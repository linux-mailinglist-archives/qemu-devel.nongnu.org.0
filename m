Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2F2FBEB3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:17:17 +0100 (CET)
Received: from localhost ([::1]:53574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vZ6-0001s5-NJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vB5-00012l-U7
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:27 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAx-0003na-WB
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id a12so20578966wrv.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nr3F1s/uxAkZsOjDBgzUMQ0nBu9JtUUnCgKnB3ia0u0=;
 b=x+DoS/jdeXRtAlobj8i5px96YIkRQBfuBk13yhtED9JFQ/5RRGyX0lbtAuwNMSdJjI
 UNjDoSR9+8ts+iLgH2GRScb2b5PhnU9V98q1E1TB7wazwgultCYQcNal+6vwvNwwlIcu
 kelDG8cXmbcMNrZhfi1/DN+BdTfjvwafU2kAm7gd2n/cGx5AVBVK6oKUXhMJsomZ5Qmj
 9ohpWmYN0CrYXb6wpnCIJ53d4rx9oTciSSlSkP/VE2XqloWcT1v67szmgKYmLZpxo5kD
 f0FS8MpLq/UWqQAx2cwiDJCqVFByyFxAQCxisGcP+/aWPwlBIxaGDlU2/o+pjAKFBBSr
 yd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nr3F1s/uxAkZsOjDBgzUMQ0nBu9JtUUnCgKnB3ia0u0=;
 b=gFgMB3Tp05MBE4ISVOpZQNerTa7H5QwqYyb3TdrW8MXN/aB18uzi8bFFIPKv3tR6CY
 HJxs2RHWopjNeOgaTu2bkwZ1DEkgGEkwNcIiGAStLHIUfu1SAN7mIT/dE+kCi5nOr3Hs
 ycOzpa2ZIS+jwpK0Wv58b5Z5vas1T60FiPxYJux32WlXINeHCCPCS+FnYqSqBzCkydny
 nG3vb++8miA7mjVLioggogOHxoM/rXEV9VuxeNd3K8kuMvi+Z0AEkoIzOeh1fGXOrITd
 ZdFn1J3oXwmrPVmmvKmvgFyrB+40h0/JkAskgLK8TAy3DPLiScANlbrg5+dT3DTk85B3
 LiNQ==
X-Gm-Message-State: AOAM533cfFOa0rXujYsbJOZVMlUWnB9h09kBjFmt4R736zW47y2K4oed
 Bpg+ERzoGxP5z6PAcWSRrmMRmg==
X-Google-Smtp-Source: ABdhPJwiuPdvIKBWhIDDygBusOxkKM7OqeCTJZ4y/iVuPifUmZyeXTDnKVVjjRuZpW8b1DDxsLaO0w==
X-Received: by 2002:adf:814f:: with SMTP id 73mr5534594wrm.368.1611078737777; 
 Tue, 19 Jan 2021 09:52:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n8sm37419097wrs.34.2021.01.19.09.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:52:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 794091FF91;
 Tue, 19 Jan 2021 17:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/6] tests/docker: alias docker-help target for consistency
Date: Tue, 19 Jan 2021 17:52:06 +0000
Message-Id: <20210119175208.763-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119175208.763-1-alex.bennee@linaro.org>
References: <20210119175208.763-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a bunch of -help targets so this will save some cognitive
dissonance. Keep the original for those with muscle memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index bdc53ddfcf..a5c1e4a615 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -1,6 +1,6 @@
 # Makefile for Docker tests
 
-.PHONY: docker docker-test docker-clean docker-image docker-qemu-src
+.PHONY: docker docker-help docker-test docker-clean docker-image docker-qemu-src
 
 NULL :=
 SPACE := $(NULL) #
@@ -218,6 +218,8 @@ endif
 	@echo '                         Specify which container engine to run.'
 	@echo '    REGISTRY=url         Cache builds from registry (default:$(DOCKER_REGISTRY))'
 
+docker-help: docker
+
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
 # docker-test-foo@bar) which will do additional verification.
-- 
2.20.1


