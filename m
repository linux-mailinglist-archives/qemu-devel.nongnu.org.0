Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D312D5EDEA4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:19:37 +0200 (CEST)
Received: from localhost ([::1]:53140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXuS-000190-Vd
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1odWmK-0001MO-1G
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 09:07:13 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:37873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1odWmA-0004qZ-0J
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 09:07:06 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id u189so12649915vsb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 06:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=THoAo47GoYPoKLEFTN4XS5hnQ0pwJLwvmkDPu0VShyY=;
 b=DTvVTUVLRjc7E9q+VyIvY1ggjAVxZ32h4JnHo2c65kcUtx/VvaWaAaOuv0OquTUDRS
 7S08qpEyuq+PklDKubbyMx072MjJtkcDpmFWB90L4mKTH0hE3PwjCHKfJtIYy5bU2PWG
 3jdr+L3/UcOUneeL0zWlh13+vF/6HBr9jp8av+3jJJO4moIFCYELQvNqGZVviAfBeBf7
 dyu83MaAdoHwoVjmgNGQ07/SpIJQjrLrdVwmFiZ39hds9mDjj3L4+UjETKq13BkNY3gf
 mXlG48VdAEDtY1vGCbB5kC7LbQ6abF3Yikmf9f0/Oe2RpJADSi3/vudlVK/msa4L2Fny
 VfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=THoAo47GoYPoKLEFTN4XS5hnQ0pwJLwvmkDPu0VShyY=;
 b=KCYfvJpiz6oU8uUmQbpSWd12u2uTa08NwtwEwZvXD/3V6l0SMNY1uxPq+JXafTBywl
 xX3dc2MEcoWNvW9zR4Qu/RK6FQFWh7rAM7l4KH3Qy2l2U8Y+B93fGkhaiMkgNqtVHS1A
 32x5pXdi1bD0yIGopSvuaL6Zkv7nqKo0hkeeRDePnhQRZe9VfWIKPMSVSaVWuYAXXhN8
 lUCr/pY2KyZjrm10M1S99UUZxe63/tQlzxApKA2OxJElteOKGu4byKa++GiKu4tkfYxY
 OciHxbM4rzA+CtCoJtTy0Mt4Hxy6nAI2v9CbI9vOjIcUF3np7IEW/04hTKHDGBEghBNV
 NAdA==
X-Gm-Message-State: ACrzQf3BMtT0n4UVJq2gpY3fsVBOA5GW6VLjNS6b6h+BAFrwFJJRX6no
 tfqH9y3lynsbkXFEMZVXMDKj6C1bFJt07qvyrlXmBg==
X-Google-Smtp-Source: AMsMyM5QyWQsE6wPGuN5VZ6KPbp7qUxY+twDORgSXzqMJpsR/xP7hKkNaqO2ra1QR26VhtZeHOu6QqZWCv963XFtAyw=
X-Received: by 2002:a67:3c7:0:b0:39b:45c2:6875 with SMTP id
 190-20020a6703c7000000b0039b45c26875mr13260454vsd.6.1664370416018; Wed, 28
 Sep 2022 06:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org> <YzQVyj5ouhGshZ2+@redhat.com>
 <20220928061303-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220928061303-mutt-send-email-mst@kernel.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 28 Sep 2022 07:06:44 -0600
Message-ID: <CANCZdfpMkqoS+ObLFJG+fu-axgoF8kFJejk+Hww9Z=KPN37+pQ@mail.gmail.com>
Subject: Re: Why we should avoid new submodules if possible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006bffa205e9bc6f1f"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--0000000000006bffa205e9bc6f1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2022 at 6:44 AM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > There's also the perenial problem that developers frequently send
> > patches that mistakenly include submodule changes, which is related to
> the
> > way that 'git checkout' doesn't sync submodule state when switching
> branches.
>
> Do you happen to know how exactly that happens?
>

Here's how it happens to me.

% git checkout master
% git checkout -b bsd-user-2022q4
# bring changes in, doesn't matter
# Build a few times
# time passes, master upstream evolves, submodules move
% git checkout master
% git pull # master fast forwards
% git rebase -i master bsd-user-2022q4

at this point I have to do unnatural git submodule recursive things to make
it stop
complaining about how all the submodules are now 'modified' because they
have
moved on the master branch.

It is real, lasting, lingering pain and a large part of the reason that I
refuse to allow FreeBSD
to use submodules[*]. It's just too much extra hassle for no gain at all
(at least for me, I
see only the pain and no benefits to me or anybody else). I've sent at
least three review
requests that have this pollution in it since it's hard to avoid if you
press forward after the
rebase not to have something swept up into an innocuous change.

Warner

[*] They are also generally a poor match for FreeBSD since we rarely import
things
verbatim, unchanged from upstreams that have well-oiled CI to give us
assurance
that things are good...

--0000000000006bffa205e9bc6f1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 28, 2022 at 6:44 AM Micha=
el S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, S=
ep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; There&#39;s also the perenial problem that developers frequently send<=
br>
&gt; patches that mistakenly include submodule changes, which is related to=
 the<br>
&gt; way that &#39;git checkout&#39; doesn&#39;t sync submodule state when =
switching branches.<br>
<br>
Do you happen to know how exactly that happens?<br></blockquote><div><br></=
div><div>Here&#39;s how it happens to me.</div><div><br></div><div>% git ch=
eckout master</div><div>% git checkout -b bsd-user-2022q4</div><div># bring=
 changes in, doesn&#39;t matter</div><div># Build a few times</div><div># t=
ime passes, master upstream evolves, submodules move</div><div>% git checko=
ut master</div><div>% git pull # master fast forwards</div><div>% git rebas=
e -i master bsd-user-2022q4</div><div><br></div><div>at this point I have t=
o do unnatural git submodule recursive things to make it stop</div><div>com=
plaining about how all the submodules are now &#39;modified&#39; because th=
ey have</div><div>moved on the master branch.</div><div><br></div><div>It i=
s real, lasting, lingering pain and a large part of the reason that I refus=
e to allow FreeBSD</div><div>to use submodules[*]. It&#39;s just too much e=
xtra hassle for no gain at all (at least for me, I</div><div>see only the p=
ain and no benefits to me or anybody else). I&#39;ve sent at least three re=
view</div><div>requests that have this pollution in it since it&#39;s hard =
to avoid if you press forward after the</div><div>rebase not to have someth=
ing swept up into an innocuous change.</div><div><br></div><div>Warner</div=
><div><br></div><div>[*] They are also generally a poor match for FreeBSD s=
ince we rarely import things</div><div>verbatim, unchanged from upstreams t=
hat have well-oiled CI to give us assurance</div><div>that things are good.=
..</div><div><br></div></div></div>

--0000000000006bffa205e9bc6f1f--

