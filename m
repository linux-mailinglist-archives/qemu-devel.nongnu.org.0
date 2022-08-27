Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F135A35CE
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 10:25:13 +0200 (CEST)
Received: from localhost ([::1]:51570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRr7u-0004F9-Ov
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 04:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRr5c-0001zE-OJ
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:22:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRr5Z-0000fN-Hd
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661588564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i01MZiN9ZlB6ehbZJbRtO5rOjZDPo++IqTcJOis8iYA=;
 b=V0GL/vPAS/JCh6PnWz3Z0z0kNYA9y/uYanInoHjueE5ssbtHOkiNklTgmuKaDNS5t1blPl
 umUbUQToFo4MSqkSCW+la6GImpScU24ewqg7Kop3zR76eXMFnY7ulBZ1WGIdpqHWxC6haT
 bX76Eq2ABqPpHgw2h0kKaWHtxpczdjM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-iXDB8SwpPBiiNpxLx2xSug-1; Sat, 27 Aug 2022 04:22:42 -0400
X-MC-Unique: iXDB8SwpPBiiNpxLx2xSug-1
Received: by mail-ej1-f72.google.com with SMTP id
 mp41-20020a1709071b2900b0073d84b11981so1111529ejc.23
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 01:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=i01MZiN9ZlB6ehbZJbRtO5rOjZDPo++IqTcJOis8iYA=;
 b=wiZmyBtYcUs3Lj1WvBMZU2au1MZupzsETJ2IM1FAfPJQJugFyqtFwRRUvSvBy8GagR
 HZCDnEkfBG0O2z2sEP6F9Ww54XYJCgccjY5liTdlTMphgEfcNm+d65sdL2KPiva4QpyP
 moPgUpQ33Y0L0Alw7eY0L1mF2nCJXND9Y0RekSCo6DZJMzzNvVU+87jrm8V6Hd1KjbR9
 3MvEAS5zC9v7ea5QLYrws2jBpEeZk2+VR/epeMT9BJe2qQEwZ2G2xmUJU3vp4yXNryTM
 aeLdBWSzcpPy5lTWX6g6xKZNKNQQFWG2a1RWNxmCVL5wlYox2znYbmjImDc8nK/9uume
 xTVQ==
X-Gm-Message-State: ACgBeo1DlhxmcWqL1pdi2SW6OqRuRP4rKS9j81z1fJ1CVR87xRP/0dxD
 t8FST1xyQiy+QhSv5mg5wJVPVnX1Yw8xhzL1DxTZaHJTEJMb9sZc+y8AyALxdq/TqC1CMAN5LL+
 LEdlw4gO+rlZ4S4YUlycFlb+IDK0WSRXpqGCqkRmFPA5O/L9j+HzE38fGDUNw1Ho7ZSA=
X-Received: by 2002:a17:907:75c1:b0:72f:248d:5259 with SMTP id
 jl1-20020a17090775c100b0072f248d5259mr7802498ejc.227.1661588561345; 
 Sat, 27 Aug 2022 01:22:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6PQLiaYLCPk90wfUJg13fZdafK39F0pvTTTT+x2Qn7tuYOmcfXQ4GAr507tt28UN2JHm8oNg==
X-Received: by 2002:a17:907:75c1:b0:72f:248d:5259 with SMTP id
 jl1-20020a17090775c100b0072f248d5259mr7802485ejc.227.1661588561069; 
 Sat, 27 Aug 2022 01:22:41 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 og4-20020a1709071dc400b0073ddfe1ea69sm1797125ejc.111.2022.08.27.01.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 01:22:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Xu <peterx@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2] KVM: dirty ring: add missing memory barrier
Date: Sat, 27 Aug 2022 10:22:18 +0200
Message-Id: <20220827082218.214001-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The KVM_DIRTY_GFN_F_DIRTY flag ensures that the entry is valid.  If
the read of the fields are not ordered after the read of the flag,
QEMU might see stale values.

Cc: Peter Xu <peterx@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 8d81ab74de..136c8eaed3 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -719,7 +719,11 @@ static void kvm_dirty_ring_mark_page(KVMState *s, uint32_t as_id,
 
 static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
 {
-    return gfn->flags == KVM_DIRTY_GFN_F_DIRTY;
+    /*
+     * Read the flags before the value.  Pairs with barrier in
+     * KVM's kvm_dirty_ring_push() function.
+     */
+    return qatomic_load_acquire(&gfn->flags) == KVM_DIRTY_GFN_F_DIRTY;
 }
 
 static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
-- 
2.37.1


