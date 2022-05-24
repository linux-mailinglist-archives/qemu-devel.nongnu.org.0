Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE56533221
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:04:22 +0200 (CEST)
Received: from localhost ([::1]:36486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntalR-0006Tf-8r
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntafF-0006Mo-OK
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:57:58 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaf4-0000IQ-Gz
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:57:47 -0400
Received: by mail-ed1-x52a.google.com with SMTP id i40so24436384eda.7
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 12:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=otVZwQK8JBQl9QQMIffdfJIkh6pJVGfyIsnTslTVu3A=;
 b=J8QrRV0gUEWm7hrrWHax6ZcHjEjUegvyDDmmGGZ+3BLz4QFkRZlnIy85t5l4GEup55
 x4f4QZOXlS+Kc8PGpQf8AYs6hQfrVGr+8jDF6lnAzTGqrn+ZuA8BkFVjpbWeW+XRa8vC
 ZK7sGfOl3nhoWuegFgUcJ1QbXjWYL5T4/uUFKP5LJxSMMnY4bX0SLgXM0P9MDsoxw6Xi
 oIL3qdFdioS+TB5yDQaMdf9JnE/drGMrfF6fMJ/Swoq7hsgbXx6c+9LP3zglzRG7RuBD
 N66V5d/r6XU2S146jOPv+9OHoTIiIR4zyiASozlfjdxnEUj87/1gegf17SfRPnOPnzKO
 HDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=otVZwQK8JBQl9QQMIffdfJIkh6pJVGfyIsnTslTVu3A=;
 b=Z8OMgPOzmd7bsTBBSpvGvhu6LcMjb0bo8ksnH5ByEp6jAeSkl83wVc0kACbHBiHuus
 m1OXVm4jFaM3TbFVIbwTMBRPFAkgO5CBxl624tkMS0N9h7NKGzP2acprrkBNwgF3QL6f
 qAEZ7CbR+/ISRDv4wWu8LbFqY0qURMp3bPA28OFAKwj41oJdHXmvHTX6laWodiT/axtK
 fgapSBTwkyUa7mTDFtMZdpW1Gd4kKmBQizEWv+liSbgi6EivNMcaxBcPuQuvoxyhNn++
 8RQ0LKfmiQORDqGWLPFVeOXZpaHoxIKVVHeJI4RcgrSnBWyc12KrRYV3swMrYxn4HylL
 Tyhg==
X-Gm-Message-State: AOAM532JckL9GB5fyLUOigcf/VAzX5zic0zXaOhxxZLy5IHuJtUJlNbu
 O/jcx9Hntl2xUQ0yLXGIRvt3S/0fGjxuiHW7bVaYkyGxOiQ=
X-Google-Smtp-Source: ABdhPJx7/fby3baWBcDLTI6FKvNbV2LVLVwOa/K+laha1hhtmtuqIFqzg0WsDfxKXU1L8V35xGpTfsAyMDaIDYaBzwg=
X-Received: by 2002:a05:6402:322a:b0:42a:cd87:b7c with SMTP id
 g42-20020a056402322a00b0042acd870b7cmr30527723eda.193.1653422265121; Tue, 24
 May 2022 12:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153402.41540-1-damien.hedde@greensocs.com>
 <20220519153402.41540-5-damien.hedde@greensocs.com>
In-Reply-To: <20220519153402.41540-5-damien.hedde@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 03:57:31 +0800
Message-ID: <CALw707pNaLBO9uVV6p3=XUp_OT1rZY_anWjqSqZbAtfXhcDHSg@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] qapi/device_add: compute is_hotplug flag
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: multipart/alternative; boundary="000000000000c6d04c05dfc75ed8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x52a.google.com
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

--000000000000c6d04c05dfc75ed8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Jim Shu <jim.shu@sifive.com>

On Thu, May 19, 2022 at 11:37 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> Instead of checking the phase everytime, just store the result
> in a flag. We will use more of it in the following commit.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  softmmu/qdev-monitor.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 12fe60c467..d68ef883b5 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -619,6 +619,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict
> *opts,
>      char *id;
>      DeviceState *dev =3D NULL;
>      BusState *bus =3D NULL;
> +    bool is_hotplug =3D phase_check(PHASE_MACHINE_READY);
>
>      driver =3D qdict_get_try_str(opts, "driver");
>      if (!driver) {
> @@ -662,7 +663,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict
> *opts,
>          return NULL;
>      }
>
> -    if (phase_check(PHASE_MACHINE_READY) && bus &&
> !qbus_is_hotpluggable(bus)) {
> +    if (is_hotplug && bus && !qbus_is_hotpluggable(bus)) {
>          error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
>          return NULL;
>      }
> @@ -676,7 +677,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict
> *opts,
>      dev =3D qdev_new(driver);
>
>      /* Check whether the hotplug is allowed by the machine */
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (is_hotplug) {
>          if (!qdev_hotplug_allowed(dev, errp)) {
>              goto err_del_dev;
>          }
> --
> 2.36.1
>
>
>

--000000000000c6d04c05dfc75ed8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 19, 2022 at =
11:37 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com" tar=
get=3D"_blank">damien.hedde@greensocs.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Instead of checking the phase ever=
ytime, just store the result<br>
in a flag. We will use more of it in the following commit.<br>
<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0softmmu/qdev-monitor.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c<br>
index 12fe60c467..d68ef883b5 100644<br>
--- a/softmmu/qdev-monitor.c<br>
+++ b/softmmu/qdev-monitor.c<br>
@@ -619,6 +619,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *op=
ts,<br>
=C2=A0 =C2=A0 =C2=A0char *id;<br>
=C2=A0 =C2=A0 =C2=A0DeviceState *dev =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0BusState *bus =3D NULL;<br>
+=C2=A0 =C2=A0 bool is_hotplug =3D phase_check(PHASE_MACHINE_READY);<br>
<br>
=C2=A0 =C2=A0 =C2=A0driver =3D qdict_get_try_str(opts, &quot;driver&quot;);=
<br>
=C2=A0 =C2=A0 =C2=A0if (!driver) {<br>
@@ -662,7 +663,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *op=
ts,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (phase_check(PHASE_MACHINE_READY) &amp;&amp; bus &amp;&am=
p; !qbus_is_hotpluggable(bus)) {<br>
+=C2=A0 =C2=A0 if (is_hotplug &amp;&amp; bus &amp;&amp; !qbus_is_hotpluggab=
le(bus)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_BUS_NO_HOTPLUG, bus=
-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -676,7 +677,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *op=
ts,<br>
=C2=A0 =C2=A0 =C2=A0dev =3D qdev_new(driver);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Check whether the hotplug is allowed by the machine =
*/<br>
-=C2=A0 =C2=A0 if (phase_check(PHASE_MACHINE_READY)) {<br>
+=C2=A0 =C2=A0 if (is_hotplug) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!qdev_hotplug_allowed(dev, errp)) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_del_dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div>

--000000000000c6d04c05dfc75ed8--

