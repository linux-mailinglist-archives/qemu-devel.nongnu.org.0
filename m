Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9418C5A9F42
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:42:17 +0200 (CEST)
Received: from localhost ([::1]:34724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTp8q-0000MJ-O1
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos6-0007h5-H4
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos0-0008J7-5G
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=066MnNoNDKXSjA2kxKedetVtMU/T3Tvf5Cyk2DBEL3k=;
 b=OL81Qezk6Az0EWJNdBZk++eyItQx29ILV33NbGOq4FJYzV3K/oGfHVGR/tZRMv1ry/eny5
 OLX8lCODFh+4/3mFnSCYKwQK8fKst8hKXZ1wZWGA6ISGTUa2H63tOAXFCcmjVRfhttV1nS
 0m9sWWaAY0umzW0e1z4GwNWLuJLdSns=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-Dv-bL7AQMwiiFFwzPiUctA-1; Thu, 01 Sep 2022 14:24:45 -0400
X-MC-Unique: Dv-bL7AQMwiiFFwzPiUctA-1
Received: by mail-ej1-f70.google.com with SMTP id
 sg35-20020a170907a42300b007414343814bso6483473ejc.18
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=066MnNoNDKXSjA2kxKedetVtMU/T3Tvf5Cyk2DBEL3k=;
 b=GfJUEujWoQrkIt1LtXoeOY09hM9tw2dQjc1QI0G6Imflad5xOwqRBBpv3N8Yfq7gCC
 gqdFUFZqUeWcyzPPdnDzFultGnkxYUfZzbxoM3vsDrDX/JS96Q9JN5q1jYPbRi339pOV
 UB+WRn04kDX2pZ8WvMYccK63h1ChhTYXiqSJa0+ZNrmYotDBGV0st3GWi7rrTr4+5MrO
 jfsNIAfw+vh6xQGrw9XvLdlIl88tNZvMQxaiIpGm/+RJhQNxghOH7fnfvoNKm1etuaTh
 F//wx9r89WCD4qDRchuFT9cTINivhb0aYHYWK6rj1x6pCXCDaNeb/eRhfLoPHzsklz07
 f8mg==
X-Gm-Message-State: ACgBeo3fQUgwb47SPyLaliZGAH1biGlUG5vC6heYbwfSQYdeOK6p9QVL
 ifFLSa/I4TXgyzwF0AbxGP1WbtxG9IjVrKczIeYVbbFBGymFvjlxBDpqsejxWxd72aYVmTRxkin
 PiebqWQphEi+2bu50WGyhd+9PoT0YgkoHDxmC/F5lgEj+Pr2Z+1P0hjivAiL7/N78/GU=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr18759073ejc.208.1662056683896; 
 Thu, 01 Sep 2022 11:24:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6mmD/m7MgszgMK2KSlrSa/jk+8ig/OImVcdAvm5GurpGJhpaGYXV/cS0nRK3Cth3GMgfrF9A==
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr18759057ejc.208.1662056683643; 
 Thu, 01 Sep 2022 11:24:43 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906300a00b00738795e7d9bsm3939ejz.2.2022.09.01.11.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PULL 05/39] i386: do kvm_put_msr_feature_control() first thing when
 vCPU is reset
Date: Thu,  1 Sep 2022 20:23:55 +0200
Message-Id: <20220901182429.93533-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Vitaly Kuznetsov <vkuznets@redhat.com>

kvm_put_sregs2() fails to reset 'locked' CR4/CR0 bits upon vCPU reset when
it is in VMX root operation. Do kvm_put_msr_feature_control() before
kvm_put_sregs2() to (possibly) kick vCPU out of VMX root operation. It also
seems logical to do kvm_put_msr_feature_control() before
kvm_put_nested_state() and not after it, especially when 'real' nested
state is set.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220818150113.479917-3-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 4f8dacc1d4..a1fd1f5379 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4529,6 +4529,18 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
 
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
+    /*
+     * Put MSR_IA32_FEATURE_CONTROL first, this ensures the VM gets out of VMX
+     * root operation upon vCPU reset. kvm_put_msr_feature_control() should also
+     * preceed kvm_put_nested_state() when 'real' nested state is set.
+     */
+    if (level >= KVM_PUT_RESET_STATE) {
+        ret = kvm_put_msr_feature_control(x86_cpu);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     /* must be before kvm_put_nested_state so that EFER.SVME is set */
     ret = has_sregs2 ? kvm_put_sregs2(x86_cpu) : kvm_put_sregs(x86_cpu);
     if (ret < 0) {
@@ -4540,11 +4552,6 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
         if (ret < 0) {
             return ret;
         }
-
-        ret = kvm_put_msr_feature_control(x86_cpu);
-        if (ret < 0) {
-            return ret;
-        }
     }
 
     if (level == KVM_PUT_FULL_STATE) {
-- 
2.37.2



