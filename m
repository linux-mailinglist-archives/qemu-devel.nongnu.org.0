Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF6D5765A2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:05:26 +0200 (CEST)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCOkn-0004ZD-E9
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCOiT-0000bR-8o
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCOiQ-0003ee-Mc
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657904578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHdWC55cUPvE5A/T86wNKaY1/bkuZbeyxYtfxnHKD7k=;
 b=f0I5waNkidTr0ygV1kOkBEWuNGIFXj9bgl5XDdt5nEOTpN3vi8odCpndP0Z3krFpHGna3u
 BdrVkVGSkK6jNV5el5PPbj+/q7dae5fLN/6NNhFu839vgFd3yqyiDjNEzKHKvJPxoD/jTl
 zVt6T2visO7qHNztuHN8T2EIiBElx34=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-CIt04sX0OzSwQo55f6kBQA-1; Fri, 15 Jul 2022 13:02:57 -0400
X-MC-Unique: CIt04sX0OzSwQo55f6kBQA-1
Received: by mail-ej1-f71.google.com with SMTP id
 qb28-20020a1709077e9c00b0072af6ccc1aeso1669686ejc.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 10:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHdWC55cUPvE5A/T86wNKaY1/bkuZbeyxYtfxnHKD7k=;
 b=NjfdKN20Vv08jLO6i9WTrd+JcUCSzmicyH2m8sDg+L3lwoJ/+DPdqLcS/4AH/Eg6Qu
 +iRPX5Kh2HKExFNk31H1I9SL83rTkaCxjY2JPg3tfV9gI0Ak5wPoy8HkIQN2jVK2z1D4
 BXsTz77mgHusT+qlRIPI6fsnIyg87n8UFbW1aefCj7e0n4M6FavtTquYLjXBgwggCED6
 paNeerLMpOfrT3eUvOsEVwRx9bTLzTPrMmOQFGXGZRvECo00ts8UGxzCpLtei4Gx0psB
 eIBXnMK5Id8Bz8KvMQInzvxgTpopUaeO54kRI1AJziAmRg5beSk1lN716M4Fphm+UKY6
 57dg==
X-Gm-Message-State: AJIora9TRnHC5nW+0GY9a7ebFOymzx+EbNpjx/gNtpIfLfQt95iRc0Hk
 XBGf8cKHRTY2VrqAfR0Br7M5ibCd3adsiYOg6z3D3bzidBmo9UGy2HRriaU5mUAl+3v7XNKd52c
 1OVJriCnkLT+1bjP06FMhu8JtuiTllQrwFz36yGFAwqEmFKsWrjoFz4djan80c+bHMdc=
X-Received: by 2002:a17:906:cc52:b0:72b:114e:c56c with SMTP id
 mm18-20020a170906cc5200b0072b114ec56cmr14641289ejb.144.1657904575502; 
 Fri, 15 Jul 2022 10:02:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tCFvvkghCvPGHuCsca25QiJVQaIDwvgw9GiNU5K6ItEosvlVxKcZkh+SR0Z6EZxYmEu7hGFw==
X-Received: by 2002:a17:906:cc52:b0:72b:114e:c56c with SMTP id
 mm18-20020a170906cc5200b0072b114ec56cmr14641260ejb.144.1657904575096; 
 Fri, 15 Jul 2022 10:02:55 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 f21-20020a17090631d500b0072ee7b51d9asm1678653ejf.39.2022.07.15.10.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 10:02:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: natto@weirdnatto.in
Subject: [PATCH 2/2] kvm: add support for boolean statistics
Date: Fri, 15 Jul 2022 19:02:49 +0200
Message-Id: <20220715170249.404786-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715170249.404786-1-pbonzini@redhat.com>
References: <20220715170249.404786-1-pbonzini@redhat.com>
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


