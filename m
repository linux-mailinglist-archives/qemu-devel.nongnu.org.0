Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D2D57967C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:40:50 +0200 (CEST)
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjij-0007yN-6l
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjcx-0001Vp-MW
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjcw-0000R2-5T
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658223289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHdWC55cUPvE5A/T86wNKaY1/bkuZbeyxYtfxnHKD7k=;
 b=CNYMqYnRksHLmGygIaaD8hgpr+iNpbvuu23omQh0FN7kQOT3FgOjx9wZUsmVtmhYdnpAaJ
 3ePHEMHV1eTPHrellPxnxgHI7dxEvrXRKfzli1IxdPJOPQsQuQFoIIk6ecfslQgIVPuwn1
 coWBu+3Om+Bd+4lHbjgSO66W6tkfTzU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-iFfcRJBeP7miuUxdqY0inw-1; Tue, 19 Jul 2022 05:34:45 -0400
X-MC-Unique: iFfcRJBeP7miuUxdqY0inw-1
Received: by mail-ed1-f71.google.com with SMTP id
 g7-20020a056402424700b0043ac55ccf15so9517714edb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 02:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHdWC55cUPvE5A/T86wNKaY1/bkuZbeyxYtfxnHKD7k=;
 b=mKvkPnoeFRneGEEmQ7u302UpDeo4oJeVAgoWOaKQ+k/C3Iv9EzsvbbmPAjLb/4SAiR
 f6V/KGs+NUlYwb6i+AO7ruQraS6+yUimsrnn5EYxjPjRrOIAFth+/TLOW+UFUqSk6eBu
 TBgM5xxvG1buJPCgQvYbQjp6wFJovic89QS30lg8v9/FummiFd5NooFvEGJoy3eqFQZb
 i8X/RGhOZCxQeUDIR0ftM50HtTNaWHQIRMoUAB12f0hG0NRnH7JZ4WO8pZngLOmmJSV1
 OBh4XxaHL5sjMWcLPEq38WvwolGUkcD835zCY/S9wjnuFvIPPaENb4487tJcy/+reM/R
 tP7g==
X-Gm-Message-State: AJIora+0csh2uZcEdCt9c15KeQ9fz9yGa2hBdVp5gtk4gXQNB4mo/zYv
 Byi4iu/tM5KesfUGsQHqPX4gyJ3JEoLja5aiz1oc4Y9TK2pOpvkDNhp3VG2GMOZOptD3zbRdJ+a
 7fYAmxNa2Fruoc21plwwbAlTl1iaqTvMKfbfkfqvr+1g5uJD+OCNg+DFBr66oXWFKzRg=
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id
 h4-20020a056402280400b0043983c28be2mr42741066ede.292.1658223284041; 
 Tue, 19 Jul 2022 02:34:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDC+Q7pX3uqPQNO8HkXbJ0IFYrd+7SrZJIyixbarK6ajGTwvFA4IyTLoKRZuB3IeAtdXuwUg==
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id
 h4-20020a056402280400b0043983c28be2mr42741034ede.292.1658223283717; 
 Tue, 19 Jul 2022 02:34:43 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 lb11-20020a170907784b00b007246492658asm6543819ejc.117.2022.07.19.02.34.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:34:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] kvm: add support for boolean statistics
Date: Tue, 19 Jul 2022 11:34:38 +0200
Message-Id: <20220719093439.528810-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719093439.528810-1-pbonzini@redhat.com>
References: <20220719093439.528810-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The next version of Linux will introduce boolean statistics, which
can only have 0 or 1 values.  Convert them to the new QAPI fields
added in the previous commit.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c       | 10 +++++++++-
 linux-headers/linux/kvm.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ed8b6b896e..3a2677d065 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3743,6 +3743,7 @@ static StatsList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
     case KVM_STATS_UNIT_BYTES:
     case KVM_STATS_UNIT_CYCLES:
     case KVM_STATS_UNIT_SECONDS:
+    case KVM_STATS_UNIT_BOOLEAN:
         break;
     default:
         return stats_list;
@@ -3761,7 +3762,10 @@ static StatsList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
     stats->name = g_strdup(pdesc->name);
     stats->value = g_new0(StatsValue, 1);;
 
-    if (pdesc->size == 1) {
+    if ((pdesc->flags & KVM_STATS_UNIT_MASK) == KVM_STATS_UNIT_BOOLEAN) {
+        stats->value->u.boolean = *stats_data;
+        stats->value->type = QTYPE_QBOOL;
+    } else if (pdesc->size == 1) {
         stats->value->u.scalar = *stats_data;
         stats->value->type = QTYPE_QNUM;
     } else {
@@ -3809,6 +3813,10 @@ static StatsSchemaValueList *add_kvmschema_entry(struct kvm_stats_desc *pdesc,
     switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
     case KVM_STATS_UNIT_NONE:
         break;
+    case KVM_STATS_UNIT_BOOLEAN:
+        schema_entry->value->has_unit = true;
+        schema_entry->value->unit = STATS_UNIT_BOOLEAN;
+        break;
     case KVM_STATS_UNIT_BYTES:
         schema_entry->value->has_unit = true;
         schema_entry->value->unit = STATS_UNIT_BYTES;
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 0d05d02ee4..f089349149 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -2031,6 +2031,7 @@ struct kvm_stats_header {
 #define KVM_STATS_UNIT_BYTES		(0x1 << KVM_STATS_UNIT_SHIFT)
 #define KVM_STATS_UNIT_SECONDS		(0x2 << KVM_STATS_UNIT_SHIFT)
 #define KVM_STATS_UNIT_CYCLES		(0x3 << KVM_STATS_UNIT_SHIFT)
+#define KVM_STATS_UNIT_BOOLEAN		(0x4 << KVM_STATS_UNIT_SHIFT)
 #define KVM_STATS_UNIT_MAX		KVM_STATS_UNIT_CYCLES
 
 #define KVM_STATS_BASE_SHIFT		8
-- 
2.36.1



