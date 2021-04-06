Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B95354E5B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:17:06 +0200 (CEST)
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTgtV-0005f4-LZ
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTgs5-0004R0-AL; Tue, 06 Apr 2021 04:15:37 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTgs3-0003xK-Oy; Tue, 06 Apr 2021 04:15:37 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u21so20468385ejo.13;
 Tue, 06 Apr 2021 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u/XTZDu3tzf2n+lLh88oTxJPyE+rmxPOf6E3varB1jM=;
 b=pZZiuQybATdvdZ/YWulIEmijfQPzzZVvumhsquBV7RMwNSGDxeulvkpS+3ZaEPkEZC
 VYWlh8u2x8UOTMswY5TiOg5f6X5trtfAaP6hCS2ZUK3t7dU2HbEzBXXOV4+u8ulU8Ree
 /FPdFGnaOiqWztdZIH+Nxb2Sv0lHMKZsJSWONUygQkbi2CrZKAAAuyF2W4UViPJ1vmm0
 E+ZH+FdfGauMy3hjZ7P9EpC6Ms0+BC+5Er3D6kUmRcu3tnK5eplQVnF7KmpIhjKkSraL
 MLJcS/4yYYC7fEm6qjKPcxAGUujzpOpPfnExkVc5C9OSlCtK3OtrRNgURQF6Ks0hooN7
 R2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/XTZDu3tzf2n+lLh88oTxJPyE+rmxPOf6E3varB1jM=;
 b=SVWvWL+AAjc6YF03/9ra7C5vHGeLqEWGRIttWuvHFS/1HKYnBjyiU2ZaUSqM0A4EYB
 0KVSc5PF729qW4W3WLgJji36GoAhSzg2nXS4Zz0e1in2NFOJyR/DWTSBtxU/ZPeHjYpc
 eulXjKw4KXbMbXYtlHpGXcSX9b8dd/8VvKiqE5oq9VO8gvp5AwjDxmt5a2m6XBGoc0pF
 Diu+U4wjejKDrqz8WPu+K+lw0TLdhDrmvGy1UddMIaj4ZfZL2Md/e/FCIY5JZ0j+wyHX
 29m5S2p6Hks/pxGbMKBl0/Fmliz5+0/o/lBKp9nUgJkyXggUTe/+sM6VfVTCRJf7cQPN
 kdwQ==
X-Gm-Message-State: AOAM530ODe2olJuioaa8JhDOIs5PoLD6MsApbOwGSLeoqr2hy7yyxjP0
 KTFCJVry3qto9XAdyve1DpnAbSFgmk4=
X-Google-Smtp-Source: ABdhPJzD7LW4IXnZIoRmse1hd/gGD2dyyyKH6+sfJ091s5QGYt6mjW9vHrNnagUPNo/gmJ1vpnc69A==
X-Received: by 2002:a17:906:2bc3:: with SMTP id
 n3mr32626486ejg.418.1617696933977; 
 Tue, 06 Apr 2021 01:15:33 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id h23sm2455213ejd.103.2021.04.06.01.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:15:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [for-6.0 PATCH 1/3] roms/Makefile: Update ppce500 u-boot build
 directory name
Date: Tue,  6 Apr 2021 16:15:11 +0800
Message-Id: <20210406081513.1013372-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406081513.1013372-1-bmeng.cn@gmail.com>
References: <20210406081513.1013372-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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

Currently building ppce500 u-boot image results in

  modified:   roms/u-boot (untracked content)

As roms/u-boot/.gitignore indicates, update the build directory
name to build-e500 to eliminate this message.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 roms/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/roms/Makefile b/roms/Makefile
index 5ffe3317ac..eeb5970348 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -154,10 +154,10 @@ slof:
 	cp SLOF/boot_rom.bin ../pc-bios/slof.bin
 
 u-boot.e500:
-	$(MAKE) -C u-boot O=build.e500 qemu-ppce500_config
+	$(MAKE) -C u-boot O=build-e500 qemu-ppce500_config
 	$(MAKE) -C u-boot CROSS_COMPILE=$(powerpc_cross_prefix) \
-		O=build.e500
-	$(powerpc_cross_prefix)strip u-boot/build.e500/u-boot -o \
+		O=build-e500
+	$(powerpc_cross_prefix)strip u-boot/build-e500/u-boot -o \
 		../pc-bios/u-boot.e500
 
 u-boot.sam460:
@@ -205,7 +205,7 @@ clean:
 	$(MAKE) -C ipxe/src veryclean
 	$(MAKE) -C edk2/BaseTools clean
 	$(MAKE) -C SLOF clean
-	rm -rf u-boot/build.e500
+	rm -rf u-boot/build-e500
 	$(MAKE) -C u-boot-sam460ex distclean
 	$(MAKE) -C skiboot clean
 	$(MAKE) -f Makefile.edk2 clean
-- 
2.25.1


