Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71D46EAFD8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:57:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu4k-0008R0-1V; Fri, 21 Apr 2023 12:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu4i-0008NS-2U
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:32 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu4g-0005Us-H5
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:31 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f7c281a015so1239641f8f.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096248; x=1684688248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4SM9YeBIclfjzNxYz14AKGlZQIua6BW7879c1Pfusg=;
 b=fOUL9MEiJNvYjsK7EZ/OtjC+vVMorHbK6Ic5qhcNTR5+tPPXYBMOBAgyzAJoKZNh5/
 W3L+jlD6Ax2gmT+HwItiYkxytH4ogL4HgwnyhcorMZp7u66wvVVcUjfUI1xHvTu6En85
 EuEsOSjwujyx/U2G76RpXNnQxO563L7IGs0DrJgcFRDXCHv6Gaa2TUa/Oq6ZybXqQDKS
 FztsZ+6I4OPAZg9e6hTQYoNnMula1v1mBKAA4tyZjLraBzBEvttSLPj4C54FxDRGFYne
 91D9AF/a9MlANaRextnb4ecieUJI7hwVQHbBko+rLZyG3cCkBk/srLiR2icfJ4JympsG
 qa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096248; x=1684688248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4SM9YeBIclfjzNxYz14AKGlZQIua6BW7879c1Pfusg=;
 b=J3/6zmpwQYre37FLBVluefpWvG4P/2ca4mgGHvotxNU2pk9adZRS4DksiStIgaFAiX
 6ohiXw/+HE3kK41/ferq6cuF0VXWWCr1dThxNQo0SiYp46HOipGQlUU7saP2mYmXR55I
 4Ffu7DF+en/5exzZW8EZSUXeT/eGNZ7LXOY8QQJb2fJkAKXIvDkgThJoUngfqK6cpW0n
 V6HbJU+ZIaf21WujVdUUtgDRi6N5eEHF70rCGiHuiX4zGc2ygWgP8ME5N07fmsAwP44U
 rTuGtot27NwjGTtk2UmrpB8nB1brFMadFc9UCDuAaURLlp5vVMOsApeD1zGfeAlG5sd4
 eOng==
X-Gm-Message-State: AAQBX9cy1wOW92jBGp/dmTyYQLZctLmhyr/u4BGBtSEqcTd6yuUn2RA5
 3C52mCLslcRixWOGQ+lKXKW85iDE9+s=
X-Google-Smtp-Source: AKy350YQoHJB0cnlBU/ICFnkGHLWIWyXZntASROlfDgNzO91nrvSdV8pWsZjv4gSwGaIk7Tj6ivk9Q==
X-Received: by 2002:a5d:4905:0:b0:2ef:b87f:2a23 with SMTP id
 x5-20020a5d4905000000b002efb87f2a23mr4591257wrq.60.1682096248184; 
 Fri, 21 Apr 2023 09:57:28 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:57:27 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 00/11] Contribution task implementations,
 for the 'FreeBSD user emulation improvements' project.
Date: Fri, 21 Apr 2023 18:53:40 +0200
Message-Id: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Upstream the implementations of bind(2), connect(2), accept(2) and
getpeername(2) system calls from the blitz branch of the bsd-user fork hosted at
https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz.

Karim Taha (1):
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>

Sean Bruno (1):
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>

Stacey Son (7):
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>

Warner Losh (2):
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>

 bsd-user/bsd-socket.c         | 108 +++++++++++++++++++++++++
 bsd-user/bsd-socket.h         | 143 ++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  21 +++++
 bsd-user/main.c               |  16 +++-
 bsd-user/meson.build          |   1 +
 bsd-user/qemu-bsd.h           |  36 +++++++++
 bsd-user/syscall_defs.h       | 148 ++++++++++++++++++++++++++++++++++
 7 files changed, 472 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/bsd-socket.c
 create mode 100644 bsd-user/bsd-socket.h
 create mode 100644 bsd-user/qemu-bsd.h

-- 
2.40.0


