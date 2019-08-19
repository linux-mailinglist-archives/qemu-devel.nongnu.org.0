Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829AF92844
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 17:21:48 +0200 (CEST)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzjTf-0006PR-MF
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 11:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzjPy-0002Uu-3h
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 11:17:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzjPw-0002We-PA
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 11:17:57 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35960)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzjPw-0002QO-FK
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 11:17:56 -0400
Received: by mail-pf1-x429.google.com with SMTP id w2so1349113pfi.3
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cvxEo5nV3XitRw4aFSjrYMhh92IvVDWZriLEb2HuXXI=;
 b=WZ9EOL8H5jlWXDQ/bXz5ywrA9uHEzHTAzyAwVr47cRBl+RkekMAtlZL9dwcCNT9nU5
 gRSJGZjdRzzMYzQzF46sH8JeQZRcEeKKSptQg1HQG2QRk4i6tIbrFiX6LTsFI0QtYL/Y
 ysn633ZBphk4UJLuk22OpuxJwiWm+Oe05Yz48Bv3rQkFZCIuhzA48mArz+QXszYfDgox
 w4jpYGJtJFZKQwTYPJFwfM/cciYGOg4C4a1Xp1hGxJhBhLPV9sqa/9tHSFkHG8n4t0hu
 OQEBqQkyioBlQMd8axjGcnRegYUL6l/qAMCWqJ1xusULQ8o1JXEq69hBiTYawR1bG+Hv
 lkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cvxEo5nV3XitRw4aFSjrYMhh92IvVDWZriLEb2HuXXI=;
 b=cFUrP28b+cSMduQ1uvcZHLQM5Dz6/dIltyTdhkhP5uYSzwYZrPCkGFX2G2ga2R786v
 N1Jii27CvWZKmLdHVjMAdALXZTq6ILkOMWRsDEYLbs0co5T8toGERboOkA5iqTt1w7+k
 bzkVuWIbCQ4rdD3atS553guOLR+5XL93dersQR/CEhp03VyY0Lgry9U6zYSh0Ma1gv+S
 Tp+Ue5Fl+NlYEjCRHPuWl650hPCTaWjOUVcw/4itaaQsgrseRQIeh43sungzhPNqiNgD
 r1rKK7ydnuawVTBsKzoyZR8U4VslPlgyLAvD/XOrVcF9wKkC5AWnU3+qbcfYMyD1f25S
 JaOQ==
X-Gm-Message-State: APjAAAVbox1DDAgHVcjtjBrWahcmM68N7TbQnEhR3kP8RBU3KBoo4cJy
 Yg/2jUBAa9cRylCk/FPgVQvco0NLx+k=
X-Google-Smtp-Source: APXvYqyqafSrpDmyVuT+ibY+vF+qbf7tLU1IAb8OXOfnF0I6boCjDS6sd4nW7VWZeBM7Z4woNQhISA==
X-Received: by 2002:a17:90a:ac11:: with SMTP id
 o17mr21595149pjq.104.1566227865062; 
 Mon, 19 Aug 2019 08:17:45 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r27sm21020406pgn.25.2019.08.19.08.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 08:17:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 08:17:40 -0700
Message-Id: <20190819151743.17267-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: [Qemu-devel] [PULL 0/3] decodetree improvements
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3fbd3405d2b0604ea530fc7a1828f19da1e95ff9:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-08-17' into staging (2019-08-19 14:14:09 +0100)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-dt-20190819

for you to fetch changes up to 59a3a1c0c211640e18b058a1b0444154c4eb6f99:

  target/riscv: Remove redundant declaration pragmas (2019-08-19 08:13:14 -0700)

----------------------------------------------------------------
Implement parameter fields.
Push warning pragmas into the generated code.

----------------------------------------------------------------
Richard Henderson (3):
      decodetree: Allow !function with no input bits
      decodetree: Suppress redundant declaration warnings
      target/riscv: Remove redundant declaration pragmas

 target/riscv/translate.c          | 19 +----------
 docs/devel/decodetree.rst         |  8 ++++-
 scripts/decodetree.py             | 71 +++++++++++++++++++++++++++++++++------
 tests/decode/err_field6.decode    |  5 +++
 tests/decode/succ_function.decode |  6 ++++
 5 files changed, 79 insertions(+), 30 deletions(-)
 create mode 100644 tests/decode/err_field6.decode
 create mode 100644 tests/decode/succ_function.decode

