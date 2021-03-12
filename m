Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C44339085
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:58:32 +0100 (CET)
Received: from localhost ([::1]:34290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjFH-0000A8-Qg
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKjE8-00084e-73
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:57:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKjE6-0006un-1j
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615561037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ke8EkIUxZ3n3rR8HVL7rps1Oq7Lj7zszQBCeFx5FrG4=;
 b=gWKWKws8yLKcNczn4L0XeKh/1tG98hBg6WQKNs0CfZk7l1abY+PXKJi6P/hPxNTwBqGyh+
 N7Kek5fEXyiEH18zv+IF0wTBKq+QOmWwupm9dOv+gudFeWeFPymc5RWVpY3w+ZmtNt+rR5
 Mckh+8YlY9pK2oHDyYybM0RGsCS0Ymo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-ZWN-ly-KOeGU57lRgeeBjQ-1; Fri, 12 Mar 2021 09:57:14 -0500
X-MC-Unique: ZWN-ly-KOeGU57lRgeeBjQ-1
Received: by mail-il1-f199.google.com with SMTP id h17so18304527ila.12
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 06:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ke8EkIUxZ3n3rR8HVL7rps1Oq7Lj7zszQBCeFx5FrG4=;
 b=bIbFGO7NK10vBB/uwVmWf9TyMcqphfp+odvDq/LUrAntCEjuyScBC7daTZ3TZ1Wy6t
 8FMOq5KDONyhPcMYRUXJvk/NQ42NvEX8lgtZoTKxOy1yNjljpwA8Dxew1JQexb1caXDW
 7eCYvJ45UxQxHzDpCJ+daX0JFo04bSdh/lM2VKxCtOwUHGI7RyLuC7AKIbGXE4Z7tyKp
 Utm4lTrjeAEvx23cpdjghxiC6XL+PIMDLxfdOUOKJ5Fg3a3nC6S7D40ATaLqzL/IDjfT
 06i9ON7VnjLrWxpwqbanfKSu2HoMaT+tJ2I98nyqL1mD4+ndaK5bg7tAl9fmcX6++U5c
 xl9Q==
X-Gm-Message-State: AOAM530paiy32QNWoLhX1+KR+t2q2VhEILIvSdsTYU7DidmGfiMouSig
 UpaeQuXs869/W7MoR5Mkd9KuZKNuxbVDZUY0puEA2D6Kt3XFjyIelqjGS4EDJkki+NKYRq2AI8x
 4S9vgmGSqE35txTJ5swFFjkC0L4X0/7I=
X-Received: by 2002:a05:6e02:216c:: with SMTP id
 s12mr3032332ilv.161.1615561034310; 
 Fri, 12 Mar 2021 06:57:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+ZuwmNC/k5qsfDumO2Xn93Bb+B7f4sHSPvH9BUJjYO692EquOhqYuej2Bl3aMxk40zZ+g3EL2ifP2iGBKmDI=
X-Received: by 2002:a05:6e02:216c:: with SMTP id
 s12mr3032325ilv.161.1615561034060; 
 Fri, 12 Mar 2021 06:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
 <20210312111806.zdh2c63cxaiyabyp@sirius.home.kraxel.org>
 <CAMxuvayh_8=bp4=_CZ9ezEjE6god+35RJ9dBx6TBF34NnO_+zw@mail.gmail.com>
 <20210312143727.sllpme4pgdhoj4ja@sirius.home.kraxel.org>
In-Reply-To: <20210312143727.sllpme4pgdhoj4ja@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 12 Mar 2021 18:57:03 +0400
Message-ID: <CAMxuvayVFMMDY6Ssn2Ca24VeuZGuyH5CQu5TJ-zu5J3C=BvcDQ@mail.gmail.com>
Subject: Re: [PATCH 00/27] Add D-Bus display backend
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008c66a005bd581db7"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008c66a005bd581db7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 12, 2021 at 6:37 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> > On Fri, Mar 12, 2021 at 3:18 PM Gerd Hoffmann <kraxel@redhat.com> wrote=
:
> >
> > > On Fri, Mar 12, 2021 at 02:00:41PM +0400, marcandre.lureau@redhat.com
> > > wrote:
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > The whole series calls for a splitup.  First the bugfixes, which we
> > > should be able to fast-track for 6.0.  Next the ui opengl changes.  F=
or
> > > those a cover letter would be nice, describing the overall direction
> and
> > > motivation for the change.  Make sure these don't re-introduce a open=
gl
> > > dependency to core qemu for modular builds.  Finally the new display
> > > backend patches / discussion.
> > >
> >
> > I agree, what about reviewing and queuing the first patches? Then I can
> > resend up to the second part.
>
> Can cherry-pick them.  First four patches I assume?
>
>
Yes, those are clearly fixes. The following GL context/events patches could
be upstream too, if you agree with it, even if they don't really have need
until a display backend makes real use of them.

--0000000000008c66a005bd581db7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 6:37 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; O=
n Fri, Mar 12, 2021 at 3:18 PM Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@r=
edhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Fri, Mar 12, 2021 at 02:00:41PM +0400, <a href=3D"mailto:marca=
ndre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a><b=
r>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<b=
r>
&gt; &gt;<br>
&gt; &gt; The whole series calls for a splitup.=C2=A0 First the bugfixes, w=
hich we<br>
&gt; &gt; should be able to fast-track for 6.0.=C2=A0 Next the ui opengl ch=
anges.=C2=A0 For<br>
&gt; &gt; those a cover letter would be nice, describing the overall direct=
ion and<br>
&gt; &gt; motivation for the change.=C2=A0 Make sure these don&#39;t re-int=
roduce a opengl<br>
&gt; &gt; dependency to core qemu for modular builds.=C2=A0 Finally the new=
 display<br>
&gt; &gt; backend patches / discussion.<br>
&gt; &gt;<br>
&gt; <br>
&gt; I agree, what about reviewing and queuing the first patches? Then I ca=
n<br>
&gt; resend up to the second part.<br>
<br>
Can cherry-pick them.=C2=A0 First four patches I assume?<br>
<br></blockquote><div><br></div><div>Yes, those are clearly fixes. The foll=
owing GL context/events patches could be upstream too, if you agree with it=
, even if they don&#39;t really have need until a display backend makes rea=
l use of them.<br></div></div></div>

--0000000000008c66a005bd581db7--


