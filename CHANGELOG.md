# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.1] - 2024-05-14

### Changed

- Bump minimum requirement for Ueberauth >= 0.10

### Fixed

- Remove deprecated usage of `Mix.Config`

## [2.0.0] - 2021-09-29

### Added

- Support CSRF requirement for Ueberauth >= 0.7.0

## [1.1.1] - 2021-05-02

### Fixed

- Internal refactor

## [1.1.0] - 2021-05-02

### Fixed

- Use `Authorization` header for API requests. Slack appears to have deprecated parameter-based requests.

## [1.0.1] - 2021-02-21

### Added

- Support for Slack V2 OAuth API
- Base code on original Ueberauth Slack project
