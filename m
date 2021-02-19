Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE46931F8AA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:53:59 +0100 (CET)
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4MA-0005Ga-O7
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4Dg-00033z-PG
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4Dd-00029G-SZ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSOzp7uQzDcR4IYxMZ7wQ2qt5GIWM3B9STvSPsjq1vc=;
 b=jDJnAOBUx7N5Fd4agAeW1xMiYwaEjCmtUM0dsRV1+mYT47aB3Dvchwr1uKORrJG6LkVq0/
 y/mGo/sWSO8xybwhApA/j0Z6QcElQ3+N5/2yBokO4HSYKc0HLuJgqxILyuW5/YwTFXnROB
 OpUcmEkaA+jk1bTOApabjAaklz4y2II=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-7V9O2vwoOn2usVLuXiQA9A-1; Fri, 19 Feb 2021 06:45:07 -0500
X-MC-Unique: 7V9O2vwoOn2usVLuXiQA9A-1
Received: by mail-wr1-f69.google.com with SMTP id x1so2292844wrg.22
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FSOzp7uQzDcR4IYxMZ7wQ2qt5GIWM3B9STvSPsjq1vc=;
 b=MT53B7MhVQycZtzoVbuWAYc3IJFTJ6Z1/7/pxiQ3x6lwWV0G7Kmd+A1eRQxu7M/k2z
 4xku5s6/mhfOR6ENZdiBayW3mSnZ/IozkU6feHM9APf9aFhmwZUKTbmcAZbfnXYcq034
 OQK84w7VQLAHGnsnm7wJMO6SkNjB42gSu2t6BAvBQhqeGXBhoaOHfFHPLxEfpK6LmqrR
 AJaBIT2ZFX3JyT6dH6TmaSvpqvmznBpXzarSXbJkxGJkpHSDAqv0UPWjqgSzgI18twCz
 C6NNH3uQzWhtyubR2H6fX0SsqW8VJxxtdNVIQ2PK6knkY1iI5gQAIOiRKBdZQcKClyCJ
 j5HA==
X-Gm-Message-State: AOAM531yqdaz2sDH2xlFE/2lAMAIvyc10DFWgi2S5rUYcF9Dp6L3CtjS
 YTCYBpbxdcRW7UxKAQVnwNqzSB20a6B54f0TeUD89qZ4FvT6jIFQ5S3FkemV0yYYQrvrmULM98Z
 zfgiBkan5vJk+AlfcSK4MP2vxYPZvxFdesDRRXwLZrg+vT8lK6S2pMwzUlXDGFkGr
X-Received: by 2002:a1c:9d52:: with SMTP id g79mr1792878wme.144.1613735106340; 
 Fri, 19 Feb 2021 03:45:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5NDROWWBmKNQhqQPWK1fZiiO56f2O6/VVl8Y9duIpMUqxZOlYU2Hbr0aPfnX0v4HquetdhQ==
X-Received: by 2002:a1c:9d52:: with SMTP id g79mr1792832wme.144.1613735106189; 
 Fri, 19 Feb 2021 03:45:06 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a11sm3917199wmh.25.2021.02.19.03.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:45:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] hw/s390x: Set kvm_supported to s390-ccw-virtio machines
Date: Fri, 19 Feb 2021 12:44:27 +0100
Message-Id: <20210219114428.1936109-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
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
 Radoslaw Biernacki <rad@semihalf.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All s390-ccw-virtio machines support KVM.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2972b607f36..259b4b4397e 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -612,6 +612,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->possible_cpu_arch_ids = s390_possible_cpu_arch_ids;
     /* it is overridden with 'host' cpu *in kvm_arch_init* */
     mc->default_cpu_type = S390_CPU_TYPE_NAME("qemu");
+    mc->kvm_supported = true;
     hc->plug = s390_machine_device_plug;
     hc->unplug_request = s390_machine_device_unplug_request;
     nc->nmi_monitor_handler = s390_nmi;
-- 
2.26.2


