Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6695332861
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:20:15 +0100 (CET)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdDa-0002yR-Nn
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJdAz-0001Hj-LG
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:17:33 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJdAx-0001gG-KZ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:17:33 -0500
Received: by mail-wr1-x432.google.com with SMTP id b18so15901822wrn.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+G9lfkQfB31Vrq/isMVua0eAtJLRoLcBAtaMiwisrs=;
 b=EG/u1PbV4xpc7a+0ieG+WxCq0BZBgcv2I5tRe32yNbedNaRKeLRC+MOMvXLdmnyLPe
 mVCQTk7xJeXP9j7Vo3YCOV9KO6uktzxPWXUMhFH4fZZ53P55LWdNEZFobvPDLSU7nxwE
 HBmwbnMd1b6IFQLK0xMRd8Y4PxNUzD/p8hIYhcSWNuc1BpOPLbuuFfqrsudTjvmrCORf
 7pJC/2lrz1TlHYgm6FaqLSSF+XEFPyncHIVk1qHT94c0EYY94x53qX84BDYFWd3NsugG
 PvqjPoKXD19UGazdtF6wlEdJidzUBT0AYImIB8geOrL6AC8PttxOSFEZYiL3wjIvB6I1
 h+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+G9lfkQfB31Vrq/isMVua0eAtJLRoLcBAtaMiwisrs=;
 b=rBR2UhW0gaobm2N8nHGo3S1GEVRLLiiDMDQ9KRsHR3iETp/LKeQRjiJ5LXRyZMAXSy
 IjJgvGqsjmsk41DH4IiKI3UaUqWpatNyUM6x2TKa+KFOluRgEtXiGYWgZCfexRI4Z97X
 iXozxg4YGOdVqJQ0ED1jIR2d9HIeIRvZ5hJSRz/aPkpPaMmBEHNJXMrh4cVswGv89/r+
 UYyQHBfAEgt/PUpyyykd+hVBs3qtX2n1fQbN7Iyc1UDIokPf+KzqpOmn9n1+CK1cX8t8
 mCtAg8PV9tllbMJZbS5QyXWYfKBIxapiBu/AUZM59wxlUxNjVrVTAfHJotYOomjvx6Z5
 wQVg==
X-Gm-Message-State: AOAM5328cLeMsiVDE4vNhzmc1uWffCW3D/k5W64cZYsJbqNyZk5yQwHS
 ukIZvM0APE/9gkstDDYOFEtUqw==
X-Google-Smtp-Source: ABdhPJyfo0KU7aGDNkcU0ypGQ/Z6N8rXtPNfVD/KRcyHFMksWvCbvCMRXD6EgWSkC4XQgcMGrnkDSQ==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr28663545wrt.31.1615299449701; 
 Tue, 09 Mar 2021 06:17:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z2sm12068825wrv.47.2021.03.09.06.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:17:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 089C81FF7E;
 Tue,  9 Mar 2021 14:17:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 0/4] semihosting/next (SYS_HEAPINFO fix)
Date: Tue,  9 Mar 2021 14:17:23 +0000
Message-Id: <20210309141727.12522-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: keithp@keithp.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

OK I took another tilt at fixing the SYS_HEAPINFO bug with a lot less
code motion and also expanding the tcg tests. Currently based on my
in-flight PR:

  pull-testing-docs-xen-updates-080321-1

which already moves the semihosting code out of hw/. Please review:

 - tests/tcg: add HeapInfo checking to semihosting test
 - semihosting/arm-compat-semi: deref parameter register for SYS_HEAPINFO
 - semihosting/arm-compat-semi: unify GET/SET_ARG helpers
 - semihosting: move semihosting tests to multiarch


Alex Bennée (4):
  semihosting: move semihosting tests to multiarch
  semihosting/arm-compat-semi: unify GET/SET_ARG helpers
  semihosting/arm-compat-semi: deref parameter register for SYS_HEAPINFO
  tests/tcg: add HeapInfo checking to semihosting test

 tests/tcg/aarch64/semicall.h                  | 18 ++++++
 tests/tcg/arm/semicall.h                      | 15 +----
 tests/tcg/riscv64/semicall.h                  | 22 +++++++
 semihosting/arm-compat-semi.c                 | 56 ++++++-----------
 tests/tcg/arm/semihosting.c                   | 26 --------
 .../arm-compat-semi}/semiconsole.c            |  2 +
 .../multiarch/arm-compat-semi/semihosting.c   | 62 +++++++++++++++++++
 tests/tcg/Makefile.target                     |  3 +
 tests/tcg/aarch64/Makefile.target             | 18 ------
 tests/tcg/arm/Makefile.target                 | 16 +----
 tests/tcg/multiarch/Makefile.target           | 31 ++++++++++
 11 files changed, 161 insertions(+), 108 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 delete mode 100644 tests/tcg/arm/semihosting.c
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 create mode 100644 tests/tcg/multiarch/arm-compat-semi/semihosting.c

-- 
2.20.1


