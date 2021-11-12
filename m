Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A8E44E2E0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 09:10:52 +0100 (CET)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlRe7-0005hw-RC
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 03:10:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlRdH-00052p-4y
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 03:09:59 -0500
Received: from [2607:f8b0:4864:20::1033] (port=38822
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlRdE-0000DT-Ke
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 03:09:58 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so6482160pju.3
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 00:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/+twN+A8x2g42xQcJqt+rj9wyG1gLXdQQjjzjYEWSQ0=;
 b=Amjlp4KjQVQLMZ9iWisXLI9WN0VaMVKD5GFC1s7fszQcbuYScYDCLhUrlChu2yp5yv
 X2hiyVS8UFF4xJF9g58la3h5GvgDo4/EOHiASjZfpaaAYoCOu7XDunNwq934CFvaoffo
 aBNhnlVkyUpInWp9Kp7N8YiQXLgv8I3wvdckk9CFBkcAJDs6DXuAupQrgLkqTe25GS1N
 ok4pBBQtzLFJ23d0beLAUx8ZCJlbqOWFdusac+UGuYRvfFPJRksZD/gVFtG11rREIRMo
 PMndi6OmCToiksg2l9VUAbBTWlgtuCnlx8SU+4kCVWxTiZSBc31+60EImT2TSN0E+NT7
 VBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/+twN+A8x2g42xQcJqt+rj9wyG1gLXdQQjjzjYEWSQ0=;
 b=Uv2fADNxAQugr/nWUUHeUUWchGSzwxYoU4i9awhpvGNNjJ/mWrUs2HWd16d+MMnph2
 tP3+OOb1IaI/HCAZRpQeDV3+4kktZaQt1FFQe47Y0laXhDrjf4lsGoJzL/O6HaBbjWp8
 i6c1w0V+BcDTZSgu4GGPQNwBSmLeY6JIcYuRpPW6NC2tcLybeVDFnQypUtXZHWQ7w2Rx
 vllJptJNYcZnUsbA7d/3s7rIAzg21mgZxQPQVERqotUrgybMj6vbCByaFq7EFeY4IYad
 QvBE1lKOMSon6S7PAM+Q8Vlq7lrAZuoZYnBxZLF6ZX26+rZbb+P1BfMcZT8E6+UEU+CV
 myoA==
X-Gm-Message-State: AOAM533xGE9HCm0V47E9GBqfkEVKSXheae++vGBzQZ9lyERlmjkO8HY3
 Ez66EKfQZc9KwQI7yQprCfDgrX5VzJ7w1lMY0EpnKdLFwsCAWQ==
X-Google-Smtp-Source: ABdhPJxWHeXgBKw9VnjsskJUQyeMUMtM4b2YB/kJpry6KHy3cUVKo+3LBm2Co1w94y2vyfVcQ0X51R39z6A9s3QkeUY=
X-Received: by 2002:a1f:a841:: with SMTP id r62mr19661113vke.19.1636704173285; 
 Fri, 12 Nov 2021 00:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
 <20211108151704.65611-3-yaroshchuk2000@gmail.com>
 <87czn9honw.fsf@dusky.pond.sub.org>
 <CADO9X9QJRxNL_Mc4rfvL5T7Bhfxekp8amN0Y56iLO4JyDsow6g@mail.gmail.com>
 <20211111204947.hsows4m5bukwxgde@redhat.com>
In-Reply-To: <20211111204947.hsows4m5bukwxgde@redhat.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 12 Nov 2021 11:02:44 +0300
Message-ID: <CADO9X9S82jozBpj8_2DMrLxnxxo3xVtsH2YKfRDVFXG-decSrw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] net/vmnet: add vmnet backends to qapi/net
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d9e51705d092e28c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: jasowang@redhat.com, phillip.ennen@gmail.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Phillip Tennen <phillip@axleos.com>,
 akihiko.odaki@gmail.com, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d9e51705d092e28c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 11 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3., 11:49 PM Eric Blak=
e <eblake@redhat.com>:

> On Thu, Nov 11, 2021 at 06:21:28PM +0300, Vladislav Yaroshchuk wrote:
> >
> > > +#
> > > > +# Since: 6.2
> > >
> > > Missed 6.2, please adjust.  More of the same below.
> > >
> > >
> > The next one is 6.3, isn't it?
>
> 7.0, actually, as it will be the first release in 2022.
>
>
OK, thank you!


> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--=20
Best Regards,

Vladislav Yaroshchuk

--000000000000d9e51705d092e28c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 11 =D0=BD=D0=BE=D1=8F=
=D0=B1. 2021 =D0=B3., 11:49 PM Eric Blake &lt;<a href=3D"mailto:eblake@redh=
at.com" target=3D"_blank">eblake@redhat.com</a>&gt;:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Thu, Nov 11, 2021 at 06:21:28PM +0300, Vladislav Yaros=
hchuk wrote:<br>
&gt; <br>
&gt; &gt; +#<br>
&gt; &gt; &gt; +# Since: 6.2<br>
&gt; &gt;<br>
&gt; &gt; Missed 6.2, please adjust.=C2=A0 More of the same below.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; The next one is 6.3, isn&#39;t it?<br>
<br>
7.0, actually, as it will be the first release in 2022.<br>
<br></blockquote><div>=C2=A0</div><div>OK, thank you!</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libvirt.org</a><br>
<br></blockquote><div>=C2=A0</div></div></div></div><div><br></div>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></d=
iv></div></div></div>

--000000000000d9e51705d092e28c--

