Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326973CFE38
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:53:11 +0200 (CEST)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s3S-0003bT-8A
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtV-0000pb-Pp
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtT-0005PN-VV
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ke+K8CUdvIjT9wDwvnpP72CHpJjDbX0XKOULAYpAuTc=;
 b=L4li5YXWRkSNHfTwSP//FAiElMq9pLK2aGYBJ5c1T4TuX7+I/QzPzpEXTqpxEddldLVJvY
 iHsY2mjT9Ere/UTZSHf3uzGQwVEO5VaeBcCG3YswO1dBniS1lKl7WL6gtJb1HnZq/G2aSa
 GIJEqLf1Cf7yQHNJ7tp2W2d0xNQ8FeU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-fWN4nW57PCyG8rhxyhebdg-1; Tue, 20 Jul 2021 11:42:49 -0400
X-MC-Unique: fWN4nW57PCyG8rhxyhebdg-1
Received: by mail-wm1-f70.google.com with SMTP id
 1-20020a05600c0201b029022095f349f3so946386wmi.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ke+K8CUdvIjT9wDwvnpP72CHpJjDbX0XKOULAYpAuTc=;
 b=rmOxNJh6oG4+yAVK6nNEFz60CcchikezGwO6+znDlQ8LWl9QvIEZ3+9yRekKT7TjHO
 Ag2r+35rVTMOyco5IxO1VPYMEVhrFLivQhP60VvUxKhYyuzQJRC1vcMkdUMcOqdKMc7J
 2OhdRfC0I/LBTiqkXSiXJNAy3i5ewAkGOh1B3fgQCWcM7GS6rMcdwgOrNSv514C/LSXz
 GWHd2+DpazzdtMA8GVP5eIn2GtzmBhisEtcusBFGHurOKu31Z9mzaPEp5FyQGkgiSj3i
 6uDM7A0bkbEq24PxQy3oLHee/nlfJ8KA9dJnId1kIzNthfm3jdFQtsNkax5/ORk67HJu
 2OrA==
X-Gm-Message-State: AOAM532nIZN1q+6zIX+msE+B3p0Qu9QC/8LFZp5xkk+mU33WalEGFXd9
 kN0haU+/8e6jneTQx1EqookKt4VK0oPlbb6oebj1u9+Ckwu0k3yqcWV175nesseQc9b1LG4EbTo
 yV9Z4CP8q5hbb78iiwWhwEIcCtYNKMnzIhLb6uzECh2uVHifH/IijPVJJ2CUWBbqz
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr35740326wrn.226.1626795768191; 
 Tue, 20 Jul 2021 08:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFjbDELn9PlVoMETbMcfKgU2MpoocKRAUMvu9ehxkvDcZjGQAk7yjfnceBxktfN5Y4tvyqXg==
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr35740295wrn.226.1626795767907; 
 Tue, 20 Jul 2021 08:42:47 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 o3sm24165228wrm.5.2021.07.20.08.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/17] hw/isa/vt82c686: Add missing Kconfig dependency (runtime
 error)
Date: Tue, 20 Jul 2021 17:41:39 +0200
Message-Id: <20210720154141.3919817-16-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building the Pegasos2 machine stand-alone we get:

  $ qemu-system-ppc -M pegasos2 -bios pegasos2.rom
  ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
  Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)

Looking at the backtrace:

  Thread 1 "qemu-system-ppc" received signal SIGABRT, Aborted.
  (gdb) bt
  #0  0x00007ffff53877d5 in raise () at /lib64/libc.so.6
  #1  0x00007ffff5370895 in abort () at /lib64/libc.so.6
  #2  0x00007ffff6dc4b6c in g_assertion_message_expr.cold () at /lib64/libglib-2.0.so.0
  #3  0x00007ffff6e229ff in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
  #4  0x0000555555a0c8f4 in object_new_with_type (type=0x0) at qom/object.c:714
  #5  0x0000555555a0c9d5 in object_new (typename=0x555555c7afe4 "isa-pit") at qom/object.c:747
  #6  0x0000555555a053b8 in qdev_new (name=0x555555c7afe4 "isa-pit") at hw/core/qdev.c:153
  #7  0x00005555557cdd05 in isa_new (name=0x555555c7afe4 "isa-pit") at hw/isa/isa-bus.c:160
  #8  0x00005555557cf518 in i8254_pit_init (bus=0x55555603d140, base=64, isa_irq=0, alt_irq=0x0) at include/hw/timer/i8254.h:54
  #9  0x00005555557d12f9 in vt8231_realize (d=0x5555563d9770, errp=0x7fffffffcc28) at hw/isa/vt82c686.c:704
  #10 0x00005555557e1340 in pci_qdev_realize (qdev=0x5555563d9770, errp=0x7fffffffcca0) at hw/pci/pci.c:2116
  #11 0x0000555555a06a84 in device_set_realized (obj=0x5555563d9770, value=true, errp=0x7fffffffcda8) at hw/core/qdev.c:761
  #12 0x0000555555a0ff9e in property_set_bool (obj=0x5555563d9770, v=0x5555563da090, name=0x555555cd7881 "realized", opaque=0x5555560acf80, errp=0x7fffffffcda8) at qom/object.c:2257
  #13 0x0000555555a0e098 in object_property_set (obj=0x5555563d9770, name=0x555555cd7881 "realized", v=0x5555563da090, errp=0x555555fc3fa0 <error_fatal>) at qom/object.c:1402
  #14 0x0000555555a12271 in object_property_set_qobject (obj=0x5555563d9770, name=0x555555cd7881 "realized", value=0x5555563cf0a0, errp=0x555555fc3fa0 <error_fatal>) at qom/qom-qobject.c:28
  #15 0x0000555555a0e3fb in object_property_set_bool (obj=0x5555563d9770, name=0x555555cd7881 "realized", value=true, errp=0x555555fc3fa0 <error_fatal>) at qom/object.c:1472
  #16 0x0000555555a05b15 in qdev_realize (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/core/qdev.c:389
  #17 0x0000555555a05b42 in qdev_realize_and_unref (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/core/qdev.c:396
  #18 0x00005555557e160f in pci_realize_and_unref (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/pci/pci.c:2181
  #19 0x00005555557e165b in pci_create_simple_multifunction (bus=0x5555563d32b0, devfn=96, multifunction=true, name=0x555555c9b63b "vt8231-isa") at hw/pci/pci.c:2189
  #20 0x0000555555867730 in pegasos2_init (machine=0x5555560427a0) at hw/ppc/pegasos2.c:105

The "isa-pit" type (TYPE_I8254) is missing. Add it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210515173716.358295-12-philmd@redhat.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index f99df0e20b1..e4db60ed580 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -50,6 +50,7 @@ config VT82C686
     select FDC_ISA
     select USB_UHCI
     select APM
+    select I8254
     select I8257
     select I8259
     select MC146818RTC
-- 
2.31.1


