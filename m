Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73D351BFA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:17:43 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1t0-0003rM-6e
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1f4-0003PG-SA
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1ey-0005xy-OX
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cc1ejjyRsgD3Z98rDH9YyBq+JCXKSN4A99erroM1Vog=;
 b=O9VObFiLRrWoUM/CrlkrTS6k1nY1Nd5QqyzCpAeaQX9YvckNqqcX1I2gryakJm2624kJFY
 R/Sg6FlsHqBpAIJc7z/WSQzHqZHBtTFgAi6uFZb/wR8s7gQ8l9HHEh0JcS9mFqKMiuOFMX
 CVmTKfqc3BeDZnFd84nxpcowg8/1SzQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-K9JG0v4pN56_6LuYuJDjIg-1; Thu, 01 Apr 2021 14:03:09 -0400
X-MC-Unique: K9JG0v4pN56_6LuYuJDjIg-1
Received: by mail-wr1-f70.google.com with SMTP id s10so3130696wre.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cc1ejjyRsgD3Z98rDH9YyBq+JCXKSN4A99erroM1Vog=;
 b=fp0ypw8Z6nm8ePktFDOnaDetlweQ11vKrdKcDLdF8wHb0kUmllDH09Xlb8TP78A7KX
 Ee3s4xutY/vaQ1fNYQBoWKC1tuN5FaJeAeaNh2IzbNs/hFd694vFj04Y3+uUMvy2WjMa
 kJPOrEKMHeulwwAup1QNXxTdBrsLk2zKt4hUu5bCyuv3hIhJ46H8ptpFmbgAPzDg/kPy
 kxckrN8v/Z476mFjtAFzh4Jq8y2XZ9WdDu9ctrZ6ldRnO4+zJqQB/WhRQrvP/mXfAvVL
 fcsSmEc2ziETCQcAE/3nqBSRdKtlMJ8a+LQXGwvzDoB2K1bLwDPfLgofOzbElVVnhmoi
 dS6Q==
X-Gm-Message-State: AOAM530BbpkH18iRSdo4INVdpc/wPY9toi5VJL0i1QCC8F7q8t30e4wK
 jwsc5fKZ8wgXjUL30q3GEbMV8NjC3tCfHG13FKXhmXLqC7HlHM4UFywXPPU0VAUMZGj6N+qYhX4
 EI40MmgaBHiCOf1RnI4nSFvhEGflhRC/BjSwQchvkSi+zr+S5bWr5j24VGA1i
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr9275804wmb.84.1617300187202; 
 Thu, 01 Apr 2021 11:03:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy35eNu/CZLDeYF58L+vfZzFv0LE3SsTu/U5aXJT2A2X3o60QQPADSV9TvkNY8GjtJsAVcNEw==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr9275782wmb.84.1617300187009; 
 Thu, 01 Apr 2021 11:03:07 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id n1sm13964745wro.36.2021.04.01.11.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:03:06 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:03:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] acpi/piix4: reinitialize acpi PM device on reset
Message-ID: <20210401180235.226321-7-mst@redhat.com>
References: <20210401180235.226321-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401180235.226321-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Commit 6be8cf56bc8b made sure that SCI is enabled in PM1.CNT
on reset in acpi_only mode by modifying acpi_pm1_cnt_reset() and
that worked for q35 as expected.

The function was introduced by commit
  eaba51c573a (acpi, acpi_piix, vt82c686: factor out PM1_CNT logic)
that forgot to actually call it at piix4 reset time and as result
SCI_EN wasn't set as was expected by 6be8cf56bc8b in acpi_only mode.

So Windows crashes when it notices that SCI_EN is not set and FADT is
not providing information about how to enable it anymore.
Reproducer:
   qemu-system-x86_64 -enable-kvm -M pc-i440fx-6.0,smm=off -cdrom any_windows_10x64.iso

Fix it by calling acpi_pm1_cnt_reset() at piix4 reset time.

Occasionally this patch adds reset acpi PM related registers on
piix4 reset time and de-assert sci.
piix4_pm_realize() initializes acpi pm tmr, evt, cnt and gpe.
Reset them on device reset. pm_reset() in ich9.c correctly calls
corresponding reset functions.

Fixes: 6be8cf56bc8b (acpi/core: always set SCI_EN when SMM isn't supported)
Reported-by: Reinoud Zandijk <reinoud@NetBSD.org>
Co-developed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <8a5bbd19727045ec863523830078dd4ca63f6a9a.1616532563.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/piix4.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 6056d51667..8f8b0e95e5 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -326,6 +326,13 @@ static void piix4_pm_reset(DeviceState *dev)
         /* Mark SMM as already inited (until KVM supports SMM). */
         pci_conf[0x5B] = 0x02;
     }
+
+    acpi_pm1_evt_reset(&s->ar);
+    acpi_pm1_cnt_reset(&s->ar);
+    acpi_pm_tmr_reset(&s->ar);
+    acpi_gpe_reset(&s->ar);
+    acpi_update_sci(&s->ar, s->irq);
+
     pm_io_space_update(s);
     acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
 }
-- 
MST


