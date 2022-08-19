Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A6C59A975
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 01:33:06 +0200 (CEST)
Received: from localhost ([::1]:60150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPBU7-0001ca-VL
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 19:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oPBT5-0000Bs-Nj
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 19:31:59 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:38892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oPBT4-0007to-3u
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 19:31:59 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3321c2a8d4cso159533567b3.5
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 16:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=3Elh7ozVx/tGkdaoAa3gGmIBDobWo2hmDe/od367f2Q=;
 b=lBj1fo1S41sBxxtM9+60HYCxheHKzYRxcOHtEOV1mDevTSgQTLUW7uu90mPGcTlqyM
 GTEA4HADu0YWAgn80/NshXbAi0zL7BuDthuu6cebvK2BoPGgItdvDd/t90i3T5+kDgKB
 hHR4Ubn8pKyrB9yUj6LJdNuDaP7gm5m+OA/nfdziXPmjGzBfLkieJQlMLZdmhSErvnUd
 vMTFyWWkYYBg7Xef7oewiZHPVarzlpue00NoGqUZgV9hy24p5oi3gRT3U6dKntCyLthU
 AO1e6nK7tryISNuZKi2xOvhxeuXoxzTi4W8CZc0+df5TaDjPGfz4M5dxe2WTFdeYDMnx
 nw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=3Elh7ozVx/tGkdaoAa3gGmIBDobWo2hmDe/od367f2Q=;
 b=HtUd5T4VBizlzwKkWrMaGoHvc8HAYN7hAaYxHxIVT0BqEYMEfafFd0ZA1PVPIPTwVF
 4m8SdI/M97eMzy8EI+511TEheymje+9ITWPI4CbpDDDjoLDujoSH2F/ZzVs90obnkR4W
 XNz+dfCjCWqfjfWVh/JzImDKQZUvo1tFj6K0XyZjBmrhcxHcpzQZw4NiwYjp+mkkRNN7
 E/wkpYnu0IjXMtIS7ph9PW8clmL4ARFAIL9Vb/UACqDanZODbdc2hjYtudaB3IM7w2Yd
 2LSAZeVbJeK1N/sAA8GndPRsVEBvO5Vfm6PSxbQ5eH6MsZGIW2ZOfg3U1x0/O1UFE9yT
 upBg==
X-Gm-Message-State: ACgBeo3shQBw69ZvSZhetxA6QcDNQHUhXlqZkz8TQQZJUstfK4/Znp8t
 +6EhOiVQy8Ctj3qyXbJCW8xVrLv6aNQ+v1pHTd8=
X-Google-Smtp-Source: AA6agR7QENzPoYwNaUfPibf0auEPbgwg6Jb0tIO5wDYhEP4KPCVCt4IaHVRoKFb8vNnqXNUeQj4XbD8bZMTIxRDwOuY=
X-Received: by 2002:a25:e087:0:b0:67c:2128:e754 with SMTP id
 x129-20020a25e087000000b0067c2128e754mr10228119ybg.635.1660951916475; Fri, 19
 Aug 2022 16:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <6A02B617-F7E4-4C8A-9770-9B9131BAF670@gmail.com>
In-Reply-To: <6A02B617-F7E4-4C8A-9770-9B9131BAF670@gmail.com>
From: Paul Schlacter <wlfightup@gmail.com>
Date: Sat, 20 Aug 2022 07:31:44 +0800
Message-ID: <CADak6y5Ui4d1yccguzT24AMD4m-xC1RUgEd7B9MdzJtLPt4dJA@mail.gmail.com>
Subject: Re: [PATCH v3] xio3130_upstream: Add ACS (Access Control Services)
 capability
To: "Michael S. Tsirkin" <mst@redhat.com>, marcel.apfelbaum@gmail.com,
 fam@euphon.net, 
 kwolf@redhat.com, stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org, 
 its@irrelevant.dk, xypron.glpk@gmx.de, imammedo@redhat.com, 
 qemu-devel@nongnu.org, armbru@redhat.com, kbusch@kernel.org, 
 hreitz@redhat.com, ani@anisinha.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=wlfightup@gmail.com; helo=mail-yw1-x112f.google.com
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

ping

On Thu, Aug 18, 2022 at 10:25 PM Paul Schlacter <wlfightup@gmail.com> wrote=
:
>
> If it is a pcie device, check that all devices on the path from
> the device to the root complex have ACS enabled, and then the
> device will become an iommu_group.
>
> pci_acs_path_enabled, this function in the Linux kernel, it means
> that if the device is a PCIe device, check the path from the
> device to the root complex. If ACS is all enabled, the device will
> become an iommu_group.
>
> acs determine whether it is a separate iommu_group.
>
> Signed-off-by: wlfightup <wlfightup@gmail.com>
> =E2=80=94
> v3:
> - Suggested by Michael S. Tsirkin, use x-disable-acs, and set the
> default value to true, Compatible with previous defaults
>
> v2:
> - Allow ACS to be disabled.
> - Suggested by Michael S. Tsirkin, use disable-acs to set property.
>
> hw/pci-bridge/xio3130_upstream.c | 13 +++++++++++++
> 1 file changed, 13 insertions(+)
>
> diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_ups=
tream.c
> index 5ff46ef050..f918113d76 100644
> --- a/hw/pci-bridge/xio3130_upstream.c
> +++ b/hw/pci-bridge/xio3130_upstream.c
> @@ -24,6 +24,7 @@
> #include "hw/pci/msi.h"
> #include "hw/pci/pcie.h"
> #include "hw/pci/pcie_port.h"
> +#include "hw/qdev-properties.h"
> #include "migration/vmstate.h"
> #include "qemu/module.h"
>
> @@ -37,6 +38,8 @@
> #define XIO3130_SSVID_SSID              0
> #define XIO3130_EXP_OFFSET              0x90
> #define XIO3130_AER_OFFSET              0x100
> +#define XIO3130_ACS_OFFSET \
> +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
>
> static void xio3130_upstream_write_config(PCIDevice *d, uint32_t address,
>                                         uint32_t val, int len)
> @@ -57,6 +60,7 @@ static void xio3130_upstream_reset(DeviceState *qdev)
> static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
> {
>   PCIEPort *p =3D PCIE_PORT(d);
> +    PCIESlot *s =3D PCIE_SLOT(d);
>   int rc;
>
>   pci_bridge_initfn(d, TYPE_PCIE_BUS);
> @@ -92,6 +96,9 @@ static void xio3130_upstream_realize(PCIDevice *d, Erro=
r **errp)
>       goto err;
>   }
>
> +    if (!s->disable_acs) {
> +        pcie_acs_init(d, XIO3130_ACS_OFFSET);
> +    }
>   return;
>
> err:
> @@ -110,6 +117,11 @@ static void xio3130_upstream_exitfn(PCIDevice *d)
>   pci_bridge_exitfn(d);
> }
>
> +static Property xio3130_upstream_props[] =3D {
> +    DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, true),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> static const VMStateDescription vmstate_xio3130_upstream =3D {
>   .name =3D "xio3130-express-upstream-port",
>   .priority =3D MIG_PRI_PCI_BUS,
> @@ -139,6 +151,7 @@ static void xio3130_upstream_class_init(ObjectClass *=
klass, void *data)
>   dc->desc =3D "TI X3130 Upstream Port of PCI Express Switch";
>   dc->reset =3D xio3130_upstream_reset;
>   dc->vmsd =3D &vmstate_xio3130_upstream;
> +    device_class_set_props(dc, xio3130_upstream_props);
> }
>
> static const TypeInfo xio3130_upstream_info =3D {
> --
> 2.24.3 (Apple Git-128)
>
>

