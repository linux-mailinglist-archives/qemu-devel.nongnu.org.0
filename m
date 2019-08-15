Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFFE8E2F5
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 04:59:27 +0200 (CEST)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy5z4-0000Om-VV
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 22:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vandersonmr2@gmail.com>) id 1hy5e2-0006bh-Oc
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:37:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vandersonmr2@gmail.com>) id 1hy5e1-0006V0-Nx
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:37:42 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:40351)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <vandersonmr2@gmail.com>)
 id 1hy5e1-0006UG-KM
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:37:41 -0400
Received: by mail-qk1-x744.google.com with SMTP id s145so782899qke.7
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 19:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3km3J1uOp8CgXZQpwwzjQw3p/KWs/vYz99LUiXT2Iv0=;
 b=d6p42qd56lqRVy6uNn8jMJxOTrWoDiHSnp2dl+E+tWAELUVakr6tBOFYbF540SNTmg
 VFBN6abJa+ehaA+OgOxbqJ+ibJquH2rugBew98KDekI54AdGQRh4oGvkIyhK4rWNBSw1
 grXj0QooeVJebsqLoPAM798q8P7QieHor5ejNTQUYCsnEYF/YT3kKoDJjeq6deTsnUKh
 biWQ7UYYIbLdSfRSn6rKidZj34IEXH7eZrhMnADr1Ot+jaKcsw3KAr31VCANnZoeCO3s
 K1jRTlpK8uwnDHGxj6hO95JL9Pd6oJKBnTcZKq67kxvPDBbbTj3GTm/EQrnyEqHeVM7E
 8Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3km3J1uOp8CgXZQpwwzjQw3p/KWs/vYz99LUiXT2Iv0=;
 b=m0u7APy2gr1q66ZGSG3vG89/iBLry0yesBvJFNIOTOUr3jw7F+HhoxrDR+KyMhAySj
 t3Qm0v+RtwZDMgEWVUhVrNoM+JookUUJoKVJevDnnhsYl33CRc5dVJPMnIQZu1BSY/pO
 lNWd53ewdcMOK2r6qLbVlIgQ64AXRjSNYEQstI0isTj/tus8ZCP41GNbNPUsTueGPp8r
 opG4j32l+DIWB9fNIWAKb+/z8Tm1TfeHIAiCPrAJ4HKI34UQzf9XQpKMgNhkvUA838zZ
 NKhw5VKV2b6YBS0U1yqi42gVMpZZulBsOyT3lebCYRK1SSgvIyjKN+njQonSLJXvLvSx
 2yuw==
X-Gm-Message-State: APjAAAUjaRPOOsrciJspeDAbjgIS805jqac6Y0z6FdURmMbKrsBKEPiM
 vX9+o0LgxwuvqI8JsvjysqEwFZP6FYo=
X-Google-Smtp-Source: APXvYqyVTbcytdiTQhJaMArayzWRWIUDFu9NP7njfGfLr/QVTa1cljCz07Cmi+he46UVzFHIO+LMsA==
X-Received: by 2002:a37:9a4a:: with SMTP id c71mr2256351qke.258.1565836660730; 
 Wed, 14 Aug 2019 19:37:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:121::1])
 by smtp.googlemail.com with ESMTPSA id t24sm764052qto.69.2019.08.14.19.37.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 19:37:40 -0700 (PDT)
From: vandersonmr <vandersonmr2@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2019 23:37:23 -0300
Message-Id: <20190815023725.2659-1-vandersonmr2@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: [Qemu-devel] [PATCH v1 0/2] Integrating qemu to Linux Perf
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
Cc: vandersonmr <vandersonmr2@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is part of Google Summer of Code (GSoC) 2019.
More about the project can be found in:
https://wiki.qemu.org/Internships/ProjectIdeas/TCGCodeQuality

This adds --perf command-line option to dump Linux Perf 
jitdump files. These files are used to enhant Perf report
and to be able to analyze and dump JITed code with perf.

Example of use:
 perf record -k 1 qemu-x86_64 -perf ./a.out
 perf inject -j -i perf.data -o perf.data.jitted
 perf report -i perf.data.jitted

vandersonmr (2):
  accel/tcg: adding integration with linux perf
  tb-stats: adding TBStatistics info into perf dump

 accel/tcg/Makefile.objs      |   1 +
 accel/tcg/perf/Makefile.objs |   1 +
 accel/tcg/perf/jitdump.c     | 193 +++++++++++++++++++++++++++++++++++
 accel/tcg/perf/jitdump.h     |  19 ++++
 accel/tcg/translate-all.c    |  12 +++
 include/qemu-common.h        |   3 +
 linux-user/main.c            |   7 ++
 qemu-options.hx              |  12 +++
 8 files changed, 248 insertions(+)
 create mode 100644 accel/tcg/perf/Makefile.objs
 create mode 100644 accel/tcg/perf/jitdump.c
 create mode 100644 accel/tcg/perf/jitdump.h

-- 
2.22.0


