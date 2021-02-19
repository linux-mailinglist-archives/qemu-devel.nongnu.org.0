Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD83131FE68
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:55:57 +0100 (CET)
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDA0S-00031J-Tk
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9l1-0003P8-5e
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kz-0005mW-8w
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKRfXZiJfNSqbVRL/SaOx1v+Z64xt5w41cSycQqYFFE=;
 b=GTGuLyHKA7H+YnH3Uu3iTtQ+U1LQZZw8r8pYOHnpZIL03nQP/p49zvNtTr6DDEs+FfO339
 MlUeC5k7DORyMQkrLc5Ffofic0/gm+cTparvBsgSG96kk7xy4dAxk/7soqzmcnKrFr6BRW
 FxV1xpM60TxLOKkb6qZSbqJXVYTiFtQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-gk_WQwzePlSdcLjKBZH8bg-1; Fri, 19 Feb 2021 12:39:55 -0500
X-MC-Unique: gk_WQwzePlSdcLjKBZH8bg-1
Received: by mail-wr1-f69.google.com with SMTP id d10so2748662wrq.17
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKRfXZiJfNSqbVRL/SaOx1v+Z64xt5w41cSycQqYFFE=;
 b=duSr9eEx3Zj9ndd6Ul45AK1fLJzHshfFka+NK1L4VL4QsbvviJoyM9e3/htHcib88F
 csVfMhc4WtiTpfYPZzF61dvrqbNkpgQdLoGsA776GYv7r89GR08j0afW7wzNp+0lZyfP
 bwO2XJlcBRppnhxsczSi70zDxWQCj7lEow2sn+jY+PRfT1pbcZPIlV88inCoSLxxGDSA
 3HPSdCSV96yzuhPm1N4gc3oLVfyY1l+CJCF8J1Qw1TghLWTkOpzw+pXV75SbRwCBMe6t
 pLgZONxYzJK3+T1Sp6/QaFajFcs3blwdMo/MOcN4Qf+az/Rr17eiQ8fXxYDL8/YulJlK
 OwVg==
X-Gm-Message-State: AOAM530b/rqjBrc7C9nblhimoGR5R8FuUlj9xItXQmAUQC/MJ3roYP2E
 lQ0i/mvUsY+USYRkx/Pts6h9z3SzCq82fDdMbs/TGs0lWwPU7OuyorC/D88Kjy/NQZgpf+WqqTJ
 LnEfOWbiNSgtaSZBsUnOObEQ0tqyyTqWdh4dmiN030wR+iWNHBLmHXrOWTqmVveIU
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr9342140wmf.82.1613756393712;
 Fri, 19 Feb 2021 09:39:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2yrJUDqwa1ymG/2RErXjJWx3WIzkQzNQF90+7ijmcN7yAwa2G2hjcHhwa/T8ilbMl1bPCyw==
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr9342087wmf.82.1613756393314;
 Fri, 19 Feb 2021 09:39:53 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r7sm15304999wre.25.2021.02.19.09.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/11] softmmu/vl: Exit gracefully when accelerator is not
 supported
Date: Fri, 19 Feb 2021 18:38:47 +0100
Message-Id: <20210219173847.2054123-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before configuring an accelerator, check it is valid for
the current machine. Doing so we can return a simple error
message instead of criptic one.

Before:

  $ qemu-system-arm -M raspi2b -enable-kvm
  qemu-system-arm: /build/qemu-ETIdrs/qemu-4.2/exec.c:865: cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()' failed.
  Aborted

  $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
  qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument

After:

  $ qemu-system-arm -M raspi2b -enable-kvm
  qemu-system-aarch64: invalid accelerator 'kvm' for machine raspi2b

  $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
  qemu-system-aarch64: -accel kvm: invalid accelerator 'kvm' for machine xlnx-zcu102

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/vl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f357..f2c4074310b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2133,6 +2133,7 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
     const char *acc = qemu_opt_get(opts, "accel");
     AccelClass *ac = accel_find(acc);
     AccelState *accel;
+    MachineClass *mc;
     int ret;
     bool qtest_with_kvm;
 
@@ -2145,6 +2146,12 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
         }
         return 0;
     }
+    mc = MACHINE_GET_CLASS(current_machine);
+    if (!qtest_chrdev && !machine_class_valid_for_accelerator(mc, ac->name)) {
+        *p_init_failed = true;
+        error_report("invalid accelerator '%s' for machine %s", acc, mc->name);
+        return 0;
+    }
     accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
     object_apply_compat_props(OBJECT(accel));
     qemu_opt_foreach(opts, accelerator_set_property,
-- 
2.26.2


