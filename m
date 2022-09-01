Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608DB5A9F41
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:42:09 +0200 (CEST)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTp8i-0000EM-HH
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosD-0007kF-8f
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos3-0008JP-CA
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAMTep0Tpgw9SwWBMdwCwDv0WRZgcQLollwdX+eXpNE=;
 b=NJ3miN5HV5cLnwx5BY/Cl9UBvHARtcQqszzcO/989qOZ2ZQAEVd9tpV6WqjbwyshZ0KPCc
 o/6uMIeTaWFSsCii8/pqkx3pRoV2nXw9ayGbi6dZIDLaIhzI1p2NFPr9GY6MTszGleX4f3
 bCW4RawQLY+ONoFlHkRWUE3NdEx548E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-CTxC66hBMSWbbJAHP9_iPQ-1; Thu, 01 Sep 2022 14:24:53 -0400
X-MC-Unique: CTxC66hBMSWbbJAHP9_iPQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sh44-20020a1709076eac00b00741a01e2aafso6060211ejc.22
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gAMTep0Tpgw9SwWBMdwCwDv0WRZgcQLollwdX+eXpNE=;
 b=2WXT+wMF6nJNzLezpTTmszVChT+EsZRNGv7QF7wkVKNdxPd2vkhRQJ+UjfZs2j8YOl
 A9MtVm8LmMWkSGzRx6PvqqvPB9gmL21P/DvpwBM2dcjxMW3flBf3psbfTqdIfIeI6lx7
 gIkv8Ubi22JrmcC2QM255f/IDI6c6O2U0TQEEu/HcBybB3AkA2vqLIkfVLtvK5MOCMnQ
 eLsFtnbGd9kTnIR6NE0TAQQB/FbauV1S6XHCB/ljfMxFgGBf4EQ3kuM79I62hVNMYWPx
 HtIUV70w/ZzX6XtqMO+2CUliaf7P2lw0IPQtSLFK4nOG5jm81pPUDObQjkyLcpI4ktW3
 fYdA==
X-Gm-Message-State: ACgBeo0Cyr+9qpExJNrbhi/usY+b7Npd/kVJYLoSqJbK/IuvOjGz8BZm
 h0eZdIygqBoEDQzJoYN4XGnMlp6GegYP7vCKaqmPGQa+rA03IEqNfEfA9S4lz94QybfRi/pIY64
 5nHpi1OP3JTNr0G6h0GWa8SPtEGOf177P3zK8MChS0owjxH+GY3e1nDVNAuWMaggyLGY=
X-Received: by 2002:a05:6402:5212:b0:446:6910:5549 with SMTP id
 s18-20020a056402521200b0044669105549mr30098744edd.345.1662056691685; 
 Thu, 01 Sep 2022 11:24:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5QithRFV2LBLpAptUccwWHtzn2N6HcLLewXTWmxE9fR6/qYWavw7HWVHX71uEQT+sL+ZdE4A==
X-Received: by 2002:a05:6402:5212:b0:446:6910:5549 with SMTP id
 s18-20020a056402521200b0044669105549mr30098726edd.345.1662056691445; 
 Thu, 01 Sep 2022 11:24:51 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 fw8-20020a170907500800b0073d87068042sm8807296ejc.110.2022.09.01.11.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 10/39] KVM: dirty ring: add missing memory barrier
Date: Thu,  1 Sep 2022 20:24:00 +0200
Message-Id: <20220901182429.93533-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.08, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Cc: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
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
2.37.2



