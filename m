Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42702320064
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 22:45:30 +0100 (CET)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDab-0005sX-AU
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 16:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lDDZS-0005Rb-Hk
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:44:18 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:42469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lDDZM-0006US-OL
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:44:18 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id a123so3425469vsc.9
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 13:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9M28Wx5/+n3IKQjuuQsD0f0Ve6VqHwxUiF9Pmgpljpc=;
 b=k2hKIXU4AgCxhWHCw+UBZkRuakro5msGNRWwLDn0MvwMqQKJgX8eQMBhT3Y6R6B2IQ
 w2MUAPSVqzuzBuowwjG0gqApl0hZvTkaBNNeVZMqKX86tOp+oldOmmDzNEIz8LlE+JhS
 nlhSR/bJctdjAT97SBnfPkngsg6QLLVvMCHFW6DJiAGYsjBfGKYGhRVIceLcjrfL0U16
 UIWXhrgUYBf1/+sUJCnadpAjWv+yDtaZf5X7M+Dg8k4aSOUUTmgSB9WCT3zmsLHgC88J
 G/xYma+calbHoiob1tR1frhfRddXBysi6kDTgEzUDm7VCe6vbYW5kpXsvctRYhU9T5AK
 fuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9M28Wx5/+n3IKQjuuQsD0f0Ve6VqHwxUiF9Pmgpljpc=;
 b=DKRl7FP3Ts5Aplz3qpqNKZ3m1seD37yIiCvM5jPB61FMjOTO1RBQ7Br4vSa+KFV1PW
 IVVKynRY0zsLHyxHk4LFFVBUq72dO+UIK+5ssMTrLkQc6AP/AKCqJEHAeOutrfdOKqCh
 J/uxlguy9yRLHTGgYtfC7qbaMGrRLO1sD7cX/Eh9Oxnqvv4D1Bbqt43hnPGpuUqGLNFt
 1FUmNAmbSD5BL7+jgWis0GYeDTgMgT6LgDYcMLqwuMeu2s8BFeqDZ/tdUEbi+OV3cWRa
 lgKQLFVe2sfeMQ/a/ARx0KRAbKeIcrnH9NtmkrMYxjpXS50XY2KpolffgRMBFXjXgwZ7
 xV9A==
X-Gm-Message-State: AOAM530s6Cnps7RQWOygK6SHQJUtaGTWEzysGgBPDLfiRaFc7Gc1Z1pO
 c96ZsjIhBdd0HJPC4z/5uZXOuIIXGx6YRL1DpPUu0g==
X-Google-Smtp-Source: ABdhPJzgm+IJjaZuhYViyBqmlkNB5kxl7tSmzcfuXek1bkjzZ3djiReySx30mQf5oLL1NpGxG50V1AKmK5Mr8DIZzwc=
X-Received: by 2002:a67:fd59:: with SMTP id g25mr7856555vsr.52.1613771050203; 
 Fri, 19 Feb 2021 13:44:10 -0800 (PST)
MIME-Version: 1.0
References: <20210218201538.701509-1-dje@google.com>
 <20210218201538.701509-2-dje@google.com>
 <YC+HDHCm0vtoXXs1@redhat.com>
In-Reply-To: <YC+HDHCm0vtoXXs1@redhat.com>
From: Doug Evans <dje@google.com>
Date: Fri, 19 Feb 2021 13:43:33 -0800
Message-ID: <CADPb22TmdB641e_OecWRqqmFEDmEx8+GM-cL+aWMLcVgVpykZQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="0000000000003290c605bbb75a1d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=dje@google.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003290c605bbb75a1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 1:38 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Thu, Feb 18, 2021 at 12:15:35PM -0800, Doug Evans wrote:
>
> FWIW, normally when QEMU updates libslirp, the commit message is
> set to contain the "git shortlog old..new" output
>


Ah. In this case I'm not sure what to do as QEMU master is using Libslirp
stable-4.2 branch (at least in QEMU's libslirp.git).

Samuel, please let me know what should happen here.
I may need some hand holding to come up with The Right patch to submit.
I think you know what patches are needed here, but I don't know what I
should be submitting in this 1/4 patch of the series.



>
> > Signed-off-by: Doug Evans <dje@google.com>
> > ---
> >
> > Changes from v3:
> > - pick up latest libslirp patch to reject ipv6 addr-any for guest addre=
ss
> >   - libslirp currently only provides a stateless DHCPv6 server, which
> means
> >     it can't know in advance what the guest's IP address is, and thus
> >     cannot do the "addr-any -> guest ip address" translation that is do=
ne
> >     for ipv4
> >
> > Changes from v2:
> > - this patch is new in v3, split out from v2
> >
> >  slirp | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/slirp b/slirp
> > index 8f43a99191..26ae658a83 160000
> > --- a/slirp
> > +++ b/slirp
> > @@ -1 +1 @@
> > -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> > +Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa
> > --
> > 2.30.0.617.g56c4b15f3c-goog
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

--0000000000003290c605bbb75a1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, Feb 19, 2021 at 1:38 AM Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Thu, Feb 18, 2021 at 12:15:35PM -0800, Doug Evans wrote:<=
br>
<br>
FWIW, normally when QEMU updates libslirp, the commit message is<br>
set to contain the &quot;git shortlog old..new&quot; output<br></blockquote=
><div><br></div><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Ah. In this case I&#39;m not sure what to do as QEMU master=
 is using Libslirp stable-4.2 branch (at least in QEMU&#39;s=C2=A0libslirp.=
git).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Samuel, please let =
me know what should happen here.</div><div class=3D"gmail_default" style=3D=
"font-size:small">I may need some hand holding to come up with The Right pa=
tch to submit.</div></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I think you know what patches are needed here, but I don&#39;t know w=
hat I should be submitting in this 1/4 patch of the series.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=
=3D"_blank">dje@google.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes from v3:<br>
&gt; - pick up latest libslirp patch to reject ipv6 addr-any for guest addr=
ess<br>
&gt;=C2=A0 =C2=A0- libslirp currently only provides a stateless DHCPv6 serv=
er, which means<br>
&gt;=C2=A0 =C2=A0 =C2=A0it can&#39;t know in advance what the guest&#39;s I=
P address is, and thus<br>
&gt;=C2=A0 =C2=A0 =C2=A0cannot do the &quot;addr-any -&gt; guest ip address=
&quot; translation that is done<br>
&gt;=C2=A0 =C2=A0 =C2=A0for ipv4<br>
&gt; <br>
&gt; Changes from v2:<br>
&gt; - this patch is new in v3, split out from v2<br>
&gt; <br>
&gt;=C2=A0 slirp | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/slirp b/slirp<br>
&gt; index 8f43a99191..26ae658a83 160000<br>
&gt; --- a/slirp<br>
&gt; +++ b/slirp<br>
&gt; @@ -1 +1 @@<br>
&gt; -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
&gt; +Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa<br>
&gt; -- <br>
&gt; 2.30.0.617.g56c4b15f3c-goog<br>
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
</blockquote></div></div>

--0000000000003290c605bbb75a1d--

