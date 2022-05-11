Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60E523AE5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 18:54:14 +0200 (CEST)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nopbJ-0000Mq-Ak
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 12:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nopa5-0007kg-As
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:52:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nopa2-00049C-GV
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652287973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oXN0OHQHHsRbWMq5ZyAqo7Wdm4LtAIbTrGoNAoov4rc=;
 b=c7Eja1LT4Df5w0LFIu4iNcYdM+TXmosAYPY81b8XKIbEr+gG+EcgWvlbuklE4ZbV1V0Gf7
 ZO5xb0eb9xMTJz+MyINSvzLBJMKpFnG1a+WNywLr7d1QtUM/FgDCXDEc95AWalViAsoW1z
 d1fxLeRS1EDpC6lbvR8hf6mF8ceY6VM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-OKJhsr5DNtGND8VnLO5cpA-1; Wed, 11 May 2022 12:52:51 -0400
X-MC-Unique: OKJhsr5DNtGND8VnLO5cpA-1
Received: by mail-ej1-f72.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso1452675eje.13
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 09:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oXN0OHQHHsRbWMq5ZyAqo7Wdm4LtAIbTrGoNAoov4rc=;
 b=Xq/EgflfhqNPgYC/ATEOSMhp163MxdwDCm7HepU0m4T5Zkj3z8JXhSEGqsRu86Ylcs
 qRuttb58+VtRcVhPT/40HRU0jUbjhHISFOJ6w/0aik6nWqv35fQ6yHujIabS7ATAvPrS
 mT7DlrjQOi2jIx+035dzgE30UFvQ0qD2B43CLcFbyvo3Zl52QivYGRfEg6L0IO+Nfx8J
 hs9B5Gi1pfwDUQCA0JuC/U93NPN9kEIE9coWTbvP7LfDdXU7wcwE0QfjWpmq7y4SydwP
 ia+7WpTT0U0Cw1ijTlQ6BCUhOVoVSUuzIQTADF11/9xZAfN4cYQoJ6xiiFjo7grekw6s
 WpDw==
X-Gm-Message-State: AOAM533vVWqPKs/Iowh2O78IEY1XZ2YSWHcgnQywTmRVOBbSWg6n3YbW
 IxyZdTAqfIP4/6VnZzqaDyHm2LWoP9+18vYQ9z0GFyLB2c5ovlFuG3QQIKEwInLU3vj4AS9URfO
 PxQYaOZPzyDHk9B227HQUKFHDVTfL7L4D7O2+mi2Vpu3QyFGCDN9895F+KhCEacjc9LA=
X-Received: by 2002:a05:6402:1d48:b0:427:dfa3:2272 with SMTP id
 dz8-20020a0564021d4800b00427dfa32272mr30264324edb.333.1652287970104; 
 Wed, 11 May 2022 09:52:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoRSE7BK3e3DMmqrtnMqnAZLdJaKQegJGhXmH6lXCj3urjhD4FrkeNTf/eh2IsCSIA5oSYZA==
X-Received: by 2002:a05:6402:1d48:b0:427:dfa3:2272 with SMTP id
 dz8-20020a0564021d4800b00427dfa32272mr30264296edb.333.1652287969828; 
 Wed, 11 May 2022 09:52:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a50f18c000000b004278942f86asm1449235edl.7.2022.05.11.09.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 09:52:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: vkuznets@redhat.com
Subject: [PATCH] vmxcap: add tertiary execution controls
Date: Wed, 11 May 2022 18:52:44 +0200
Message-Id: <20220511165244.336750-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
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


