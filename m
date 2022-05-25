Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D7534439
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:32:34 +0200 (CEST)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwkC-0007AY-CU
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgr-0004Zj-G4
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgo-0003pA-8N
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngKAJ1ClsBYBIb2xn8wk4rk26dUbkChSoPtm42EWb1o=;
 b=VD7FuWGU2CVy/ZkvQJGL1kw34o93C1e2jX82gRL3xCxBV2VfpLocUwh69yzTrugG7ycUJU
 FMadWZIra/HQmweBdWHda4rEz7/GFk1dcv2LtBNyWAaLh7KS+gszqRtBn/fb6GqeVjGyLs
 SjxVIYW9kzzKtCF/C+QjMEDXptHrUdE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-vNn2tm9aN7KIYuGn0qFmEw-1; Wed, 25 May 2022 15:28:59 -0400
X-MC-Unique: vNn2tm9aN7KIYuGn0qFmEw-1
Received: by mail-ej1-f69.google.com with SMTP id
 tl4-20020a170907c30400b006ff066327b2so3093639ejc.9
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ngKAJ1ClsBYBIb2xn8wk4rk26dUbkChSoPtm42EWb1o=;
 b=I0EweTSjo5zChGmWV7awRCRaDcYteEUsbKuTy00zjhFsD8+zruvbcDCwxg67Hv7Goi
 d+K7sMfdok53TZtYFMpJ+8nAfElnACGHPgYMO8d95+Nvx5sY4faWMN0bL39Z2f00rcqJ
 nLaHeB/xINt9voaseOgdvGjvDSkDYC/kwda0yf4t/MZmEhh1HopwBMbzmS0caL9cc+EK
 KxLkiA47MNwEEBX0Xo4xYkaG25IWfTFSMtdal5TC87iezFu9cE41xp/W9WnWqftv2EpQ
 cpnG//G4sdYaVo2fsGM5IUNr2LQcNu0PN8OHST80cCMbE6Dq4/O4CM6KWsczoegq5hcd
 RiVg==
X-Gm-Message-State: AOAM530HVEsBor1GwKf+U6DsSTp4GmeahFSwgBthwxiNu1yFvQ/DzVgm
 0obdmrqJrCVvcLbVZlBqUFor/Xi5bMNjUKTVyYGrCeq2FT+PzkGTejI9y2SN5mUKr6rfo3ZwzV1
 oTccxnRAafv0CpE2tQggHqcMJXh8ryd7IbgvWhwdCmTpWAkOz5JfqZMRi6/IV6PHsozM=
X-Received: by 2002:a17:906:c209:b0:6fe:a3d5:c5a4 with SMTP id
 d9-20020a170906c20900b006fea3d5c5a4mr26041587ejz.759.1653506937561; 
 Wed, 25 May 2022 12:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygu6IeBWcpD4BjjgVh71MuUzHXSPnkTdYNzWmzxvQEnpGp8H2RIXt9ahysGGDysV8R3cMpSw==
X-Received: by 2002:a17:906:c209:b0:6fe:a3d5:c5a4 with SMTP id
 d9-20020a170906c20900b006fea3d5c5a4mr26041558ejz.759.1653506937209; 
 Wed, 25 May 2022 12:28:57 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170906700600b006fed40e5564sm3864081ejj.83.2022.05.25.12.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:28:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Weijiang <weijiang.yang@intel.com>
Subject: [PULL 01/17] target/i386: Remove LBREn bit check when access Arch LBR
 MSRs
Date: Wed, 25 May 2022 21:28:36 +0200
Message-Id: <20220525192852.301633-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Weijiang <weijiang.yang@intel.com>

Live migration can happen when Arch LBR LBREn bit is cleared,
e.g., when migration happens after guest entered SMM mode.
In this case, we still need to migrate Arch LBR MSRs.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20220517155024.33270-1-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a9ee8eebd7..e2d675115b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3373,15 +3373,14 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
             int i, ret;
 
             /*
-             * Only migrate Arch LBR states when: 1) Arch LBR is enabled
-             * for migrated vcpu. 2) the host Arch LBR depth equals that
-             * of source guest's, this is to avoid mismatch of guest/host
-             * config for the msr hence avoid unexpected misbehavior.
+             * Only migrate Arch LBR states when the host Arch LBR depth
+             * equals that of source guest's, this is to avoid mismatch
+             * of guest/host config for the msr hence avoid unexpected
+             * misbehavior.
              */
             ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
 
-            if (ret == 1 && (env->msr_lbr_ctl & 0x1) && !!depth &&
-                depth == env->msr_lbr_depth) {
+            if (ret == 1 && !!depth && depth == env->msr_lbr_depth) {
                 kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, env->msr_lbr_ctl);
                 kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, env->msr_lbr_depth);
 
@@ -3801,13 +3800,11 @@ static int kvm_get_msrs(X86CPU *cpu)
 
     if (kvm_enabled() && cpu->enable_pmu &&
         (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
-        uint64_t ctl, depth;
-        int i, ret2;
+        uint64_t depth;
+        int i, ret;
 
-        ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_CTL, &ctl);
-        ret2 = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
-        if (ret == 1 && ret2 == 1 && (ctl & 0x1) &&
-            depth == ARCH_LBR_NR_ENTRIES) {
+        ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
+        if (ret == 1 && depth == ARCH_LBR_NR_ENTRIES) {
             kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, 0);
             kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, 0);
 
-- 
2.36.1



