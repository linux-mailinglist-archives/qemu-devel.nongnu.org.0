Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F13C36A208
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:19:36 +0200 (CEST)
Received: from localhost ([::1]:34616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL0J-0003h6-Bp
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi9-0005af-VY
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:55 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:35436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhw-0004DC-VI
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:49 -0400
Received: by mail-io1-xd2b.google.com with SMTP id t21so943800iob.2
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h22zSJcv65mLDeK4wR1kfxWQM4XY7qd7DrXHOulaaTM=;
 b=Bb9w1yBlVPSgONytHKU0zCsCx+gNOCCth8Y3LcYEkYd8YIn5KjxSuNRSp6X9UkkySC
 5L1Nmsbu6FWzeJSMgfjSnULrKbGejmbEE+83Aj9HQysQ3tTbDwhcDRrN8ayETv2BGb3F
 VNT5rCR77PZrOzLL53VoTCQXYCenDSzYYoObdceYoEixfslRjvuqKqaJSCDU7qkW+bcZ
 trVGsoWo5W7HNIHxPjL+YI7u7CmXP9ScfOOHbSoiGcqII/wvpaSDiH7O/lKZxcC0iTCd
 /+QuGCJ8qQnPsmRqsZ70jNhMQeYtdBqVFBB5770vSch+lnEWHfORB8gfS/GK3T1bpNzm
 +rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h22zSJcv65mLDeK4wR1kfxWQM4XY7qd7DrXHOulaaTM=;
 b=Nx3lIeuFQZQVfxVn5nQsQH08Yicv6fOsbTv6R2G0JqncaB/qKoz7btYHHPlh+wi+iT
 svCKSGtlUoJNFAGOZWy0VxSX4N/TIgmg+ovsEy5Q0oCFysOjfxZUrTzw727ADGu/MSRF
 GqMlHypQiazk14Mg97HGssyddUaaqTagz0fnwPySmTaufJ+y6uqhP/2SWfUxFYLWmgOj
 shEce86S68obU6L5l0TMxZXL7/Zu534laxVP/3uJ0W70tU4S1FnNn6PL76GLSg8osTNX
 oWGdfPKQVV0uVq+uXkUmO0ueEOUsr6hCVRMe+Tb3n7WjsLfSPUVxEWw5vqLTvm8YmvpB
 Dawg==
X-Gm-Message-State: AOAM530K71ONY5Vqh5OdZpXxK1ExQAmLRJzLJgpwZA+fnEDfyvYyB9jl
 ZwOnRAnKV5ld/XZum7e+KvmSi6d/3qu/Zu+Q
X-Google-Smtp-Source: ABdhPJw3t9+NMRQq+DTL6rBf7kBBsO2FW7PUkNDnGL0HQ1oLZX4HfhDdfvHRxNbOR81ibiRqiHU3pQ==
X-Received: by 2002:a02:818b:: with SMTP id n11mr8590242jag.62.1619280035707; 
 Sat, 24 Apr 2021 09:00:35 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:35 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/48] bsd-user: style tweak: Remove #if 0'd code
Date: Sat, 24 Apr 2021 09:59:39 -0600
Message-Id: <20210424160016.15200-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 87154283ef..2c6764d372 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1270,9 +1270,6 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
               ibcs2_interpreter = 1;
             }
 
-#if 0
-            printf("Using ELF interpreter %s\n", path(elf_interpreter));
-#endif
             if (retval >= 0) {
                 retval = open(path(elf_interpreter), O_RDONLY);
                 if (retval >= 0) {
@@ -1529,15 +1526,6 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
 
     padzero(elf_bss, elf_brk);
 
-#if 0
-    printf("(start_brk) %x\n" , info->start_brk);
-    printf("(end_code) %x\n" , info->end_code);
-    printf("(start_code) %x\n" , info->start_code);
-    printf("(end_data) %x\n" , info->end_data);
-    printf("(start_stack) %x\n" , info->start_stack);
-    printf("(brk) %x\n" , info->brk);
-#endif
-
     if (info->personality == PER_SVR4)
     {
             /* Why this, you ask???  Well SVr4 maps page 0 as read-only,
-- 
2.22.1


