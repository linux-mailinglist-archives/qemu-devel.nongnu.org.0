Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD392EC460
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:01:33 +0100 (CET)
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxEzp-0000df-Jq
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxExh-00006n-73
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 14:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxExb-0004ZK-3h
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 14:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609963149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vr8S/anGxUAVkroaUUA6TApfkCCzIl4V8FumhBwSJdk=;
 b=fmcMgjgdu4f5Wvrxa+zzDLci6ugKiJgdsQJrb+0Sf/a6eXTAy5fi7H0KdyuxYmChBTkCz7
 E0s/FBfS7pde9vs4ZmP72N5DZeK+q2mmO8vZiOT1YUyXFAndFtxCnltL/iGDWTtgwuGds5
 vfmA1gvN+q63TQR6fu3t68P6t7K8Hyc=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-rbIfLANwPryFUuif-AJrLw-1; Wed, 06 Jan 2021 14:59:06 -0500
X-MC-Unique: rbIfLANwPryFUuif-AJrLw-1
Received: by mail-pf1-f197.google.com with SMTP id n8so2347944pfa.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 11:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vr8S/anGxUAVkroaUUA6TApfkCCzIl4V8FumhBwSJdk=;
 b=YBuwhkDnLTGi6aHEU1EbVKE3h+MnMjHF19D+Dfbnh3x/IRAjb1oeCykcDU/2HUf6Uz
 C2bwGpP3vnBTuEPMrhkXOgQMac2Ap8YHZ2RWlZnoTOsfyjfln7IJ+P6DxPqmW9gVjkM9
 vpyyVrTunTZa7yK70/w2Eaz+vhqjb2Bl3aXC3OekaKMyVRGezUwieb2q4DZnDbTgR40Y
 YYgQU7OSsqdQNWc17xwJSqsmX4U8v1KTaDs0MafPT8VrwOMqei8WaADAcUKINMVEJKV7
 z0h8ZmVpPhfYd9otSyWJ4FUNTpOQkROHPFsmqwKcolEjF3oQu6ykPxGMIyfc12qjp8HU
 OO6A==
X-Gm-Message-State: AOAM5332a8nGbCqNJCv0hEFJmjMuXoEvtZuv6FWoqUW3QxAYbou1Z5dS
 HQoCkr8hEpM8qSjD7Rp2lpUT6AVpEb9jW4q7HpgVJQELhY2fB9RkPslCfJgvylCGuOEBE+1DO7s
 c6g02pjgR+AwpK5GcfQdFExY2cdrlsHU=
X-Received: by 2002:a17:902:6903:b029:da:f458:798c with SMTP id
 j3-20020a1709026903b02900daf458798cmr5653088plk.68.1609963145790; 
 Wed, 06 Jan 2021 11:59:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY7GCx3uJ22o9Xy/81DiIKQGcYujMf9q9AbVjRRvRq+xO5HGRxePCDsGkfQ1abx/D47gWvZ+UJIbqPE7T5dYU=
X-Received: by 2002:a17:902:6903:b029:da:f458:798c with SMTP id
 j3-20020a1709026903b02900daf458798cmr5653071plk.68.1609963145440; Wed, 06 Jan
 2021 11:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20201217091403.36195-1-pbonzini@redhat.com>
 <206452d4-8883-8787-366-c2921c365e@eik.bme.hu>
In-Reply-To: <206452d4-8883-8787-366-c2921c365e@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 6 Jan 2021 20:58:53 +0100
Message-ID: <CABgObfb4v2bZ_PQNxoZHK48c4LhYy34WEWOQo7=Eky+E5=e2Wg@mail.gmail.com>
Subject: Re: [PATCH] vl: initialize displays _after_ exiting preconfiguration
To: BALATON Zoltan <balaton@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000062c64205b840c194"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000062c64205b840c194
Content-Type: text/plain; charset="UTF-8"

Il mer 6 gen 2021, 18:06 BALATON Zoltan <balaton@eik.bme.hu> ha scritto:

> On Thu, 17 Dec 2020, Paolo Bonzini wrote:
> > Due to the renumbering of text consoles when graphical consoles are
> > created, init_displaystate must be called after all QemuConsoles are
> > created, i.e. after devices are created.
> >
> > vl.c calls it from qemu_init_displays, while qmp_x_exit_preconfig is
> > where devices are created.  If qemu_init_displays is called before it,
> > the VGA graphical console does not come up.
>
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> This still seems to be missing from master, who should take care of this?
>

It's in now, I think.

Paolo


> Regards,
> BALATON Zoltan
>
> > Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> > softmmu/vl.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index 0ed5c5ba93..7ddf405d76 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -3529,10 +3529,10 @@ void qemu_init(int argc, char **argv, char
> **envp)
> >         exit(0);
> >     }
> >
> > -    qemu_init_displays();
> >     if (!preconfig_requested) {
> >         qmp_x_exit_preconfig(&error_fatal);
> >     }
> > +    qemu_init_displays();
> >     accel_setup_post(current_machine);
> >     os_setup_post();
> >     resume_mux_open();
> >
>
>

--00000000000062c64205b840c194
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 6 gen 2021, 18:06 BALATON Zoltan &lt;<a href=3D=
"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; ha scritto:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Thu, 17 Dec 2020, Paolo Bonzini wrote:<b=
r>
&gt; Due to the renumbering of text consoles when graphical consoles are<br=
>
&gt; created, init_displaystate must be called after all QemuConsoles are<b=
r>
&gt; created, i.e. after devices are created.<br>
&gt;<br>
&gt; vl.c calls it from qemu_init_displays, while qmp_x_exit_preconfig is<b=
r>
&gt; where devices are created.=C2=A0 If qemu_init_displays is called befor=
e it,<br>
&gt; the VGA graphical console does not come up.<br>
<br>
Tested-by: BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=
=3D"_blank" rel=3D"noreferrer">balaton@eik.bme.hu</a>&gt;<br>
<br>
This still seems to be missing from master, who should take care of this?<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It=
&#39;s in now, I think.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<br>
<br>
&gt; Reported-by: Howard Spoelstra &lt;<a href=3D"mailto:hsp.cat7@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">hsp.cat7@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; softmmu/vl.c | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
&gt; index 0ed5c5ba93..7ddf405d76 100644<br>
&gt; --- a/softmmu/vl.c<br>
&gt; +++ b/softmmu/vl.c<br>
&gt; @@ -3529,10 +3529,10 @@ void qemu_init(int argc, char **argv, char **e=
nvp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 qemu_init_displays();<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (!preconfig_requested) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_x_exit_preconfig(&amp;error_fatal=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 qemu_init_displays();<br>
&gt;=C2=A0 =C2=A0 =C2=A0accel_setup_post(current_machine);<br>
&gt;=C2=A0 =C2=A0 =C2=A0os_setup_post();<br>
&gt;=C2=A0 =C2=A0 =C2=A0resume_mux_open();<br>
&gt;<br>
<br>
</blockquote></div></div></div>

--00000000000062c64205b840c194--


