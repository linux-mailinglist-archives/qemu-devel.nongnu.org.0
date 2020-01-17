Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83FC1411AA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 20:30:04 +0100 (CET)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isXJj-0005Ro-0i
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 14:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40056)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <3ywoiXgMKCmAHIXEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--jkz.bounces.google.com>)
 id 1isXI0-0004LH-R8
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 14:28:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <3ywoiXgMKCmAHIXEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--jkz.bounces.google.com>)
 id 1isXHz-0003rP-Fu
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 14:28:16 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:39575)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <3ywoiXgMKCmAHIXEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--jkz.bounces.google.com>)
 id 1isXHz-0003pR-86
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 14:28:15 -0500
Received: by mail-pj1-x1049.google.com with SMTP id c67so5047521pje.4
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 11:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Rn/bOt7W3AWrpvy+8IA9jzDepEgSdAfjJtSlHj9C/EU=;
 b=fcNM762vYeWQNOrCHdMv5HmbO62ZcZga5URYDJMrLJpO/pZJYvdX8NptQGxgCKTjYa
 2Bi4CTeu6eL+9Dgdf4KbPuqqs8CVVlX6gViVNJStnGI1qRnxgUiFmp1uvBkb8jh385l/
 VLrs8OdYokYVIMY4Z9aLfP0Yuc0hODJq/BkLlcHmPjengwm1VsaTy29yvs0csQ3zv7W+
 /5qEYl4HZseNZR8OhLcqUVFsVgRGQCC+55OB74zbv15++b4smdFUTIk3urljedxis1ur
 7HH6lWLNxhNtSKk7yTLCwfLv8eUNhlwYtkhDjgHAM7rk/W6BvfxtQJq26MJ3pllw6ZfB
 8nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Rn/bOt7W3AWrpvy+8IA9jzDepEgSdAfjJtSlHj9C/EU=;
 b=p20qisYLFdlnC99AxmtAIg0gCGT9uBvvOu3b46RgVJngGxTKlDesxx23+9aMlxHmx1
 fsNH68t4vPdBIupH4igzJ6GkX3MaDPw7MYI9ehOzFwgSKn9FgIuuSVBnmkgKqwuX9Dim
 M+PUTozY2iLj5nNgCBkcBfisHQs/yuzXG3efL8oGnKcj16hNXA9VrMKJYuKBYQDSqf3X
 kF/t0Qpt9bHy4z2Uo9zsoxdo3FQ3dzTyB9XSR88iJZfJQeuTYtgf5hREyUIid+ptr7Rj
 cCM2qoqzvgk+QgKdFb7jJCpkm6rb4wwicZ6OXkQuL1S/ONZq06UD5jLQ2a+uAJFYrTwK
 bX4Q==
X-Gm-Message-State: APjAAAVuKQ3qdYUJ9BoSBrHc3WgRc/cczBT3kW1zF6NlDhwwtWuVDyc7
 6r5i5T3NeLgKT0BfaTCWmSZDUZuAX4SV3g2si+56CVh2Pc3/+hkO5kC3fUYZdtz0lPysybekyTx
 161l/7j5QG8Db4rFcDm0buZwQUDQeyVKzJ74MRhQ5/AYSOk9/v3UH
X-Google-Smtp-Source: APXvYqyMzYcEg8zYd6790KfeqQ887NIw4mb9nXf/Q4IovD0G8UcBq9fUB08kElCJndggq8rxAlTsGWE=
X-Received: by 2002:a63:6c09:: with SMTP id h9mr46010434pgc.34.1579289291930; 
 Fri, 17 Jan 2020 11:28:11 -0800 (PST)
Date: Fri, 17 Jan 2020 11:28:04 -0800
Message-Id: <20200117192808.129398-1-jkz@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 0/4] migration: Replace gemu_log with qemu_log
From: Josh Kunz <jkz@google.com>
To: qemu-devel@nongnu.org
Cc: riku.voipio@iki.fi, laurent@vivier.eu, alex.bennee@linaro.org, 
 armbru@redhat.com, imp@bsdimp.com, Josh Kunz <jkz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1049
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Summary of v2 changes:
  * Removed backwards-compatibility code for non-strace log statements.
  * Removed new qemu_log interface for adding or removing fields from
    the log mask.
  * Removed LOG_USER and converted all uses (except one) to LOG_UNIMP.
    * One gemu_log statement was converted to an assert.
  * Some style cleanup.

The linux-user and bsd-user trees both widely use a function called
`gemu_log` (notice the 'g') for miscellaneous and strace logging. This
function predates the newer `qemu_log` function, and has a few drawbacks
compared to `qemu_log`:

  1. Always logs to `stderr`, no logging redirection.
  2. "Miscellaneous" logging cannot be disabled, so it may mix with guest
     logging.
  3. Inconsistency with other parts of the QEMU codebase, and a
     confusing name.

The second issue is especially troubling because it can interfere with
programs that expect to communicate via stderr.

This change introduces one new logging masks to the `qemu_log` subsystem
to support its use for user-mode logging: the `LOG_STRACE` mask for
strace-specific logging. Further, it replaces all existing uses of
`gemu_log` with the appropriate `qemu_log_mask(LOG_{UNIMP,STRACE}, ...)`
based on the log message.

Backwards incompatibility:
  * Log messages for unimplemented user-mode features are no longer
    logged by default. They have to be enabled by setting the LOG_UNIMP
    mask.
  * Log messages for strace/unimplemented user-mode features may be
    redirected based on `-D`, instead of always logging to stderr.

Tested:
  * Built with clang 9 and g++ 8.3
  * `make check` run with clang 9 build 
  * Verified:
    * QEMU_STRACE/-strace still works for linux-user
  * `make vm-build-netbsd EXTRA_CONFIGURE_OPTS="--disable-system"`
    passed.

Not tested:
  * Build/logging with bsd-user. I do not have easy access to a BSD system.

Josh Kunz (4):
  linux-user: Use `qemu_log' for non-strace logging
  linux-user: Use `qemu_log' for strace
  linux-user: remove gemu_log from the linux-user tree
  bsd-user: Replace gemu_log with qemu_log

 bsd-user/main.c           |  13 +-
 bsd-user/qemu.h           |   2 -
 bsd-user/strace.c         |  32 ++-
 bsd-user/syscall.c        |  31 ++-
 include/qemu/log.h        |   2 +
 linux-user/arm/cpu_loop.c |   5 +-
 linux-user/fd-trans.c     |  55 +++--
 linux-user/main.c         |  39 ++--
 linux-user/qemu.h         |   2 -
 linux-user/signal.c       |   2 +-
 linux-user/strace.c       | 479 +++++++++++++++++++-------------------
 linux-user/syscall.c      |  68 +++---
 linux-user/vm86.c         |   3 +-
 util/log.c                |   2 +
 14 files changed, 383 insertions(+), 352 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog


