Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08548533238
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:14:14 +0200 (CEST)
Received: from localhost ([::1]:50476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntauz-0000Sv-3h
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqE-0005ub-8e
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:18 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqC-00027h-5o
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:17 -0400
Received: by mail-ej1-x636.google.com with SMTP id y13so36817278eje.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 13:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7PBJA3C62eoSkl6DhdyxP6mvWBig6wkMDoxUPX6PawE=;
 b=nZApcgahAWmq9C5jlp35Xgo/4eGzfSZK8wRlY+xgssi98KwzMNP6luS7BqZOaGNn3C
 8P0L2quIodM60qJu7+1vIwCEZhlKa9G5LRd8HXpKao+S1e7MXgXfwoVuE5Qi/c4n3cox
 0fLKjKABsoT/4Ztr1ICsTIWsQ0Q7mb9X1DdLRxBM03JRdYBJMzdTRyxJECpSOxVio4EC
 H+dknK9/Hv9P3moXXMBj0gW0WN1rLpv/TzswZW130H6uF1ICCAwQtF6cB9Uuus0rMUd4
 8zJr15REw0wSLUMpVrgE1/5setfQHkVA4MK25tpjaYm4kj8Akqfb05PnnNrP1k5y9PmC
 kAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7PBJA3C62eoSkl6DhdyxP6mvWBig6wkMDoxUPX6PawE=;
 b=wH1A0bdUzcUuJIP9KFBRvI9yF2gZ07TR0l4KSGhZRNq3dgljx+kN0652dvHtFDB8k4
 3cKQoIIOSfFibJni+lF4/C4iuRlay3DxDd8A7sQMgKF8vCI/Tlv16rz+TkqJcm7+vz7y
 DVN7xyj6SzGL7zoC1qBYzH81R3wQ7J5DtaVyM1gjBTwGholwQU5f8h963qrbx2iD4jBu
 Lcwn4JX2ffi8q+5H6c9bn9oiLuAX5hJTRAhjZ0gRkEOUyuaP+aiWssrzc61351ofTsY6
 JBbz6LSLx9LtzHFqaJEonJiHmdcXi3BcQG1h6lnhzhBR7YVPRgPxxNyawhbkSjUQ7mc0
 BWqA==
X-Gm-Message-State: AOAM532X+tdXL8CEUvV0JXkOKwcAnVoruWdJpvR8R7WVEwZZ9sado3mH
 TKDVJ7pClI0wHi6qLYfpZmSj4/KO+936JQhs8nsD2A==
X-Google-Smtp-Source: ABdhPJzYzdHIkHl4ctoOZGmvFZsHchjcLJyUcqqHxfWGsyrrT/Sw97i+OUxAdCHSlGp2eHLfoILwszlsl16Vpax2WBs=
X-Received: by 2002:a17:907:6d12:b0:6fe:bef9:58d5 with SMTP id
 sa18-20020a1709076d1200b006febef958d5mr15913264ejc.548.1653422949861; Tue, 24
 May 2022 13:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-6-damien.hedde@greensocs.com>
In-Reply-To: <20220223090706.4888-6-damien.hedde@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 04:08:57 +0800
Message-ID: <CALw707pHPz-bii8cnZ5WuegyFP4qay3o9gCyTvn0X=cbNheg1w@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] qapi/device_add: handle the rom_order_override
 when cold-plugging
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: multipart/alternative; boundary="00000000000097340605dfc787bd"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x636.google.com
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

--00000000000097340605dfc787bd
Content-Type: text/plain; charset="UTF-8"

Tested-by: Jim Shu <jim.shu@sifive.com>

On Wed, Feb 23, 2022 at 5:18 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> rom_set_order_override() and rom_reset_order_override() were called
> in qemu_create_cli_devices() to set the rom_order_override value
> once and for all when creating the devices added on CLI.
>
> Unfortunately this won't work with qapi commands.
>
> Move the calls inside device_add so that it will be done in every
> case:
> + CLI option: -device
> + QAPI command: device_add
>
> rom_[set|reset]_order_override() are implemented in hw/core/loader.c
> They either do nothing or call fw_cfg_[set|reset]_order_override().
> The later functions are implemented in hw/nvram/fw_cfg.c and only
> change an integer value of a "global" variable.
> In consequence, there are no complex side effects involved and we can
> safely move them from outside the -device option loop to the inner
> function.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  softmmu/qdev-monitor.c | 11 +++++++++++
>  softmmu/vl.c           |  2 --
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 47a89aee20..9ec3e0ebff 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -43,6 +43,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/clock.h"
>  #include "hw/boards.h"
> +#include "hw/loader.h"
>
>  /*
>   * Aliases were a bad idea from the start.  Let's keep them
> @@ -671,6 +672,10 @@ DeviceState *qdev_device_add_from_qdict(const QDict
> *opts,
>          return NULL;
>      }
>
> +    if (!is_hotplug) {
> +        rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
> +    }
> +
>      /* create device */
>      dev = qdev_new(driver);
>
> @@ -712,6 +717,9 @@ DeviceState *qdev_device_add_from_qdict(const QDict
> *opts,
>      if (!qdev_realize(DEVICE(dev), bus, errp)) {
>          goto err_del_dev;
>      }
> +    if (!is_hotplug) {
> +        rom_reset_order_override();
> +    }
>      return dev;
>
>  err_del_dev:
> @@ -719,6 +727,9 @@ err_del_dev:
>          object_unparent(OBJECT(dev));
>          object_unref(OBJECT(dev));
>      }
> +    if (!is_hotplug) {
> +        rom_reset_order_override();
> +    }
>      return NULL;
>  }
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 50337d68b9..b91ae1b8ae 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2680,7 +2680,6 @@ static void qemu_create_cli_devices(void)
>      }
>
>      /* init generic devices */
> -    rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
>      qemu_opts_foreach(qemu_find_opts("device"),
>                        device_init_func, NULL, &error_fatal);
>      QTAILQ_FOREACH(opt, &device_opts, next) {
> @@ -2697,7 +2696,6 @@ static void qemu_create_cli_devices(void)
>          object_unref(OBJECT(dev));
>          loc_pop(&opt->loc);
>      }
> -    rom_reset_order_override();
>  }
>
>  static void qemu_machine_creation_done(void)
> --
> 2.35.1
>
>
>

--00000000000097340605dfc787bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 23, 2022 at =
5:18 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com" targ=
et=3D"_blank">damien.hedde@greensocs.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">rom_set_order_override() and rom_re=
set_order_override() were called<br>
in qemu_create_cli_devices() to set the rom_order_override value<br>
once and for all when creating the devices added on CLI.<br>
<br>
Unfortunately this won&#39;t work with qapi commands.<br>
<br>
Move the calls inside device_add so that it will be done in every<br>
case:<br>
+ CLI option: -device<br>
+ QAPI command: device_add<br>
<br>
rom_[set|reset]_order_override() are implemented in hw/core/loader.c<br>
They either do nothing or call fw_cfg_[set|reset]_order_override().<br>
The later functions are implemented in hw/nvram/fw_cfg.c and only<br>
change an integer value of a &quot;global&quot; variable.<br>
In consequence, there are no complex side effects involved and we can<br>
safely move them from outside the -device option loop to the inner<br>
function.<br>
<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
---<br>
=C2=A0softmmu/qdev-monitor.c | 11 +++++++++++<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
=C2=A02 files changed, 11 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c<br>
index 47a89aee20..9ec3e0ebff 100644<br>
--- a/softmmu/qdev-monitor.c<br>
+++ b/softmmu/qdev-monitor.c<br>
@@ -43,6 +43,7 @@<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/clock.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
+#include &quot;hw/loader.h&quot;<br>
<br>
=C2=A0/*<br>
=C2=A0 * Aliases were a bad idea from the start.=C2=A0 Let&#39;s keep them<=
br>
@@ -671,6 +672,10 @@ DeviceState *qdev_device_add_from_qdict(const QDict *o=
pts,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (!is_hotplug) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rom_set_order_override(FW_CFG_ORDER_OVERRIDE_D=
EVICE);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* create device */<br>
=C2=A0 =C2=A0 =C2=A0dev =3D qdev_new(driver);<br>
<br>
@@ -712,6 +717,9 @@ DeviceState *qdev_device_add_from_qdict(const QDict *op=
ts,<br>
=C2=A0 =C2=A0 =C2=A0if (!qdev_realize(DEVICE(dev), bus, errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_del_dev;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (!is_hotplug) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rom_reset_order_override();<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return dev;<br>
<br>
=C2=A0err_del_dev:<br>
@@ -719,6 +727,9 @@ err_del_dev:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unparent(OBJECT(dev));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(dev));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (!is_hotplug) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rom_reset_order_override();<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
index 50337d68b9..b91ae1b8ae 100644<br>
--- a/softmmu/vl.c<br>
+++ b/softmmu/vl.c<br>
@@ -2680,7 +2680,6 @@ static void qemu_create_cli_devices(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* init generic devices */<br>
-=C2=A0 =C2=A0 rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);<br>
=C2=A0 =C2=A0 =C2=A0qemu_opts_foreach(qemu_find_opts(&quot;device&quot;),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0device_init_func, NULL, &amp;error_fatal);<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH(opt, &amp;device_opts, next) {<br>
@@ -2697,7 +2696,6 @@ static void qemu_create_cli_devices(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(dev));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loc_pop(&amp;opt-&gt;loc);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 rom_reset_order_override();<br>
=C2=A0}<br>
<br>
=C2=A0static void qemu_machine_creation_done(void)<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div>

--00000000000097340605dfc787bd--

