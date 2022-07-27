Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68528582356
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:40:15 +0200 (CEST)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdWY-0004kR-5K
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGdNd-0004iL-Ef
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:31:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGdNa-0003ml-34
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658914257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5TPITfS7Kx/5GMueHKAuV0xsuUVJiyudlAXE7kAVfcY=;
 b=IUOgp/DBScvKzMpUYIb+JqULRyDZVwYRytC43UhUphSdfVL9Xh8p4GpHcRBjm2xYTPB+Rt
 rmLZUzvaY/S7un2Wzxx9R7q3llI6jciGdE+llW/pBjN7Dskijv7lS2E6bGGIBK3X1If+W4
 7wVf3FKyjuA5hLnQyVeEH9WUstQ9pjs=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-43XpjwvXP7aK0w-uAM8-uw-1; Wed, 27 Jul 2022 05:30:55 -0400
X-MC-Unique: 43XpjwvXP7aK0w-uAM8-uw-1
Received: by mail-yb1-f200.google.com with SMTP id
 u6-20020a25b7c6000000b00670862c5b16so13025634ybj.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 02:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TPITfS7Kx/5GMueHKAuV0xsuUVJiyudlAXE7kAVfcY=;
 b=ARp8E3wt1dVY7A/bwg+IJCsYLuqh2wi0Qm8jnjZooM0C+8p1ufVhm8rMGCxHBrl4N4
 82LSgOiF2dV+SraHjf5jmBTCHvRGVdymqB/azXT+Tn0M9tqRGf2Zdfv0WIfQC10Lf/sy
 giQs6Qw9kgEMLattKXeqRc5ZkbvbwY9HoUa4UoDfuIgURzqSg9WW778P/vbmEeJJneGv
 HKf+TbXqnUUNo+mctLpljvq3A6rRJoR3Rcmk5rAy0aIuZojF65jGee1OqwV6RlzW7/K7
 xXlz48+7LBHrQaHvAIPXoQAJFQC+gsrvvuyj4EqkRbzvJYA5NACEl1UJZBnYfftDigOV
 dcmA==
X-Gm-Message-State: AJIora/QjHcuhZWNti4wvOJv27NDttQexBtq9mzhe3oy0VUvcb6FSTr6
 mdJPhibtYJ/BiRkMZEksW2JO/WXgcdrqvceFwifV1Yhi3+6CGX9+7u6mYnwSuPMRaaKro7LHDma
 pUt/x3Rpkq7lYPlox9lmV97lTnzSCbo4=
X-Received: by 2002:a05:6902:100d:b0:670:9e0c:8819 with SMTP id
 w13-20020a056902100d00b006709e0c8819mr17650783ybt.271.1658914255401; 
 Wed, 27 Jul 2022 02:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXCUiFrHD9W13cJtWfjPq174f714orGPsOMxwO9bo1ZVMqrWTeDPBiFr7is9Br2wbLTsQWYmx6tRQgsdY5CO0=
X-Received: by 2002:a05:6902:100d:b0:670:9e0c:8819 with SMTP id
 w13-20020a056902100d00b006709e0c8819mr17650769ybt.271.1658914255209; Wed, 27
 Jul 2022 02:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220727092135.302915-1-thuth@redhat.com>
 <20220727092135.302915-2-thuth@redhat.com>
 <YuEFfizE+lpguU7g@redhat.com>
In-Reply-To: <YuEFfizE+lpguU7g@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 27 Jul 2022 12:30:44 +0300
Message-ID: <CAPMcbCoTGNwU3FMvHghJVeFNNBba2v95XnCm0tkP_L7qdJeFxw@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga: Replace 'blacklist' command line and config file
 options by 'block-rpcs'
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 QEMU <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="000000000000e51f3405e4c61288"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000e51f3405e4c61288
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>



On Wed, Jul 27, 2022 at 12:29 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> On Wed, Jul 27, 2022 at 11:21:33AM +0200, Thomas Huth wrote:
> > Let's use a more appropriate wording for this command line and config
> > file option. The old ones are still accepted for compatibility reasons,
> > but marked as deprecated now so that it could be removed in a future
> > version of QEMU.
> >
> > This change is based on earlier patches from Philippe Mathieu-Daud=C3=
=A9,
> > with the idea for the new option name suggested by BALATON Zoltan.
> >
> > And while we're at it, replace the "?" in the help text with "help"
> > since that does not have the problem of conflicting with the wildcard
> > character of the shells.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  docs/about/deprecated.rst  | 19 +++++++++++++++++++
> >  docs/interop/qemu-ga.rst   |  8 ++++----
> >  qga/main.c                 | 18 +++++++++++++-----
> >  tests/unit/test-qga.c      |  2 +-
> >  tests/data/test-qga-config |  2 +-
> >  5 files changed, 38 insertions(+), 11 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> With regards,
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

--000000000000e51f3405e4c61288
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto=
:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><d=
iv><br></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, Jul 27, 2022 at 12:29 PM Daniel P. Berrang=C3=A9 &=
lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jul 27=
, 2022 at 11:21:33AM +0200, Thomas Huth wrote:<br>
&gt; Let&#39;s use a more appropriate wording for this command line and con=
fig<br>
&gt; file option. The old ones are still accepted for compatibility reasons=
,<br>
&gt; but marked as deprecated now so that it could be removed in a future<b=
r>
&gt; version of QEMU.<br>
&gt; <br>
&gt; This change is based on earlier patches from Philippe Mathieu-Daud=C3=
=A9,<br>
&gt; with the idea for the new option name suggested by BALATON Zoltan.<br>
&gt; <br>
&gt; And while we&#39;re at it, replace the &quot;?&quot; in the help text =
with &quot;help&quot;<br>
&gt; since that does not have the problem of conflicting with the wildcard<=
br>
&gt; character of the shells.<br>
&gt; <br>
&gt; Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" tar=
get=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/about/deprecated.rst=C2=A0 | 19 +++++++++++++++++++<br>
&gt;=C2=A0 docs/interop/qemu-ga.rst=C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt;=C2=A0 qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 18 +++++++++++++-----<br>
&gt;=C2=A0 tests/unit/test-qga.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/data/test-qga-config |=C2=A0 2 +-<br>
&gt;=C2=A0 5 files changed, 38 insertions(+), 11 deletions(-)<br>
<br>
Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
<br>
<br>
With regards,<br>
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
</blockquote></div>

--000000000000e51f3405e4c61288--


