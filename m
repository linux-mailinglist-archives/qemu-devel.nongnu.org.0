Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CA9339010
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:31:36 +0100 (CET)
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKipD-0004Qh-Cy
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1lKihY-0003KI-U8
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:23:40 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1lKihW-0003A3-NI
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:23:40 -0500
Received: by mail-pl1-x62e.google.com with SMTP id j6so11991729plx.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 06:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wrRICl2LKX1A+npXzMp0cSWCIWvlFYp7RX0e9BIiVQg=;
 b=h2XpmmUIM5Fa5VJjn8nQUD/HPkW9NfWGGcMEafe8JaRkjFXZv7K2N9NfPjjCATf8rl
 nIMmFhn7Og52+df+OBdsSkPaHmuRtCH+WB5gzptICkgAPBGIlM/cDoP+6ScSs2gH4CAm
 sqh2rsnh4DIEQkGzlKy0Rs0455/WWVF5Q+ouxrhjjJbk4HTX+O+P2kj3qm2WX8iqQerv
 XBs8Wz6/OaP0Ny7HwkMTF7oggWjZOnpuuayCI3mko/GUiP8E4rwhO9oKJKxOrofvhMQP
 AsAXUNSR9jXqPWr8RewSisPxvtahMyMd7a+O5mE40FRn2cj9c+RIW/65RI45/pelQ21L
 SoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrRICl2LKX1A+npXzMp0cSWCIWvlFYp7RX0e9BIiVQg=;
 b=c0Af/voZYetOHWZ/cVPKk5MOegoVAfKdnq+4adEi11iU3HTCaf4e70WYX7qIy2KOgF
 Yq+PJaNC1IQPdzt2sczgIROWO/IUH7dzTsiHgzFF9Iy47MtXxVrCgAeWMcK1dTknbTaF
 KBeiZcoFiY5fXsAyZtk1hax87Zv8nIgh6b1cn0zevJZFCyTAK7MQBsWuBVOCXm2oCMSj
 EUWYy6QYrNxZk+7bN0bwKrPJ7r1wM+lTvBFHqh4lTaDB/b1g2SlbdH1tKzTjmj6EhFA1
 osm8PbIsotNqKtfevvM5b2U/SKMlge9NhAjbzJWl8BUPGQ57ukuWN91gB/90m1RHLK13
 RnvA==
X-Gm-Message-State: AOAM532sbOKQ6Cx0E7/1nNILhMLcAHvw67F4p6f9CM4O/ar5IN3jPHC0
 YEaBwResxg4MWDlFPxdaq4K4sFkvTrc4tEdtkZU=
X-Google-Smtp-Source: ABdhPJwGt8jiyKB3tv10hLbOlDCQIZkAKvEhSHOAPdjt9N1M52bO+1hzt55rgW30NWMqdsIieIvL1GNVwkRsFDrZmfU=
X-Received: by 2002:a17:902:da8d:b029:e5:c7d9:81f2 with SMTP id
 j13-20020a170902da8db02900e5c7d981f2mr13639980plx.21.1615559016581; Fri, 12
 Mar 2021 06:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20210205164106.6664-1-phillip.ennen@gmail.com>
 <87o8g1j0ee.fsf@dusky.pond.sub.org>
In-Reply-To: <87o8g1j0ee.fsf@dusky.pond.sub.org>
From: Phillip Tennen <phillip.ennen@gmail.com>
Date: Fri, 12 Mar 2021 15:23:25 +0100
Message-ID: <CAAi_9z4YObJkHxvxS-KVc2W+riGnsQzdA29QnyhVnKTGJnbybQ@mail.gmail.com>
Subject: Re: [PATCH v2] net/macos: implement vmnet-based network device
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004c0f4c05bd57a52f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=phillip.ennen@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, jasowang@redhat.com,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004c0f4c05bd57a52f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Markus, thanks for the review. I apologize for my lateness in getting back
to you.

I've integrated most of your suggestions, and will submit a v5 that
incorporates them. I've left a couple comments and questions for you below.

Aside: I haven't responded inline to emails like this before, I'm hoping it
shows
up correctly for you! I appreciate how understanding everyone's been
towards my
newness to this development & review format. I cut out the irrelevant bits
for brevity and am unsure if that breaks anything.

Phillip

On Tue, Mar 2, 2021 at 11:49 AM Markus Armbruster <armbru@redhat.com> wrote=
:

> Phillip, this doesn't apply anymore.  I'm reviewing the QAPI schema part
> anyway.
>
> Peter, there is a question for you below.  Search for "Sphinx".
>
> phillip.ennen@gmail.com writes:
>
> > From: Phillip Tennen <phillip@axleos.com>
> >
> > This patch implements a new netdev device, reachable via -netdev
> > vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.
> >
>
[...]

> > diff --git a/qapi/net.json b/qapi/net.json
> > index c31748c87f..e4d4143243 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -450,6 +450,115 @@
> >      '*vhostdev':     'str',
> >      '*queues':       'int' } }
> >
> > +##
> > +# @VmnetOperatingMode:
> > +#
> > +# The operating modes in which a vmnet netdev can run
> > +# Only available on macOS
>
> Please end these sentences with a period.
>
> I'm not sure we need "Only available on macOS".  Rendered documentation
> shows the 'if' like
>
> [...]

> > +#                      (only valid with mode=3Dhost|shared)
>
> Isn't that trivial?  The type's only use is as union branch for modes
> host and shared.
>
True. I added comments like this for clarity, but I accept that the schema
should make it clear alone.

>
> > +#                      (must be specified with dhcp-end-address and
> > +#                       dhcp-subnet-mask)
>
> Does that mean you have to specify all three parameters or none?
>
That's correct. You may provide either none or all three.

[...]

> > +#                      (allocated automatically if unset)
>
> How?
>
vmnet automatically allocates specifics like the MAC address, DHCP pool,
etc,
if not explicitly supplied. I'll add some wording to this effect.
[...]

>
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'NetdevVmnetOptions',
> > +  'data': {'options': 'NetdevVmnetModeOptions' },
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
>
> Awkward.
>
> You can't use make NetdevVmnetModeOptions a branch of union Netdev,
> because NetdevVmnetModeOptions is a union, and a branch must be a
> struct.  To work around, you wrap struct NetdevVmnetOptions around union
> NetdevVmnetModeOptions.
>
> NetdevVmnetModeOptions has no common members other than the union
> discriminator.  Why not add them as three branches to Netdev?
>
> Just to be sure I understand, you're proposing adding 3 new fields to
Netdev,
like so:
    'vmnet-macos-bridged': { 'type': 'NetdevVmnetModeOptionsBridged',
                     'if': 'defined(CONFIG_DARWIN)' },
    'vmnet-macos-host': { 'type': 'NetdevVmnetModeOptionsHostOrShared',
                     'if': 'defined(CONFIG_DARWIN)' },
    'vmnet-macos-shared': { 'type': 'NetdevVmnetModeOptionsHostOrShared',
                     'if': 'defined(CONFIG_DARWIN)' },
... where each of those "ModeOptions" structs contains a new "mode" field
extracted from the union. Did I get your intent right? I'm assuming there
wouldn't be issues with "vmnet-macos" referenced elsewhere.

Thank you!
Phillip

--0000000000004c0f4c05bd57a52f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Markus, thanks for =
the review. I apologize for my lateness=C2=A0in getting back to you.</div><=
div><br></div><div>I&#39;ve integrated most of your suggestions, and will s=
ubmit a v5 that=C2=A0</div><div>incorporates them. I&#39;ve left a couple c=
omments and questions for you below.</div><div><br></div><div>Aside: I have=
n&#39;t responded inline to emails like this before, I&#39;m hoping it show=
s</div><div>up correctly for you! I appreciate how understanding everyone&#=
39;s been towards my</div><div>newness to this development &amp; review for=
mat. I cut out the irrelevant bits</div><div>for brevity and am unsure if t=
hat breaks anything.</div><div><br></div><div>Phillip</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 =
at 11:49 AM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armb=
ru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;border-left-color:rgb(204,204,204);padding-left:1ex">Phillip, this doesn&=
#39;t apply anymore.=C2=A0 I&#39;m reviewing the QAPI schema part<br>
anyway.<br>
<br>
Peter, there is a question for you below.=C2=A0 Search for &quot;Sphinx&quo=
t;.<br>
<br>
<a href=3D"mailto:phillip.ennen@gmail.com" target=3D"_blank">phillip.ennen@=
gmail.com</a> writes:<br>
<br>
&gt; From: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com" target=
=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt;<br>
&gt; This patch implements a new netdev device, reachable via -netdev<br>
&gt; vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.=
<br>
&gt;<br></blockquote><div>[...]=C2=A0<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/qapi/net.json b/qapi/net.json<br>
&gt; index c31748c87f..e4d4143243 100644<br>
&gt; --- a/qapi/net.json<br>
&gt; +++ b/qapi/net.json<br>
&gt; @@ -450,6 +450,115 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*vhostdev&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#=
39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*queues&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
int&#39; } }<br>
&gt;=C2=A0 <br>
&gt; +##<br>
&gt; +# @VmnetOperatingMode:<br>
&gt; +#<br>
&gt; +# The operating modes in which a vmnet netdev can run<br>
&gt; +# Only available on macOS<br>
<br>
Please end these sentences with a period.<br>
<br>
I&#39;m not sure we need &quot;Only available on macOS&quot;.=C2=A0 Rendere=
d documentation<br>
shows the &#39;if&#39; like<br><br></blockquote><div>[...]=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddin=
g-left:1ex">
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (only valid with mode=3Dhost|shared)<br>
<br>
Isn&#39;t that trivial?=C2=A0 The type&#39;s only use is as union branch fo=
r modes<br>
host and shared.<br></blockquote><div>True. I added comments like this for =
clarity, but I accept that the schema</div><div>should make it clear alone.=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (must be specified with dhcp-end-address and <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dhcp-subnet-mask)<br>
<br>
Does that mean you have to specify all three parameters or none?<br></block=
quote><div>That&#39;s correct. You may provide either none or all three.</d=
iv><div><br></div><div>[...]=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;border-left-color:rgb(204,204,204);padding-left:1ex">
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (allocated automatically if unset)<br>
<br>
How?<br></blockquote><div>vmnet automatically allocates specifics like the =
MAC address, DHCP pool, etc,</div><div>if not explicitly supplied. I&#39;ll=
 add some wording to this effect.</div><div>[...]=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; +#<br>
&gt; +# Since: 6.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {&#39;options&#39;: &#39;NetdevVmnetModeOption=
s&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_DARWIN)&#39; }<br>
&gt; +<br>
<br>
Awkward.<br>
<br>
You can&#39;t use make NetdevVmnetModeOptions a branch of union Netdev,<br>
because NetdevVmnetModeOptions is a union, and a branch must be a<br>
struct.=C2=A0 To work around, you wrap struct NetdevVmnetOptions around uni=
on<br>
NetdevVmnetModeOptions.<br>
<br>
NetdevVmnetModeOptions has no common members other than the union<br>
discriminator.=C2=A0 Why not add them as three branches to Netdev?<br><br><=
/blockquote><div>Just to be sure I understand, you&#39;re proposing adding =
3 new fields to Netdev,=C2=A0</div><div>like so:</div><div><div>=C2=A0 =C2=
=A0 &#39;vmnet-macos-bridged&#39;: { &#39;type&#39;: &#39;NetdevVmnetModeOp=
tionsBridged&#39;,=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;if&#39;: &#39;defined(CONFIG_DAR=
WIN)&#39; },</div><div>=C2=A0 =C2=A0 &#39;vmnet-macos-host&#39;: { &#39;typ=
e&#39;: &#39;NetdevVmnetModeOptionsHostOrShared&#39;,=C2=A0</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;if&#39;: &#39;defined(CONFIG_DARWIN)&#39; },</div><div>=C2=A0 =C2=A0 &#3=
9;vmnet-macos-shared&#39;: { &#39;type&#39;: &#39;NetdevVmnetModeOptionsHos=
tOrShared&#39;,=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;if&#39;: &#39;defined(CONFIG_DARWIN)=
&#39; },</div></div><div>... where each of those &quot;ModeOptions&quot; st=
ructs contains a new &quot;mode&quot; field=C2=A0</div><div>extracted from =
the union. Did I get your intent right? I&#39;m assuming there</div><div>wo=
uldn&#39;t be issues with &quot;vmnet-macos&quot; referenced elsewhere.</di=
v><div><br></div><div>Thank you!</div><div>Phillip</div></div></div></div><=
/div>

--0000000000004c0f4c05bd57a52f--

