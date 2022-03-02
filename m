Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518464CAD51
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:16:33 +0100 (CET)
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTWa-0004P3-DK
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:16:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRs-0006eV-Ow
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:41 -0500
Received: from [2a00:1450:4864:20::429] (port=43913
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRq-0008Li-S7
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id m6so4063498wrr.10
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9cqJILoV0+xn8mWQ2aytUPnC+SpQT6vl7Ugzs0thRM=;
 b=id2G97uub8Qa3dD1fLhTCiPLhQzRU5ZiimUd8W2FoyKBm/3EI6JdkUzWUHvxqHQVVL
 leY7EfX/ldU5TvudNjV6fdkQg+Up1ZURVunzBSdcbagaeVqlGeSlPKeIpnzoQwzRXNty
 8vowyMtdaUCUEGAfmrZGXYiXivJ5FdIlRs7vgzKoTyqocriDIXo+uFXUVKd9qo+xxwPa
 ZYWoPgAcQdKc23y07TLHMTx0O4zyv9wFcsGwnNf/ZPHgukaiPDg1VDjU7RQP2CIDQptm
 ce1fRvwaezZ3wiS6aehqKOoajLrGGxYpe4uUM3b0ffP1B8AT55wKB+EcMqQUXNJDlLxr
 XPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y9cqJILoV0+xn8mWQ2aytUPnC+SpQT6vl7Ugzs0thRM=;
 b=v4Pa7vZdTeJbWTfOtGMnGKgVp5NXgOIaK/mo3tRtCdveuOZhu9UYICOlTwhGWRJ+e2
 JLWWOk5iurG9jWKxtpc56xvEtLDVmHTKnflLfQ1Pbz/jM97V4R8R4fG0j9GrfU/kymKa
 KUPSP1iJvpoHhpXqyyPRKk2oc1RG5uHT2SgB/26DKeKjmxejlJ+QJpE1gQ8j/4gbQP4J
 pCF6EzzQFUKGahoxmU2HTLFqODy0L5W7zf06/tH5AcONPLOAVEQlYq3kr/iAxsXkMDVv
 YOvR+HUXcAYmZxtqK+F7WbB+OrED30oTPOhUFPnp2MMw/kpAHHBOOqV0eworxQL9xy50
 /osQ==
X-Gm-Message-State: AOAM530YL810Ae5cDysV9guK+xbpnkWApDaK0/j9M/MVQCltFEUDILoX
 mUHsxzy8yEIlqO9LpfwrRmK98BKpJ6w=
X-Google-Smtp-Source: ABdhPJzxZvIxl88LJnT187ZwGEyw3rMF4JAbXTP4fTcOXmViEAG0ZTDkX2xuGAlJFXsjwMaVKPS1Rg==
X-Received: by 2002:adf:e5d0:0:b0:1f0:22ee:5828 with SMTP id
 a16-20020adfe5d0000000b001f022ee5828mr5227668wrn.516.1646244697372; 
 Wed, 02 Mar 2022 10:11:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] whpx: Fixed reporting of the CPU context to GDB for
 64-bit
Date: Wed,  2 Mar 2022 19:11:24 +0100
Message-Id: <20220302181134.285107-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Ivan Shcherbakov <ivan@sysprogs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivan Shcherbakov <ivan@sysprogs.com>

Make sure that pausing the VM while in 64-bit mode will set the
HF_CS64_MASK flag in env->hflags (see x86_update_hflags() in
target/i386/cpu.c).

Without it, the code in gdbstub.c would only use the 32-bit register values
when debugging 64-bit targets, making debugging effectively impossible.

Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>
Message-Id: <00f701d82874$68b02000$3a106000$@sysprogs.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/whpx/whpx-all.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index ef896da0a2..edd4fafbdf 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -604,6 +604,8 @@ static void whpx_get_registers(CPUState *cpu)
         whpx_apic_get(x86_cpu->apic_state);
     }
 
+    x86_update_hflags(env);
+
     return;
 }
 
-- 
2.34.1



