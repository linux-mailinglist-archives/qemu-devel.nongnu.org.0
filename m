Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB681298F7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 17:56:04 +0100 (CET)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijQzz-0002xv-9J
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 11:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ijQn2-000527-6E
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:42:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ijQn0-0005h8-Vk
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:42:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21858
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ijQn0-0005h3-S6
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577119358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMQapAZoKHuzNu9Pp7IYAg1kGSgMFQ0zkXvOLbEXi5E=;
 b=IxPrx7lyN2BMmLDCSX/KmqEzw3X36qyH3fm6Ha/htVzYD/f53jNqRDtOiAWXHEtTxDq/yP
 9M3asXMQ1GbqnhK8UzjJGeWOLwudxZ9t9OcZM9lOD+XXytr2RI9c8paeroU85beiAb1iI+
 KxN+OygRIY4beuUgdU6Bk+uiwHhzfas=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-jXfGunCkPBKAB5L5mXHbDQ-1; Mon, 23 Dec 2019 11:42:36 -0500
Received: by mail-qt1-f198.google.com with SMTP id y7so11499674qto.8
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 08:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kOPqzhUAAr1F9DHkT+R7bzvkT8C45cWHnUcu3/B6bq0=;
 b=S9v+rfL6GrNhFC9GzpvB+9x2IBbkp8M7G4Egtk+AGopR5wEbezAehbRHaGXmqVzGxS
 0k8qkEjMLOm4V920mprLhgXIdpjB5GHtllSH6v0ArLyjUkqC5wyeXNOLzoFhN4F6VvLC
 t/J8KwkKGoJAANM/m7JQYrgS4m4MFXd+jUJvvPOHeLd2gytptCn90AueT7GW7M3DDza5
 hSKSzjX53hTtaxm+txXbAdPkMimd84QT5AlaIFtku027j35kpf06luLDvJrQtfoJfyX5
 1bNnwk+TnFXwPkOo5XrrRkWDgDJjrKHhCKG0Uv4lzaGxmwOJnDhcXNzLLSy5UpWEZ5WA
 TbXw==
X-Gm-Message-State: APjAAAWTo9YhbPX5cTk3wvLj6Re3bk9bz6A2lPn3Nm7L9uINJIs0momL
 GsqoyhPrhhxt3L4CMcgfnMzzIGCid5Af1tz7NkIXRdHDNkjF/VP+W4eIjlHVTGDAv+nhY5Xc+os
 4TDZf6zZemNBX8hk=
X-Received: by 2002:aed:2be4:: with SMTP id e91mr24332604qtd.148.1577119355639; 
 Mon, 23 Dec 2019 08:42:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyxZi1S1FTbMo97qQsHqYUQILJOv3+xDlO6RQG/SsUHKXZZFMOjgN/1jVsD05Xw9LtqnkUqew==
X-Received: by 2002:aed:2be4:: with SMTP id e91mr24332592qtd.148.1577119355454; 
 Mon, 23 Dec 2019 08:42:35 -0800 (PST)
Received: from redhat.com (bzq-109-64-31-13.red.bezeqint.net. [109.64.31.13])
 by smtp.gmail.com with ESMTPSA id
 s27sm5848235qkm.97.2019.12.23.08.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 08:42:34 -0800 (PST)
Date: Mon, 23 Dec 2019 11:42:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 21/27] hw/pci/pci_host: Remove redundant PCI_DPRINTF()
Message-ID: <20191223141536.72682-22-mst@redhat.com>
References: <20191223141536.72682-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191223141536.72682-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: jXfGunCkPBKAB5L5mXHbDQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

In commit 3bf4dfdd111 we introduced the pci_cfg_[read/write]
trace events in pci_host_config_[read/write]_common().
We have the following call trace:

  pci_host_data_[read/write]()
    - PCI_DPRINTF()
    - pci_data_[read/write]()
        - PCI_DPRINTF()
        - pci_host_config_[read/write]_common()
            trace_pci_cfg_[read/write]()

Since the PCI_DPRINTF() calls are redundant with the trace
events, remove them.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20191216002134.18279-2-philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci_host.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index c5f9244934..0958d157de 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -115,8 +115,6 @@ void pci_data_write(PCIBus *s, uint32_t addr, uint32_t =
val, int len)
         return;
     }
=20
-    PCI_DPRINTF("%s: %s: addr=3D%02" PRIx32 " val=3D%08" PRIx32 " len=3D%d=
\n",
-                __func__, pci_dev->name, config_addr, val, len);
     pci_host_config_write_common(pci_dev, config_addr, PCI_CONFIG_SPACE_SI=
ZE,
                                  val, len);
 }
@@ -125,18 +123,13 @@ uint32_t pci_data_read(PCIBus *s, uint32_t addr, int =
len)
 {
     PCIDevice *pci_dev =3D pci_dev_find_by_addr(s, addr);
     uint32_t config_addr =3D addr & (PCI_CONFIG_SPACE_SIZE - 1);
-    uint32_t val;
=20
     if (!pci_dev) {
         return ~0x0;
     }
=20
-    val =3D pci_host_config_read_common(pci_dev, config_addr,
-                                      PCI_CONFIG_SPACE_SIZE, len);
-    PCI_DPRINTF("%s: %s: addr=3D%02"PRIx32" val=3D%08"PRIx32" len=3D%d\n",
-                __func__, pci_dev->name, config_addr, val, len);
-
-    return val;
+    return pci_host_config_read_common(pci_dev, config_addr,
+                                       PCI_CONFIG_SPACE_SIZE, len);
 }
=20
 static void pci_host_config_write(void *opaque, hwaddr addr,
@@ -167,8 +160,7 @@ static void pci_host_data_write(void *opaque, hwaddr ad=
dr,
                                 uint64_t val, unsigned len)
 {
     PCIHostState *s =3D opaque;
-    PCI_DPRINTF("write addr " TARGET_FMT_plx " len %d val %x\n",
-                addr, len, (unsigned)val);
+
     if (s->config_reg & (1u << 31))
         pci_data_write(s->bus, s->config_reg | (addr & 3), val, len);
 }
@@ -177,14 +169,11 @@ static uint64_t pci_host_data_read(void *opaque,
                                    hwaddr addr, unsigned len)
 {
     PCIHostState *s =3D opaque;
-    uint32_t val;
+
     if (!(s->config_reg & (1U << 31))) {
         return 0xffffffff;
     }
-    val =3D pci_data_read(s->bus, s->config_reg | (addr & 3), len);
-    PCI_DPRINTF("read addr " TARGET_FMT_plx " len %d val %x\n",
-                addr, len, val);
-    return val;
+    return pci_data_read(s->bus, s->config_reg | (addr & 3), len);
 }
=20
 const MemoryRegionOps pci_host_conf_le_ops =3D {
--=20
MST


