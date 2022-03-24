Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D41D4E6078
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:38:17 +0100 (CET)
Received: from localhost ([::1]:55216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIz2-0007fu-KQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:38:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nXIkT-0001S7-Kd
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:23:14 -0400
Received: from [2607:f8b0:4864:20::635] (port=34411
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nXIkN-0004DP-Lg
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:23:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id i11so3994243plr.1
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ShFofV19rY5NuEgzmEWmA0QiWYlY/qGYBxHDrJP68Vw=;
 b=RpgJoAPSpCWr60QZ9S2NkoGsyXh3T2BpOAt3/8YZDocxKPrbsYqV5ldB/uzKzIrK1I
 Ex/z8pf7y7vCn+gkwnq2dZkmxlWVC/P+bmZS95gzD3S8V0ZW7agF5i8FSCPIH+DgZQG9
 qAtO8Vq/MQvDNJFTV9DXVfDYrAtBvh88ABDdiaADnNgyMYdUejhQuuk52P6DE1dbVeoE
 OkKDfJgOd8icuAY7sdiYFCPcyxiW7QFnAO9XmSV8DDyIYTHLLaLwhFKCuMmL1VJQbToJ
 BmZ8lqnbA6r9WvP76Dj1QVnKugLfcg86HZ2W5mV3e518i6p6FoctNwpMPvQ+jtV8WX+7
 sysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ShFofV19rY5NuEgzmEWmA0QiWYlY/qGYBxHDrJP68Vw=;
 b=E2EeV1bd8quW7Z8W0n4GvnHJfZgHMdwOm4Xz7WEgv8ueuUVha3ImfpPrYwVj2JbpJo
 tmSmzt9OOhbWkl8GZRKolKKn5oI6br95d6tt7wDGEuA6J/pfm1ev9k19p0R0hcYyvvaO
 c2TsgLcMc1eb0iIeWy1ZKkFj+R8XK3HKMHonVNbz0Cz2/96YD7kOstGjne2HzRigLFPy
 7bYcIEYpLfVVbaUu41jfyDhiYnCyXGIXor549SvI9DeidziVL5yHAfODxdz9wu3JXKhA
 NPGlw91UfFqVhSuLOTT1J4xfj2X+vJijJEeH1KJjLDagz8/02ok6CyBsEZrDMjsa5Uwn
 c15Q==
X-Gm-Message-State: AOAM533ZQL6JnnUkTT4UKlamavIPtN3DeX34VrwG7SNEkqwHfB97VW0e
 NbMPfAKm8YmqqsCEzF4b2bJsew4B2P7X9g==
X-Google-Smtp-Source: ABdhPJyESOBRinlV+4m99UxzRXKYGN+e3KNreVcqr5au2uW1+VCOvPDy2YGFFl5A3JUdkliNYT9Fvg==
X-Received: by 2002:a17:902:6b47:b0:150:1f58:44c3 with SMTP id
 g7-20020a1709026b4700b001501f5844c3mr4712513plt.127.1648110186129; 
 Thu, 24 Mar 2022 01:23:06 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 me5-20020a17090b17c500b001c63699ff60sm9237395pjb.57.2022.03.24.01.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 01:23:05 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/core: loader: Setting is_linux to true for VxWorks
 uImage
Date: Thu, 24 Mar 2022 16:22:43 +0800
Message-Id: <20220324082243.451107-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324082243.451107-1-bmeng.cn@gmail.com>
References: <20220324082243.451107-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

VxWorks 7 now uses the same boot interface as the Linux kernel on
Arm64, PowerPC and RISC-V architectures, except Arm. Add logic to
set is_linux to true for VxWorks uImage for these architectures in
load_uboot_image().

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/core/loader.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index ca2f2431fb..af14b377f1 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -697,6 +697,21 @@ static int load_uboot_image(const char *filename, hwaddr *ep, hwaddr *loadaddr,
         if (is_linux) {
             if (hdr->ih_os == IH_OS_LINUX) {
                 *is_linux = 1;
+            } else if (hdr->ih_os == IH_OS_VXWORKS) {
+                /*
+                 * VxWorks 7 uses the same boot interface as the Linux kernel
+                 * on Arm64, PowerPC and RISC-V architectures, except Arm.
+                 */
+                switch (hdr->ih_arch) {
+                case IH_ARCH_ARM64:
+                case IH_ARCH_PPC:
+                case IH_ARCH_RISCV:
+                    *is_linux = 1;
+                    break;
+                default:
+                    *is_linux = 0;
+                    break;
+                }
             } else {
                 *is_linux = 0;
             }
-- 
2.25.1


