Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4331321CC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 10:01:34 +0100 (CET)
Received: from localhost ([::1]:44950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iokjy-0001kO-Cn
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 04:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iojQN-0006Sm-FR
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:37:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iojQI-0008OP-Nr
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:37:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60504
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iojQI-0008Lt-Jf
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578382623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMQapAZoKHuzNu9Pp7IYAg1kGSgMFQ0zkXvOLbEXi5E=;
 b=cM9WxUMVWuBf0T7EGgH0rJtxZX3rY3KCWsedHRB39AiouVaDMsptClYh06A4TGcExBXvT0
 S9HVTfD7JOrNYYBE1m65tAVJs211fMsDrokUfqb1j9ZiarOpn3c6w1Y96nNBWFOetR7INv
 yReGl7owaPQlNpKPj0e+JZ3VgvDA+L8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-wPz_Jjr-PTC6m_gBat38Mw-1; Tue, 07 Jan 2020 02:37:02 -0500
Received: by mail-qk1-f200.google.com with SMTP id c202so1847284qkg.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jan 2020 23:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kOPqzhUAAr1F9DHkT+R7bzvkT8C45cWHnUcu3/B6bq0=;
 b=YgE4MB77G2PBWE3n0a2O4TgKy+0nlzrSrWT/DJr5EgSncANh3l9gfSaeUUsXVYt67B
 WK9MU8UrF5TT7/4mfsBIFTF2XI/3Ire5J0Jb3hyMcTDhbu5hBqb0jTn2GiHFiN/S0aGl
 z+W90Z9fAkn0CgRMLBvb7+2Y/lnx6rzqK+zPjS0Ayr7EcEjWv/PxYYVkEkwI044x8edc
 S5Aow3pyC3RIPukHB0KtpyheqPRc+H4tIIZLV3xfZSOVLw6Lqg5TAbbSNxj7fIeUkNbz
 yr4HMWB9niDMRBYELHH3FC+ZhMZ6aU5Mos5msGUU0pWCfIDUhrqV3bAeo+4wyaxV70PW
 lE6Q==
X-Gm-Message-State: APjAAAUF3H1rMldP2QkKhy81LSYNwXbGvF8a5mTOHOAoL9Br5P4xJ952
 +TiQzadEOiGgDMcROhudLZwHOC+u3FUjpJOIRSpAJTSIq4AT3yduVPVbdjeqEJEM4wsn1IO+sIZ
 u9UymhsWxQhIeMKM=
X-Received: by 2002:a37:a30a:: with SMTP id m10mr83251752qke.56.1578382621467; 
 Mon, 06 Jan 2020 23:37:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqyEd4WjDrVFcGasoVsd/g+4kPqonsObYlED8RjNgSWxRh6zeMJySjnWk0gcA0KgreenRlLQ/w==
X-Received: by 2002:a37:a30a:: with SMTP id m10mr83251745qke.56.1578382621260; 
 Mon, 06 Jan 2020 23:37:01 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id f23sm21893397qke.104.2020.01.06.23.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 23:37:00 -0800 (PST)
Date: Tue, 7 Jan 2020 02:36:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 21/32] hw/pci/pci_host: Remove redundant PCI_DPRINTF()
Message-ID: <20200107073451.298261-22-mst@redhat.com>
References: <20200107073451.298261-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200107073451.298261-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: wPz_Jjr-PTC6m_gBat38Mw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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


