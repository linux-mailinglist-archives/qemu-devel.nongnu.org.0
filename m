Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C163F153E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 10:34:04 +0200 (CEST)
Received: from localhost ([::1]:39374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGdUx-0006Wc-IP
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 04:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1mGdTv-0005r7-BF
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:32:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1mGdTt-0005Tm-I7
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629361975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sAr3cAp32u+B5DTGCL4SloiPKELrBlFwYsZPpbkB75k=;
 b=Ut5mBtuvLzhwc2VUBtB+2TJt88mnEkaklo9R0ekv1A8u5dOgaUnbzaZMaZ1FUSgKwKF0ya
 IYcmGS1PSzNxmUcU5jbVfiWb3qjbgGH3+Iq7e06svdehPakM+95o9XJXzZqXOVikPHDRg6
 G54HGIxm9QIIDZBcIepqVRrTxrWBFjI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-t9ZH0I3tMeaZNLn0C2UrXw-1; Thu, 19 Aug 2021 04:32:53 -0400
X-MC-Unique: t9ZH0I3tMeaZNLn0C2UrXw-1
Received: by mail-lj1-f199.google.com with SMTP id
 7-20020a05651c12c7b029019545e8e9c2so1890513lje.4
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 01:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sAr3cAp32u+B5DTGCL4SloiPKELrBlFwYsZPpbkB75k=;
 b=B+88+cXerlXkEK0bky0SDstZNTytuVd1Kkr19NYUpTh6isMy3kGsa50WUh8jfYwnXn
 2a/Pst9i8dPCDaC6TVrZHXbTt/uXGBvjlPgnsn3s9ykXNBjfJAa6nmkiBZ+8sacyz81x
 0hX1Zb5wGLiUIll7ipyakppElVz3SrSddh6557G2IJ7TgalaUHKoFmf+XW01gZ41joJM
 mRjLuM6bihrJRXyYedM1MsyAARCNlNkmFeEQ9n7UT7TLCyQ4jlzVnzJ29TJ6JvqYVH2N
 5ccVcDHOsTigebWfDx9Ilp2YKPTv0huPDxCkouI6oZCqLEflV6QAAfoQietHcAUXKjwt
 Re2w==
X-Gm-Message-State: AOAM5307J+V5fjnfCYRr0T93dQHGlyVrqAfGSQPyEfLNyGqlzoNCyX45
 4jgzZQIjluXslqlGnkyukQXiK5uUJWajgJLL5pz1GWJw3ArYWF1RFHSambTaD/KfPZ4aLkmC/Yd
 fxOk+AI/CPmLlLAtXUMy34l93Nw9GhIc=
X-Received: by 2002:a05:6512:3b14:: with SMTP id
 f20mr5994585lfv.614.1629361971885; 
 Thu, 19 Aug 2021 01:32:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9f08olii+hcsasAgCP9iVnvgwo0SAEGq8A1qdjnw4mFNTgBj6lN33nTWC86FZEyqeH2aKFfwXpg/x1MvdXAE=
X-Received: by 2002:a05:6512:3b14:: with SMTP id
 f20mr5994568lfv.614.1629361971645; 
 Thu, 19 Aug 2021 01:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <7ec1626e-3c4b-c9e8-1a29-f576163712f5@redhat.com>
 <CACGkMEsfHNX4nO6y2a8wRZF42Pus8UpCk6+TNhbqTp-ecFKhpw@mail.gmail.com>
In-Reply-To: <CACGkMEsfHNX4nO6y2a8wRZF42Pus8UpCk6+TNhbqTp-ecFKhpw@mail.gmail.com>
From: Yan Vugenfirer <yvugenfi@redhat.com>
Date: Thu, 19 Aug 2021 11:32:40 +0300
Message-ID: <CAGoVJZx4wKtFoMNwXwFt3+hDBMkgqf+zP90=JV7qe72ePRkdvQ@mail.gmail.com>
Subject: Re: Is QEMU's vmxnet3 still being used?
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=yvugenfi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000087e3ef05c9e56509"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=yvugenfi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Leonid Bloch <leonid@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000087e3ef05c9e56509
Content-Type: text/plain; charset="UTF-8"

Hi All,

I know it is used to develop DPDK support on Windows right now.
Previously it was used for different nested virtualization scenarios as
well.

Best regards,
Yan.

On Thu, Aug 19, 2021 at 11:22 AM Jason Wang <jasowang@redhat.com> wrote:

> On Wed, Aug 18, 2021 at 9:42 PM Thomas Huth <thuth@redhat.com> wrote:
> >
> >
> >   Hi all,
> >
> > I recently noticed that we have quite a bunch of tickets against the
> vmxnet3
> > device in our bug trackers, which indicate that this device could be
> used to
> > crash QEMU in various ways:
> >
> >
> https://gitlab.com/qemu-project/qemu/-/issues?state=opened&search=vmxnet3
> >
> >   https://bugs.launchpad.net/qemu?field.searchtext=vmxnet3
> >
> > Having hardly any knowledge about this device and its usage at all, I
> wonder
> > how much it is still used out there in the wild?
>
> I guess it might have been used for virt-v2v in the past.
>
> But I'm not sure what's the status now.
>
> Thanks
>
> > If there are still many
> > users of this device, is there anybody interested here in helping to get
> > these crashes fixed in the near future? Otherwise, should we maybe rather
> > mark this device as deprecated and remove it in a couple of releases?
> What
> > do you think?
> >
> >   Thomas
> >
>
>
>

--00000000000087e3ef05c9e56509
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I know it is used to develop DP=
DK support on Windows right now.=C2=A0</div><div>Previously it was used for=
 different nested virtualization scenarios as well.</div><div><br></div><di=
v>Best regards,</div><div>Yan.</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 19, 2021 at 11:22 AM Jason =
Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex">On Wed, Aug 18, 2021 at 9:42 PM Thomas Hu=
th &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Hi all,<br>
&gt;<br>
&gt; I recently noticed that we have quite a bunch of tickets against the v=
mxnet3<br>
&gt; device in our bug trackers, which indicate that this device could be u=
sed to<br>
&gt; crash QEMU in various ways:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues?s=
tate=3Dopened&amp;search=3Dvmxnet3" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.com/qemu-project/qemu/-/issues?state=3Dopened&amp;search=3Dvmx=
net3</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://bugs.launchpad.net/qemu?field.searchtex=
t=3Dvmxnet3" rel=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.ne=
t/qemu?field.searchtext=3Dvmxnet3</a><br>
&gt;<br>
&gt; Having hardly any knowledge about this device and its usage at all, I =
wonder<br>
&gt; how much it is still used out there in the wild?<br>
<br>
I guess it might have been used for virt-v2v in the past.<br>
<br>
But I&#39;m not sure what&#39;s the status now.<br>
<br>
Thanks<br>
<br>
&gt; If there are still many<br>
&gt; users of this device, is there anybody interested here in helping to g=
et<br>
&gt; these crashes fixed in the near future? Otherwise, should we maybe rat=
her<br>
&gt; mark this device as deprecated and remove it in a couple of releases? =
What<br>
&gt; do you think?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Thomas<br>
&gt;<br>
<br>
<br>
</blockquote></div>

--00000000000087e3ef05c9e56509--


