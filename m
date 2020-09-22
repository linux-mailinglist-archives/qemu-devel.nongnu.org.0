Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32372738EA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 04:51:39 +0200 (CEST)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKYP4-0004ZV-M7
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 22:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kKYNj-0003c5-7C
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 22:50:15 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kKYNf-0001pS-LH
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 22:50:14 -0400
Received: by mail-pg1-x544.google.com with SMTP id t14so10716391pgl.10
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 19:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4LZY9AT6Mymy8OX4vUPbotCOlkEO5KtdgcPTjzUYABc=;
 b=mkyvjKVxDGF9tF1tvCjoT+Qr8L5aVg9d1n9Dyd8YVGJFdOU1U4QT+FUCNfMp3xad3n
 +XavmL73JF5gKmH/Vrrj61w6rX1qmFXCy5ZkmaNdbiMFc9gxNI81kE6/yvsZDMV1rDB7
 Mv8KLtBsqHCZL6zoDwQpEezNYTgVAo+auFDWuQOAtNYK6bj+9Ud27nDBfUMO6uQOqrVj
 eHC9+s+hgNWqjintkCVVqLQOomrlHoa3oloP3SiwLccMGZh5VVEg4+aU0vtqDS54F4AI
 zErJs1wCMCYYCuEyN2ZYWqH89R5W6/x9Fn07FR3oFppQ1FhMxQy7M7pWgMcu+2LFcNGY
 PtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4LZY9AT6Mymy8OX4vUPbotCOlkEO5KtdgcPTjzUYABc=;
 b=OuHp5HqU2DGg8BWiggehqRVslrCzoqAeQrdgv2aHUaAr3nWtLWUliLN45QqFCLaafl
 0HzyovptspQb7xG0ZUb5i/7aYPzbij6CQ16zJDJ99gQ8Erpdz1vpEJ2Y6inNB9E1GcL6
 uQRZ65s1HZrTAwkXUjvIB/iwuR1iKTbkHH871yGcfaWwX2M4htgmQ/exR04FZUhIeHwk
 pw/+/QqbV2gsR6jmOOlb97a14c3v/Lqq9AvxcQd7BJz5YgwzA6ipL9cLNohfgkLFH1yG
 T2c7z2JCzH0MrdOse0nXH6D9ou4ShX9tgrzVZwoqBxRcV+nZCnJey1ftd+Se0QqqoJll
 ohZg==
X-Gm-Message-State: AOAM532MYO7exEBVC2AdjX6siWoqCYJTX+2TnU/T2CgazcrIc4DGFWwR
 4Mc7TV8LtdKjypjW++DgBQU=
X-Google-Smtp-Source: ABdhPJx3xSd40uKWqMgKhr54ZCjXCY21XcCG8G3oKRsaqCq8lGKT82l+B4eKgFTyZn48SMwLpwT3+A==
X-Received: by 2002:a17:902:ab87:b029:d2:1ceb:34 with SMTP id
 f7-20020a170902ab87b02900d21ceb0034mr2654855plr.12.1600743010226; 
 Mon, 21 Sep 2020 19:50:10 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id q4sm13263677pfs.193.2020.09.21.19.50.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 19:50:09 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH V10 1/8] linux-headers: Update MIPS KVM type defintition
Date: Tue, 22 Sep 2020 10:49:20 +0800
Message-Id: <1600742967-12933-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1600742967-12933-1-git-send-email-chenhc@lemote.com>
References: <1600742967-12933-1-git-send-email-chenhc@lemote.com>
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
index a28c366737..36a480fd77 100644
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
2.17.2


