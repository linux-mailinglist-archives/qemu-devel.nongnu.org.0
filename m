Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A2F585223
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:11:32 +0200 (CEST)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHReF-00051U-EB
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXp-0003dg-Tv
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXo-0005Zw-EP
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659107092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aequy6Qk0ViZ+gTKObRysKwXIpsvPUj5N7aD5w/r25U=;
 b=TwD8erBeNm/mEctn45WZ3yaRFACgm2yTSO1K0VavupERDDL/X2SpNEofpEttS7oIS2GPHc
 R0Hiq116Lczv7c40FBC8CSUr1jRdVwuIc+ty0nP2WC6cO9KWX0mEHLUnmkh2KqWcVcrn2g
 acWXurAoWBD2F4H9Mn7JU05KmSAYR4k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-n9r83-PvOEypvjm54wmyTQ-1; Fri, 29 Jul 2022 11:04:50 -0400
X-MC-Unique: n9r83-PvOEypvjm54wmyTQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 z14-20020a05640240ce00b0043c25c21e94so3072177edb.14
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aequy6Qk0ViZ+gTKObRysKwXIpsvPUj5N7aD5w/r25U=;
 b=1EvlL728jnhyP/PdmK6tLSTDZIXg84E+LL2JWNNEnTmohajeV/lA7IwiwnqK0p+0ML
 Ri89X9Fa/HKS5WMlNNaVmJFaTd7vINClVDrI14yW0YLDPt7sdJGE0Ntqw2sNdU6enh8s
 Cm1FbPkhc5knqOMGScrsKG99x/5WxYXWSS4C9M1newWx/+R9NvzsM5fT2GHX+xOMbq++
 z/1BoYXeXW/hchSsrMrraaJU7GfkLnFYA+85SqjB6vIfZcVj2n5+MYFlYh+kgGgYAkny
 Og04LiEe9ut9qkm1gSqgxuT7pBLFk4M3zH2iLrQRKDu83EbE968YSoowkKmt5NilL33X
 QT7g==
X-Gm-Message-State: AJIora+Y3a8itjoRcj8kerUXr7f2T7KkHrUBHELkOX20YplGDpQf2BU5
 8dcQN2uvJOKCVbhZCA1cBuISWOavnHZhFsGqMWXVSSe2iE1GG5mylosgzgUMZHKh1k2rGfOykZK
 9xWTfaq0iKctXxgaEMrQv9LasiALLOF41AbQuXNQeUBS5W9yJWxbFAUE1ZSTNlF5MxXQ=
X-Received: by 2002:aa7:cad3:0:b0:43c:e615:13e2 with SMTP id
 l19-20020aa7cad3000000b0043ce61513e2mr3875779edt.289.1659107088995; 
 Fri, 29 Jul 2022 08:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tCoWCA1oCP7QsDnGxhccYOKdg2GgCIiJU70L6nJZqSdDAJdBD4wYFbKQC8KeuypyTsi58q/Q==
X-Received: by 2002:aa7:cad3:0:b0:43c:e615:13e2 with SMTP id
 l19-20020aa7cad3000000b0043ce61513e2mr3875744edt.289.1659107088594; 
 Fri, 29 Jul 2022 08:04:48 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 j20-20020aa7c414000000b0043a85d7d15esm2511505edq.12.2022.07.29.08.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:04:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 5/6] kvm: don't use perror() without useful errno
Date: Fri, 29 Jul 2022 17:04:37 +0200
Message-Id: <20220729150438.20293-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729150438.20293-1-pbonzini@redhat.com>
References: <20220729150438.20293-1-pbonzini@redhat.com>
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

From: Cornelia Huck <cohuck@redhat.com>

perror() is designed to append the decoded errno value to a
string. This, however, only makes sense if we called something that
actually sets errno prior to that.

For the callers that check for split irqchip support that is not the
case, and we end up with confusing error messages that end in
"success". Use error_report() instead.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20220728142446.438177-1-cohuck@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 2 +-
 target/arm/kvm.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f165074e99..645f0a249a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2265,7 +2265,7 @@ static void kvm_irqchip_create(KVMState *s)
     ret = kvm_arch_irqchip_create(s);
     if (ret == 0) {
         if (s->kernel_irqchip_split == ON_OFF_AUTO_ON) {
-            perror("Split IRQ chip mode not supported.");
+            error_report("Split IRQ chip mode not supported.");
             exit(1);
         } else {
             ret = kvm_vm_ioctl(s, KVM_CREATE_IRQCHIP);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4339e1cd6e..e5c1bd50d2 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -959,7 +959,7 @@ void kvm_arch_init_irq_routing(KVMState *s)
 int kvm_arch_irqchip_create(KVMState *s)
 {
     if (kvm_kernel_irqchip_split()) {
-        perror("-machine kernel_irqchip=split is not supported on ARM.");
+        error_report("-machine kernel_irqchip=split is not supported on ARM.");
         exit(1);
     }
 
-- 
2.36.1



