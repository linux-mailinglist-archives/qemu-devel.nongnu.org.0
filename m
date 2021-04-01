Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC6A351BF9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:17:35 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1sr-0003h2-7K
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1f5-0003QL-Jo
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1f1-000604-Vr
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZxETA9xkUI8DHODBhav7aR/O/iVcPfZSSiEn8GIYWg=;
 b=FJ1ym/SiY7qpu+IeJhzLLBPbdNQ2kaWnAau9gea30OVt8ITUMqiIdncN1z7SWhlYrX0c69
 /PaWtI5FeYPAlsE4H1auSPY2pMEim276z99U6rVzjeTeETgcrtV0zA9+D+QJhF1qBRYQSf
 taeDzj2HLMyTn7lffAhuLSxdSSnqtEc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-kkDSjYLDMGyDjW_X73ZVXQ-1; Thu, 01 Apr 2021 14:03:11 -0400
X-MC-Unique: kkDSjYLDMGyDjW_X73ZVXQ-1
Received: by mail-wr1-f70.google.com with SMTP id e10so3095574wru.13
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XZxETA9xkUI8DHODBhav7aR/O/iVcPfZSSiEn8GIYWg=;
 b=VugOHNID1PPxURU4Cn8qS9Y6I+PfiemrrJRGnf32PJvV7BIOVrwpsdaTACwyPJBmlw
 iNCiRvhBtEbSJnQfVFsoPiEoIF1oeJP8OWctCnvOaBzsrBN7ZYKPScMWiZ1cl9OOQtiT
 8Dztyos4hhvqwhmZe/jwrLlGStXIfvm0GEfcjAmqvgRGbVPHatnpYCMJ/AV92q4ZY2sq
 vRCVtAReM9GtOKWLWsWjIEnIHen2rfCta7Cpyg2wJLQVK8dMZyEVwxMCrysn0z/8Pw0I
 v8v7P6kn6Y7LXNGO+6yndiB+jpeQUqocbBanVXR5PGJYPVrLuDt+aYSY5Rq3S9P4CKRY
 /92w==
X-Gm-Message-State: AOAM532LXU7UmpvswATTCfzhRS7LYZ0/paKASZ3b550H9P0+k1g9kcHQ
 7mEzk4h0ihqmMMWjjrBrW412y40mXAWET3WbXPB4Vwof3ajJ1VwAh9z+it7MXLEPGquRCad40c0
 8sWd7+fK74FipSfcQ02HypFocEFHdpYA7FRti9US3CBW4MRNdPgBW7Ec02thh
X-Received: by 2002:a5d:4fca:: with SMTP id h10mr11577267wrw.70.1617300190366; 
 Thu, 01 Apr 2021 11:03:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu7trJFGO0P/GheHrc9mpZGvXsP04ONlfeXadPMaqkyowx/882HFtyVuEFbfX9A7W089qQuA==
X-Received: by 2002:a5d:4fca:: with SMTP id h10mr11577246wrw.70.1617300190192; 
 Thu, 01 Apr 2021 11:03:10 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id m9sm11272840wro.52.2021.04.01.11.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:03:09 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:03:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] vt82c686.c: don't raise SCI when PCI_INTERRUPT_PIN isn't
 setup
Message-ID: <20210401180235.226321-8-mst@redhat.com>
References: <20210401180235.226321-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401180235.226321-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen <chenhuacai@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Without this patch, the following patch will triger clan runtime
sanitizer warnings as follows. This patch proactively works around it.
I leave a correct fix to v582c686.c maintainerfix as I'm not sure
about fuloong2e device model.

> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/qom-test --tap -k
> PASS 1 qtest-mips64el/qom-test /mips64el/qom/loongson3-virt
> PASS 2 qtest-mips64el/qom-test /mips64el/qom/none
> PASS 3 qtest-mips64el/qom-test /mips64el/qom/magnum
> PASS 4 qtest-mips64el/qom-test /mips64el/qom/mipssim
> PASS 5 qtest-mips64el/qom-test /mips64el/qom/malta
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 6 qtest-mips64el/qom-test /mips64el/qom/fuloong2e
> PASS 7 qtest-mips64el/qom-test /mips64el/qom/boston
> PASS 8 qtest-mips64el/qom-test /mips64el/qom/pica61
>
> and similarly for eg
>
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/endianness-test
> --tap -k
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 1 qtest-mips64el/endianness-test /mips64el/endianness/fuloong2e
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 2 qtest-mips64el/endianness-test /mips64el/endianness/split/fuloong2e
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 3 qtest-mips64el/endianness-test /mips64el/endianness/combine/fuloong2e

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <62a5fc69e453fb848bfd4794bae1852a75af73c5.1616532563.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/vt82c686.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 05d084f698..f0fb309f12 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -144,7 +144,18 @@ static void pm_update_sci(ViaPMState *s)
                    ACPI_BITMASK_POWER_BUTTON_ENABLE |
                    ACPI_BITMASK_GLOBAL_LOCK_ENABLE |
                    ACPI_BITMASK_TIMER_ENABLE)) != 0);
-    pci_set_irq(&s->dev, sci_level);
+    if (pci_get_byte(s->dev.config + PCI_INTERRUPT_PIN)) {
+        /*
+         * FIXME:
+         * Fix device model that realizes this PM device and remove
+         * this work around.
+         * The device model should wire SCI and setup
+         * PCI_INTERRUPT_PIN properly.
+         * If PIN# = 0(interrupt pin isn't used), don't raise SCI as
+         * work around.
+         */
+        pci_set_irq(&s->dev, sci_level);
+    }
     /* schedule a timer interruption if needed */
     acpi_pm_tmr_update(&s->ar, (s->ar.pm1.evt.en & ACPI_BITMASK_TIMER_ENABLE) &&
                        !(pmsts & ACPI_BITMASK_TIMER_STATUS));
-- 
MST


