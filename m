Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B3533259
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:18:50 +0200 (CEST)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntazR-0006CV-BZ
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqg-0006aT-D5
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:46 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqe-0002F8-85
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:46 -0400
Received: by mail-ej1-x629.google.com with SMTP id rq11so15444486ejc.4
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kwet7AqFbAIpfjpoHJp8MnRdkykz0MtFqAh1niMiOCo=;
 b=Il0qKILEkke7E4pH1AIgjc+KMY/DR6/1GVJHzN2PExrXITX6a2bT+50B9lCgq4zwBA
 R3TR/cM6/T78pWdS/GHT/iT84YgNGWBpNvYrz1nLLcYrgFeT+xsqMxOuyXYr9N/L9vpX
 SxGLcJD5hGfLu65VsPlV2kb28hYv5wbby10Jxy/07se7qzLL32M9LeslyKaIEA/OGWvD
 x9OlN5vd26NK1x2lb9egMv7glpaLitgT0uSdPeC5zXlAwbLdZb892AJadHvoP9wtKvoB
 EOxayirrtNvlCnxQmEa7GffnS1ApUGrs5Crbo/jFrUErUp8w5fXl5umEDXzMtoZCMf2e
 NtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kwet7AqFbAIpfjpoHJp8MnRdkykz0MtFqAh1niMiOCo=;
 b=3MZ6A6RgxINoaGxGYYX/ZLbxLYaovJpBsdp1+ZgQyuMycrMo9uvgt3yCcrsNyI+9Q3
 pyjqLCrXbDQRY732RurEd1HlXM1gg9FqqPuo7y8f8ijciXz39+g+4pTb21NLTit8zpCV
 T4BkB6waBBOyedroMXmIvNog9XDP77oDwXOX/H2iHTfirxs1DSH2Q06iI+fQmJf6UKp6
 kfOL0QMNAV9MKkijfr0nYaHcCbOxvclasR8S9VAnnsbyZSUZHYeQU5AdY8ODmL7zwSxD
 H0vn1UMBvQEWPgtgzVYSrZuKpTnvtoHE0/C/TUsSI4ucBqeRDU4bY9KM8ls4XbRwYeJI
 DyCw==
X-Gm-Message-State: AOAM532tT088v1SkMCqbrp4kB0FmJWCmR2yiFU6HzjtL8b7UO7rw0cLY
 aUPHzbUEQ3YOh/LinmMoUrJGdpabr2F1Ef6vimAAKA==
X-Google-Smtp-Source: ABdhPJw4fhN+AwozCNai8eal5cMc0MWMV/C5LZa1dJYdSKfRF227JCaGtreEQbAq215eRApEKliiqNO2sg9k2dNnsHg=
X-Received: by 2002:a17:907:7ea8:b0:6f5:941:cba9 with SMTP id
 qb40-20020a1709077ea800b006f50941cba9mr25068736ejc.213.1653422982936; Tue, 24
 May 2022 13:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-13-damien.hedde@greensocs.com>
In-Reply-To: <20220223090706.4888-13-damien.hedde@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 04:09:29 +0800
Message-ID: <CALw707oDT_JcZ1yf0Xb+5qUKmPe2bFdHEnxRG4_QqGipx0FVGg@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] add sysbus-mmio-map qapi command
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008fd26a05dfc789b5"
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

--0000000000008fd26a05dfc789b5
Content-Type: text/plain; charset="UTF-8"

Tested-by: Jim Shu <jim.shu@sifive.com>

On Wed, Feb 23, 2022 at 5:37 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> This command allows to map an mmio region of sysbus device onto
> the system memory. Its behavior mimics the sysbus_mmio_map()
> function apart from the automatic unmap (the C function unmaps
> the region if it is already mapped).
> For the qapi function we consider it is an error to try to map
> an already mapped function. If unmapping is required, it is
> probably better to add a sysbus-mmip-unmap command.
>
> This command is still experimental (hence the 'unstable' feature),
> as it is related to the sysbus device creation through qapi commands.
>
> This command is required to be able to dynamically build a machine
> from scratch as there is no qapi-way of doing a memory mapping.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> Cc: Alistair Francis <alistair.francis@wdc.com>
>
> v4:
>  + integrate priority parameter
>  + use 'unstable' feature flag instead of 'x-' prefix
>  + bump version to 7.0
>  + dropped Alistair's reviewed-by as a consequence
> ---
>  qapi/qdev.json   | 31 ++++++++++++++++++++++++++++++
>  hw/core/sysbus.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
>
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 2e2de41499..4830e87a90 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -160,3 +160,34 @@
>  ##
>  { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @sysbus-mmio-map:
> +#
> +# Map a sysbus device mmio onto the main system bus.
> +#
> +# @device: the device's QOM path
> +#
> +# @mmio: The mmio number to be mapped (defaults to 0).
> +#
> +# @addr: The base address for the mapping.
> +#
> +# @priority: The priority of the mapping (defaults to 0).
> +#
> +# Features:
> +# @unstable: Command is meant to map sysbus devices
> +#            while in preconfig mode.
> +#
> +# Since: 7.0
> +#
> +# Returns: Nothing on success
> +#
> +##
> +
> +{ 'command': 'sysbus-mmio-map',
> +  'data': { 'device': 'str',
> +            '*mmio': 'uint8',
> +            'addr': 'uint64',
> +            '*priority': 'int32' },
> +  'features': ['unstable'],
> +  'allow-preconfig' : true }
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index 05c1da3d31..df1f1f43a5 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -23,6 +23,7 @@
>  #include "hw/sysbus.h"
>  #include "monitor/monitor.h"
>  #include "exec/address-spaces.h"
> +#include "qapi/qapi-commands-qdev.h"
>
>  static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
>  static char *sysbus_get_fw_dev_path(DeviceState *dev);
> @@ -154,6 +155,54 @@ static void sysbus_mmio_map_common(SysBusDevice *dev,
> int n, hwaddr addr,
>      }
>  }
>
> +void qmp_sysbus_mmio_map(const char *device,
> +                         bool has_mmio, uint8_t mmio,
> +                         uint64_t addr,
> +                         bool has_priority, int32_t priority,
> +                         Error **errp)
> +{
> +    Object *obj = object_resolve_path_type(device, TYPE_SYS_BUS_DEVICE,
> NULL);
> +    SysBusDevice *dev;
> +
> +    if (phase_get() != PHASE_MACHINE_INITIALIZED) {
> +        error_setg(errp, "The command is permitted only when "
> +                         "the machine is in initialized phase");
> +        return;
> +    }
> +
> +    if (obj == NULL) {
> +        error_setg(errp, "Device '%s' not found", device);
> +        return;
> +    }
> +    dev = SYS_BUS_DEVICE(obj);
> +
> +    if (!has_mmio) {
> +        mmio = 0;
> +    }
> +    if (!has_priority) {
> +        priority = 0;
> +    }
> +
> +    if (mmio >= dev->num_mmio) {
> +        error_setg(errp, "MMIO index '%u' does not exist in '%s'",
> +                   mmio, device);
> +        return;
> +    }
> +
> +    if (dev->mmio[mmio].addr != (hwaddr)-1) {
> +        error_setg(errp, "MMIO index '%u' is already mapped", mmio);
> +        return;
> +    }
> +
> +    if (!memory_region_try_add_subregion(get_system_memory(), addr,
> +                                         dev->mmio[mmio].memory, priority,
> +                                         errp)) {
> +        return;
> +    }
> +
> +    dev->mmio[mmio].addr = addr;
> +}
> +
>  void sysbus_mmio_unmap(SysBusDevice *dev, int n)
>  {
>      assert(n >= 0 && n < dev->num_mmio);
> --
> 2.35.1
>
>
>

--0000000000008fd26a05dfc789b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 23, 2022 at =
5:37 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com" targ=
et=3D"_blank">damien.hedde@greensocs.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">This command allows to map an mmio =
region of sysbus device onto<br>
the system memory. Its behavior mimics the sysbus_mmio_map()<br>
function apart from the automatic unmap (the C function unmaps<br>
the region if it is already mapped).<br>
For the qapi function we consider it is an error to try to map<br>
an already mapped function. If unmapping is required, it is<br>
probably better to add a sysbus-mmip-unmap command.<br>
<br>
This command is still experimental (hence the &#39;unstable&#39; feature),<=
br>
as it is related to the sysbus device creation through qapi commands.<br>
<br>
This command is required to be able to dynamically build a machine<br>
from scratch as there is no qapi-way of doing a memory mapping.<br>
<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
---<br>
Cc: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" target=
=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
v4:<br>
=C2=A0+ integrate priority parameter<br>
=C2=A0+ use &#39;unstable&#39; feature flag instead of &#39;x-&#39; prefix<=
br>
=C2=A0+ bump version to 7.0<br>
=C2=A0+ dropped Alistair&#39;s reviewed-by as a consequence<br>
---<br>
=C2=A0qapi/qdev.json=C2=A0 =C2=A0| 31 ++++++++++++++++++++++++++++++<br>
=C2=A0hw/core/sysbus.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 80 insertions(+)<br>
<br>
diff --git a/qapi/qdev.json b/qapi/qdev.json<br>
index 2e2de41499..4830e87a90 100644<br>
--- a/qapi/qdev.json<br>
+++ b/qapi/qdev.json<br>
@@ -160,3 +160,34 @@<br>
=C2=A0##<br>
=C2=A0{ &#39;event&#39;: &#39;DEVICE_UNPLUG_GUEST_ERROR&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;*device&#39;: &#39;str&#39;, &#39;path&=
#39;: &#39;str&#39; } }<br>
+<br>
+##<br>
+# @sysbus-mmio-map:<br>
+#<br>
+# Map a sysbus device mmio onto the main system bus.<br>
+#<br>
+# @device: the device&#39;s QOM path<br>
+#<br>
+# @mmio: The mmio number to be mapped (defaults to 0).<br>
+#<br>
+# @addr: The base address for the mapping.<br>
+#<br>
+# @priority: The priority of the mapping (defaults to 0).<br>
+#<br>
+# Features:<br>
+# @unstable: Command is meant to map sysbus devices<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while in preconfig mode.<br>
+#<br>
+# Since: 7.0<br>
+#<br>
+# Returns: Nothing on success<br>
+#<br>
+##<br>
+<br>
+{ &#39;command&#39;: &#39;sysbus-mmio-map&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;device&#39;: &#39;str&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*mmio&#39;: &#39;uint8&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;addr&#39;: &#39;uint64&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*priority&#39;: &#39;int32&=
#39; },<br>
+=C2=A0 &#39;features&#39;: [&#39;unstable&#39;],<br>
+=C2=A0 &#39;allow-preconfig&#39; : true }<br>
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c<br>
index 05c1da3d31..df1f1f43a5 100644<br>
--- a/hw/core/sysbus.c<br>
+++ b/hw/core/sysbus.c<br>
@@ -23,6 +23,7 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
+#include &quot;qapi/qapi-commands-qdev.h&quot;<br>
<br>
=C2=A0static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int inde=
nt);<br>
=C2=A0static char *sysbus_get_fw_dev_path(DeviceState *dev);<br>
@@ -154,6 +155,54 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, =
int n, hwaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+void qmp_sysbus_mmio_map(const char *device,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool has_mmio, uint8_t mmio,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0uint64_t addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool has_priority, int32_t priority,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Object *obj =3D object_resolve_path_type(device, TYPE_SYS_BU=
S_DEVICE, NULL);<br>
+=C2=A0 =C2=A0 SysBusDevice *dev;<br>
+<br>
+=C2=A0 =C2=A0 if (phase_get() !=3D PHASE_MACHINE_INITIALIZED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The command is permitte=
d only when &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;the machine is in initialized phase&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (obj =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Device &#39;%s&#39; not=
 found&quot;, device);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 dev =3D SYS_BUS_DEVICE(obj);<br>
+<br>
+=C2=A0 =C2=A0 if (!has_mmio) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mmio =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (!has_priority) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priority =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (mmio &gt;=3D dev-&gt;num_mmio) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;MMIO index &#39;%u&#39;=
 does not exist in &#39;%s&#39;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmio,=
 device);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (dev-&gt;mmio[mmio].addr !=3D (hwaddr)-1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;MMIO index &#39;%u&#39;=
 is already mapped&quot;, mmio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!memory_region_try_add_subregion(get_system_memory(), ad=
dr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0de=
v-&gt;mmio[mmio].memory, priority,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0er=
rp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dev-&gt;mmio[mmio].addr =3D addr;<br>
+}<br>
+<br>
=C2=A0void sysbus_mmio_unmap(SysBusDevice *dev, int n)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0assert(n &gt;=3D 0 &amp;&amp; n &lt; dev-&gt;num_mmio);=
<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div>

--0000000000008fd26a05dfc789b5--

