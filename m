Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863B34A776A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 19:03:28 +0100 (CET)
Received: from localhost ([::1]:50040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFJyZ-0007YD-KG
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 13:03:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nFIak-0006Cz-S6
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:34:47 -0500
Received: from [2607:f8b0:4864:20::929] (port=42914
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nFIai-00005P-Ol
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:34:46 -0500
Received: by mail-ua1-x929.google.com with SMTP id e17so137894uad.9
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 08:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ThK1ncxv4XZ8WNd5qDB7t8/lRyy36pZGZHRv5DVJ4no=;
 b=IFa9k46QhVtl3cg1JaaZyvkKbOHG2tONdbvYeykOSBmPlIiYHphPnkG10w4/X/DZNc
 UBce31cf+teIjTVvwPVS/hN/5O8ZRFgLKJg5B1UG/N9axHz0jr3so6JDlieeV5lT96xf
 Jl+cPRgjLzgZqrvbLRBULgTMxCnk2scfCByEhbo/c/NedStavgof+uA1dwLVA/3S2xlA
 Zhj70rKVTEEltIAkUnYQjvQV2KSlAI4gYmcfzXyWJCkCY9A+olBkDxU0raLuwF3lISCY
 n159Csv49qUJLKgXaZRqOXIc9VqTOh4Boyu0mqPhqfSbcLJtQhH21XVa/j0Xvz/IsZRo
 bVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ThK1ncxv4XZ8WNd5qDB7t8/lRyy36pZGZHRv5DVJ4no=;
 b=CYiertPsbfxudJxVeT3OVm1gcAYRW5qw01Eznakmogi5NICTbc5mVXf8affBINBVnq
 peagzdtUL/4ueGM3TUVwDYcy77z/JYRdHdru+HKOQpY0Aawp0rCYPsJUg95sJ06FsnMB
 lXRWMRaEPrCMUFgE8RhaM33V+HJLC+2dO1LXbFDBbStWlJnTZ/TeWISviDNL9k1qa0o9
 UCPRi0Ffz5rAh2ueeqt8AvBcBEYq0G1My8XmveKeNWCttaAtkFqV9pjo5AYot9gQkR5e
 AIyzcUD9RsOc6B4OIfJTbzSyp2OYz2xZdk73xk9Yqo9qyS2SJyZE4TU+eVBB+YeyyQnt
 yzKQ==
X-Gm-Message-State: AOAM530OLLyx/eweHDsDaCmRguFwqf1/nR1GAiWsld6XqbsY3zHm5e8e
 E6dQdYA5j2vKXlaSbkOCsZuqfqENo1sgaHkkJ5U7Lg==
X-Google-Smtp-Source: ABdhPJzw4crndAgstOhsDahlHwXIW1bOaJXPRWkmM/F+/A9F8iiZLdLQC+KL3BzoVLLIPRlwPJ6WkA+SahatPjVJ3ns=
X-Received: by 2002:a9f:2626:: with SMTP id 35mr12216066uag.40.1643819683557; 
 Wed, 02 Feb 2022 08:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20220201163005.989457-1-venture@google.com>
 <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
 <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
In-Reply-To: <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 2 Feb 2022 08:34:32 -0800
Message-ID: <CAO=notw9jYSc6xGr3_kwuAWHG2J3VJ7WxJT+tL_fbXFfTRrhpw@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: flatten pca954x mux device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Corey Minyard <cminyard@mvista.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="00000000000050c60605d70b988c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=venture@google.com; helo=mail-ua1-x929.google.com
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

--00000000000050c60605d70b988c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 1, 2022 at 12:54 PM Patrick Venture <venture@google.com> wrote:

>
>
> On Tue, Feb 1, 2022 at 11:02 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
> wrote:
>
>> On 1/2/22 17:30, Patrick Venture wrote:
>> > Previously this device created N subdevices which each owned an i2c bu=
s.
>> > Now this device simply owns the N i2c busses directly.
>> >
>> > Tested: Verified devices behind mux are still accessible via qmp and i=
2c
>> > from within an arm32 SoC.
>> >
>> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> > Signed-off-by: Patrick Venture <venture@google.com>
>> > ---
>> >   hw/i2c/i2c_mux_pca954x.c | 75 ++++++--------------------------------=
--
>> >   1 file changed, 11 insertions(+), 64 deletions(-)
>>
>> >   static void pca954x_init(Object *obj)
>> >   {
>> >       Pca954xState *s =3D PCA954X(obj);
>> >       Pca954xClass *c =3D PCA954X_GET_CLASS(obj);
>> >       int i;
>> >
>> > -    /* Only initialize the children we expect. */
>> > +    /* SMBus modules. Cannot fail. */
>> >       for (i =3D 0; i < c->nchans; i++) {
>> > -        object_initialize_child(obj, "channel[*]", &s->channel[i],
>> > -                                TYPE_PCA954X_CHANNEL);
>> > +        /* start all channels as disabled. */
>> > +        s->enabled[i] =3D false;
>> > +        s->bus[i] =3D i2c_init_bus(DEVICE(s), "channel[*]");
>>
>> This is not a QOM property, so you need to initialize manually:
>>
>
> that was my suspicion but this is the output I'm seeing:
>
> {'execute': 'qom-list', 'arguments': { 'path':
> '/machine/soc/smbus[0]/i2c-bus/child[0]' }}
>
> {"return": [
> {"name": "type", "type": "string"},
> {"name": "parent_bus", "type": "link<bus>"},
> {"name": "realized", "type": "bool"},
> {"name": "hotplugged", "type": "bool"},
> {"name": "hotpluggable", "type": "bool"},
> {"name": "address", "type": "uint8"},
> {"name": "channel[3]", "type": "child<i2c-bus>"},
> {"name": "channel[0]", "type": "child<i2c-bus>"},
> {"name": "channel[1]", "type": "child<i2c-bus>"},
> {"name": "channel[2]", "type": "child<i2c-bus>"}
> ]}
>
> It seems to be naming them via the order they're created.
>
> Is this not behaving how you expect?
>

Philippe,

I0202 08:29:45.380384  6641 stream.go:31] qemu: child buses at "pca9546":
"channel[*]", "channel[*]", "channel[*]", "channel[*]"

Ok, so that's interesting.  In one system (using qom-list) it's correct,
but then when using it to do path assignment (qdev-monitor), it fails...

I'm not as fond of the name i2c-bus.%d, since they're referred to as
channels in the datasheet.  If I do the manual name creation, can I keep
the name channel or should I pivot over?

Thanks


>
>>
>> -- >8 --
>> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
>> index f9ce633b3a..a9517b612a 100644
>> --- a/hw/i2c/i2c_mux_pca954x.c
>> +++ b/hw/i2c/i2c_mux_pca954x.c
>> @@ -189,9 +189,11 @@ static void pca954x_init(Object *obj)
>>
>>       /* SMBus modules. Cannot fail. */
>>       for (i =3D 0; i < c->nchans; i++) {
>> +        g_autofree gchar *bus_name =3D g_strdup_printf("i2c.%d", i);
>> +
>>           /* start all channels as disabled. */
>>           s->enabled[i] =3D false;
>> -        s->bus[i] =3D i2c_init_bus(DEVICE(s), "channel[*]");
>> +        s->bus[i] =3D i2c_init_bus(DEVICE(s), bus_name);
>>       }
>>   }
>>
>> ---
>>
>> (look at HMP 'info qtree' output).
>>
>> >       }
>> >   }
>>
>> With the change:
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>

--00000000000050c60605d70b988c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 12:54 PM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 11:02 AM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank"=
>f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 1/2/22 17:30, Patrick Venture wrote:<br>
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
/div><div>Is this not behaving how you expect?</div></div></div></blockquot=
e><div><br></div><div>Philippe,<br></div><div><br>I0202 08:29:45.380384 =C2=
=A06641 stream.go:31] qemu: child buses at &quot;pca9546&quot;: &quot;chann=
el[*]&quot;, &quot;channel[*]&quot;, &quot;channel[*]&quot;, &quot;channel[=
*]&quot;<br><br>Ok, so that&#39;s interesting.=C2=A0 In one system (using q=
om-list) it&#39;s correct, but then when using it to do path assignment (qd=
ev-monitor), it fails...</div><div><br></div><div>I&#39;m not as fond of th=
e name i2c-bus.%d, since they&#39;re referred to as channels in the datashe=
et.=C2=A0 If I do the manual name creation, can I keep the name channel or =
should I pivot over?</div><div><br></div><div>Thanks<br><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
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
</blockquote></div></div>

--00000000000050c60605d70b988c--

