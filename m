Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03C5EFBC1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:18:06 +0200 (CEST)
Received: from localhost ([::1]:35176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxAi-0003JF-3v
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwR9-0003oz-Gr
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwR7-00038T-VW
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxT5Mw8r3lduhbysVF+py45W71A3byvjHK4jNnbC6vo=;
 b=ND5F+jWxmqNURAK62coPnaVjs5je9qFxw2uegNJ3d487DsaJw2yfEXWbgWfBbXN+9UCZbX
 pGc2uQa7eSEsnCjnsvliGN//nlsnNFnDEnVvOBMxo6CGqgghOVn0NnB2aHsc6CVnq2aGbv
 KOrl0QFR9VNo4F+5uXwNJOLvl10OBtQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-r6pQKZfKNveB2sw4uAzU2g-1; Thu, 29 Sep 2022 12:30:54 -0400
X-MC-Unique: r6pQKZfKNveB2sw4uAzU2g-1
Received: by mail-ed1-f71.google.com with SMTP id
 y9-20020a056402270900b00451dfbbc9b2so1649484edd.12
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TxT5Mw8r3lduhbysVF+py45W71A3byvjHK4jNnbC6vo=;
 b=Emu87g/KSwMXBypDaRmNt/h6p0qjvz92mZq68lVai+7+wCvn4s0LA3rKuQYFEC97pj
 P9zFkwm490LtkfBHY7NA07UH0lJeogm3Qg00PwUVDD/EIGvkxv0PPIHAhL9G4QLNJj3Q
 TyhuO9hr/P9O92CrdlHkpGK3shIVLy+I68nhDDHQF34RDIIocP6OHECKHyze39HSEDKM
 5aKcrmN61Z2IjaK8Aaq3LCziGzhymtahPXBgovnQyJbG+uGvyI62Kpyz7bmsWAAwJPeE
 VuLLIQRa9shWS7ebSE8vXMOP/g8Ib/K0bMGhJOc/ns7h+U3ZmpPAA58Nud2/KJ5Qd5nn
 ySxg==
X-Gm-Message-State: ACrzQf2kWfqwFSBh6lwVt0FZW/1jTdJqNDeujNAOb6GR2ASqFXbAyUR7
 GjLWPOyDAa64OZUb35g3W7ELKBrKnKOE3T4C6KoO6flvcKOoL84yL7gMXx9aKE3TvYA4VW9ncXF
 nVtBIvciy/MxaGz6XlDeEqn8pI6NdNkk8Lch7uVIdHbpGHq149eF1qssWEa5AdZ17Kw8=
X-Received: by 2002:a17:907:8688:b0:782:6637:e8dc with SMTP id
 qa8-20020a170907868800b007826637e8dcmr3517455ejc.174.1664469053334; 
 Thu, 29 Sep 2022 09:30:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42OTmo8CQt3z0pTKDO4eDAD1czi1br3ZUddBCYKTBkTA1/cRMoDF1CICNRqNmMngwc2u5ysQ==
X-Received: by 2002:a17:907:8688:b0:782:6637:e8dc with SMTP id
 qa8-20020a170907868800b007826637e8dcmr3517436ejc.174.1664469053048; 
 Thu, 29 Sep 2022 09:30:53 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 j5-20020aa7de85000000b00455262f83aasm5719102edv.32.2022.09.29.09.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ray Zhang <zhanglei002@gmail.com>
Subject: [PULL 13/14] target/i386/kvm: fix kvmclock_current_nsec: Assertion
 `time.tsc_timestamp <= migration_tsc' failed
Date: Thu, 29 Sep 2022 18:30:13 +0200
Message-Id: <20220929163014.16950-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Ray Zhang <zhanglei002@gmail.com>

New KVM_CLOCK flags were added in the kernel.(c68dc1b577eabd5605c6c7c08f3e07ae18d30d5d)
```
+ #define KVM_CLOCK_VALID_FLAGS						\
+	(KVM_CLOCK_TSC_STABLE | KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC)

	case KVM_CAP_ADJUST_CLOCK:
-		r = KVM_CLOCK_TSC_STABLE;
+		r = KVM_CLOCK_VALID_FLAGS;
```

kvm_has_adjust_clock_stable needs to handle additional flags,
so that s->clock_is_reliable can be true and kvmclock_current_nsec doesn't need to be called.

Signed-off-by: Ray Zhang <zhanglei002@gmail.com>
Message-Id: <20220922100523.2362205-1-zhanglei002@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a1fd1f5379..9eeee91c2f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -157,7 +157,7 @@ bool kvm_has_adjust_clock_stable(void)
 {
     int ret = kvm_check_extension(kvm_state, KVM_CAP_ADJUST_CLOCK);
 
-    return (ret == KVM_CLOCK_TSC_STABLE);
+    return (ret & KVM_CLOCK_TSC_STABLE);
 }
 
 bool kvm_has_adjust_clock(void)
-- 
2.37.3


