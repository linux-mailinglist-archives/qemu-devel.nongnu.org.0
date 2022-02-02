Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC894A7A84
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 22:33:05 +0100 (CET)
Received: from localhost ([::1]:52590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFNFQ-0003l1-Qp
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 16:33:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nFNDM-0002CS-Lx
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:30:58 -0500
Received: from [2607:f8b0:4864:20::92e] (port=34647
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nFNDJ-0000wD-BB
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 16:30:55 -0500
Received: by mail-ua1-x92e.google.com with SMTP id 60so1714278uae.1
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 13:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E144bm7GdFF7io5bvdzqiPeudqIJli8D0VyCsxM7ZLQ=;
 b=jCOmmvmuD2VsRSQrbTPq+POgkuKZB2PFLCGNuoAT2sg4WNDQMnT8VXzS+DTx2lMJ4l
 g9JlGv0ibOeBPB/AWrP1mDi1wPF+cIKh23tT6OuDRHial8yvnwL66KHRUZ7WWbAX89yk
 vRy7DmgXAejzACxPyZZx4lC5RqjRYImr1e0Lcx/Uo+gsk83aMCYcERf60rC2mXTytOCI
 h/oVGEmVPDJ1hXP489Rr6OdpwaxRqUS0WtQvsDeslzN7iRXUAqfzyUWTBDkvIcZAWIso
 Q/ZqQx6r/QHVw60QpVyNBSXR2wfPxYIZELYjzMLFm5IrZqk1w2Y0OfzpHA0R4P8Zjm2z
 uDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E144bm7GdFF7io5bvdzqiPeudqIJli8D0VyCsxM7ZLQ=;
 b=yfiwf/NUi7DHGM0BCzVamWwHUKAi1ElFc/YFXQ4C7HfgCZQ/FbByla5IFrvQdl+iXv
 pYgvZStdkVbNWwgrjOOxnSi0Jd2gHxFJ3MBcJeaZNuV+EVWbwo+At/spXVOge32ekajA
 mVbueFDmjSw9gAVEXvxtlet9rkteqMzm9gWqL8TEdIr7WSZlBJUlWfbaPwgab+ychsyP
 gvlbpVZoB0axaOCIj+juVb+zvwBk9layg8UlqQuHpPhwlNLGXhSc7J+PkICistqczAqa
 FWdl2dgxByiM7D7oP3JaDnD0sJAjzqPa3PIUlpBRnHAGSzeAFE2CtU4IlUZkWb48nIhs
 NlPA==
X-Gm-Message-State: AOAM533mAIzCyDJPsx5vcq/TZT2+m39ZvU4cqlRjJCKN3SHAK84qhLYv
 2fPRFJQ96vg9qrB+XgBTXFq7kvbubLBjxRxunGYQ3A==
X-Google-Smtp-Source: ABdhPJz9Hyve41fx94kr+sK42alW6ViUFLQ9+BmPZqQ7pvB38q5UMWEB05vlicMmNXqbWk/kL64o+f03gLFNNGFxkvo=
X-Received: by 2002:a67:e0c2:: with SMTP id m2mr12041283vsl.49.1643837450619; 
 Wed, 02 Feb 2022 13:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20220201163005.989457-1-venture@google.com>
 <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
 <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
 <CAO=notw9jYSc6xGr3_kwuAWHG2J3VJ7WxJT+tL_fbXFfTRrhpw@mail.gmail.com>
 <CAO=notzLfum_zkXhP+xQ9RTxcpG3oNxwFMPYWz+o1vYdF8ynQg@mail.gmail.com>
 <f10cbf13-ac56-cbe0-02f8-1d96a687700e@amsat.org>
In-Reply-To: <f10cbf13-ac56-cbe0-02f8-1d96a687700e@amsat.org>
From: Patrick Venture <venture@google.com>
Date: Wed, 2 Feb 2022 13:30:39 -0800
Message-ID: <CAO=notzN4_Sid6AvwDa4UUCjrUQs+vCf8NA-PmiHULiyGwUQMQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: flatten pca954x mux device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Corey Minyard <cminyard@mvista.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="00000000000050b8c405d70fbb9d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=venture@google.com; helo=mail-ua1-x92e.google.com
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

--00000000000050b8c405d70fbb9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 2, 2022 at 9:31 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> On 2/2/22 17:40, Patrick Venture wrote:
>
> >     Philippe,
> >
> >     I0202 08:29:45.380384  6641 stream.go:31] qemu: child buses at
> >     "pca9546": "channel[*]", "channel[*]", "channel[*]", "channel[*]"
> >
> >     Ok, so that's interesting.  In one system (using qom-list) it's
> >     correct, but then when using it to do path assignment
> >     (qdev-monitor), it fails...
> >
> >     I'm not as fond of the name i2c-bus.%d, since they're referred to a=
s
> >     channels in the datasheet.  If I do the manual name creation, can I
> >     keep the name channel or should I pivot over?
> >
> >     Thanks
> >
> >
> >             -- >8 --
> >             diff --git a/hw/i2c/i2c_mux_pca954x.c
> b/hw/i2c/i2c_mux_pca954x.c
> >             index f9ce633b3a..a9517b612a 100644
> >             --- a/hw/i2c/i2c_mux_pca954x.c
> >             +++ b/hw/i2c/i2c_mux_pca954x.c
> >             @@ -189,9 +189,11 @@ static void pca954x_init(Object *obj)
> >
> >                    /* SMBus modules. Cannot fail. */
> >                    for (i =3D 0; i < c->nchans; i++) {
> >             +        g_autofree gchar *bus_name =3D
> >             g_strdup_printf("i2c.%d", i);
> >             +
> >                        /* start all channels as disabled. */
> >                        s->enabled[i] =3D false;
> >             -        s->bus[i] =3D i2c_init_bus(DEVICE(s), "channel[*]"=
);
> >             +        s->bus[i] =3D i2c_init_bus(DEVICE(s), bus_name);
> >                    }
> >                }
> >
> >             ---
> >
> >             (look at HMP 'info qtree' output).
> >
> >              >       }
> >              >   }
> >
> >             With the change:
> >             Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org
> >             <mailto:f4bug@amsat.org>>
> >             Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org
> >             <mailto:f4bug@amsat.org>>
> >
> >
> > Just saw your reply, and found a bunch of other non-spam in my spam
> > folder.  I sent the message to the anti-spam team, hopefully that'll
> > resolve this for myself and presumably others.
>
> Thanks. I suppose the problem is the amsat.org domain.
>

Yours aren't the only ones I've missed, but who knows.


>
> > I definitely see the same result with the qdev-monitor, but was really
> > surprised that the qom-list worked.  I'll explicitly set the name, and
> > i2c.%d is fine.  The detail that they're channels is not really
> > important to the end user presumably.
>
> I agree it is better to follow datasheets, thus I am fine if you
> change and use channel. How would it look like? "channel.0"?
> FYI qdev busses are described in docs/qdev-device-use.txt.
>

Thanks.  I went with i2c.%d in v2, since I figured it wasn't super
important.


>
> We should be able to plug a device using some command line
> such "-device i2c_test_dev,bus=3Dchannel.0,addr=3D0x55".
> I wonder how to select the base PCA9548 ...
>

So I have been working on that, and I have been running into a different
issue, but related.

/smbus[1]/i2c-bus/pca9546/i2c.0 works to add a device via command line.

However, if there are two pca9546s on that main bus.  So if i do:

/smbus[1]/i2c-bus/child[0]/i2c.0 it'll respond that there is no child[0],
but rather includes "pca9546, pca9546"


>
> Maybe we need to pass the PCA ID to pca954x_init(), so we can
> name "channel.2.0" for the 1st channel on the 2nd PCA?
>

It sounds like you're thinking about the same problem overall.


>
> Regards,
>
> Phil.
>

--00000000000050b8c405d70fbb9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 2, 2022 at 9:31 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 2/2/22 17:40, Patrick Venture wrote:<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Philippe,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I0202 08:29:45.380384 =C2=A06641 stream.go:31] qemu=
: child buses at<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;pca9546&quot;: &quot;channel[*]&quot;, &quot;=
channel[*]&quot;, &quot;channel[*]&quot;, &quot;channel[*]&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Ok, so that&#39;s interesting.=C2=A0 In one system =
(using qom-list) it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0correct, but then when using it to do path assignme=
nt<br>
&gt;=C2=A0 =C2=A0 =C2=A0(qdev-monitor), it fails...<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m not as fond of the name i2c-bus.%d, since t=
hey&#39;re referred to as<br>
&gt;=C2=A0 =C2=A0 =C2=A0channels in the datasheet.=C2=A0 If I do the manual=
 name creation, can I<br>
&gt;=C2=A0 =C2=A0 =C2=A0keep the name channel or should I pivot over?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- &gt;8 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/hw/i2c/i2c=
_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index f9ce633b3a..a9517=
b612a 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/hw/i2c/i2c_mux_pc=
a954x.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/hw/i2c/i2c_mux_pc=
a954x.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -189,9 +189,11 @@ st=
atic void pca954x_init(Object *obj)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=
* SMBus modules. Cannot fail. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
or (i =3D 0; i &lt; c-&gt;nchans; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 g_autofree gchar *bus_name =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_strdup_printf(&quot;i=
2c.%d&quot;, i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* start all channels as disabled. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 s-&gt;enabled[i] =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;bus[i] =3D i2c_init_bus(DEVICE(s), &quot;channel[*]&quot;);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s-&gt;bus[i] =3D i2c_init_bus(DEVICE(s), bus_name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(look at HMP &#39;info =
qtree&#39; output).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0With the change:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Reviewed-by: Philippe M=
athieu-Daud=C3=A9 &lt;<a>f4bug@amsat.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a>f4bug@ams=
at.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Tested-by: Philippe Mat=
hieu-Daud=C3=A9 &lt;<a>f4bug@amsat.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a>f4bug@ams=
at.org</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Just saw your reply, and found a bunch of other non-spam in my spam <b=
r>
&gt; folder.=C2=A0 I sent the message to the anti-spam team, hopefully that=
&#39;ll <br>
&gt; resolve this for myself and presumably others.<br>
<br>
Thanks. I suppose the problem is the <a rel=3D"noreferrer">amsat.org</a> do=
main.<br></blockquote><div><br></div><div>Yours aren&#39;t the only ones I&=
#39;ve missed, but who knows.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt; I definitely see the same result with the qdev-monitor, but was really=
 <br>
&gt; surprised that the qom-list worked.=C2=A0 I&#39;ll explicitly set the =
name, and <br>
&gt; i2c.%d is fine.=C2=A0 The detail that they&#39;re channels is not real=
ly <br>
&gt; important to the end user presumably.<br>
<br>
I agree it is better to follow datasheets, thus I am fine if you<br>
change and use channel. How would it look like? &quot;channel.0&quot;?<br>
FYI qdev busses are described in docs/qdev-device-use.txt.<br></blockquote>=
<div><br></div><div>Thanks.=C2=A0 I went with i2c.%d in v2, since I figured=
 it wasn&#39;t super important.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
We should be able to plug a device using some command line<br>
such &quot;-device i2c_test_dev,bus=3Dchannel.0,addr=3D0x55&quot;.<br>
I wonder how to select the base PCA9548 ...<br></blockquote><div><br></div>=
<div>So I have been working on that, and I have been running into a differe=
nt issue, but related.</div><div><br></div><div>/smbus[1]/i2c-bus/pca9546/i=
2c.0 works to add a device via command line.<br></div><div><br></div><div>H=
owever, if there are two pca9546s on that main bus.=C2=A0 So if i do:<br><b=
r></div><div>/smbus[1]/i2c-bus/child[0]/i2c.0 it&#39;ll respond that there =
is no child[0], but rather includes &quot;pca9546, pca9546&quot;<br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Maybe we need to pass the PCA ID to pca954x_init(), so we can<br>
name &quot;channel.2.0&quot; for the 1st channel on the 2nd PCA?<br></block=
quote><div><br></div><div>It sounds like you&#39;re thinking about the same=
 problem overall.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div></div>

--00000000000050b8c405d70fbb9d--

