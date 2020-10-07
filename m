Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746AE285AB4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 10:43:58 +0200 (CEST)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ53F-0007Pj-Hc
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 04:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kQ4zR-0005iH-Am
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:40:01 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kQ4zP-0002Df-NZ
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:40:00 -0400
Received: by mail-pj1-x1041.google.com with SMTP id a1so703769pjd.1
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TiNCEUVKKCHWqpy9W5xDNZIsp3AxDMHKvqiirTNf+tE=;
 b=WqayvCjX4rOnjamB2hYjHiEEPachPreR/zav5XmueqkCAShDSXlxLolAYF9yMYsfKX
 Fs02Gj3spmio8ni9jlaS/q+FxJ7ucfotmdCt1YB7zdHcNbqe768UWFsCLNqDyr/NIyXo
 A+2kiPTEl1U7u6gIi+pip7cGqWtTDPqbSZdLhlBKVQHtQr+MRnYIMqCwQc2omK8oNeni
 6i2P8mTQ9KTDrNHwMGJATPaRZAR+rNkznjhL2+9XNG7ZSalN25Ql1wvCxLsDtd5z4gzp
 PfHaubvSGsKmc7ThF9XMisbOqqm0rDEmMzuJj5AqbAh9SCRmYTLS6DnukxyFlr8O7ph4
 /a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TiNCEUVKKCHWqpy9W5xDNZIsp3AxDMHKvqiirTNf+tE=;
 b=GnI2RC/ZazwyjJPZjf94gf7K4yG7AGaDqQiVEdfC/HlsHlugIElbiiZdXMUUk29ibc
 PWuksr+5dXZASG/6qwH+Arjt4+GZ3CU18AUDPqSCw/PslWW/wEanD2Kvt7nChMaAudLr
 v0umyf28Ud9TQ+LewJQ5N2cKzHpQf7JdG+1pRKii80aikQ89oiC5IvRJty9Jf1PYZHuH
 zvKqsukCIeuCNhi87/LTDp6jzTQU2qBig6j6Ut1dEquS9y5IZww/BI0HW0kV1p6p9Q27
 96JOD9O6sEPvXVAz0ArLtMUmzHr8yirKbUbEdNSnwe2ZPQKAUlT6sRRUKzIorvvCBdRs
 oeEQ==
X-Gm-Message-State: AOAM530oHcreE2PVKLTxXc+sfDlF2J+ny1gNpbVtp5niyyK1/lDbDE37
 hatK5Xpai0+BAPbnPH47z7Q=
X-Google-Smtp-Source: ABdhPJzjri07Yl28UQ2upoE2I7WXdt2dbeSRK6pbX1TLhG7tyPC72OIQ/1+skFbID86W+VQ85kLgIQ==
X-Received: by 2002:a17:90a:7f82:: with SMTP id
 m2mr1952681pjl.177.1602059998492; 
 Wed, 07 Oct 2020 01:39:58 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id i9sm1999692pfq.53.2020.10.07.01.39.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Oct 2020 01:39:57 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH V13 1/9] linux-headers: Update MIPS KVM type defintition
Date: Wed,  7 Oct 2020 16:39:27 +0800
Message-Id: <1602059975-10115-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1602059975-10115-1-git-send-email-chenhc@lemote.com>
References: <1602059975-10115-1-git-send-email-chenhc@lemote.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pj1-x1041.google.com
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
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update MIPS KVM type defintition from Linux 5.9-rc6.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 linux-headers/linux/kvm.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 6683e2e..c138b2f 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -790,9 +790,10 @@ struct kvm_ppc_resize_hpt {
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


