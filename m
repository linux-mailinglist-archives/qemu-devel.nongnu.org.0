Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8984A76E9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 18:34:51 +0100 (CET)
Received: from localhost ([::1]:51192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFJWs-0004Yt-La
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 12:34:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nFIhI-00021R-TQ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:41:32 -0500
Received: from [2607:f8b0:4864:20::934] (port=33357
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nFIh1-00023L-2C
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:41:32 -0500
Received: by mail-ua1-x934.google.com with SMTP id r8so333502uaj.0
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6UJYEuCm/8aV9ng3sAr9C2XDjFyqd7pqAQxImsQoknA=;
 b=aBlFD52oRGYB+HC29c5dh97aNqojMi0Qrog2SQxtKYeHuCCxXVJJZAjIt1y28zAH5y
 iuI8Zx4CFN57ZVYVkgzig+R2lrRnAOh0DX+REuAVaG5V1I6ybwl6iibBGBY4/3oV2aGj
 wuxMrdZlD874jSvulJjUdZa5tWEuTe04OjKslzVP+nGrrzfBmPv/npB8Rf/PQIFSlN2K
 uflWlLJRISmQe5ND0iB4dW7jVHja1sh8037lq51GFmaaFJlEWGX2GI7svjj+ByltZNQG
 DvAK4FsqXaExc32J9dZHfFaDLj3CvCa2ymQG/hGzvZmOnDn3t96koVkofwUIwMD3ZhBk
 zfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6UJYEuCm/8aV9ng3sAr9C2XDjFyqd7pqAQxImsQoknA=;
 b=1KmgWeD9U5qBdroOdpBzPmlbdbGSNndlwd7+8Cnmo4s68qTsSTX9IJVA/+cjmzJowF
 goGmdwXQ9xoT1XsYDvO58bm//kqQ6jT2ZpnIvu704hnN6yU/TUGRgwXfXIXswiX2Cgna
 NLu4SeT8JiymIAWaKQlECYuetprEDIKPjunMphKzpMbeAFoy6HJQMHMsKc6dgx0fJvlY
 UFCr0HHI7gVwvQFiXZHlCBu1Jt/c+drBke01SXdRrlH5e5sTiXipgdcHtfXDj3b5tC9Q
 HQqQ/S5X47QG/UK3wLlJSt48RWzLjdKa48cSRDZ7DQJ0rWyl/DZKl0hQKbxBo1030RPG
 NItg==
X-Gm-Message-State: AOAM533LeglQu7Ixy/W/i1VFIeg+l9aPQzIXG0KKpLFrozpPO+b2yaN9
 A4oPZFKzdv09wT61NGyNTDcbmo4tOdUCqLuZzsGzcg==
X-Google-Smtp-Source: ABdhPJxc0MDSHVaWxL6swp1ROfGA18igPwGT5suvsBuqyD+luD8x1WUyMfGvjHJMaLSOePc9qSCV2ZJbCDg5ng4OhOU=
X-Received: by 2002:a67:ffcb:: with SMTP id w11mr11689104vsq.35.1643820059390; 
 Wed, 02 Feb 2022 08:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20220201163005.989457-1-venture@google.com>
 <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
 <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
 <CAO=notw9jYSc6xGr3_kwuAWHG2J3VJ7WxJT+tL_fbXFfTRrhpw@mail.gmail.com>
In-Reply-To: <CAO=notw9jYSc6xGr3_kwuAWHG2J3VJ7WxJT+tL_fbXFfTRrhpw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 2 Feb 2022 08:40:48 -0800
Message-ID: <CAO=notzLfum_zkXhP+xQ9RTxcpG3oNxwFMPYWz+o1vYdF8ynQg@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: flatten pca954x mux device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Corey Minyard <cminyard@mvista.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="000000000000b7450805d70baebe"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=venture@google.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000b7450805d70baebe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 2, 2022 at 8:34 AM Patrick Venture <venture@google.com> wrote:

>
>
> On Tue, Feb 1, 2022 at 12:54 PM Patrick Venture <venture@google.com>
> wrote:
>
>>
>>
>> On Tue, Feb 1, 2022 at 11:02 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org>
>> wrote:
>>
>>> On 1/2/22 17:30, Patrick Venture wrote:
>>> > Previously this device created N subdevices which each owned an i2c
>>> bus.
>>> > Now this device simply owns the N i2c busses directly.
>>> >
>>> > Tested: Verified devices behind mux are still accessible via qmp and
>>> i2c
>>> > from within an arm32 SoC.
>>> >
>>> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>>> > Signed-off-by: Patrick Venture <venture@google.com>
>>> > ---
>>> >   hw/i2c/i2c_mux_pca954x.c | 75
>>> ++++++----------------------------------
>>> >   1 file changed, 11 insertions(+), 64 deletions(-)
>>>
>>> >   static void pca954x_init(Object *obj)
>>> >   {
>>> >       Pca954xState *s =3D PCA954X(obj);
>>> >       Pca954xClass *c =3D PCA954X_GET_CLASS(obj);
>>> >       int i;
>>> >
>>> > -    /* Only initialize the children we expect. */
>>> > +    /* SMBus modules. Cannot fail. */
>>> >       for (i =3D 0; i < c->nchans; i++) {
>>> > -        object_initialize_child(obj, "channel[*]", &s->channel[i],
>>> > -                                TYPE_PCA954X_CHANNEL);
>>> > +        /* start all channels as disabled. */
>>> > +        s->enabled[i] =3D false;
>>> > +        s->bus[i] =3D i2c_init_bus(DEVICE(s), "channel[*]");
>>>
>>> This is not a QOM property, so you need to initialize manually:
>>>
>>
>> that was my suspicion but this is the output I'm seeing:
>>
>> {'execute': 'qom-list', 'arguments': { 'path':
>> '/machine/soc/smbus[0]/i2c-bus/child[0]' }}
>>
>> {"return": [
>> {"name": "type", "type": "string"},
>> {"name": "parent_bus", "type": "link<bus>"},
>> {"name": "realized", "type": "bool"},
>> {"name": "hotplugged", "type": "bool"},
>> {"name": "hotpluggable", "type": "bool"},
>> {"name": "address", "type": "uint8"},
>> {"name": "channel[3]", "type": "child<i2c-bus>"},
>> {"name": "channel[0]", "type": "child<i2c-bus>"},
>> {"name": "channel[1]", "type": "child<i2c-bus>"},
>> {"name": "channel[2]", "type": "child<i2c-bus>"}
>> ]}
>>
>> It seems to be naming them via the order they're created.
>>
>> Is this not behaving how you expect?
>>
>
> Philippe,
>
> I0202 08:29:45.380384  6641 stream.go:31] qemu: child buses at "pca9546":
> "channel[*]", "channel[*]", "channel[*]", "channel[*]"
>
> Ok, so that's interesting.  In one system (using qom-list) it's correct,
> but then when using it to do path assignment (qdev-monitor), it fails...
>
> I'm not as fond of the name i2c-bus.%d, since they're referred to as
> channels in the datasheet.  If I do the manual name creation, can I keep
> the name channel or should I pivot over?
>
> Thanks
>
>
>>
>>>
>>> -- >8 --
>>> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
>>> index f9ce633b3a..a9517b612a 100644
>>> --- a/hw/i2c/i2c_mux_pca954x.c
>>> +++ b/hw/i2c/i2c_mux_pca954x.c
>>> @@ -189,9 +189,11 @@ static void pca954x_init(Object *obj)
>>>
>>>       /* SMBus modules. Cannot fail. */
>>>       for (i =3D 0; i < c->nchans; i++) {
>>> +        g_autofree gchar *bus_name =3D g_strdup_printf("i2c.%d", i);
>>> +
>>>           /* start all channels as disabled. */
>>>           s->enabled[i] =3D false;
>>> -        s->bus[i] =3D i2c_init_bus(DEVICE(s), "channel[*]");
>>> +        s->bus[i] =3D i2c_init_bus(DEVICE(s), bus_name);
>>>       }
>>>   }
>>>
>>> ---
>>>
>>> (look at HMP 'info qtree' output).
>>>
>>> >       }
>>> >   }
>>>
>>> With the change:
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>
>>
Just saw your reply, and found a bunch of other non-spam in my spam
folder.  I sent the message to the anti-spam team, hopefully that'll
resolve this for myself and presumably others.

I definitely see the same result with the qdev-monitor, but was really
surprised that the qom-list worked.  I'll explicitly set the name, and
i2c.%d is fine.  The detail that they're channels is not really important
to the end user presumably.

I'll have v2 out shortly.

thanks,
Patrick

--000000000000b7450805d70baebe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 2, 2022 at 8:34 AM Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 12:54 PM Patrick Ve=
nture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">venture@g=
oogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 11:=
02 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" ta=
rget=3D"_blank">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 1/2/22 17:30, Patrick Venture wrote:<br=
>
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
g" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote></div></div></=
blockquote></div></div></blockquote><div><br></div><div>Just saw your reply=
, and found a bunch of other non-spam in my spam folder.=C2=A0 I sent the m=
essage to the anti-spam team, hopefully that&#39;ll resolve this for myself=
 and presumably others.</div><div><br></div><div>I definitely see the same =
result with the qdev-monitor, but was really surprised that the qom-list wo=
rked.=C2=A0 I&#39;ll explicitly set the name, and i2c.%d is fine.=C2=A0 The=
 detail that they&#39;re channels is not really important to the end user p=
resumably.</div><div><br></div><div>I&#39;ll have v2 out shortly.</div><div=
><br></div><div>thanks,</div><div>Patrick=C2=A0</div></div></div>

--000000000000b7450805d70baebe--

