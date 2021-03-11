Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA46337082
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:53:07 +0100 (CET)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIwE-0008Gf-Q9
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKIvP-0007hY-EJ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:52:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKIvN-0000UO-RF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615459931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjrhOdExxjTkHEHwnyPmYzVzzKgfY1kW7w6NGvr6FrQ=;
 b=VYnPsrXda7cF5vxDXUTYHJCs4MuOp1/1ovPgOfS7EyDPthXvr2HF3gqKE6OKndU5KFZLkd
 Oc3v5GzFBkBFK7pVy4AGntuB7MpQ0CSqtIjfE5/KgikDP370rS7qT+RGmpgoZq16OKvyz+
 IONinx7VteEzquXZc74Hp2pqK6XinQA=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-g0WpfmVsPVqYoyLTzrSvEA-1; Thu, 11 Mar 2021 05:52:08 -0500
X-MC-Unique: g0WpfmVsPVqYoyLTzrSvEA-1
Received: by mail-il1-f197.google.com with SMTP id r16so5545251ilj.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 02:52:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IjrhOdExxjTkHEHwnyPmYzVzzKgfY1kW7w6NGvr6FrQ=;
 b=Fr/i/JjWGUATTquHnJahAzE1QkfSqRSlpx+X7P5Xr/bIQVs6uTzctNzC2zbgS/mVMV
 mr5KniZOrH8+ZTegh7g8/MmHbCGDl57ByCxwHF91qHkHw64IbazwUNUoUrGPGQ6t6aj2
 fOWjTncdcOUUL9baM+ZL4ychHxwWlqUz0eV3kZ7vYnyKc9QR8MAsauCpcXij4LtLSYL5
 FXounf598v5baTdm1cd3CfcPU+MWV7mA/6zouQXISnvyJjnaN+AwpUBiErm7AbkYDCCy
 jzdUuNZ+8jJ4AhpsggjZB0hcr+M54SdpeolQbsqmCErXHKXl+L/IZvQf6DJIL9YAd9or
 14rA==
X-Gm-Message-State: AOAM5324W12G048hSW3n1+/OwM/161mzXwGxLJqNuU3u2wZiugGHOaDK
 mBsBHvHEt5r2/RPIJMK3G7RMWG4EGd+mD0zVLq9WXvQYu2UTWnzV0gqQ+wGD75Hk6Unf0B2nVIT
 xJNZ+WDHUcXWi5suMMph56qJPfJC+M4U=
X-Received: by 2002:a02:8545:: with SMTP id g63mr2888089jai.79.1615459928278; 
 Thu, 11 Mar 2021 02:52:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy09hOAY1LOi58A9Zm8sxADBtQkybAhTLd5wWVcN6HVvmR1SaOgZ1Vsz/jHNcM2WywiFaTv0Yc6mpwHu9A3Too=
X-Received: by 2002:a02:8545:: with SMTP id g63mr2888076jai.79.1615459928142; 
 Thu, 11 Mar 2021 02:52:08 -0800 (PST)
MIME-Version: 1.0
References: <20210311103250.532191-1-pbonzini@redhat.com>
In-Reply-To: <20210311103250.532191-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 11 Mar 2021 14:51:57 +0400
Message-ID: <CAMxuvaxwDujPJN=JjADGE+=wDiBWjhFX+omJ_D8bmXJMPxRaZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] vhost: replace master/slave with more accurate
 wording
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002a8afc05bd40931b"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002a8afc05bd40931b
Content-Type: text/plain; charset="UTF-8"

Hi

On Thu, Mar 11, 2021 at 2:33 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Compared to v1, which only affected the prose of the documentation, I
> am also changing the message names in the docs and code now.
>
> Patch 2 was also adjusted according to Stefan's documentation, and
> "frontend/backend" (with no hyphen) is used consistently.
>
> Paolo
>
>
What about renaming  VhostUserSlaveRequest too ?
(subprojects/libvhost-user/libvhost-user.h & hw/virtio/vhost-user.c)

Supersedes: <20210226143413.188046-1-pbonzini@redhat.com>
>
> Paolo Bonzini (7):
>   docs: vhost-user: clean up request/reply description
>   docs: vhost-user: rewrite section on ring state machine
>   docs: vhost-user: replace master/slave with front-end/back-end
>   docs: vhost-user: rename message names from "SLAVE" to "BACKEND"
>   vhost-user: rename message names from "SLAVE" to "BACKEND"
>   libvhost-user: rename message names from "SLAVE" to "BACKEND"
>   libvhost-user: rename struct VuDev fields from "slave" to "backend"
>
>  docs/interop/vhost-user-gpu.rst           |  10 +-
>  docs/interop/vhost-user.rst               | 532 ++++++++++++----------
>  hw/virtio/vhost-user.c                    |  96 ++--
>  subprojects/libvhost-user/libvhost-user.c |  66 +--
>  subprojects/libvhost-user/libvhost-user.h |  45 +-
>  5 files changed, 395 insertions(+), 354 deletions(-)
>
> --
> 2.26.2
>
>

--0000000000002a8afc05bd40931b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 2:33 PM Paolo Bonzini=
 &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Compared to =
v1, which only affected the prose of the documentation, I<br>
am also changing the message names in the docs and code now.<br>
<br>
Patch 2 was also adjusted according to Stefan&#39;s documentation, and<br>
&quot;frontend/backend&quot; (with no hyphen) is used consistently.<br>
<br>
Paolo<br>
<br></blockquote><div><br></div><div>What about renaming=C2=A0 VhostUserSla=
veRequest too ?</div><div>(subprojects/libvhost-user/libvhost-user.h &amp; =
hw/virtio/vhost-user.c)</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
Supersedes: &lt;<a href=3D"mailto:20210226143413.188046-1-pbonzini@redhat.c=
om" target=3D"_blank">20210226143413.188046-1-pbonzini@redhat.com</a>&gt;<b=
r>
<br>
Paolo Bonzini (7):<br>
=C2=A0 docs: vhost-user: clean up request/reply description<br>
=C2=A0 docs: vhost-user: rewrite section on ring state machine<br>
=C2=A0 docs: vhost-user: replace master/slave with front-end/back-end<br>
=C2=A0 docs: vhost-user: rename message names from &quot;SLAVE&quot; to &qu=
ot;BACKEND&quot;<br>
=C2=A0 vhost-user: rename message names from &quot;SLAVE&quot; to &quot;BAC=
KEND&quot;<br>
=C2=A0 libvhost-user: rename message names from &quot;SLAVE&quot; to &quot;=
BACKEND&quot;<br>
=C2=A0 libvhost-user: rename struct VuDev fields from &quot;slave&quot; to =
&quot;backend&quot;<br>
<br>
=C2=A0docs/interop/vhost-user-gpu.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 10 +-<br>
=C2=A0docs/interop/vhost-user.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 532 ++++++++++++----------<br>
=C2=A0hw/virtio/vhost-user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 96 ++--<br>
=C2=A0subprojects/libvhost-user/libvhost-user.c |=C2=A0 66 +--<br>
=C2=A0subprojects/libvhost-user/libvhost-user.h |=C2=A0 45 +-<br>
=C2=A05 files changed, 395 insertions(+), 354 deletions(-)<br>
<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div>

--0000000000002a8afc05bd40931b--


