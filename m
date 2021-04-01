Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D944351AF1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:08:00 +0200 (CEST)
Received: from localhost ([::1]:47550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1jb-0005N3-6d
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1f7-0003SB-5k
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1f4-00062X-H4
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKCnnXenvH7r51iGFAf4L/sGjea+/dMJumwisHEHz1c=;
 b=J9yULXYKiJY6Ro/5jLFcXwp4dlvCHU0DKZhJiwS75i5gbs5sae29da7X73js034b+XO/he
 qL1A5FVTDcBzVsPnRFnZjszic2zPvfSE/bv+IGq3nbiNtn5rKGZ83djg/2wVrVkSSbMTFx
 mhV/2eEpCoX40TLqazdsb/nTraB7sFs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-iACARY8hMnSEds49KZuSYg-1; Thu, 01 Apr 2021 14:03:15 -0400
X-MC-Unique: iACARY8hMnSEds49KZuSYg-1
Received: by mail-wr1-f71.google.com with SMTP id h30so3127864wrh.10
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RKCnnXenvH7r51iGFAf4L/sGjea+/dMJumwisHEHz1c=;
 b=g9p7lXqjnuowntMYlWiPDbIwUOE6qsyz4VXq4izf1DEI6G6KWqaFyzKj8BdSXkldQy
 Nm42k8w54X7iTIoGZABGV/CwemhbThUpBkE3wNHvQGV0UbTkhSo89E06jd7HrdZXKqjY
 GWv+Gy1fzmydxFK4MfCM/abOK2VLOea/haZmg3c7aE2BA/MVZymF4ShN/FMeHLUdxFik
 WyZFYnfF3lrhp7dMkjW+t95DlswFD3Su3biEEnRtbt4WxX43j/RiptA1kvPsEzehCiQ6
 h3c+IMPeZvsz5j2zYRkv9om3ZB0ksw/3Wcf978upgm3uS429t6JWCiIZLLzHTr4VHNQr
 kB8w==
X-Gm-Message-State: AOAM532F/ZlFeA/oJYFHpF1eNBFkvEru1+OEnjoWubsJZaNvBz9nFfvZ
 gi3GGA86V1Fbvm4JIce2Gn8tC35YB2/SViBAVaMrTO1EhnoLLhoY2X8EhewSs13OxGzdLrIfcZE
 IJsxTV3+tgwmunVbjug5/GYpP/pY81O7R3hYnlDQC1RE6Jm/JuQF2VKuf82qQ
X-Received: by 2002:a1c:2587:: with SMTP id l129mr9133710wml.135.1617300193454; 
 Thu, 01 Apr 2021 11:03:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfh/ntQVUb1h3F73wyfToudKz5dPGvmGRHgyIns6SPAeTK5uOcsbTueRRU5WGEKp7GEGVQ2A==
X-Received: by 2002:a1c:2587:: with SMTP id l129mr9133683wml.135.1617300193234; 
 Thu, 01 Apr 2021 11:03:13 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id s21sm9268676wmc.10.2021.04.01.11.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:03:12 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:03:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] isa/v582c686: Reinitialize ACPI PM device on reset
Message-ID: <20210401180235.226321-9-mst@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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

Commit 6be8cf56bc8b made sure that SCI is enabled in PM1.CNT
on reset in acpi_only mode by modifying acpi_pm1_cnt_reset() and
that worked for q35 as expected.

This patch adds reset ACPI PM related registers on vt82c686 reset time
and de-assert sci.
via_pm_realize() initializes acpi pm tmr, evt, cnt and gpe.
Reset them on device reset.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <0a3fe998525552860919a690ce83dab8f663ab99.1616532563.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/vt82c686.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f0fb309f12..98325bb32b 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -178,6 +178,11 @@ static void via_pm_reset(DeviceState *d)
     /* SMBus IO base */
     pci_set_long(s->dev.config + 0x90, 1);
 
+    acpi_pm1_evt_reset(&s->ar);
+    acpi_pm1_cnt_reset(&s->ar);
+    acpi_pm_tmr_reset(&s->ar);
+    pm_update_sci(s);
+
     pm_io_space_update(s);
     smb_io_space_update(s);
 }
-- 
MST


