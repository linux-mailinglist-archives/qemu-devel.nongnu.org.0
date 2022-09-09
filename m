Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828F5B4050
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 22:06:12 +0200 (CEST)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWkGQ-0001zm-GH
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 16:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oWk9R-0002em-6M; Fri, 09 Sep 2022 15:58:58 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oWk9O-00042y-3o; Fri, 09 Sep 2022 15:58:56 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 53BD95C00B0;
 Fri,  9 Sep 2022 15:58:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 09 Sep 2022 15:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1662753533; x=
 1662839933; bh=CetYLwyHuTR+HyxW3RyT/mNZWfVHdHGQvAN92uGX/0Q=; b=V
 eC1Sa5206nEGy5TYGOfH6gCZGDZE5+WcEOLumx0sM6TaPxnPp6bESn8fFelmN0mh
 t64j/3FRYlBplc02D59NqS7h4fto7Xca5p8bXK4vLWEZel4yYjlsCpcTpHwAP1zi
 4jWW9cKspLUIc2EZcVGBTOlsE/KtdjZWlOqt66tuF6QWVXGkcewfwLxaBiN1HI9r
 srN4W5tqcbSmNpuix/NIPoxRv2ngWLl1BiwGsZ42PASOK+xKeds6Gh3ZMxHm01sG
 0RqDKjYk6zQhsfgME/Uo8XqcAq4VHNMv1W50QQP80+B3LKEqcQk5Dxwtx8k5V4ZQ
 Ut0Pwf3Ax6EETOjAFUTrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662753533; x=
 1662839933; bh=CetYLwyHuTR+HyxW3RyT/mNZWfVHdHGQvAN92uGX/0Q=; b=B
 jLXdli2pqVxyK5bs/tq56KnONL8TAk+mrbN3by87HL/LwUQgewCw7uIGFKvsZO5B
 0NaHRLjtFhcA9B5FyXLakikykuxKX1FN3MuNzegsH/9pqzIkwdB324BBG9HyF35X
 6hSF83Mke8ecbNZ4iqYjmQEhZFaaT6skMBzHQuu6iUk2zEQVBQ0EHVAItKM9Qmiu
 ewWd/6FsUEVhCPlLY5k1uekc/ufYXM8Ka6fV+zMRvQuDUd9YC1ROYiV0Ummb7US+
 wrAOBpa9ftEOKqjOt72273D1JgyBnBMj4Oqf8F24XH+coCCfC53qvQlARx3LsshZ
 dAcHn/RQ+vETqE1+ZrYDA==
X-ME-Sender: <xms:_JobY1XwcjTA7KBrYuDuevbpPK016vQZBQlkfPLZq0suhglVD0xy6w>
 <xme:_JobY1nOLiVoOY-ReH9YPICZojQe0yaLTEnTar9j1Vo9lgxQs3SopEEynUsTd3um2
 UTIAWnLYo_0VCrpUzI>
X-ME-Received: <xmr:_JobYxYqvkH8gRLtdJBaX3b7OR12Ky_CZektz7qkeJ-Ahx1zZutiFSEwJBz3AcQzFqbCzYXdZHyI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:_JobY4Ub8_yCpwzB9WG8EmSzNNuN-LXzp57a__CRNiAUVRVcfWAO8A>
 <xmx:_JobY_n5Gw_Morn-uVPSOZsDBwixqeUM4SL0RTgIBgY7WSwbiHoGlw>
 <xmx:_JobY1fB8XFOqnSoEd6q6MNArOjEe9C6oJftgvYbY9TF7SHmM7Eugg>
 <xmx:_ZobY9WgPKHWNjlD_FYRhevBXd1zaec5_9wBaa5NSUVosSjqMPhADw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 15:58:51 -0400 (EDT)
Date: Fri, 9 Sep 2022 12:58:50 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Titus Rwantare <titusr@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz,
 iwona.winiarska@intel.com, tmaimon77@gmail.com,
 quic_jaehyoo@quicinc.com, Hao Wu <wuhaotsh@google.com>,
 Patrick Venture <venture@google.com>
Subject: Re: [RFC PATCH 1/3] hw/peci: add initial support for PECI
Message-ID: <Yxua+pZUn5lSSekN@pdel-fedora-MJ0HJWH9>
References: <20220906220552.1243998-1-titusr@google.com>
 <20220906220552.1243998-2-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906220552.1243998-2-titusr@google.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On Tue, Sep 06, 2022 at 10:05:50PM +0000, Titus Rwantare wrote:
> PECI - Platform Environment Control Interface
> 
> This commit adds support for reading basic sensor values from a client
> on the PECI bus.
> BMCs can use the PECI wire to get thermal information out of an Intel
> cpu. Additionally, on hardware, various MSRs are exposed over the
> PECI bus. Part of PCI config space is exposed due to Intel posting
> various platform configuration in PCI config space.
> 
> Commands implemented:
> - Ping
> - GetDIB
> - GetTemp
> - GetPkgConfig (partial)
> 
> Commands not implemented:
> - RdIAMSR
> - RdPCIConfig
> - RdPCIConfigLocal
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  MAINTAINERS            |   7 ++
>  hw/Kconfig             |   1 +
>  hw/meson.build         |   1 +
>  hw/peci/Kconfig        |   2 +
>  hw/peci/meson.build    |   1 +
>  hw/peci/peci-client.c  | 230 +++++++++++++++++++++++++++++++++++++++++
>  hw/peci/peci-core.c    | 182 ++++++++++++++++++++++++++++++++
>  hw/peci/trace-events   |   5 +
>  hw/peci/trace.h        |   1 +
>  include/hw/peci/peci.h | 194 ++++++++++++++++++++++++++++++++++
>  meson.build            |   1 +
>  11 files changed, 625 insertions(+)
>  create mode 100644 hw/peci/Kconfig
>  create mode 100644 hw/peci/meson.build
>  create mode 100644 hw/peci/peci-client.c
>  create mode 100644 hw/peci/peci-core.c
>  create mode 100644 hw/peci/trace-events
>  create mode 100644 hw/peci/trace.h
>  create mode 100644 include/hw/peci/peci.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ce4227ff6..14ab29679d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3212,6 +3212,13 @@ F: tests/qtest/adm1272-test.c
>  F: tests/qtest/max34451-test.c
>  F: tests/qtest/isl_pmbus_vr-test.c
>  
> +PECI
> +M: Titus Rwantare <titusr@google.com>
> +S: Maintained
> +F: hw/peci/peci-core.c
> +F: hw/peci/peci-client.c
> +F: include/hw/peci/peci.h
> +
>  Firmware schema specifications
>  M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>  R: Daniel P. Berrange <berrange@redhat.com>
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 38233bbb0f..300ab48127 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -24,6 +24,7 @@ source net/Kconfig
>  source nubus/Kconfig
>  source nvme/Kconfig
>  source nvram/Kconfig
> +source peci/Kconfig
>  source pci-bridge/Kconfig
>  source pci-host/Kconfig
>  source pcmcia/Kconfig
> diff --git a/hw/meson.build b/hw/meson.build
> index c7ac7d3d75..340cc88a52 100644
> --- a/hw/meson.build
> +++ b/hw/meson.build
> @@ -28,6 +28,7 @@ subdir('pci')
>  subdir('pci-bridge')
>  subdir('pci-host')
>  subdir('pcmcia')
> +subdir('peci')
>  subdir('rdma')
>  subdir('rtc')
>  subdir('scsi')
> diff --git a/hw/peci/Kconfig b/hw/peci/Kconfig
> new file mode 100644
> index 0000000000..fe4f665d21
> --- /dev/null
> +++ b/hw/peci/Kconfig
> @@ -0,0 +1,2 @@
> +config PECI
> +    bool
> diff --git a/hw/peci/meson.build b/hw/peci/meson.build
> new file mode 100644
> index 0000000000..01cfa95abe
> --- /dev/null
> +++ b/hw/peci/meson.build
> @@ -0,0 +1 @@
> +softmmu_ss.add(when: 'CONFIG_PECI', if_true: files('peci-core.c', 'peci-client.c'))
> diff --git a/hw/peci/peci-client.c b/hw/peci/peci-client.c
> new file mode 100644
> index 0000000000..2aa797b5f6
> --- /dev/null
> +++ b/hw/peci/peci-client.c
> @@ -0,0 +1,230 @@
> +/*
> + * PECI Client device
> + * Copyright 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later

Not sure, but I think the SPDX license identifier is supposed to be in
the first line? Maybe not though. I would have expected:

/* SPDX-License-Identifier: GPL-2.0-or-later */
/*
 * PECI Client device
 *
 * Copyright 2021 Google LLC
 */

> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/peci/peci.h"
> +#include "hw/qdev-core.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +#include "qom/object.h"
> +
> +/*
> + * A PECI client represents an Intel socket and the peripherals attached to it
> + * that are accessible over the PECI bus.
> + */
> +
> +#define PECI_CLIENT_DEFAULT_TEMP 30
> +
> +static void peci_client_update_temps(PECIClientDevice *client)
> +{
> +    uint8_t temp_cpu = 0;
> +    for (size_t i = 0; i < client->cpu_cores; i++) {
> +        if (temp_cpu < client->core_temp[i]) {
> +            temp_cpu = client->core_temp[i];
> +        }
> +    }
> +    client->core_temp_max = -1 * (client->tjmax - temp_cpu);
> +
> +    uint8_t temp_dimm = 0;
> +    for (size_t i = 0; i < client->dimms; i++) {
> +        if (temp_dimm < client->dimm_temp[i]) {
> +            temp_dimm = client->dimm_temp[i];
> +        }
> +    }
> +    client->dimm_temp_max = temp_dimm;
> +}
> +
> +PECIClientDevice *peci_get_client(PECIBus *bus, uint8_t addr)
> +{
> +    PECIClientDevice *client;
> +    BusChild *var;
> +
> +    QTAILQ_FOREACH(var, &bus->qbus.children, sibling) {
> +        DeviceState *dev = var->child;
> +        client = PECI_CLIENT(dev);
> +
> +        if (client->address == addr) {
> +            return client;
> +        }
> +    }
> +    return 0;
> +}
> +
> +
> +PECIClientDevice *peci_add_client(PECIBus *bus,
> +                                  uint8_t address,
> +                                  PECIClientProperties *props)
> +{
> +    DeviceState *dev = qdev_new("peci-client");
> +    PECIClientDevice *client;
> +
> +    /* Only 8 addresses supported as of rev 4.1, 0x30 to 0x37 */
> +    if (address < PECI_BASE_ADDR || address > PECI_BASE_ADDR + 7) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to add client at 0x%02x",
> +                      __func__, address);
> +        return 0;
> +    }
> +
> +    client = PECI_CLIENT(dev);
> +    client->address = address;
> +
> +    /* these fields are optional, get set to max if unset or invalid */
> +    if (!props->cpu_cores || props->cpu_cores > PECI_NUM_CPUS_MAX) {
> +        props->cpu_cores = PECI_NUM_CPUS_MAX;
> +    }
> +    if (!props->dimms || props->dimms > PECI_NUM_DIMMS_MAX) {
> +        props->dimms = PECI_NUM_DIMMS_MAX;
> +    }
> +    if (!props->cpu_family) {
> +        props->cpu_family = FAM6_ICELAKE_X;
> +    }
> +    if (!props->dimms_per_channel ||
> +        props->dimms_per_channel > PECI_DIMMS_PER_CHANNEL_MAX) {
> +        props->dimms_per_channel = 2;
> +    }
> +
> +    client->cpu_id = props->cpu_family;
> +    client->cpu_cores = props->cpu_cores;
> +    client->dimms = props->dimms;
> +    client->dimms_per_channel = props->dimms_per_channel;
> +
> +    /* TODO: find real revisions and TJ max for supported families */
> +    client->tjmax = 90;
> +    client->tcontrol = -5;
> +
> +    switch (props->cpu_family) {
> +    case FAM6_HASWELL_X:
> +        client->revision = 0x31;
> +        break;
> +
> +    case FAM6_BROADWELL_X:
> +        client->revision = 0x32;
> +        break;
> +
> +    case FAM6_SKYLAKE_X:
> +    case FAM6_SKYLAKE_XD:
> +        client->revision = 0x36;
> +        break;
> +
> +    case FAM6_ICELAKE_X:
> +    case FAM6_SAPPHIRE_RAPIDS_X:
> +        client->revision = 0x40;
> +        client->ucode = 0x8c0004a0;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unsupported cpu: 0x%x\n",
> +                      __func__, props->cpu_family);
> +        client->revision = 0x31;
> +        break;
> +    }
> +
> +    qdev_realize_and_unref(&client->qdev, &bus->qbus, &error_abort);
> +    bus->num_clients += 1;
> +    return client;
> +}
> +
> +static void peci_client_get(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    /* use millidegrees convention */
> +    uint32_t value = *(uint8_t *)opaque * 1000;
> +    visit_type_uint32(v, name, &value, errp);
> +}
> +
> +static void peci_client_set(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    PECIClientDevice *client = PECI_CLIENT(obj);
> +    uint8_t *internal = opaque;
> +    uint32_t value;
> +
> +    if (!visit_type_uint32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    g_assert(value <= 255000);
> +
> +    *internal = value / 1000;
> +    peci_client_update_temps(client);
> +}
> +
> +static void peci_client_reset(Object *obj, ResetType type)
> +{
> +    PECIClientDevice *client = PECI_CLIENT(obj);
> +    client->core_temp_max = 0;
> +    client->dimm_temp_max = 0;
> +}
> +
> +static const VMStateDescription vmstate_peci_client = {
> +    .name = TYPE_PECI_CLIENT,
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(address, PECIClientDevice),
> +        VMSTATE_UINT8(device_info, PECIClientDevice),
> +        VMSTATE_UINT8(revision, PECIClientDevice),
> +        VMSTATE_UINT32(cpu_id, PECIClientDevice),
> +        VMSTATE_UINT8(cpu_cores, PECIClientDevice),
> +        VMSTATE_UINT8(tjmax, PECIClientDevice),
> +        VMSTATE_INT8(tcontrol, PECIClientDevice),
> +        VMSTATE_UINT8_ARRAY(core_temp, PECIClientDevice, PECI_NUM_CPUS_MAX),
> +        VMSTATE_UINT8(dimms, PECIClientDevice),
> +        VMSTATE_UINT8(dimms_per_channel, PECIClientDevice),
> +        VMSTATE_UINT8_ARRAY(dimm_temp, PECIClientDevice , PECI_NUM_DIMMS_MAX),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static void peci_client_realize(DeviceState *dev, Error **errp)
> +{
> +    PECIClientDevice *client = PECI_CLIENT(dev);
> +    for (size_t i = 0; i < client->cpu_cores; i++) {
> +        client->core_temp[i] = PECI_CLIENT_DEFAULT_TEMP;
> +        object_property_add(OBJECT(client), "cpu_temp[*]", "uint8",
> +                            peci_client_get,
> +                            peci_client_set, NULL, &client->core_temp[i]);
> +    }
> +
> +    for (size_t i = 0; i < client->dimms; i++) {
> +        client->dimm_temp[i] = PECI_CLIENT_DEFAULT_TEMP;
> +        object_property_add(OBJECT(client), "dimm_temp[*]", "uint8",
> +                            peci_client_get,
> +                            peci_client_set, NULL, &client->dimm_temp[i]);
> +    }
> +}
> +
> +static void peci_client_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    dc->desc = "PECI Client Device";
> +    dc->bus_type = TYPE_PECI_BUS;
> +    dc->realize = peci_client_realize;
> +    dc->vmsd = &vmstate_peci_client;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    rc->phases.enter = peci_client_reset;
> +}
> +
> +static const TypeInfo peci_client_info = {
> +    .name = TYPE_PECI_CLIENT,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(PECIClientDevice),
> +    .class_init = peci_client_class_init,
> +};
> +
> +static void peci_client_register_types(void)
> +{
> +    type_register_static(&peci_client_info);
> +}
> +
> +type_init(peci_client_register_types)
> diff --git a/hw/peci/peci-core.c b/hw/peci/peci-core.c
> new file mode 100644
> index 0000000000..8210bfa198
> --- /dev/null
> +++ b/hw/peci/peci-core.c
> @@ -0,0 +1,182 @@
> +/*
> + * PECI - Platform Environment Control Interface
> + * Copyright 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +/*
> + * This PECI implementation aims to simulate a host with peci as viewed by a
> + * BMC. This is developed with OpenBMC firmware running in QEMU.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/peci/peci.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +
> +#define PECI_FCS_OK         0
> +#define PECI_FCS_ERR        1
> +
> +static void peci_rd_pkg_cfg(PECIClientDevice *client, PECICmd *pcmd)
> +{
> +    PECIPkgCfg *resp = (PECIPkgCfg *)pcmd->tx;
> +    uint8_t index = pcmd->rx[1];
> +    uint16_t param = pcmd->rx[3] | pcmd->rx[2];
> +
> +    switch (index) {
> +    case PECI_MBX_CPU_ID: /* CPU Family ID*/
> +        trace_peci_rd_pkg_cfg("CPU ID");
> +        switch (param) {
> +        case PECI_PKG_ID_CPU_ID:
> +            resp->data = client->cpu_id;
> +            break;
> +
> +        case PECI_PKG_ID_MICROCODE_REV:
> +            resp->data = client->ucode;
> +            break;
> +
> +        default:
> +            qemu_log_mask(LOG_UNIMP, "%s: CPU ID param %u\n", __func__, param);
> +            break;
> +        }
> +        break;
> +
> +    case PECI_MBX_DTS_MARGIN:
> +        trace_peci_rd_pkg_cfg("DTS MARGIN");
> +    /*
> +     * Processors return a value of DTS reading in 10.6 format
> +     * (10 bits signed decimal, 6 bits fractional).
> +     */
> +        resp->data = (-1 * client->core_temp_max) << 6;
> +        break;
> +
> +    case PECI_MBX_DDR_DIMM_TEMP:
> +        trace_peci_rd_pkg_cfg("DDR DIMM TEMP");
> +        if (param > PECI_NUM_CHANNELS_MAX) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: DDR_DIMM_TEMP unsupported channel index %d",
> +                          __func__, param);
> +            param = PECI_NUM_CHANNELS_MAX;
> +        }
> +        uint8_t channel_index = param * client->dimms_per_channel;
> +        memcpy(&resp->data,
> +               &client->dimm_temp[channel_index],
> +               sizeof(client->dimm_temp[0]) * client->dimms_per_channel);
> +        break;
> +
> +    case PECI_MBX_TEMP_TARGET:
> +        trace_peci_rd_pkg_cfg("TEMP TARGET");
> +        PECITempTarget target = {
> +            .tcontrol = client->tcontrol,
> +            .tjmax = client->tjmax,
> +        };
> +        memcpy(&resp->data, &target, sizeof(target));
> +        break;
> +
> +    case PECI_MBX_PPIN:
> +        trace_peci_rd_pkg_cfg("PPIN");
> +        resp->data = 0xdeadbeef;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented PkgCfg Index: %u\n",
> +                      __func__, index);
> +        resp->cc = PECI_DEV_CC_INVALID_REQ;
> +        return;
> +    }
> +
> +    resp->cc = PECI_DEV_CC_SUCCESS;
> +}
> +
> +int peci_handle_cmd(PECIBus *bus, PECICmd *pcmd)
> +{
> +    PECIClientDevice *client = peci_get_client(bus, pcmd->addr);
> +
> +    if (!client) { /* ignore commands if clients aren't found */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: no peci client at address: 0x%02x\n",
> +                      __func__, pcmd->addr);
> +        return PECI_FCS_ERR;
> +    }
> +
> +    /* clear output buffer before handling command */
> +    for (size_t i = 0; i < pcmd->rd_length; i++) {
> +        pcmd->tx[i] = 0;
> +    }
> +
> +    switch (pcmd->cmd) {
> +    case PECI_CMD_PING:
> +        trace_peci_handle_cmd("PING!", pcmd->addr);
> +        break;
> +
> +    case PECI_CMD_GET_DIB: /* Device Info Byte */
> +        trace_peci_handle_cmd("GetDIB", pcmd->addr);
> +        PECIDIB dib = {
> +            .device_info = client->device_info,
> +            .revision = client->revision,
> +        };
> +        memcpy(pcmd->tx, &dib, sizeof(PECIDIB));
> +        break;
> +
> +    case PECI_CMD_GET_TEMP: /* maximum die temp in socket */
> +        trace_peci_handle_cmd("GetTemp", pcmd->addr);
> +        /*
> +         * The data is returned as a negative value representing the number of
> +         * degrees centigrade below the maximum processor junction temperature
> +         */
> +        memcpy(pcmd->tx, &client->core_temp_max, sizeof(client->core_temp_max));
> +        break;
> +
> +    case PECI_CMD_RD_PKG_CFG:
> +        trace_peci_handle_cmd("RdPkgConfig", pcmd->addr);
> +        peci_rd_pkg_cfg(client, pcmd);
> +        break;
> +
> +    case PECI_CMD_RD_IA_MSR:
> +        trace_peci_handle_cmd("RdIAMSR", pcmd->addr);
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented RD_IA_MSR\n", __func__);
> +        break;
> +
> +    case PECI_CMD_RD_PCI_CFG:
> +        trace_peci_handle_cmd("RdPCIConfig", pcmd->addr);
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented PCI_CFG\n", __func__);
> +        break;
> +
> +    case PECI_CMD_RD_PCI_CFG_LOCAL:
> +        trace_peci_handle_cmd("RdPCIConfigLocal", pcmd->addr);
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented PCI_CFG_LOCAL\n", __func__);
> +        break;
> +
> +    case PECI_CMD_RD_END_PT_CFG:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented CMD_RD_END_PT_CFG\n",
> +                      __func__);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: unknown cmd: %x\n",
> +                      __func__, pcmd->cmd);
> +        break;
> +    }
> +
> +    return PECI_FCS_OK;
> +}
> +
> +PECIBus *peci_bus_create(DeviceState *parent)
> +{
> +    return PECI_BUS(qbus_new(TYPE_PECI_BUS, parent, "peci-bus"));
> +};
> +
> +static const TypeInfo peci_types[] = {
> +    {
> +        .name = TYPE_PECI_BUS,
> +        .parent = TYPE_BUS,
> +        .instance_size = sizeof(PECIBus),
> +    },
> +};
> +
> +DEFINE_TYPES(peci_types);
> diff --git a/hw/peci/trace-events b/hw/peci/trace-events
> new file mode 100644
> index 0000000000..f90c998dd9
> --- /dev/null
> +++ b/hw/peci/trace-events
> @@ -0,0 +1,5 @@
> +# See docs/devel/tracing.rst for syntax documentation.
> +
> +# peci-core.c
> +peci_handle_cmd(const char* s, uint8_t addr) "%s @ 0x%02" PRIx8
> +peci_rd_pkg_cfg(const char* s) "%s"
> diff --git a/hw/peci/trace.h b/hw/peci/trace.h
> new file mode 100644
> index 0000000000..4283e3bfc5
> --- /dev/null
> +++ b/hw/peci/trace.h
> @@ -0,0 +1 @@
> +#include "trace/trace-hw_peci.h"
> diff --git a/include/hw/peci/peci.h b/include/hw/peci/peci.h
> new file mode 100644
> index 0000000000..1a0abe65cd
> --- /dev/null
> +++ b/include/hw/peci/peci.h
> @@ -0,0 +1,194 @@
> +/*
> + * PECI - Platform Environment Control Interface
> + *
> + * Copyright 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef PECI_H
> +#define PECI_H
> +
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +
> +#define PECI_CMD_PING               0x0
> +#define PECI_CMD_GET_DIB            0xF7
> +#define PECI_CMD_GET_TEMP           0x01
> +#define PECI_CMD_RD_PKG_CFG         0xA1
> +#define PECI_CMD_WR_PKG_CFG         0xA5
> +#define   PECI_MBX_CPU_ID            0  /* Package Identifier Read */
> +#define     PECI_PKG_ID_CPU_ID              0x0000  /* CPUID Info */
> +#define     PECI_PKG_ID_PLATFORM_ID         0x0001  /* Platform ID */
> +#define     PECI_PKG_ID_UNCORE_ID           0x0002  /* Uncore Device ID */
> +#define     PECI_PKG_ID_MAX_THREAD_ID       0x0003  /* Max Thread ID */
> +#define     PECI_PKG_ID_MICROCODE_REV       0x0004  /* CPU Microcode Revision */
> +#define     PECI_PKG_ID_MACHINE_CHECK_STATUS 0x0005  /* Machine Check Status */
> +#define   PECI_MBX_VR_DEBUG          1  /* VR Debug */
> +#define   PECI_MBX_PKG_TEMP_READ     2  /* Package Temperature Read */
> +#define   PECI_MBX_ENERGY_COUNTER    3  /* Energy counter */
> +#define   PECI_MBX_ENERGY_STATUS     4  /* DDR Energy Status */
> +#define   PECI_MBX_WAKE_MODE_BIT     5  /* "Wake on PECI" Mode bit */
> +#define   PECI_MBX_EPI               6  /* Efficient Performance Indication */
> +#define   PECI_MBX_PKG_RAPL_PERF     8  /* Pkg RAPL Performance Status Read */
> +#define   PECI_MBX_PER_CORE_DTS_TEMP 9  /* Per Core DTS Temperature Read */
> +#define   PECI_MBX_DTS_MARGIN        10 /* DTS thermal margin */
> +#define   PECI_MBX_SKT_PWR_THRTL_DUR 11 /* Socket Power Throttled Duration */
> +#define   PECI_MBX_CFG_TDP_CONTROL   12 /* TDP Config Control */
> +#define   PECI_MBX_CFG_TDP_LEVELS    13 /* TDP Config Levels */
> +#define   PECI_MBX_DDR_DIMM_TEMP     14 /* DDR DIMM Temperature */
> +#define   PECI_MBX_CFG_ICCMAX        15 /* Configurable ICCMAX */
> +#define   PECI_MBX_TEMP_TARGET       16 /* Temperature Target Read */
> +#define   PECI_MBX_CURR_CFG_LIMIT    17 /* Current Config Limit */
> +#define   PECI_MBX_PPIN              19 /* Processor Inventory Number */
> +#define   PECI_MBX_DIMM_TEMP_READ    20 /* Package Thermal Status Read */
> +#define   PECI_MBX_DRAM_IMC_TMP_READ 22 /* DRAM IMC Temperature Read */
> +#define   PECI_MBX_DDR_CH_THERM_STAT 23 /* DDR Channel Thermal Status */
> +#define   PECI_MBX_PKG_POWER_LIMIT1  26 /* Package Power Limit1 */
> +#define   PECI_MBX_PKG_POWER_LIMIT2  27 /* Package Power Limit2 */
> +#define   PECI_MBX_TDP               28 /* Thermal design power minimum */
> +#define   PECI_MBX_TDP_HIGH          29 /* Thermal design power maximum */
> +#define   PECI_MBX_TDP_UNITS         30 /* Units for power/energy registers */
> +#define   PECI_MBX_RUN_TIME          31 /* Accumulated Run Time */
> +#define   PECI_MBX_CONSTRAINED_TIME  32 /* Thermally Constrained Time Read */
> +#define   PECI_MBX_TURBO_RATIO       33 /* Turbo Activation Ratio */
> +#define   PECI_MBX_DDR_RAPL_PL1      34 /* DDR RAPL PL1 */
> +#define   PECI_MBX_DDR_PWR_INFO_HIGH 35 /* DRAM Power Info Read (high) */
> +#define   PECI_MBX_DDR_PWR_INFO_LOW  36 /* DRAM Power Info Read (low) */
> +#define   PECI_MBX_DDR_RAPL_PL2      37 /* DDR RAPL PL2 */
> +#define   PECI_MBX_DDR_RAPL_STATUS   38 /* DDR RAPL Performance Status */
> +#define   PECI_MBX_DDR_HOT_ABSOLUTE  43 /* DDR Hottest Dimm Absolute Temp */
> +#define   PECI_MBX_DDR_HOT_RELATIVE  44 /* DDR Hottest Dimm Relative Temp */
> +#define   PECI_MBX_DDR_THROTTLE_TIME 45 /* DDR Throttle Time */
> +#define   PECI_MBX_DDR_THERM_STATUS  46 /* DDR Thermal Status */
> +#define   PECI_MBX_TIME_AVG_TEMP     47 /* Package time-averaged temperature */
> +#define   PECI_MBX_TURBO_RATIO_LIMIT 49 /* Turbo Ratio Limit Read */
> +#define   PECI_MBX_HWP_AUTO_OOB      53 /* HWP Autonomous Out-of-band */
> +#define   PECI_MBX_DDR_WARM_BUDGET   55 /* DDR Warm Power Budget */
> +#define   PECI_MBX_DDR_HOT_BUDGET    56 /* DDR Hot Power Budget */
> +#define   PECI_MBX_PKG_PSYS_PWR_LIM3 57 /* Package/Psys Power Limit3 */
> +#define   PECI_MBX_PKG_PSYS_PWR_LIM1 58 /* Package/Psys Power Limit1 */
> +#define   PECI_MBX_PKG_PSYS_PWR_LIM2 59 /* Package/Psys Power Limit2 */
> +#define   PECI_MBX_PKG_PSYS_PWR_LIM4 60 /* Package/Psys Power Limit4 */
> +#define   PECI_MBX_PERF_LIMIT_REASON 65 /* Performance Limit Reasons */
> +#define PECI_CMD_RD_IA_MSR          0xB1
> +#define PECI_CMD_WR_IA_MSR          0xB5
> +#define PECI_CMD_RD_IA_MSREX        0xD1
> +#define PECI_CMD_RD_PCI_CFG         0x61
> +#define PECI_CMD_WR_PCI_CFG         0x65
> +#define PECI_CMD_RD_PCI_CFG_LOCAL   0xE1
> +#define PECI_CMD_WR_PCI_CFG_LOCAL   0xE5
> +#define PECI_CMD_RD_END_PT_CFG      0xC1
> +#define PECI_CMD_WR_END_PT_CFG      0xC5
> +#define PECI_CMD_CRASHDUMP_GET_FRAME            0x71
> +
> +/* Device Specific Completion Code (CC) Definition */
> +#define PECI_DEV_CC_SUCCESS                            0x40
> +#define PECI_DEV_CC_NEED_RETRY                         0x80
> +#define PECI_DEV_CC_OUT_OF_RESOURCE                    0x81
> +#define PECI_DEV_CC_UNAVAIL_RESOURCE                   0x82
> +#define PECI_DEV_CC_INVALID_REQ                        0x90
> +#define PECI_DEV_CC_MCA_ERROR                          0x91
> +#define PECI_DEV_CC_CATASTROPHIC_MCA_ERROR             0x93
> +#define PECI_DEV_CC_FATAL_MCA_DETECTED                 0x94
> +#define PECI_DEV_CC_PARITY_ERROR_ON_GPSB_OR_PMSB       0x98
> +#define PECI_DEV_CC_PARITY_ERROR_ON_GPSB_OR_PMSB_IERR  0x9B
> +#define PECI_DEV_CC_PARITY_ERROR_ON_GPSB_OR_PMSB_MCA   0x9C
> +
> +
> +typedef struct PECIDIB {  /* DIB - Device Info Byte(s) */
> +    uint8_t device_info; /* bit 2 - num of domains */
> +    uint8_t revision;
> +} PECIDIB;
> +
> +typedef struct  __attribute__ ((__packed__)) {
> +    uint8_t cc; /* completion code */
> +    uint32_t data;
> +} PECIPkgCfg;
> +
> +typedef struct PECITempTarget {
> +    uint8_t reserved;
> +    int8_t tcontrol;
> +    uint8_t tjmax;
> +} PECITempTarget;
> +
> +#define PECI_BASE_ADDR              0x30
> +#define PECI_BUFFER_SIZE            0x100
> +#define PECI_NUM_CPUS_MAX           56
> +#define PECI_DIMMS_PER_CHANNEL_MAX  3
> +#define PECI_NUM_CHANNELS_MAX       8
> +#define PECI_NUM_DIMMS_MAX  (PECI_NUM_CHANNELS_MAX * PECI_DIMMS_PER_CHANNEL_MAX)
> +
> +typedef struct PECIClientDevice {
> +    DeviceState qdev;
> +    uint8_t address;
> +    uint8_t device_info;
> +    uint8_t revision;
> +
> +    /* CPU */
> +    uint32_t cpu_id;
> +    uint8_t cpu_cores;
> +    uint32_t ucode;
> +    uint8_t tjmax;
> +    int8_t tcontrol;
> +    int8_t core_temp_max; /* absolute temp - tjmax */
> +    uint8_t core_temp[PECI_NUM_CPUS_MAX];
> +
> +    /* DIMMS */
> +    uint8_t dimms;
> +    uint8_t dimms_per_channel;
> +    uint8_t dimm_temp_max;
> +    uint8_t dimm_temp[PECI_NUM_DIMMS_MAX];
> +
> +} PECIClientDevice;
> +
> +#define TYPE_PECI_CLIENT "peci-client"
> +OBJECT_DECLARE_SIMPLE_TYPE(PECIClientDevice, PECI_CLIENT)
> +
> +typedef struct PECIBus {
> +    BusState qbus;
> +    uint8_t num_clients;
> +} PECIBus;
> +
> +#define TYPE_PECI_BUS "peci-bus"
> +OBJECT_DECLARE_SIMPLE_TYPE(PECIBus, PECI_BUS)
> +
> +/* Creates a basic qemu bus onto which PECI clients will be attached */
> +PECIBus *peci_bus_create(DeviceState *parent);
> +
> +enum {
> +    FAM6_HASWELL_X = 0x306F0,
> +    FAM6_BROADWELL_X = 0x406F0,
> +    FAM6_SKYLAKE_X = 0x50650,
> +    FAM6_SKYLAKE_XD = 0x50660,
> +    FAM6_ICELAKE_X = 0x606A0,
> +    FAM6_SAPPHIRE_RAPIDS_X = 0x806F3,
> +};

I'm curious if we really need the CPU family here, or if we could just
base everything off the PECI version.

The PECI specification doesn't mention the CPU family, does it? Or maybe
it does.

> +
> +typedef struct PECIClientProperties {
> +    uint32_t cpu_family;
> +    uint8_t cpu_cores;
> +    uint8_t dimms;
> +    uint8_t dimms_per_channel;
> +} PECIClientProperties;
> +
> +/* Creates a PECI client with the specified cpu and dimm count */
> +PECIClientDevice *peci_add_client(PECIBus *bus,
> +                                  uint8_t address,
> +                                  PECIClientProperties *props);
> +PECIClientDevice *peci_get_client(PECIBus *bus, uint8_t addr);
> +
> +typedef struct PECICmd {
> +    uint8_t addr;
> +    uint8_t cmd;
> +
> +    size_t wr_length;
> +    uint8_t rx[PECI_BUFFER_SIZE];
> +
> +    size_t rd_length;
> +    uint8_t tx[PECI_BUFFER_SIZE];
> +} PECICmd;
> +
> +int peci_handle_cmd(PECIBus *bus, PECICmd *pcmd);
> +
> +#endif
> diff --git a/meson.build b/meson.build
> index 20fddbd707..55594702c3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2965,6 +2965,7 @@ if have_system
>      'hw/nvram',
>      'hw/pci',
>      'hw/pci-host',
> +    'hw/peci',
>      'hw/ppc',
>      'hw/rdma',
>      'hw/rdma/vmw',
> -- 
> 2.37.2.789.g6183377224-goog
> 

