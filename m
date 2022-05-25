Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F883534471
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:44:40 +0200 (CEST)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwvv-0008Gq-EE
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhC-0005QQ-Rf
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhB-0003rf-6J
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zji5N8tvYfzPULF1gqHXy1PKmhSyaeVYQ1Ev1V1EIkU=;
 b=XUVfpgPnXsA2bWi6hMHzQz6lRHwzVnxCuJvSsWm4xFIY2QbCc3ZMyJlu79/E02m2cODX3r
 lgl8jsrLSgezRXHedACLWTl1v24LpKRptpirt4WoQh7MBhgS4iRqdfnTj2QGiW9q9KULLE
 xaPooIuhxHstU6ApB4emqogGNJpDDAY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-XJoSVuHfM-OzSy_UiSCOaw-1; Wed, 25 May 2022 15:29:22 -0400
X-MC-Unique: XJoSVuHfM-OzSy_UiSCOaw-1
Received: by mail-ej1-f71.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so9212675eje.23
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zji5N8tvYfzPULF1gqHXy1PKmhSyaeVYQ1Ev1V1EIkU=;
 b=0jpzvi4Q8puKqehx5NEE3jQt2dpnfvm7jSw2bNGeXm/rkNJ+aUA+ZjcDWue2Z50Y3B
 XvG9AY/Ic2FHIu7/Xog+ckXwVchqNtRfdB7WH0PfAQT1TArAQGMoOa4kzlrum9URx4Px
 SARp+/PE6VMk/65sYrG1Mj723+MOU5x8zITCo9jULg6dMI2f/e8QZTAcGFbmmzUItvtD
 3euA4nFU6nG8sLNPlvZMTN9gPB0577EozW4r4g0nqM8npzEau39kWBOrk66sQJrWcCol
 qXPTFu/bQZTfmdUJlK8XsmTalPxRu1V0qkcf0fbKX9w+U0FCfz9+qw5dfR5rKWVDiAuc
 Sh8Q==
X-Gm-Message-State: AOAM5303JvffG+1YTWiP9FZ8pqmhJSCHg2WMFcPzw5PvQbxi+UIZGEcB
 fSqI1ngauzpf2O0ho1lfn5IrUFYmb/74zLWkuohnVzG6gQobTMHpB5BDQquhfJU3HXgfWvxgI1e
 TwRwa59PSttmim7sWmamQ1A2fIjeIL+o1EJVFtE1QAHZV/NCiarpUps7yQKMON5rWPP0=
X-Received: by 2002:aa7:d2d0:0:b0:42b:c56b:c619 with SMTP id
 k16-20020aa7d2d0000000b0042bc56bc619mr6163455edr.157.1653506960783; 
 Wed, 25 May 2022 12:29:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOMHsOMcX2q9aKbqrTinJYnr8OhUX0FLAWVKVKHTEwstH4u9N+johCnlg+BQJYlIk14Bfctg==
X-Received: by 2002:aa7:d2d0:0:b0:42b:c56b:c619 with SMTP id
 k16-20020aa7d2d0000000b0042bc56bc619mr6163436edr.157.1653506960441; 
 Wed, 25 May 2022 12:29:20 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 15-20020a170906004f00b006f3ef214dd9sm8039809ejg.63.2022.05.25.12.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-stable@nongnu.org
Subject: [PULL 10/17] target/i386/kvm: Fix disabling MPX on "-cpu host" with
 MPX-capable host
Date: Wed, 25 May 2022 21:28:45 +0200
Message-Id: <20220525192852.301633-11-pbonzini@redhat.com>
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

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

Since KVM commit 5f76f6f5ff96 ("KVM: nVMX: Do not expose MPX VMX controls when guest MPX disabled")
it is not possible to disable MPX on a "-cpu host" just by adding "-mpx"
there if the host CPU does indeed support MPX.
QEMU will fail to set MSR_IA32_VMX_TRUE_{EXIT,ENTRY}_CTLS MSRs in this case
and so trigger an assertion failure.

Instead, besides "-mpx" one has to explicitly add also
"-vmx-exit-clear-bndcfgs" and "-vmx-entry-load-bndcfgs" to QEMU command
line to make it work, which is a bit convoluted.

Make the MPX-related bits in FEAT_VMX_{EXIT,ENTRY}_CTLS dependent on MPX
being actually enabled so such workarounds are no longer necessary.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Message-Id: <51aa2125c76363204cc23c27165e778097c33f0b.1653323077.git.maciej.szmigiero@oracle.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35c3475e6c..385691458f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1355,6 +1355,14 @@ static FeatureDep feature_dependencies[] = {
         .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INVPCID },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_ENABLE_INVPCID },
     },
+    {
+        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_MPX },
+        .to = { FEAT_VMX_EXIT_CTLS,         VMX_VM_EXIT_CLEAR_BNDCFGS },
+    },
+    {
+        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_MPX },
+        .to = { FEAT_VMX_ENTRY_CTLS,        VMX_VM_ENTRY_LOAD_BNDCFGS },
+    },
     {
         .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_RDSEED },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDSEED_EXITING },
-- 
2.36.1



