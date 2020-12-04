Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852042CEE52
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 13:47:02 +0100 (CET)
Received: from localhost ([::1]:56112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klAUH-0003BX-5k
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 07:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klATF-0002kx-0q
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:45:57 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klATD-0003vp-1l
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:45:56 -0500
Received: by mail-ed1-x542.google.com with SMTP id ck29so5668196edb.8
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 04:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IQTjT4Ycs6KM6RJrspJYI3YyIM4bQRedRl4f7h+QF9o=;
 b=g7YFLIWik/Qs9prAZNB1byBopoIW4RFPg0s99Xy9T9j0g1pz3FT1dtUX4s33EO5Faf
 6err9Vma+4T1wkecO2gfmSJqVCLWcZKIFBlFaEXZ+EOLYVJfJ1yr6uNgFVOGok5w9Dcs
 ENd1YtN6UgMNXc/0xffhL/SRj4TuEc+zs6GLLX+aNfxsu7DxI43x/bdxcCwuh7xafQVc
 UXilAeKl47MPjPXcaENMaluuBjy/MfzwAunaS3nHAp0GTyjht7drtSL6HENIbCTvlqKf
 5KyaHtAzqjtzkmT4wGoLZtkvsgkW/fDEsFh85HuPTNfcYj6YRjEe2hOcTXtoXQCMYL8i
 pyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQTjT4Ycs6KM6RJrspJYI3YyIM4bQRedRl4f7h+QF9o=;
 b=gUwxb2ZQF/wkoZrfdm5H1EJ30JZcO7TbjturGHGSvGUXqeR0OP4d1yIHa2AlafmaVc
 YSg/jnkBd8chk/1LcNy5VRNAX9Xm3RQpIvaYxUSOPM/xpHsAosSkQHVezkK/9rwvR6ZJ
 TI6sfV6gI0+qi3GVgckB0cbcq3y1BSsxC4LOu9zP7LU+2DxzTTz/pQ4CjcpvwF+vpus7
 qdUvqwjE+tTDApUU13jXD17XiUnZA816aXDJgx3aoZALKDdLAEPAVdcvnmJTrhXKy69H
 q/aQroB0e58NTN0lv1CWI5qrq9gr9ZCxUUqOD3WLfHluI8VQ07V+y7ueFTvwZKSIMyp5
 u8Ng==
X-Gm-Message-State: AOAM530FcKlTJS9PLbxmrleF/XODtcbvYzfKjmyNDLHHSpSbvU5G33oD
 fYmpgA6nyx8qUOQgK6Q+V8tfUj2G1wD8wqsrkok=
X-Google-Smtp-Source: ABdhPJxh45xAcy+zXjxYmPAgft6pADUO7h37S89Tgkdch0O9UhgCw4AyndX1ommEzV7NgXIKU8E9RwCjUKctgz5iN0k=
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr7524370edw.53.1607085953470; 
 Fri, 04 Dec 2020 04:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-10-kraxel@redhat.com>
 <20201204122020.GF3056135@redhat.com>
In-Reply-To: <20201204122020.GF3056135@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 16:45:41 +0400
Message-ID: <CAJ+F1CLSxNrsXYik4u=HJav5tUdYbHVAUqBf58ym_BVbZsNfBA@mail.gmail.com>
Subject: Re: [PATCH 9/9] qxl: add ui_info callback
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000061552405b5a2dbdd"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x542.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000061552405b5a2dbdd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 4, 2020 at 4:21 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Thu, Dec 03, 2020 at 12:08:05PM +0100, Gerd Hoffmann wrote:
> > This makes qxl respond to user interface window resizes
> > when not using spice, so it works with gtk and vnc too.
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  hw/display/qxl.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> > index 431c1070967a..e1df95c3e8a9 100644
> > --- a/hw/display/qxl.c
> > +++ b/hw/display/qxl.c
> > @@ -1177,8 +1177,35 @@ static const QXLInterface qxl_interface =3D {
> >      .client_monitors_config =3D interface_client_monitors_config,
> >  };
> >
> > +static int qxl_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
> > +{
> > +    PCIQXLDevice *qxl =3D opaque;
> > +    VDAgentMonitorsConfig *cfg;
> > +    size_t size;
> > +
> > +    if (using_spice) {
> > +        /* spice agent will handle display resize */
> > +        return -1;
> > +    }
>
> Does this break VNC resizes if  both  VNC + SPICE are enabled
> but the client is connected with VNC ?
>

Yes. I am not sure we should worry about that case much, either way.
Perhaps it's best to handle both QEMU-originated resize and spice-agent
based resizes, even if the former can lose details from the later for
multiple screens.


> > +    if (idx > 0) {
> > +        /* supporting only single head for now */
> > +        return -1;
> > +    }
> > +
> > +    /* go fake a spice agent message */
> > +    size =3D sizeof(VDAgentMonitorsConfig) + sizeof(VDAgentMonConfig);
> > +    cfg =3D g_malloc0(size);
> > +    cfg->num_of_monitors =3D 1;
> > +    cfg->monitors[0].width =3D info->width;
> > +    cfg->monitors[0].height =3D info->height;
> > +    interface_client_monitors_config(&qxl->ssd.qxl, cfg);
> > +    g_free(cfg);
> > +    return 0;
> > +}
> > +
> >  static const GraphicHwOps qxl_ops =3D {
> >      .gfx_update  =3D qxl_hw_update,
> > +    .ui_info     =3D qxl_ui_info,
> >      .gfx_update_async =3D true,
> >  };
> >
> > --
> > 2.27.0
> >
> >
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000061552405b5a2dbdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 4, 2020 at 4:21 PM Daniel=
 P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, Dec 03, 2020 at 12:08:05PM +0100, Gerd Hoffmann wrote:<br>
&gt; This makes qxl respond to user interface window resizes<br>
&gt; when not using spice, so it works with gtk and vnc too.<br>
&gt; <br>
&gt; Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" =
target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/display/qxl.c | 27 +++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 27 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/display/qxl.c b/hw/display/qxl.c<br>
&gt; index 431c1070967a..e1df95c3e8a9 100644<br>
&gt; --- a/hw/display/qxl.c<br>
&gt; +++ b/hw/display/qxl.c<br>
&gt; @@ -1177,8 +1177,35 @@ static const QXLInterface qxl_interface =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 .client_monitors_config =3D interface_client_monit=
ors_config,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +static int qxl_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PCIQXLDevice *qxl =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 VDAgentMonitorsConfig *cfg;<br>
&gt; +=C2=A0 =C2=A0 size_t size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (using_spice) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* spice agent will handle display resize=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Does this break VNC resizes if=C2=A0 both=C2=A0 VNC + SPICE are enabled<br>
but the client is connected with VNC ?<br></blockquote><div><br></div><div>=
Yes. I am not sure we should worry about that case much, either way. Perhap=
s it&#39;s best to handle both QEMU-originated resize and spice-agent based=
 resizes, even if the former can lose details from the later for multiple s=
creens.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; +=C2=A0 =C2=A0 if (idx &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* supporting only single head for now */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* go fake a spice agent message */<br>
&gt; +=C2=A0 =C2=A0 size =3D sizeof(VDAgentMonitorsConfig) + sizeof(VDAgent=
MonConfig);<br>
&gt; +=C2=A0 =C2=A0 cfg =3D g_malloc0(size);<br>
&gt; +=C2=A0 =C2=A0 cfg-&gt;num_of_monitors =3D 1;<br>
&gt; +=C2=A0 =C2=A0 cfg-&gt;monitors[0].width =3D info-&gt;width;<br>
&gt; +=C2=A0 =C2=A0 cfg-&gt;monitors[0].height =3D info-&gt;height;<br>
&gt; +=C2=A0 =C2=A0 interface_client_monitors_config(&amp;qxl-&gt;ssd.qxl, =
cfg);<br>
&gt; +=C2=A0 =C2=A0 g_free(cfg);<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static const GraphicHwOps qxl_ops =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .gfx_update=C2=A0 =3D qxl_hw_update,<br>
&gt; +=C2=A0 =C2=A0 .ui_info=C2=A0 =C2=A0 =C2=A0=3D qxl_ui_info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .gfx_update_async =3D true,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.27.0<br>
&gt; <br>
&gt; <br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000061552405b5a2dbdd--

