Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5765985B7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 16:27:04 +0200 (CEST)
Received: from localhost ([::1]:43522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOgUA-0001bQ-Vk
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 10:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oOgSO-00082k-Eo
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:25:12 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oOgSM-000416-Mx
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:25:12 -0400
Received: by mail-pl1-x62c.google.com with SMTP id m2so1646047pls.4
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc;
 bh=wTQFMvyMCBLH0V14/pjwOxur2tGStshx0xLZreeyl6U=;
 b=ls9TgG9u4vG7Epb5HvtnHMsbNu6J3j14qSIgo3O+vvAL7vUqeJYeiHd+acWnJzNMp/
 gqNaWRQMGcjCq0bwiJtIZjvd/ArE8niFxiiIvfDT7vylFnbIOxM1MKz+hqNpgWNk+YfO
 Oy0UZCtBy2igfv2BkDTLM36pYC/FtRGNA3gHIGWUSnqVHttKOfJZTCYTi4LCu7EChPD/
 RtEdONredJ+SRU8sjgvV49+vaMrI0mzvxeBvDZCc2tI3aoT+DztX/F9Q+rWoi7Gtz5/R
 OOxcNjrx3zx1WQkUuRG7TLiHoi4LRJzHo8nMoKeG+e/z65R4shjKVqgOD8yEhqqutAPj
 NVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc;
 bh=wTQFMvyMCBLH0V14/pjwOxur2tGStshx0xLZreeyl6U=;
 b=VLSYuvFW/HoMgSXY2QGOzEkHFJYHxzNFlXHkHE8YsZK6iii1wN02i5d+69HVvfXuoM
 jmtojheBMDuM8HfQyHHLgtrFKOscWEuYzDw2FCH6chMfY44mR9Xh5dHS5c1Z02wfzDIr
 CV7swz0xm4y4NtrVC+yb5ldZCHhpPwVDSiui3IYChInlPFScVEpECnRfZji4PYYy4OWH
 cm9/E8wM//IFh9HSNLDdrbVaCrzFyB/vkrOLp2VyYfTZEu6Jb1x3n/++NQtRlFW5bziU
 F5MUb7oNv8hA8b6esa2w2rJ0KbsqWSBWzTLcJtQ3MCFU540PWkwp1caCd0ebmL8bmHyW
 arHg==
X-Gm-Message-State: ACgBeo1xuj3gJAh7qx/ZXHUEamWHkqBgDqNNAlQAtL9FGMF5NCbJfMFp
 veieDrw+FaG+d6R2IXkPRBw=
X-Google-Smtp-Source: AA6agR4irIOMs7Co/qFxMToynjbbmUCrb4R+GhQcJ7nZzYgD5gXDEDYIFN4G0OO9dGo7JCIIfYf4hA==
X-Received: by 2002:a17:90b:4c8c:b0:1fa:c44f:473a with SMTP id
 my12-20020a17090b4c8c00b001fac44f473amr4815837pjb.195.1660832708724; 
 Thu, 18 Aug 2022 07:25:08 -0700 (PDT)
Received: from [172.22.202.50] ([111.206.214.32])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a17090ab28b00b001f4f76033f9sm1555692pjr.49.2022.08.18.07.25.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Aug 2022 07:25:08 -0700 (PDT)
From: Paul Schlacter <wlfightup@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: [PATCH v3] xio3130_upstream: Add ACS (Access Control Services)
 capability 
Message-Id: <6A02B617-F7E4-4C8A-9770-9B9131BAF670@gmail.com>
Date: Thu, 18 Aug 2022 22:25:02 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>, marcel.apfelbaum@gmail.com,
 fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 k.jensen@samsung.com, f4bug@amsat.org, its@irrelevant.dk,
 xypron.glpk@gmx.de, imammedo@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, kbusch@kernel.org, hreitz@redhat.com, ani@anisinha.ca
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=wlfightup@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If it is a pcie device, check that all devices on the path from
the device to the root complex have ACS enabled, and then the
device will become an iommu_group.

pci_acs_path_enabled, this function in the Linux kernel, it means
that if the device is a PCIe device, check the path from the
device to the root complex. If ACS is all enabled, the device will
become an iommu_group.

acs determine whether it is a separate iommu_group.

Signed-off-by: wlfightup <wlfightup@gmail.com>
=E2=80=94
v3:
- Suggested by Michael S. Tsirkin, use x-disable-acs, and set the
default value to true, Compatible with previous defaults

v2:
- Allow ACS to be disabled.
- Suggested by Michael S. Tsirkin, use disable-acs to set property.

hw/pci-bridge/xio3130_upstream.c | 13 +++++++++++++
1 file changed, 13 insertions(+)

diff --git a/hw/pci-bridge/xio3130_upstream.c =
b/hw/pci-bridge/xio3130_upstream.c
index 5ff46ef050..f918113d76 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -24,6 +24,7 @@
#include "hw/pci/msi.h"
#include "hw/pci/pcie.h"
#include "hw/pci/pcie_port.h"
+#include "hw/qdev-properties.h"
#include "migration/vmstate.h"
#include "qemu/module.h"

@@ -37,6 +38,8 @@
#define XIO3130_SSVID_SSID              0
#define XIO3130_EXP_OFFSET              0x90
#define XIO3130_AER_OFFSET              0x100
+#define XIO3130_ACS_OFFSET \
+        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)

static void xio3130_upstream_write_config(PCIDevice *d, uint32_t =
address,
                                        uint32_t val, int len)
@@ -57,6 +60,7 @@ static void xio3130_upstream_reset(DeviceState *qdev)
static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
{
  PCIEPort *p =3D PCIE_PORT(d);
+    PCIESlot *s =3D PCIE_SLOT(d);
  int rc;

  pci_bridge_initfn(d, TYPE_PCIE_BUS);
@@ -92,6 +96,9 @@ static void xio3130_upstream_realize(PCIDevice *d, =
Error **errp)
      goto err;
  }

+    if (!s->disable_acs) {
+        pcie_acs_init(d, XIO3130_ACS_OFFSET);
+    }
  return;

err:
@@ -110,6 +117,11 @@ static void xio3130_upstream_exitfn(PCIDevice *d)
  pci_bridge_exitfn(d);
}

+static Property xio3130_upstream_props[] =3D {
+    DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, true),
+    DEFINE_PROP_END_OF_LIST()
+};
+
static const VMStateDescription vmstate_xio3130_upstream =3D {
  .name =3D "xio3130-express-upstream-port",
  .priority =3D MIG_PRI_PCI_BUS,
@@ -139,6 +151,7 @@ static void xio3130_upstream_class_init(ObjectClass =
*klass, void *data)
  dc->desc =3D "TI X3130 Upstream Port of PCI Express Switch";
  dc->reset =3D xio3130_upstream_reset;
  dc->vmsd =3D &vmstate_xio3130_upstream;
+    device_class_set_props(dc, xio3130_upstream_props);
}

static const TypeInfo xio3130_upstream_info =3D {
--=20
2.24.3 (Apple Git-128)



