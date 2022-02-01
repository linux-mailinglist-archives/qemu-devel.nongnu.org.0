Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7A14A6928
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 01:21:19 +0100 (CET)
Received: from localhost ([::1]:53774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF3Og-0008My-KC
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 19:21:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nF0AL-0004KK-VR
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:54:17 -0500
Received: from [2607:f8b0:4864:20::92d] (port=34423
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nF0AK-0006BB-26
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:54:17 -0500
Received: by mail-ua1-x92d.google.com with SMTP id y4so15508222uad.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 12:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RNp6wynBZJQnFnRwfATDNsPnAzCjjguKFbFD5ll24TU=;
 b=n4UPPl/I0nwrzib6eaCafj7jN4uNj8JBRNO2fSSl7WOV+e+umVXZmCyTxFEBpJLy4G
 iKSiuVjOkOjjJlNruX9eRSgc+Bmu6c9AOEsXGhdLPGY+GlkJ28+X9hqCkaeQilOi2goJ
 yzQC2Swx8nH2EXjCBwlx78XWs6mPwGLWdX/+dT10Hwr6M1nppXBgKCJVXmj8uQ5dvNpE
 L2NcO/s3d+0SVt/psWy46iTpUrqowGyhY2ZbyOBJpqfi3QsPebO+t8LS8YzzAp/azmUx
 rKdJ/d8WxCZ2rV8MWP+7djECDbd1yiv/LPpf11S8VOlZa9i+dDTFJhFSggEjy+E/lgYk
 zopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RNp6wynBZJQnFnRwfATDNsPnAzCjjguKFbFD5ll24TU=;
 b=d8bH5U9R1PyOVkWhjjZcvEWuXP9E1e+QNlNn8ICP12lgLoZOoTuwTn5450zEpFjUf8
 G57Ym3HtowEDxMjf+obCn1wMbGAej7EbDel/1ljVV662pDLt+IkatmmwBBCyObHWa/FO
 9rBDlStBBRZwQWBkN/jqwxPe/SxyN6mEM5ZbEGqLo8oTeD93akEUk64pOuA9fXVVLP30
 hAG0D0ZeKLv9v/u39dNXKxMFMGMIoQahnxf50W3mahxH2x3W1TlCOU6MmMMZ5pFQ0UN+
 MhhLEXFJNukZ2oOIqvSU/4mruNbS4jcpAb2YgW9Du4KRrjQQJUqEsbFrtIlA8sbDrbNb
 G39Q==
X-Gm-Message-State: AOAM532vis63mypn9MlxCz6z+kLHzC3H1PBq+//LDHmzRrgwsI4Y0pRi
 mSWfi2J6YGhb+Foqht3HMKlIGyYvTS71jRryepoyhw==
X-Google-Smtp-Source: ABdhPJwjLASM3+cOItdRoRaYUiF+UibJVzJ/EXBBvN2UwM6ViAsXLjJy2stgs3NPBIjxJeK8WQuAFuzCjLatFwe64Pk=
X-Received: by 2002:a67:d58b:: with SMTP id m11mr11195676vsj.46.1643748853654; 
 Tue, 01 Feb 2022 12:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20220201163005.989457-1-venture@google.com>
 <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
In-Reply-To: <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
From: Patrick Venture <venture@google.com>
Date: Tue, 1 Feb 2022 12:54:02 -0800
Message-ID: <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: flatten pca954x mux device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Corey Minyard <cminyard@mvista.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="000000000000860c3d05d6fb1aa9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=venture@google.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000860c3d05d6fb1aa9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 1, 2022 at 11:02 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 1/2/22 17:30, Patrick Venture wrote:
> > Previously this device created N subdevices which each owned an i2c bus=
.
> > Now this device simply owns the N i2c busses directly.
> >
> > Tested: Verified devices behind mux are still accessible via qmp and i2=
c
> > from within an arm32 SoC.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >   hw/i2c/i2c_mux_pca954x.c | 75 ++++++---------------------------------=
-
> >   1 file changed, 11 insertions(+), 64 deletions(-)
>
> >   static void pca954x_init(Object *obj)
> >   {
> >       Pca954xState *s =3D PCA954X(obj);
> >       Pca954xClass *c =3D PCA954X_GET_CLASS(obj);
> >       int i;
> >
> > -    /* Only initialize the children we expect. */
> > +    /* SMBus modules. Cannot fail. */
> >       for (i =3D 0; i < c->nchans; i++) {
> > -        object_initialize_child(obj, "channel[*]", &s->channel[i],
> > -                                TYPE_PCA954X_CHANNEL);
> > +        /* start all channels as disabled. */
> > +        s->enabled[i] =3D false;
> > +        s->bus[i] =3D i2c_init_bus(DEVICE(s), "channel[*]");
>
> This is not a QOM property, so you need to initialize manually:
>

that was my suspicion but this is the output I'm seeing:

{'execute': 'qom-list', 'arguments': { 'path':
'/machine/soc/smbus[0]/i2c-bus/child[0]' }}

{"return": [
{"name": "type", "type": "string"},
{"name": "parent_bus", "type": "link<bus>"},
{"name": "realized", "type": "bool"},
{"name": "hotplugged", "type": "bool"},
{"name": "hotpluggable", "type": "bool"},
{"name": "address", "type": "uint8"},
{"name": "channel[3]", "type": "child<i2c-bus>"},
{"name": "channel[0]", "type": "child<i2c-bus>"},
{"name": "channel[1]", "type": "child<i2c-bus>"},
{"name": "channel[2]", "type": "child<i2c-bus>"}
]}

It seems to be naming them via the order they're created.

Is this not behaving how you expect?


>
> -- >8 --
> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> index f9ce633b3a..a9517b612a 100644
> --- a/hw/i2c/i2c_mux_pca954x.c
> +++ b/hw/i2c/i2c_mux_pca954x.c
> @@ -189,9 +189,11 @@ static void pca954x_init(Object *obj)
>
>       /* SMBus modules. Cannot fail. */
>       for (i =3D 0; i < c->nchans; i++) {
> +        g_autofree gchar *bus_name =3D g_strdup_printf("i2c.%d", i);
> +
>           /* start all channels as disabled. */
>           s->enabled[i] =3D false;
> -        s->bus[i] =3D i2c_init_bus(DEVICE(s), "channel[*]");
> +        s->bus[i] =3D i2c_init_bus(DEVICE(s), bus_name);
>       }
>   }
>
> ---
>
> (look at HMP 'info qtree' output).
>
> >       }
> >   }
>
> With the change:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

--000000000000860c3d05d6fb1aa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 11:02 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 1/2/22 17:30, Patrick Venture wrote:<br>
&gt; Previously this device created N subdevices which each owned an i2c bu=
s.<br>
&gt; Now this device simply owns the N i2c busses directly.<br>
&gt; <br>
&gt; Tested: Verified devices behind mux are still accessible via qmp and i=
2c<br>
&gt; from within an arm32 SoC.<br>
&gt; <br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/i2c/i2c_mux_pca954x.c | 75 ++++++----------------------=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 11 insertions(+), 64 deletions(-)<br>
<br>
&gt;=C2=A0 =C2=A0static void pca954x_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Pca954xState *s =3D PCA954X(obj);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Pca954xClass *c =3D PCA954X_GET_CLASS(obj);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 /* Only initialize the children we expect. */<br>
&gt; +=C2=A0 =C2=A0 /* SMBus modules. Cannot fail. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; c-&gt;nchans; i++) {<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(obj, &quot;channe=
l[*]&quot;, &amp;s-&gt;channel[i],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PCA954X_CHANNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* start all channels as disabled. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;enabled[i] =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;bus[i] =3D i2c_init_bus(DEVICE(s), =
&quot;channel[*]&quot;);<br>
<br>
This is not a QOM property, so you need to initialize manually:<br></blockq=
uote><div><br></div><div>that was my suspicion but this is the output I&#39=
;m seeing:<br><br></div><div>{&#39;execute&#39;: &#39;qom-list&#39;, &#39;a=
rguments&#39;: { &#39;path&#39;: &#39;/machine/soc/smbus[0]/i2c-bus/child[0=
]&#39; }}<br><br>{&quot;return&quot;: [<br>{&quot;name&quot;: &quot;type&qu=
ot;, &quot;type&quot;: &quot;string&quot;},<br>{&quot;name&quot;: &quot;par=
ent_bus&quot;, &quot;type&quot;: &quot;link&lt;bus&gt;&quot;},<br>{&quot;na=
me&quot;: &quot;realized&quot;, &quot;type&quot;: &quot;bool&quot;},<br>{&q=
uot;name&quot;: &quot;hotplugged&quot;, &quot;type&quot;: &quot;bool&quot;}=
,<br>{&quot;name&quot;: &quot;hotpluggable&quot;, &quot;type&quot;: &quot;b=
ool&quot;},<br>{&quot;name&quot;: &quot;address&quot;, &quot;type&quot;: &q=
uot;uint8&quot;},<br>{&quot;name&quot;: &quot;channel[3]&quot;, &quot;type&=
quot;: &quot;child&lt;i2c-bus&gt;&quot;},<br>{&quot;name&quot;: &quot;chann=
el[0]&quot;, &quot;type&quot;: &quot;child&lt;i2c-bus&gt;&quot;},<br>{&quot=
;name&quot;: &quot;channel[1]&quot;, &quot;type&quot;: &quot;child&lt;i2c-b=
us&gt;&quot;},<br>{&quot;name&quot;: &quot;channel[2]&quot;, &quot;type&quo=
t;: &quot;child&lt;i2c-bus&gt;&quot;}<br>]}<br></div><div><br></div><div>It=
 seems to be naming them via the order they&#39;re created.</div><div><br><=
/div><div>Is this not behaving how you expect?</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
-- &gt;8 --<br>
diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c<br>
index f9ce633b3a..a9517b612a 100644<br>
--- a/hw/i2c/i2c_mux_pca954x.c<br>
+++ b/hw/i2c/i2c_mux_pca954x.c<br>
@@ -189,9 +189,11 @@ static void pca954x_init(Object *obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 /* SMBus modules. Cannot fail. */<br>
=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; c-&gt;nchans; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree gchar *bus_name =3D g_strdup_printf=
(&quot;i2c.%d&quot;, i);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* start all channels as disabled. */<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;enabled[i] =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;bus[i] =3D i2c_init_bus(DEVICE(s), &quot=
;channel[*]&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;bus[i] =3D i2c_init_bus(DEVICE(s), bus_n=
ame);<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 }<br>
<br>
---<br>
<br>
(look at HMP &#39;info qtree&#39; output).<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
With the change:<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.or=
g" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
</blockquote></div></div>

--000000000000860c3d05d6fb1aa9--

