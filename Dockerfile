# Stage 1 - Build rust application
FROM rust:latest as builder
WORKDIR /app
COPY . .
RUN cargo build --release

# Stage 2, final image
FROM debian:latest
WORKDIR /app
COPY --from=builder /app/target/release/rust-stakeholder /usr/local/bin
ENTRYPOINT ["rust-stakeholder"]
