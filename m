Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3747631FE57
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:51:40 +0100 (CET)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9wI-0006fI-US
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9ko-0002sI-Vh
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9ki-0005a2-DW
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ueqj+n2dHsbjBHuZ0Hoy+mZlGObPSK9klpKLOoZpu4Y=;
 b=gS9gFcTc29lGbzA9TGtZVJjmLZ2DsvalXDYrgj52AGPDcHgBajrLLeyCgYvrAsDq22wD2Z
 yYh/well8zumKHdE1ojLFP4vEAx9a6jtTV1YCt5DJt21rFSpTrOej321UaS07i1Cb8y40n
 brIBOS52mffkAzOKwl2pakdRhdy0AI4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-Md9tAcG2P7CUHRm2tvS5lw-1; Fri, 19 Feb 2021 12:39:32 -0500
X-MC-Unique: Md9tAcG2P7CUHRm2tvS5lw-1
Received: by mail-wr1-f70.google.com with SMTP id v18so485895wrr.8
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ueqj+n2dHsbjBHuZ0Hoy+mZlGObPSK9klpKLOoZpu4Y=;
 b=AzEcN6KfY9NdqovuU02ofKVVqmnbMtexW5ulsktegKbL8yesE0RcJoCBgRL0Cn5l7j
 nvMFAYVYQ5COw/q1Jis0UREoG997pCQ5iBo9/3q8s7gWNn3GbMItZ20gKcxp5uEsInmC
 Zi3mf1sprROjUMLec3THVk6itFn6w86WzrFyD4W0vps5ePEnCcsF1PpQR1+C6Gw/DvY/
 zJlTDPFMNbSZVCnrDkAYe/I4zAxJQFi7tlPHt28UazIoXMPmP5v8Wv4PWyKpdXFBDpxG
 /L9n7vFNjIbkBFtCA+RCwXGkftoELngit3Ru6wjVmF2VEthnv7UO1qEITNj4QFb1qkgF
 YevQ==
X-Gm-Message-State: AOAM5330RVrVpoEdKRBmauuow7LoGenl56/8ix740+Z/GNSgAbPBN03Z
 bvyjeuGJTTCC4FjxqZ8S02N1iv3BBbDQBo5se0ZqcgIO2nIJzDadN2WCea7oD38j8FOFIhKSZ5h
 z8Y386L2RljPfuIgclPwozgv56zaC3gXyENyt8xs2Xtsz+94ER51AyD+RHq+6Jkqb
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr9312032wmb.98.1613756370790; 
 Fri, 19 Feb 2021 09:39:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQVxSvgdKIkMYLk6jZPql9ZCAN0WXriT+5Nc8pY51dY+mHxFK5IkbcVQRBV0rvadWM1WYfTA==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr9311979wmb.98.1613756370490; 
 Fri, 19 Feb 2021 09:39:30 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r12sm3052972wrt.69.2021.02.19.09.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] hw/s390x: Explicit the s390-ccw-virtio machines
 support TCG and KVM
Date: Fri, 19 Feb 2021 18:38:43 +0100
Message-Id: <20210219173847.2054123-8-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

All s390-ccw-virtio machines support TCG and KVM.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2972b607f36..1f168485066 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -586,6 +586,10 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
     return newsz;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void ccw_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -612,6 +616,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->possible_cpu_arch_ids = s390_possible_cpu_arch_ids;
     /* it is overridden with 'host' cpu *in kvm_arch_init* */
     mc->default_cpu_type = S390_CPU_TYPE_NAME("qemu");
+    mc->valid_accelerators = valid_accels;
     hc->plug = s390_machine_device_plug;
     hc->unplug_request = s390_machine_device_unplug_request;
     nc->nmi_monitor_handler = s390_nmi;
-- 
2.26.2


