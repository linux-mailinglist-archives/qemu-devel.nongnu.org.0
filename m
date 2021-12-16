Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ECF476A9F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 07:51:51 +0100 (CET)
Received: from localhost ([::1]:43600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxkcI-0008DC-A2
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 01:51:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mxkZF-0006Lj-HD; Thu, 16 Dec 2021 01:48:41 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=33546
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mxkZD-0005Px-RO; Thu, 16 Dec 2021 01:48:41 -0500
Received: by mail-io1-xd2f.google.com with SMTP id m9so33963506iop.0;
 Wed, 15 Dec 2021 22:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4VNIWE+grGyasSlHE22Jzb2u7dCewCAQ9WV4W7onhI=;
 b=b0Ge3Q5D5Roe+v7ulU3lxWDfLQrLBigA/h5+0hMQP6QnNxxaVc6jiAkAHNjouKEnF0
 qreB/UwBnemS/9T11mzbYSPic1oXy6HKb6Oh94h+v8eKTexgY/hHp99aesNelNvxdK12
 frah6r7UHgwGntJS0HI4qlmKrJ5efh1eQ2rys43satDgSOUR1mmtPh1ifnpWwF+Aj0Du
 lp/9M4wwfA+WW1n0NTE6SzCeR+ax5eg8KOJ6nUP0XMUau1wW8OFvWeq3zl56F94gnaAG
 j0FSvoZl8ehhDPH9RMcRvubUMK1MOutlVu4om7GYF/W7Vi0tENi9WDUlosGFI8WPtJTM
 i75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4VNIWE+grGyasSlHE22Jzb2u7dCewCAQ9WV4W7onhI=;
 b=7Pyo4DGShu8ZGgmYlZZLe/GtZDrscnG7ojTrBXkFEbGKfmpw06sig5uJTjwGWG4Lsp
 SkxQhqohuyQ6NzC5Tj+EaLdNdMR+OukscmUjVBUrbWxg3URmIyqkdjyO/k6PPSd7//Dg
 YScxRH+lQ0bRjJWWf1Rl4jG3/NckuhtKUqNQl4xYsfrjelbT5vBE01HCjpt9CP/HkC/4
 qeP9bVWHvos1wMH0qd8T1V09YUImVO0+0gzo9dDUfdIVsa2K5s25YnbgrB7W3PcakOm3
 Tm7RVb0mxJV3+M0YQq6P7/2ZkLsmxuiZ0evUsf3bXlCc3cs25pr0OMhdzWX8YS4Y13V2
 niwQ==
X-Gm-Message-State: AOAM533pkWQ5VJO2Y6FAdqSsDFHcDlhtrInW1wL2t/ykZPHZbgJZgEbA
 f2bwvETajb3PV5f+FeMTgUUtbaFHbZwbaA==
X-Google-Smtp-Source: ABdhPJyJJP5Vhn5OgRGx+7LqvzSn9fIx/1NerICqgSx8C2oKmoqR7DgLnuW6l0s7K9hKp7hwJsHSCw==
X-Received: by 2002:a05:6638:33a6:: with SMTP id
 h38mr8373946jav.188.1639637317393; 
 Wed, 15 Dec 2021 22:48:37 -0800 (PST)
Received: from localhost.localdomain (s-30-204.flex.volo.net. [76.191.30.204])
 by smtp.gmail.com with ESMTPSA id
 t6sm2081650ioi.51.2021.12.15.22.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 22:48:37 -0800 (PST)
From: Byron Lathi <bslathi19@gmail.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 bslathi19@gmail.org
Subject: [PATCH v2 2/2] hw/arm: Add Cortex-A5 to virt device
Date: Thu, 16 Dec 2021 00:48:20 -0600
Message-Id: <20211216064820.61342-3-bslathi19@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211216064820.61342-1-bslathi19@gmail.com>
References: <20211216064820.61342-1-bslathi19@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=bslathi19@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Byron Lathi <bslathi19@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the Cortex-A5 to the list of supported CPUs by the virt platform.

Signed-off-by: Byron Lathi <bslathi19@gmail.com>
---
 docs/system/arm/virt.rst | 1 +
 hw/arm/virt.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 850787495b..2384606ae7 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -50,6 +50,7 @@ The virt board supports:
 
 Supported guest CPU types:
 
+- ``cortex-a5`` (32-bit)
 - ``cortex-a7`` (32-bit)
 - ``cortex-a15`` (32-bit; the default)
 - ``cortex-a53`` (64-bit)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6bce595aba..545bd2f958 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -195,6 +195,7 @@ static const int a15irqmap[] = {
 };
 
 static const char *valid_cpus[] = {
+    ARM_CPU_TYPE_NAME("cortex-a5"),
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
-- 
2.30.2


