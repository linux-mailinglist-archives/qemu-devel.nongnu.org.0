Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58632482F34
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 10:05:35 +0100 (CET)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4JHa-0007Cb-Aq
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 04:05:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bjorn.topel@gmail.com>)
 id 1n4JDx-0005KH-Em
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 04:01:49 -0500
Received: from mail-lf1-f52.google.com ([209.85.167.52]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bjorn.topel@gmail.com>)
 id 1n4JDv-0002Oc-Nk
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 04:01:49 -0500
Received: by mail-lf1-f52.google.com with SMTP id u13so73556192lff.12
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 01:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r7ji59pr+eafAlYWeNvDesu4JUv0rmm0MdLuRUjbmf0=;
 b=XcDQwoMbJbGSH0J8uFwQ1w9EqZdNy/Qg6X9HBuB90vDZUynL840kDlMazXtWJSRI5l
 aIrS4wdu1U51KzzeRtwwMm6QFJVoq9tu+UrRIvYs1+qLaujweZ7ELpCAbEKAb0nKRPDa
 4xMkdNY09K8gJ8AzfSTjFbi9soWxjRXqYrt8KM7irRySbq57Gqi76PeYQHDi1jBw8emd
 mtacLyACmlpSsbB0hHxEx22xZTMGcml7HylA8iNv5sX/g/k7wT7EAf/M/9KyCzge8zXq
 sBOCL6sarKgByZ3PA6SSBEM1eQs8WNrQAkFIBOXINndTUCkOZ2Mmzgizc3/vfgqLdRzb
 Yiew==
X-Gm-Message-State: AOAM53188IUiUbrFfR0lqGXnmNAZezDbijFy6GXBmE30CDPIozxw79nQ
 WQeIqgFnDdk463sUa+Luz3wawPrhsMU=
X-Google-Smtp-Source: ABdhPJwIOb7A+LtWb4zg1XzNujzd1L880MbDgWj7eBm87eeSjYOf4YQaaPaXO/dMKiSEHxOLXnvCFQ==
X-Received: by 2002:a05:6512:2032:: with SMTP id
 s18mr38334060lfs.392.1641200505147; 
 Mon, 03 Jan 2022 01:01:45 -0800 (PST)
Received: from bjorn-nuc.. ([193.138.218.214])
 by smtp.gmail.com with ESMTPSA id j15sm3558282lfg.102.2022.01.03.01.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 01:01:44 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] optionrom: Turn off -fcf-protection
Date: Mon,  3 Jan 2022 10:01:12 +0100
Message-Id: <20220103090112.312202-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.167.52; envelope-from=bjorn.topel@gmail.com;
 helo=mail-lf1-f52.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ubuntu GCC enables -fcf-protection globally, which is not supported
for x86 16-bit (realmode). This causes the build to fail.

This commit turns off that option.

Signed-off-by: Björn Töpel <bjorn@kernel.org>
---
 pc-bios/optionrom/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 5d55d25acca2..c5f5fa02ef06 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -21,6 +21,7 @@ override CFLAGS += $(filter -W%, $(QEMU_CFLAGS))
 override CFLAGS += $(CFLAGS_NOPIE) -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
 override CFLAGS += $(call cc-option, -m16)
+override CFLAGS += $(call cc-option, -fcf-protection=none)
 
 ifeq ($(filter -m16, $(CFLAGS)),)
 # Attempt to work around compilers that lack -m16 (GCC <= 4.8, clang <= ??)
-- 
2.32.0


