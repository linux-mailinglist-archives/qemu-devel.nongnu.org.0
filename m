Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B15254C4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:24:26 +0200 (CEST)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDU9-0007aV-DS
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZm-0005Hs-Nv
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZl-0005IM-7R
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXN0OHQHHsRbWMq5ZyAqo7Wdm4LtAIbTrGoNAoov4rc=;
 b=L2KAfH1uINqUHHOCHv3BEaJamITF7weleSEdap3JqYgu4+vM1djJBwP6wU+i+cA6BjtsRN
 prhA7hUUqSnnyEs5ggpPAdFS464W6mUAlMkdVnSliVRJEn6I+XRKccJl2QR9d3VVKIXW4d
 ZKSBPqce9VgiBh5UnfjocviD6/6qMVA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-tZzRwIF2MIueisrvkEVUsQ-1; Thu, 12 May 2022 13:26:07 -0400
X-MC-Unique: tZzRwIF2MIueisrvkEVUsQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 t25-20020a508d59000000b00425d86c2987so3463780edt.21
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oXN0OHQHHsRbWMq5ZyAqo7Wdm4LtAIbTrGoNAoov4rc=;
 b=SLQtp/HCZUePcb77hVKp2C0zSccmV1b4Xj4OJILgV8E3pStsZeM+lEnMJWrNSgGMjg
 M/8FnY/uSOyHcn7BN0BL/auHe35lf+MUe0dN3LbMkgKiDxpjhx7QSqruukN6JSxuLFo7
 wlEyPmFmDfRj6ZlkRhBN20PCc/ygX+De8AjafG5KZ4rDNePXmozVKleEugcXyWOeAV9c
 SwxglYBDN3BwlAUUQlcyvO6wL4vg/ngQaENwhu27yb2RHuNV55JGjVJBgEndiF7TmYj0
 Ij0Qx3QQVMY2LQ2opikbwIcmmeiJyhZm4fNmv79FpHyejT7vvDOuy7bN+UtjzQqPZBA1
 O7eg==
X-Gm-Message-State: AOAM5311KFLCLnOH39aIWraYDnguUl+H1nINnMfYdFUn28Zor9v72zpr
 DFIP9fM7HZWIO+rA+wwauGdIW96KVhcNwk9FXpwwzAY7Z3SWP/OUula5FUN8Of2RdV2DGcKPJFs
 XwBy1FRJz+xjpU+k7LQDg83q+Q6+VikhSpYwCXlu8VQAQIQGbAWaYXeO5U/PqaH+EJ0Q=
X-Received: by 2002:a17:907:8a17:b0:6f4:4b56:f550 with SMTP id
 sc23-20020a1709078a1700b006f44b56f550mr879451ejc.720.1652376365770; 
 Thu, 12 May 2022 10:26:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWh5s+ui0q29t2uQwp5XhkJLe8FHbNicsVBZaXFaenaK/ztISCPMl6XcYcTlviSuN5G4Wbqg==
X-Received: by 2002:a17:907:8a17:b0:6f4:4b56:f550 with SMTP id
 sc23-20020a1709078a1700b006f44b56f550mr879432ejc.720.1652376365500; 
 Thu, 12 May 2022 10:26:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05640206d300b0042617ba63absm2787433edy.53.2022.05.12.10.26.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:26:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/27] vmxcap: add tertiary execution controls
Date: Thu, 12 May 2022 19:25:05 +0200
Message-Id: <20220512172505.1065394-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kvm/vmxcap | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
index f140040104..ce27f5e635 100755
--- a/scripts/kvm/vmxcap
+++ b/scripts/kvm/vmxcap
@@ -23,6 +23,7 @@ MSR_IA32_VMX_TRUE_PROCBASED_CTLS = 0x48E
 MSR_IA32_VMX_TRUE_EXIT_CTLS = 0x48F
 MSR_IA32_VMX_TRUE_ENTRY_CTLS = 0x490
 MSR_IA32_VMX_VMFUNC = 0x491
+MSR_IA32_VMX_PROCBASED_CTLS3 = 0x492
 
 class msr(object):
     def __init__(self):
@@ -71,6 +72,13 @@ class Control(object):
                 s = 'yes'
             print('  %-40s %s' % (self.bits[bit], s))
 
+# All 64 bits in the tertiary controls MSR are allowed-1
+class Allowed1Control(Control):
+    def read2(self, nr):
+        m = msr()
+        val = m.read(nr, 0)
+        return (0, val)
+
 class Misc(object):
     def __init__(self, name, bits, msr):
         self.name = name
@@ -135,6 +143,7 @@ controls = [
             12: 'RDTSC exiting',
             15: 'CR3-load exiting',
             16: 'CR3-store exiting',
+            17: 'Activate tertiary controls',
             19: 'CR8-load exiting',
             20: 'CR8-store exiting',
             21: 'Use TPR shadow',
@@ -186,6 +195,14 @@ controls = [
         cap_msr = MSR_IA32_VMX_PROCBASED_CTLS2,
         ),
 
+    Allowed1Control(
+        name = 'tertiary processor-based controls',
+        bits = {
+            4: 'Enable IPI virtualization'
+            },
+        cap_msr = MSR_IA32_VMX_PROCBASED_CTLS3,
+        ),
+
     Control(
         name = 'VM-Exit controls',
         bits = {
-- 
2.36.0


