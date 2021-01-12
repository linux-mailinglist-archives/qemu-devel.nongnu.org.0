Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207142F3870
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:39 +0100 (CET)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOGY-0006HF-59
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kzNu7-0001Bd-8T
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:56:27 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:34902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kzNu2-0002p2-I3
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:56:26 -0500
Received: by mail-lf1-x135.google.com with SMTP id u25so4713374lfc.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KO6qDQIbEVkoF4M7Euju23RL8XH28UtY0vMBbtDUReM=;
 b=hCmYdERKuPZ7R/+6QpEFUdRydSaiWz5cEUp4TIG6b6oovl0vXZF8K4CeXaNNGb2DwG
 cSEqqT191373odWbZhVZp72WOL6yxg9bXKssFc3pquGy1cgFyxSGByfyK0lHFsE+Oglg
 GMtLtdSjh/fXOXgUnXTKFr5AECdydygoW9gHF/+YZx8NZ9c8/xgs/XsSzcRjINoezsh1
 5ueadS44s+KCiMSanreOfIrPTyr40dn53pO28US67neCP2WvrDbYsmktY1b76GgT3mpY
 i9jVgbIn4G8R3by+7ZwlKiJg8NfX8YiYkrpRQA8J+F6emNqxWHmTnbLhPpK5TaWy8krR
 DnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KO6qDQIbEVkoF4M7Euju23RL8XH28UtY0vMBbtDUReM=;
 b=sUezbmqCYxyVp2WIKtveXicCDP31z1tmoa3TRScJo5+HK216GGkLW6h4uToctdmjvk
 ZTPRtARnePUkPV+5j2OeBj4MsCnvYhHcJM4F4E4k2mpHxUjcUZAFYV8UncS7SwRRtDbs
 xB3UovDTZ6xkFRYAM5/3VNdMov8o6uA+VRGsqBh1BlErrIK/uep3EsgKEfvbbS5xk59D
 mmZFOC+t6+Kz5c0hht6+SU3geJ1U+KTps22Num0GknziHMVxt5p0LcTcH+6a2pfeDINd
 XiDIhK1PuyINrm44avrDDh63qzn2AZr5TuN6O14B7dgycU5OjcgFYSZqgFZjrneqZOPk
 3ULg==
X-Gm-Message-State: AOAM531FeSZ+1Vlcpp6mjczzBboe90SbH9BLKuBWgi4yHDIBxdE1w/tV
 ybjKk3n76FmDH8J9MEfZaVrFqz+l8tRm+EmfNGPScA==
X-Google-Smtp-Source: ABdhPJykji0NDh7S1S1HcRqwfKA+FoIidauZvzWV8HkRzpwMiuekXGL0LBcY+fkjil7gnq+P7ebQfuV6VLOt8XSRirg=
X-Received: by 2002:ac2:5689:: with SMTP id 9mr45549lfr.175.1610474178824;
 Tue, 12 Jan 2021 09:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-2-maxim.uvarov@linaro.org>
In-Reply-To: <20210112143058.12159-2-maxim.uvarov@linaro.org>
Date: Tue, 12 Jan 2021 09:56:05 -0800
Message-ID: <CAGcCb130kODs-LWoYSm_RbuB3A7AqSfqoQg4ktq4Ssn0ab+FYw@mail.gmail.com>
Subject: Re: [PATCHv4 1/2] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000059a4a205b8b7bd8f"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jose.Marinho@arm.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--00000000000059a4a205b8b7bd8f
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 12, 2021 at 6:36 AM Maxim Uvarov <maxim.uvarov@linaro.org>
wrote:

> Implement gpio-pwr driver to allow reboot and poweroff machine.
> This is simple driver with just 2 gpios lines. Current use case
> is to reboot and poweroff virt machine in secure mode. Secure
> pl066 gpio chip is needed for that.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  hw/gpio/Kconfig     |  3 ++
>  hw/gpio/gpio_pwr.c  | 70 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build |  1 +
>  3 files changed, 74 insertions(+)
>  create mode 100644 hw/gpio/gpio_pwr.c
>
> diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
> index b6fdaa2586..f0e7405f6e 100644
> --- a/hw/gpio/Kconfig
> +++ b/hw/gpio/Kconfig
> @@ -8,5 +8,8 @@ config PL061
>  config GPIO_KEY
>      bool
>
> +config GPIO_PWR
> +    bool
> +
>  config SIFIVE_GPIO
>      bool
> diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
> new file mode 100644
> index 0000000000..8ed8d5d24f
> --- /dev/null
> +++ b/hw/gpio/gpio_pwr.c
> @@ -0,0 +1,70 @@
> +/*
> + * GPIO qemu power controller
> + *
> + * Copyright (c) 2020 Linaro Limited
> + *
> + * Author: Maxim Uvarov <maxim.uvarov@linaro.org>
> + *
> + * Virtual gpio driver which can be used on top of pl061
> + * to reboot and shutdown qemu virtual machine. One of use
> + * case is gpio driver for secure world application (ARM
> + * Trusted Firmware.).
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +/*
> + * QEMU interface:
> + * two named input GPIO lines:
> + *   'reset' : when asserted, trigger system reset
> + *   'shutdown' : when asserted, trigger system shutdown
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/runstate.h"
> +
> +#define TYPE_GPIOPWR "gpio-pwr"
> +OBJECT_DECLARE_SIMPLE_TYPE(GPIO_PWR_State, GPIOPWR)
> +
> +struct GPIO_PWR_State {
> +    SysBusDevice parent_obj;
> +};
> +
> +static void gpio_pwr_reset(void *opaque, int n, int level)
> +{
> +    if (!level) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +    }
> +}
> +
> +static void gpio_pwr_shutdown(void *opaque, int n, int level)
> +{
> +    if (!level) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    }
> +}
> +
> +static void gpio_pwr_init(Object *obj)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +
> +    qdev_init_gpio_in_named(dev, gpio_pwr_reset, "reset", 1);
> +    qdev_init_gpio_in_named(dev, gpio_pwr_shutdown, "shutdown", 1);
> +}
> +
> +static const TypeInfo gpio_pwr_info = {
> +    .name          = TYPE_GPIOPWR,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(GPIO_PWR_State),
> +    .instance_init = gpio_pwr_init,
> +};
> +
> +static void gpio_pwr_register_types(void)
> +{
> +    type_register_static(&gpio_pwr_info);
> +}
> +
> +type_init(gpio_pwr_register_types)
> diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
> index 5c0a7d7b95..79568f00ce 100644
> --- a/hw/gpio/meson.build
> +++ b/hw/gpio/meson.build
> @@ -1,5 +1,6 @@
>  softmmu_ss.add(when: 'CONFIG_E500', if_true: files('mpc8xxx.c'))
>  softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
> +softmmu_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
>  softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
>  softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
>  softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_gpio.c'))
> --
> 2.17.1
>
>
>

--00000000000059a4a205b8b7bd8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 12, 2021 at 6:36 AM Maxim=
 Uvarov &lt;<a href=3D"mailto:maxim.uvarov@linaro.org">maxim.uvarov@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Implement gpio-pwr driver to allow reboot and poweroff machine.<br>
This is simple driver with just 2 gpios lines. Current use case<br>
is to reboot and poweroff virt machine in secure mode. Secure<br>
pl066 gpio chip is needed for that.<br>
<br>
Signed-off-by: Maxim Uvarov &lt;<a href=3D"mailto:maxim.uvarov@linaro.org" =
target=3D"_blank">maxim.uvarov@linaro.org</a>&gt;<br></blockquote><div>Revi=
ewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.=
com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/gpio/Kconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A0hw/gpio/gpio_pwr.c=C2=A0 | 70 +++++++++++++++++++++++++++++++++++++++=
++++++<br>
=C2=A0hw/gpio/meson.build |=C2=A0 1 +<br>
=C2=A03 files changed, 74 insertions(+)<br>
=C2=A0create mode 100644 hw/gpio/gpio_pwr.c<br>
<br>
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig<br>
index b6fdaa2586..f0e7405f6e 100644<br>
--- a/hw/gpio/Kconfig<br>
+++ b/hw/gpio/Kconfig<br>
@@ -8,5 +8,8 @@ config PL061<br>
=C2=A0config GPIO_KEY<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
+config GPIO_PWR<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0config SIFIVE_GPIO<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c<br>
new file mode 100644<br>
index 0000000000..8ed8d5d24f<br>
--- /dev/null<br>
+++ b/hw/gpio/gpio_pwr.c<br>
@@ -0,0 +1,70 @@<br>
+/*<br>
+ * GPIO qemu power controller<br>
+ *<br>
+ * Copyright (c) 2020 Linaro Limited<br>
+ *<br>
+ * Author: Maxim Uvarov &lt;<a href=3D"mailto:maxim.uvarov@linaro.org" tar=
get=3D"_blank">maxim.uvarov@linaro.org</a>&gt;<br>
+ *<br>
+ * Virtual gpio driver which can be used on top of pl061<br>
+ * to reboot and shutdown qemu virtual machine. One of use<br>
+ * case is gpio driver for secure world application (ARM<br>
+ * Trusted Firmware.).<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ */<br>
+<br>
+/*<br>
+ * QEMU interface:<br>
+ * two named input GPIO lines:<br>
+ *=C2=A0 =C2=A0&#39;reset&#39; : when asserted, trigger system reset<br>
+ *=C2=A0 =C2=A0&#39;shutdown&#39; : when asserted, trigger system shutdown=
<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;sysemu/runstate.h&quot;<br>
+<br>
+#define TYPE_GPIOPWR &quot;gpio-pwr&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(GPIO_PWR_State, GPIOPWR)<br>
+<br>
+struct GPIO_PWR_State {<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+};<br>
+<br>
+static void gpio_pwr_reset(void *opaque, int n, int level)<br>
+{<br>
+=C2=A0 =C2=A0 if (!level) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST=
_RESET);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void gpio_pwr_shutdown(void *opaque, int n, int level)<br>
+{<br>
+=C2=A0 =C2=A0 if (!level) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST=
_SHUTDOWN);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void gpio_pwr_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(obj);<br>
+<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in_named(dev, gpio_pwr_reset, &quot;reset&quo=
t;, 1);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in_named(dev, gpio_pwr_shutdown, &quot;shutdo=
wn&quot;, 1);<br>
+}<br>
+<br>
+static const TypeInfo gpio_pwr_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_GPIOPWR,<br=
>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(GPIO_PWR_State),<br>
+=C2=A0 =C2=A0 .instance_init =3D gpio_pwr_init,<br>
+};<br>
+<br>
+static void gpio_pwr_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;gpio_pwr_info);<br>
+}<br>
+<br>
+type_init(gpio_pwr_register_types)<br>
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build<br>
index 5c0a7d7b95..79568f00ce 100644<br>
--- a/hw/gpio/meson.build<br>
+++ b/hw/gpio/meson.build<br>
@@ -1,5 +1,6 @@<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_E500&#39;, if_true: files(&#39;mpc8x=
xx.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_GPIO_KEY&#39;, if_true: files(&#39;g=
pio_key.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_GPIO_PWR&#39;, if_true: files(&#39;gpio_p=
wr.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_MAX7310&#39;, if_true: files(&#39;ma=
x7310.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_PL061&#39;, if_true: files(&#39;pl06=
1.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_PUV3&#39;, if_true: files(&#39;puv3_=
gpio.c&#39;))<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000059a4a205b8b7bd8f--

