Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB734A1B2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 07:23:45 +0100 (CET)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfsm-00044S-Ss
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 02:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPfrJ-0003c3-O7
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:22:13 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPfrB-0000FZ-94
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:22:13 -0400
Received: by mail-ed1-x535.google.com with SMTP id h10so4982312edt.13
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 23:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kCTNiBc8jU86jDKAzdnwHJmcWfEdRseqMGEu3twvtU=;
 b=ATGz9N+63Lc4mmFtq9l1jKynqAlnqPimnG91U1KwczjU0NNtVDnsVvrzU367tw1dN/
 ToUfVGYAZVh2+DWVWRIQKx/DlTUMQUpbx2Q78wcw60FkNdwas/+qZX7qY8/wNIoifKlS
 xjjyAicnKAgGDSQ67lTcT2kWIjnMc36XsqTukxdwmGVRCNpe8qP92tix45TUg/sm4Uvu
 mjnA/Jq0s8V/dBdD1JqB1l1OafrFaM7WeBK0Gv3StRPKGtxMp+C8NG1cRtyuauD+yTFH
 ytmvYMUVnBkN6CtYjh+lJz6sK2sl1SCaiSS14bcRpbKe7Zk/HDpsNks1Lo47fm7QZRjA
 lZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kCTNiBc8jU86jDKAzdnwHJmcWfEdRseqMGEu3twvtU=;
 b=glC0Xhojwf64P4mQ6C1QyX3kJHLUFsQbsnwRjvW8CexJwUEY5lhQK6Ar4T0vkn3p4v
 Sd9LS41N6I1IE7LVe1ev44piCFVf5FKuE7dFNlwoAEiBRctyo8KzUjUq9zArAo8hBgR0
 xSAMwOl1FkOjstseTluxjQYeKP5DthBx1TdlU/dEPjYOMOKG/kjK5bn5E6NbcdcIYjw1
 bAwUJCimQWA/0+09r0WtjiRt2jWPLSCUUAOGP3gvn0st7C0KM8D8iweqUy5TWDKLCW1V
 zCRaEcpuo5iIiaevm9bVDWXwzziQvPKJv8+0KpTRZ+H/jnPGb21bSpO9eaVeLWVfu7oX
 9Q5A==
X-Gm-Message-State: AOAM533MyrfG2iskgRlmoqskmJmeZDN8ls2q8RxwlABPiVzoKvbOIAkU
 q86gsy6ArshZOqQPPLCBAlA=
X-Google-Smtp-Source: ABdhPJzaANxp9fUkVK+AzT/5aJ9S6cPHW7ZxD0soXurmwYhpoGYYLg8WLNTqkRxcBt1o8ZHpfSMw1g==
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr13002663edd.48.1616739723545; 
 Thu, 25 Mar 2021 23:22:03 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id t17sm3695556edr.36.2021.03.25.23.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 23:22:03 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH] nsis: Install *.elf images
Date: Fri, 26 Mar 2021 14:21:40 +0800
Message-Id: <20210326062140.367861-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of today, the QEMU Windows installer does not include the
following two RISC-V BIOS images:

- opensbi-riscv64-generic-fw_dynamic.elf
- opensbi-riscv32-generic-fw_dynamic.elf

Update the installer script to include them.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---
Based on:
https://repo.or.cz/qemu/ar7.git/commit/657a6a90b69da971afdc71501c30275ba307ff6c

The above commit does not land on QEMU master. I am not sure what
the process is, sending it here for comments.

 qemu.nsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qemu.nsi b/qemu.nsi
index 96c5534254..aeabe3bdbe 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -142,6 +142,7 @@ Section "${PRODUCT}" QEMU_System_File_Section_Description
 
     File "${DATADIR}\*.bin"
     File "${DATADIR}\*.dtb"
+    File "${DATADIR}\*.elf"
     File "${DATADIR}\*.fd"
     File "${DATADIR}\*.img"
     File "${DATADIR}\*.lid"
@@ -258,6 +259,7 @@ Section "Uninstall" Uninstall_Section_Description
     Delete "$INSTDIR\*.bin"
     Delete "$INSTDIR\*.dll"
     Delete "$INSTDIR\*.dtb"
+    Delete "$INSTDIR\*.elf"
     Delete "$INSTDIR\*.fd"
     Delete "$INSTDIR\*.img"
     Delete "$INSTDIR\*.lid"
-- 
2.25.1


