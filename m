Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E9031FE25
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:47:03 +0100 (CET)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9rp-0000WZ-MF
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9ki-0002nd-Jp
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kR-0005XC-84
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltjnESlJDd3H5QR2j8eiWOyKx9h8jJk2C0jWkjeNUew=;
 b=L3a9lXk5OZuki7MzffNLSQ0fbMjU1HoI4yglxA8NcJcptlEqqOKr1rmQp+FnIr3PKmabmt
 pzIPClFZ1iS9xuFt3rE8LcdYaS2Fg4Oc5NPDFhcJfsjXKYukXWzBSA3ufseQc32aDtyiKH
 d0FsvA9cyINzUlfjpvg3TPi6zf9GMtA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-kzz0O2JUPRWity-TzV0ezA-1; Fri, 19 Feb 2021 12:39:20 -0500
X-MC-Unique: kzz0O2JUPRWity-TzV0ezA-1
Received: by mail-wr1-f72.google.com with SMTP id l3so1135409wrx.15
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ltjnESlJDd3H5QR2j8eiWOyKx9h8jJk2C0jWkjeNUew=;
 b=CUpWSxLgRf4REoyNXtCNnRTMPf8eNhjEfQwvkJIGqX+yszhGWVquxVpsD1Gtpntnhi
 nEhtDYhv64YTZ9M09WPxzfKJlbk+OWtlKb+J8C4f0vr/zFjD2CbVOtFg3jt8mtUAqIzF
 8UO8qSq+X/Es1TNAKbKK+SPVkNLk5siLIkqTY/YBD8QHw0g84JeadUw5+lUKqWBp51EH
 OPpDhZVzpr1vjmbj620IPUmW22inbWXby0cYFErcpQKDopzQwaoucwXdgV2LiuoEqWIC
 lVFc5cDzj/BPTjblOx7nOut6HuleaihE9OHaNebbAACLVjElfdUU87tCdXMOAyAjwV8Q
 YNOQ==
X-Gm-Message-State: AOAM532xRKSl37NTocKz2YcA3rcBUxdLxmmDk6vylfGZ7U9nTexlR5ZC
 8IH+rEUeY1+XsHzTIhOQtPIv+69D2CdSvw0w5URAAvPBWZ0mN5NLgWwRkytP9ifH+6KfTs3xCWg
 rFzO7jR+OJCY5JEO0iF2CHYOnwJb46rgx2sHs7akZQJcH6JNFt5vt79FY5tlGbw/G
X-Received: by 2002:a5d:558b:: with SMTP id i11mr10341354wrv.125.1613756359057; 
 Fri, 19 Feb 2021 09:39:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyksADAECUrKIFfE8NXfSBq0p9Yv0QU1jPKKdp6ensUX0SFo+MEZzOE/tMgXW9KlqBOatRsLw==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr10341310wrv.125.1613756358861; 
 Fri, 19 Feb 2021 09:39:18 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm14534967wre.78.2021.02.19.09.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] hw/mips: Restrict KVM to the malta & virt machines
Date: Fri, 19 Feb 2021 18:38:41 +0100
Message-Id: <20210219173847.2054123-6-philmd@redhat.com>
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

Restrit KVM to the following MIPS machines:
- malta
- loongson3-virt

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/mips/loongson3_virt.c | 5 +++++
 hw/mips/malta.c          | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index d4a82fa5367..c3679dff043 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -612,6 +612,10 @@ static void mips_loongson3_virt_init(MachineState *machine)
     loongson3_virt_devices_init(machine, liointc);
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -622,6 +626,7 @@ static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = LOONGSON_MAX_VCPUS;
     mc->default_ram_id = "loongson3.highram";
     mc->default_ram_size = 1600 * MiB;
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = mips_kvm_type;
     mc->minimum_page_bits = 14;
 }
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427bf..0212048dc63 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1443,6 +1443,10 @@ static const TypeInfo mips_malta_device = {
     .instance_init = mips_malta_instance_init,
 };
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void mips_malta_machine_init(MachineClass *mc)
 {
     mc->desc = "MIPS Malta Core LV";
@@ -1456,6 +1460,7 @@ static void mips_malta_machine_init(MachineClass *mc)
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
 #endif
     mc->default_ram_id = "mips_malta.ram";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("malta", mips_malta_machine_init)
-- 
2.26.2


