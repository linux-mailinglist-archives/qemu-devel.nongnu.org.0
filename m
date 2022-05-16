Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC367528BE4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:24:17 +0200 (CEST)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeS8-000050-F6
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5A-0002JI-Qr
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd59-0003Nh-4y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/zDHPfJxeRK0CPitXPTPqElU0Z+GlLsQXSOtZiRzTU=;
 b=d9/NLUT8X1NvHAquR8mEog8WoedwJti9oAp+6mKlS1qpfTIsj3Gi3dHAHFlUWHg/dRxXEj
 ZQEv0O78lQpFI00K6jw0miYsHYh05yJMGn2i1WeXfGE5K4FMPBaj8NyVqFT0vUWiPosK4w
 tpj7J6KsGrEJKa8DLNLFds80+kRz6DA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-AmQjTjHHOGiR_QdkoGpCEg-1; Mon, 16 May 2022 11:56:25 -0400
X-MC-Unique: AmQjTjHHOGiR_QdkoGpCEg-1
Received: by mail-ej1-f71.google.com with SMTP id
 p7-20020a170906614700b006f87f866117so6006020ejl.21
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/zDHPfJxeRK0CPitXPTPqElU0Z+GlLsQXSOtZiRzTU=;
 b=GtKF3tBOzGkA5RGp+PcQ0PiS7d0Envt/cebFl6Ibpd3cFc7vbkKGTv8CuBXySZMAzg
 +6Qr2CVXgUILe2qTas4wuMd+RJQBFnhcpiYibzQhdWu9Mx7heTG3CdGGYjQWotzeJlxY
 H1XeP+WY8YHRxLCoLOj2szQ9i627lllKFSfERogvy1GEn1GgChDpFw5OUHIXMnDb1or4
 incHKIwNeqQ4c20Bi9910EmCHobveicqwX88Vdk0yINHVkbyNeUt4iAshVYlm373f2Ep
 +IBeaaL49sTytakjwqJnQPntpUDEZmLjEy+QesrSXEFhzzrsRBbTw/yFJvgWKzXozk7V
 hpVQ==
X-Gm-Message-State: AOAM531Dl7SYEZxvLtNM8JagiIDtQfBYZO3LO0PV/7XYffHeDu+WIrDR
 rOgLB2JNC4LqRQFPiVAgqdzqC4GEhXwalcCL++uBwcJ1fdhyjF44NK61qD1Z9R2K0tz1q4UGLsV
 MVbgLRNhuHovh27aGNTiKe96NnONvToDRxna1UUHV61jD4EcuEsgtAGz1+TJ5r1nnopI=
X-Received: by 2002:a17:907:a40a:b0:6f4:d84e:3e49 with SMTP id
 sg10-20020a170907a40a00b006f4d84e3e49mr15546295ejc.361.1652716583750; 
 Mon, 16 May 2022 08:56:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSuN+OsIFEiE/gmFusde/zZ1tIcZWlQ7Jr50SBmMrhQGgxL3H5Aush6vnxTlMN/AF9VwlDqw==
X-Received: by 2002:a17:907:a40a:b0:6f4:d84e:3e49 with SMTP id
 sg10-20020a170907a40a00b006f4d84e3e49mr15546278ejc.361.1652716583411; 
 Mon, 16 May 2022 08:56:23 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 30-20020a170906025e00b006f3ef214e48sm32668ejl.174.2022.05.16.08.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Weijiang <weijiang.yang@intel.com>
Subject: [PULL 11/23] target/i386: Enable Arch LBR migration states in vmstate
Date: Mon, 16 May 2022 17:55:51 +0200
Message-Id: <20220516155603.1234712-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The Arch LBR record MSRs and control MSRs will be migrated
to destination guest if the vcpus were running with Arch
LBR active.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20220215195258.29149-8-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/machine.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/target/i386/machine.c b/target/i386/machine.c
index 7c54bada81..cecd476e98 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -136,6 +136,22 @@ static const VMStateDescription vmstate_mtrr_var = {
 #define VMSTATE_MTRR_VARS(_field, _state, _n, _v)                    \
     VMSTATE_STRUCT_ARRAY(_field, _state, _n, _v, vmstate_mtrr_var, MTRRVar)
 
+static const VMStateDescription vmstate_lbr_records_var = {
+    .name = "lbr_records_var",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(from, LBREntry),
+        VMSTATE_UINT64(to, LBREntry),
+        VMSTATE_UINT64(info, LBREntry),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define VMSTATE_LBR_VARS(_field, _state, _n, _v)                    \
+    VMSTATE_STRUCT_ARRAY(_field, _state, _n, _v, vmstate_lbr_records_var, \
+                         LBREntry)
+
 typedef struct x86_FPReg_tmp {
     FPReg *parent;
     uint64_t tmp_mant;
@@ -1525,6 +1541,27 @@ static const VMStateDescription vmstate_amx_xtile = {
 };
 #endif
 
+static bool arch_lbr_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return !!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR);
+}
+
+static const VMStateDescription vmstate_arch_lbr = {
+    .name = "cpu/arch_lbr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = arch_lbr_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.msr_lbr_ctl, X86CPU),
+        VMSTATE_UINT64(env.msr_lbr_depth, X86CPU),
+        VMSTATE_LBR_VARS(env.lbr_records, X86CPU, ARCH_LBR_NR_ENTRIES, 1),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
@@ -1668,6 +1705,7 @@ const VMStateDescription vmstate_x86_cpu = {
 #ifdef TARGET_X86_64
         &vmstate_amx_xtile,
 #endif
+        &vmstate_arch_lbr,
         NULL
     }
 };
-- 
2.36.0


