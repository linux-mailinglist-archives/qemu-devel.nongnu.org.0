Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2726A53325C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:21:55 +0200 (CEST)
Received: from localhost ([::1]:37668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntb2Q-0002nh-5r
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntarI-0007D8-IW
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:10:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntarE-0002Wp-Ib
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:10:22 -0400
Received: by mail-ej1-x629.google.com with SMTP id gh17so24524523ejc.6
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 13:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QRmC23NW00XLdsTPuPDKi6TxjTM7VoA4NR3QjZ2jx4s=;
 b=GdBrjuvotRF5Hc3aTxvGZ8UnRKtmzO1QLJUfoq4DKRLbdT1MC7ALP5dsBFLWNJ3cIf
 sFEOL9ID9kzPdPlL2H0YQ5gmmQeb1MDxv0n1prVexHHw3gfI02iSqOfQG+mJlzu4xo9/
 +xvql6CoNWkKkkfxu3F+W1dDWA5nBc5tLansPfgybdDvSDmxchDb6hamALcfIpGHqitt
 jgoTW6KJ8Ric9MTItJnia1WK2bpMNvw/5mGQ2V7JGj26h/x5F02MY9RO4xIqI/wEPaMP
 ZmwNYdonFRz8xjpYz+IPXYGA02Rtt40MFkzWR474e5znLaCuvzDa7cR5evEldjojdICH
 CWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QRmC23NW00XLdsTPuPDKi6TxjTM7VoA4NR3QjZ2jx4s=;
 b=bcGOC4pMFHspq4dPwp/0LSYl5kfzIMMUzp1UDRPUHydXr37erFnbFi5+fhQ1T3yfXJ
 3Wblicu1dRfKhgbiKsRukZVCZm+LR8FUn+1pSc43vJy/F9aQ//cKAB7+RLbCLMjzLepl
 6RZAH5f15LWUT+Z5Ebjx1BSyqDNxAbDuy7DZko5EtPcXE2vN8qx3UgHVx8yfa6moHPZu
 olFlAV34tC7DFOjiIfCPrdq6M3qulOLDTwLIKldsPPOQcZWF2FzRlYP1XAJ00WrbHSFb
 +/bCsmBvgNKRX1wyVxJcF7MJByhXRQDazsNto6a5onbIHBjIkoa+bLjLln736JnfGheM
 A8/w==
X-Gm-Message-State: AOAM530EDRRaziHxIfnc5cCpRNanOGEKzCGZFAG7TXFH4HkKDHSywhZh
 Vm7GdgH9l3oJYSM/ml6gqBU5NLDYOKB+EUBnjNvdKoQJaig=
X-Google-Smtp-Source: ABdhPJw9vIl4SFxGcU+h7rlamXlLsiBYYoXxy24RfWlt5fOmY+KgbAuLStX2HQOGghU/g/FxoyOEqpjtcjwVejYUPZQ=
X-Received: by 2002:a17:907:9709:b0:6fd:c0e1:c86b with SMTP id
 jg9-20020a170907970900b006fdc0e1c86bmr25498536ejc.600.1653423019332; Tue, 24
 May 2022 13:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-14-damien.hedde@greensocs.com>
In-Reply-To: <20220223090706.4888-14-damien.hedde@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 04:10:06 +0800
Message-ID: <CALw707o4+ZiEh-bOTEnsRZJznLXLPKm=DS4-ME_mo-10YeBT6Q@mail.gmail.com>
Subject: Re: [PATCH v4 13/14] hw/mem/system-memory: add a memory sysbus device
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bb2bba05dfc78b64"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--000000000000bb2bba05dfc78b64
Content-Type: text/plain; charset="UTF-8"

Tested-by: Jim Shu <jim.shu@sifive.com>

On Wed, Feb 23, 2022 at 5:14 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> This device can be used to create a memory wrapped into a
> sysbus device.
> This device has one property 'readonly' which allows
> to choose between a ram or a rom.
>
> The purpose for this device is to be used with qapi command
> device_add.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  include/hw/mem/sysbus-memory.h | 28 ++++++++++++
>  hw/mem/sysbus-memory.c         | 80 ++++++++++++++++++++++++++++++++++
>  hw/mem/meson.build             |  2 +
>  3 files changed, 110 insertions(+)
>  create mode 100644 include/hw/mem/sysbus-memory.h
>  create mode 100644 hw/mem/sysbus-memory.c
>
> diff --git a/include/hw/mem/sysbus-memory.h
> b/include/hw/mem/sysbus-memory.h
> new file mode 100644
> index 0000000000..5c596f8b4f
> --- /dev/null
> +++ b/include/hw/mem/sysbus-memory.h
> @@ -0,0 +1,28 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * SysBusDevice Memory
> + *
> + * Copyright (c) 2021 Greensocs
> + */
> +
> +#ifndef HW_SYSBUS_MEMORY_H
> +#define HW_SYSBUS_MEMORY_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_SYSBUS_MEMORY "sysbus-memory"
> +OBJECT_DECLARE_SIMPLE_TYPE(SysBusMemoryState, SYSBUS_MEMORY)
> +
> +struct SysBusMemoryState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +    uint64_t size;
> +    bool readonly;
> +
> +    /* <public> */
> +    MemoryRegion mem;
> +};
> +
> +#endif /* HW_SYSBUS_MEMORY_H */
> diff --git a/hw/mem/sysbus-memory.c b/hw/mem/sysbus-memory.c
> new file mode 100644
> index 0000000000..f1ad7ba7ec
> --- /dev/null
> +++ b/hw/mem/sysbus-memory.c
> @@ -0,0 +1,80 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * SysBusDevice Memory
> + *
> + * Copyright (c) 2021 Greensocs
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/mem/sysbus-memory.h"
> +#include "hw/qdev-properties.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +
> +static Property sysbus_memory_properties[] = {
> +    DEFINE_PROP_UINT64("size", SysBusMemoryState, size, 0),
> +    DEFINE_PROP_BOOL("readonly", SysBusMemoryState, readonly, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sysbus_memory_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusMemoryState *s = SYSBUS_MEMORY(dev);
> +    gchar *name;
> +
> +    if (!s->size) {
> +        error_setg(errp, "'size' must be non-zero.");
> +        return;
> +    }
> +
> +    /*
> +     * We impose having an id (which is unique) because we need to
> generate
> +     * a unique name for the memory region.
> +     * memory_region_init_ram/rom() will abort() (in qemu_ram_set_idstr()
> +     * function if 2 system-memory devices are created with the same name
> +     * for the memory region).
> +     */
> +    if (!dev->id) {
> +        error_setg(errp, "system-memory device must have an id.");
> +        return;
> +    }
> +    name = g_strdup_printf("%s.region", dev->id);
> +
> +    if (s->readonly) {
> +        memory_region_init_rom(&s->mem, OBJECT(dev), name, s->size, errp);
> +    } else {
> +        memory_region_init_ram(&s->mem, OBJECT(dev), name, s->size, errp);
> +    }
> +
> +    g_free(name);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mem);
> +}
> +
> +static void sysbus_memory_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->user_creatable = true;
> +    dc->realize = sysbus_memory_realize;
> +    device_class_set_props(dc, sysbus_memory_properties);
> +}
> +
> +static const TypeInfo sysbus_memory_info = {
> +    .name          = TYPE_SYSBUS_MEMORY,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SysBusMemoryState),
> +    .class_init    = sysbus_memory_class_init,
> +};
> +
> +static void sysbus_memory_register_types(void)
> +{
> +    type_register_static(&sysbus_memory_info);
> +}
> +
> +type_init(sysbus_memory_register_types)
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 82f86d117e..04c74e12f2 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -7,3 +7,5 @@ mem_ss.add(when: 'CONFIG_NVDIMM', if_true:
> files('nvdimm.c'))
>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
>
>  softmmu_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c'))
> +
> +softmmu_ss.add(files('sysbus-memory.c'))
> --
> 2.35.1
>
>
>

--000000000000bb2bba05dfc78b64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:=
jim.shu@sifive.com" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Feb 23, 2022 at 5:14 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@gr=
eensocs.com" target=3D"_blank">damien.hedde@greensocs.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">This device can be=
 used to create a memory wrapped into a<br>
sysbus device.<br>
This device has one property &#39;readonly&#39; which allows<br>
to choose between a ram or a rom.<br>
<br>
The purpose for this device is to be used with qapi command<br>
device_add.<br>
<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
---<br>
=C2=A0include/hw/mem/sysbus-memory.h | 28 ++++++++++++<br>
=C2=A0hw/mem/sysbus-memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 80 ++++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/mem/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +<br>
=C2=A03 files changed, 110 insertions(+)<br>
=C2=A0create mode 100644 include/hw/mem/sysbus-memory.h<br>
=C2=A0create mode 100644 hw/mem/sysbus-memory.c<br>
<br>
diff --git a/include/hw/mem/sysbus-memory.h b/include/hw/mem/sysbus-memory.=
h<br>
new file mode 100644<br>
index 0000000000..5c596f8b4f<br>
--- /dev/null<br>
+++ b/include/hw/mem/sysbus-memory.h<br>
@@ -0,0 +1,28 @@<br>
+/*<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ *<br>
+ * SysBusDevice Memory<br>
+ *<br>
+ * Copyright (c) 2021 Greensocs<br>
+ */<br>
+<br>
+#ifndef HW_SYSBUS_MEMORY_H<br>
+#define HW_SYSBUS_MEMORY_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+<br>
+#define TYPE_SYSBUS_MEMORY &quot;sysbus-memory&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(SysBusMemoryState, SYSBUS_MEMORY)<br>
+<br>
+struct SysBusMemoryState {<br>
+=C2=A0 =C2=A0 /* &lt;private&gt; */<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 uint64_t size;<br>
+=C2=A0 =C2=A0 bool readonly;<br>
+<br>
+=C2=A0 =C2=A0 /* &lt;public&gt; */<br>
+=C2=A0 =C2=A0 MemoryRegion mem;<br>
+};<br>
+<br>
+#endif /* HW_SYSBUS_MEMORY_H */<br>
diff --git a/hw/mem/sysbus-memory.c b/hw/mem/sysbus-memory.c<br>
new file mode 100644<br>
index 0000000000..f1ad7ba7ec<br>
--- /dev/null<br>
+++ b/hw/mem/sysbus-memory.c<br>
@@ -0,0 +1,80 @@<br>
+/*<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ *<br>
+ * SysBusDevice Memory<br>
+ *<br>
+ * Copyright (c) 2021 Greensocs<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/mem/sysbus-memory.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+<br>
+static Property sysbus_memory_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;size&quot;, SysBusMemoryState, size=
, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;readonly&quot;, SysBusMemoryState, re=
adonly, false),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void sysbus_memory_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 SysBusMemoryState *s =3D SYSBUS_MEMORY(dev);<br>
+=C2=A0 =C2=A0 gchar *name;<br>
+<br>
+=C2=A0 =C2=A0 if (!s-&gt;size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;&#39;size&#39; must be =
non-zero.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* We impose having an id (which is unique) because we =
need to generate<br>
+=C2=A0 =C2=A0 =C2=A0* a unique name for the memory region.<br>
+=C2=A0 =C2=A0 =C2=A0* memory_region_init_ram/rom() will abort() (in qemu_r=
am_set_idstr()<br>
+=C2=A0 =C2=A0 =C2=A0* function if 2 system-memory devices are created with=
 the same name<br>
+=C2=A0 =C2=A0 =C2=A0* for the memory region).<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!dev-&gt;id) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;system-memory device mu=
st have an id.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 name =3D g_strdup_printf(&quot;%s.region&quot;, dev-&gt;id);=
<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;readonly) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_init_rom(&amp;s-&gt;mem, OBJECT(=
dev), name, s-&gt;size, errp);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_init_ram(&amp;s-&gt;mem, OBJECT(=
dev), name, s-&gt;size, errp);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_free(name);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVICE(s), &amp;s-&gt;mem);<br>
+}<br>
+<br>
+static void sysbus_memory_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;user_creatable =3D true;<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D sysbus_memory_realize;<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, sysbus_memory_properties);<br>
+}<br>
+<br>
+static const TypeInfo sysbus_memory_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYSBUS_MEMO=
RY,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(SysBusMemoryState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D sysbus_memory_class_init,<br>
+};<br>
+<br>
+static void sysbus_memory_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;sysbus_memory_info);<br>
+}<br>
+<br>
+type_init(sysbus_memory_register_types)<br>
diff --git a/hw/mem/meson.build b/hw/mem/meson.build<br>
index 82f86d117e..04c74e12f2 100644<br>
--- a/hw/mem/meson.build<br>
+++ b/hw/mem/meson.build<br>
@@ -7,3 +7,5 @@ mem_ss.add(when: &#39;CONFIG_NVDIMM&#39;, if_true: files(&#=
39;nvdimm.c&#39;))<br>
=C2=A0softmmu_ss.add_all(when: &#39;CONFIG_MEM_DEVICE&#39;, if_true: mem_ss=
)<br>
<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_SPARSE_MEM&#39;, if_true: files(&#39=
;sparse-mem.c&#39;))<br>
+<br>
+softmmu_ss.add(files(&#39;sysbus-memory.c&#39;))<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div>
</div>

--000000000000bb2bba05dfc78b64--

