Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BC540FC13
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:19:54 +0200 (CEST)
Received: from localhost ([::1]:45192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFeb-0000Fs-5s
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRFan-0007AS-GJ
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:15:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRFak-0001hx-Gc
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631891752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o3qvGpQWDPrpV92yHYfNUHwn6AcGodeGeuLy1wu4PT4=;
 b=X/cuRi4IwX1BaikEBna6IKyrRt32feA96ETU1jhw1Z/kCw/OuAqxX3rhz8jjgCWBOWBiTo
 r0e5+Htbhmacl9Z9X2a4xlG1QhbL3ZQi/ZsS1wgSFAvxAX1Ap9dviBLc1P3nOKkuattnsG
 zam4o7WH0BzCVYoEW/p4PIRAYbh5V70=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-R39u3fOVN1aAwuu1V9tCjw-1; Fri, 17 Sep 2021 11:15:51 -0400
X-MC-Unique: R39u3fOVN1aAwuu1V9tCjw-1
Received: by mail-oi1-f200.google.com with SMTP id
 y185-20020acaafc2000000b0027359453ad4so845877oie.6
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 08:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o3qvGpQWDPrpV92yHYfNUHwn6AcGodeGeuLy1wu4PT4=;
 b=j3cO/jLJy7RCBu9P4U8ml6sgY7Ac5uTyUVvILvtMI3qoN2EiXHVBTwVCrDsnVPHRV8
 tfJ73dIqPXpamLa6V2IAAxpB6xSMtusyGYHBsW+pie8UDhTVzMlo7u4UahL7zZ7NbKiy
 4fb5pLWZtbCZ+52TEdyxUhOzoCbeeTG8BNSpMzitJqNQqAyG+rxwxU03uc7VgQpY5dAn
 eeWuqgnaRrSPvyxU/tZEN53y7k2GNJHGjpRTT9mWl7YT7HWb+P9hbHVIQpHRpBlV8l0H
 2pavaQJFjxcMJIdPUBHYUrjUaZDpGlEZ/7B0hCHBhfyuZw8e/KA/pEsoub6ewAl3KLEW
 0s2A==
X-Gm-Message-State: AOAM530AO2FAew4h7+vnfEhYdQOUZDuDxevyCkUBCUfIPp9BevffXvli
 BNOe1p/cLJOkXjxc9qi4bcVQ1A0Wum4Es/XN1SXAqbMuQGPEidCL7fdCXDzMo8kBjSipQ/mJJjZ
 N1t9xcoNBbKRzBRXaLn1y1xzhQM45gz4=
X-Received: by 2002:a05:6830:2685:: with SMTP id
 l5mr6296458otu.129.1631891750672; 
 Fri, 17 Sep 2021 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjUIMByY+Ra2nmUDYmSjUzjhWRr6Bc6/P6/5C/SjLoQRGAf57KQ6cS1r6KsWV3ItLSEw2EZMuaTCftbo3PcHU=
X-Received: by 2002:a05:6830:2685:: with SMTP id
 l5mr6296441otu.129.1631891750446; 
 Fri, 17 Sep 2021 08:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-15-jsnow@redhat.com>
 <7e77d482-3ba1-06b4-6c6d-0bafb9ff7e2f@redhat.com>
In-Reply-To: <7e77d482-3ba1-06b4-6c6d-0bafb9ff7e2f@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 11:15:39 -0400
Message-ID: <CAFn=p-b3tLmJ2WgB3Cyv14Mg1hND4EcsQRVGbNm2c0P6XwpSFQ@mail.gmail.com>
Subject: Re: [PATCH 14/15] python/aqmp: Remove scary message
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000018fc3a05cc326863"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000018fc3a05cc326863
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 10:39 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > The scary message interferes with the iotests output. Coincidentally, i=
f
> > iotests works by removing this, then it's good evidence that we don't
> > really need to scare people away from using it.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/aqmp/__init__.py | 14 --------------
> >   1 file changed, 14 deletions(-)
>
> I definitely won=E2=80=99t give an R-b for this one, because that would r=
equire
> me reviewing the AQMP series, and, well, you know.
>
>
Yep, no worries. I'd feel bad if you started digging into it. Not the best
use of your time. I am trying to shield you from this junk, not pull you
into it.

(but, I hope the new library is easy to use. I went out of my way to make
sure the transition would be as seamless as possible for iotest writers,
and I genuinely hope I achieved that. Though as you've seen, there's a few
messy bits -- One of the reasons for sending this series out to list so
soon was precisely to force someone to witness the ugly bits so I could
align my thinking on how best to address them.)

Also, if I were to review the AQMP series and could actually give R-bs
> in good faith, why would I accept adding this message?  I mean, if I=E2=
=80=99d
> reviewed it, I=E2=80=99d=E2=80=99ve had to trust it.
>
> So, =C3=B6hm, I=E2=80=99m fine with dropping this message because evident=
ly I=E2=80=99d=E2=80=99ve
> never agreed to adding it in the first place (had I reviewed the AQMP
> series).
>
> Hanna
>
>
I added as a pre-emptive mollification, it's been in my series for a while.
I jokingly refer to it as "tech preview". The asyncio stuff is fairly new
(even to Python programmers) and though I have tried my very hardest to
test that library as thoroughly as I possibly could, it seems like
everyone's reaction has been "Ah jeez, I dunno if I can truly review this"
so I added a little warning to ease minds a bit and try to make people feel
like they were committing to less.

--00000000000018fc3a05cc326863
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:39 AM Hann=
a Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.=
21 07:40, John Snow wrote:<br>
&gt; The scary message interferes with the iotests output. Coincidentally, =
if<br>
&gt; iotests works by removing this, then it&#39;s good evidence that we do=
n&#39;t<br>
&gt; really need to scare people away from using it.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/__init__.py | 14 --------------<br>
&gt;=C2=A0 =C2=A01 file changed, 14 deletions(-)<br>
<br>
I definitely won=E2=80=99t give an R-b for this one, because that would req=
uire <br>
me reviewing the AQMP series, and, well, you know.<br>
<br></blockquote><div><br></div><div>Yep, no worries. I&#39;d feel bad if y=
ou started digging into it. Not the best use of your time. I am trying to s=
hield you from this junk, not pull you into it.<br></div><div><br></div><di=
v>(but, I hope the new library is easy to use. I went out of my way to make=
 sure the transition would be as seamless as possible for iotest writers, a=
nd I genuinely hope I achieved that. Though as you&#39;ve seen, there&#39;s=
 a few messy bits -- One of the reasons for sending this series out to list=
 so soon was precisely to force someone to witness the ugly bits so I could=
 align my thinking on how best to address them.)<br></div><div> <br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
Also, if I were to review the AQMP series and could actually give R-bs <br>
in good faith, why would I accept adding this message?=C2=A0 I mean, if I=
=E2=80=99d <br>
reviewed it, I=E2=80=99d=E2=80=99ve had to trust it.<br>
<br>
So, =C3=B6hm, I=E2=80=99m fine with dropping this message because evidently=
 I=E2=80=99d=E2=80=99ve <br>
never agreed to adding it in the first place (had I reviewed the AQMP <br>
series).<br>
<br>
Hanna<br>
<br></blockquote><div><br></div><div>I added as a pre-emptive mollification=
, it&#39;s been in my series for a while. I jokingly refer to it as &quot;t=
ech preview&quot;. The asyncio stuff is fairly new (even to Python programm=
ers) and though I have tried my very hardest to test that library as thorou=
ghly as I possibly could, it seems like everyone&#39;s reaction has been &q=
uot;Ah jeez, I dunno if I can truly review this&quot; so I added a little w=
arning to ease minds a bit and try to make people feel like they were commi=
tting to less.</div><div><br></div></div></div>

--00000000000018fc3a05cc326863--


