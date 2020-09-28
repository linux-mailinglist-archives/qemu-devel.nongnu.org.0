Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90E27AB35
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 11:52:45 +0200 (CEST)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMpps-0006w6-Mm
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 05:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kMpo4-00061A-HT
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 05:50:53 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kMpny-0006nY-7F
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 05:50:50 -0400
Received: by mail-pg1-x544.google.com with SMTP id u24so413802pgi.1
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UZo00x5e0PgCE56Mxc+bsaLI7WCxdZMfP8+4vb35TnY=;
 b=VT96BnQ25ZEaO67/P4hpxQIcMS8sr/4ZQWyu4nV2DFYU83SK/kSFvnM94mlzCVjWV5
 eTJ+o6XPXwaIHEs8WR8Rc3XtguWfMo+6kXL/O23O46XnMljoTwp8fbN967CAfxQx5AaQ
 59PmgQxgoVEtc7+rkttsS5Vq21DJRaSwG6sysFkA7p1uYGMGEyknhpjT/a4fSgLQMfRI
 eJLonKkDxlxNvs38ECqEDR4RuCW6cA7ttow5gF6DQgHgrxqq2ubHgXjyud768xThOF0z
 +lRJ3wjfGeEtw/ylk+uT0qG3wjwoGolbnJO7FgOmAU9TJldWq8tzJhiO9vjYdFdrNEVT
 ixPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UZo00x5e0PgCE56Mxc+bsaLI7WCxdZMfP8+4vb35TnY=;
 b=B6vRdao6pvPqEH7llRYSTkwZyqgf5FhJwmKoiw+uqDYnBs5COiUeW2v26ZfXXo7PJ4
 C8RqOp6NxJ0GL6nMkHwhOQgt1cBIcPtUW/WKr5VBZX1FMZL4KU6nHilVr39df9wkkupH
 7trmj4vZivDkm3remvb7Zc/f0KVhSNu4153ddOFV55tEorZ945h1Rk+o+gkm6QbcNVAl
 qGaWXfZv2gVb1sQ4an8rrURGv3CPhRerL3G6r97Ji4paJZ7/4VaOarQE1krPDU3hBh3H
 L/Y8sp+s1KAT22ZqA0hFJcgNPkCBaMi6DY5HVLKo+cZ/qAflyN59eStrueUL0NuNCzUg
 cVCg==
X-Gm-Message-State: AOAM5301XEHecaXvR1u31L4r70SknjmQmbEvOQQVf2E4AcwJk3UVu4ir
 Q1P2Q0RKPuNoR+OVo5gkEa4=
X-Google-Smtp-Source: ABdhPJyd9zM9vCbv1H9xPCfYLOsPSQ2+2zQH+VTXLrZTNcUIrxj6ufONXV0n2nR5C/dIMOiI0yTPGA==
X-Received: by 2002:aa7:8084:0:b029:13f:b82a:1725 with SMTP id
 v4-20020aa780840000b029013fb82a1725mr9548474pff.9.1601286644638; 
 Mon, 28 Sep 2020 02:50:44 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id j4sm865417pfj.143.2020.09.28.02.50.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Sep 2020 02:50:43 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH V12 1/8] linux-headers: Update MIPS KVM type defintition
Date: Mon, 28 Sep 2020 17:49:39 +0800
Message-Id: <1601286586-1810-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1601286586-1810-1-git-send-email-chenhc@lemote.com>
References: <1601286586-1810-1-git-send-email-chenhc@lemote.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update MIPS KVM type defintition from Linux 5.9-rc6.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 linux-headers/linux/kvm.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index a28c366..36a480f 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -789,9 +789,10 @@ struct kvm_ppc_resize_hpt {
 #define KVM_VM_PPC_HV 1
 #define KVM_VM_PPC_PR 2
 
-/* on MIPS, 0 forces trap & emulate, 1 forces VZ ASE */
-#define KVM_VM_MIPS_TE		0
+/* on MIPS, 0 indicates auto, 1 forces VZ ASE, 2 forces trap & emulate */
+#define KVM_VM_MIPS_AUTO	0
 #define KVM_VM_MIPS_VZ		1
+#define KVM_VM_MIPS_TE		2
 
 #define KVM_S390_SIE_PAGE_OFFSET 1
 
-- 
2.7.0


