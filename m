Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99B681B46
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:21:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMacg-0002J3-Tu; Mon, 30 Jan 2023 15:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacX-0002Gj-8c
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacU-0006ph-W7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/dOoJvzG9odeo4jTr8/g/DKOuCic1QRPN2s5bAH5YI=;
 b=XttoI7FouER5vQdyKxxoUCCf4X0yT6FUAJw0Jl/qSnIQ8G8p47tkYuiU5P7eEeNgnGk+fe
 xBem30K869WUp0thHRneBTEC8YP/BDmUhDLYYQwYF/E+kKieQiilCmqLEFbyxR1B3Mau9C
 h3xU8FLM18vguY5VNY5xbOy06PsUTPQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-UrCLPXM2Moa6mHwUHD73HA-1; Mon, 30 Jan 2023 15:19:13 -0500
X-MC-Unique: UrCLPXM2Moa6mHwUHD73HA-1
Received: by mail-ed1-f69.google.com with SMTP id
 j10-20020a05640211ca00b0049e385d5830so9056051edw.22
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0/dOoJvzG9odeo4jTr8/g/DKOuCic1QRPN2s5bAH5YI=;
 b=3pUElFsGiY859+sVJGOilxvysUm6wrzNBS984okgh0XzBRR+skZqjw2UtIKIQcLKin
 AEwJHSdoTbQ+XZn223DTjZNMSB6jHGEXJjZ3jSwotX/sLgZZTf6n4gFVkv914AmEC8b3
 3wZzEi1aHYLDuzPk6Rpheckc/fmHAIDPatz+eOBJYOtaB2XT93eaXBVeceyGli0WmvPt
 S2INwGqmXQ/H6lccTKYQcO399IH9BnJF7XNWbzCa5B1b5ENwdCyJAjBOXX5B8cd7LLil
 Jh7eJluOTm4m8JUtEd+BaZNF6MTNRkv7blm1mS1zM7I6Ut5/ili/i73Y9AlbvTE9ZtEt
 iCJA==
X-Gm-Message-State: AO0yUKWq6eGz6h0rf3HrWPbiBFKRDfcZXQ3hTUUCXQQRg64v6NXuRqPK
 uJTfkLZx4NUapQG7IqGnq/WMQOPUAeSN6+NeujfFx3Xh2kr/bPkZk1uZ/kQlQeqtXb1r/Sc+PIA
 7okURK2KqTPz9jv2F2sRr0o/U7e9qqz3zctZxTh0EADe40rJD9769f9tLELTd
X-Received: by 2002:a17:906:13c6:b0:878:605e:dbe7 with SMTP id
 g6-20020a17090613c600b00878605edbe7mr18067726ejc.3.1675109951275; 
 Mon, 30 Jan 2023 12:19:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8G5c6Dif7sTPlMCDjSUNOHx0ULwcTQ5s8ic5oi01DEswAgsJnvtwqehsXYqQKIeR+vQeNEfA==
X-Received: by 2002:a17:906:13c6:b0:878:605e:dbe7 with SMTP id
 g6-20020a17090613c600b00878605edbe7mr18067699ejc.3.1675109951025; 
 Mon, 30 Jan 2023 12:19:11 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1709064a1700b008860045df76sm3306225eju.105.2023.01.30.12.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:10 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 David Daney <david.daney@fungible.com>, Dr.David@redhat.com,
 Alan@redhat.com, Gilbert@redhat.com, &lt@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 08/56] virtio-rng-pci: fix migration compat for vectors
Message-ID: <20230130201810.11518-9-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Fixup the migration compatibility for existing machine types
so that they do not enable msi-x.

Symptom:

(qemu) qemu: get_pci_config_device: Bad config data: i=0x34 read: 84 device: 98 cmask: ff wmask: 0 w1cmask:0
qemu: Failed to load PCIDevice:config
qemu: Failed to load virtio-rng:virtio
qemu: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-rng'
qemu: load of migration failed: Invalid argument

Note: This fix will break migration from 7.2->7.2-fixed with this patch

bz: https://bugzilla.redhat.com/show_bug.cgi?id=2155749
Fixes: 9ea02e8f1 ("virtio-rng-pci: Allow setting nvectors, so we can use MSI-X")

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20230109105809.163975-1-dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: David Daney <david.daney@fungible.com>
Fixes: 9ea02e8f1 (&quot;virtio-rng-pci: Allow setting nvectors, so we can use MSI-X&quot;)<br>
Signed-off-by: Dr. David Alan Gilbert &lt;<a href="mailto:dgilbert@redhat.com" target="_blank">dgilbert@redhat.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 616f3a207c..f7761baab5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -46,6 +46,7 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
 
 GlobalProperty hw_compat_7_1[] = {
     { "virtio-device", "queue_reset", "false" },
+    { "virtio-rng-pci", "vectors", "0" },
 };
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 
-- 
MST


