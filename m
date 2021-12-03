Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E5467FB5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 23:11:58 +0100 (CET)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtGma-0003MF-Vp
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 17:11:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elima@redhat.com>) id 1mtFIr-0006CY-IE
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 15:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elima@redhat.com>) id 1mtFIn-0005LU-Dl
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 15:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638563824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lZtyhJCr2hRAWrAzIrAnni83D8SnJgwhgPvjlTPQ+hU=;
 b=MKfMUBr3GqvEX9dPpACiXeQPxgM30kX4iu2gd7nh7bcjAOxmHzBVzpQnCIHJDiqnMsGqfX
 eLTojOP5gPx1NaKCsfqOAMhcDp+VKXXmydiF60wlFvbapnKZG7lK95yQx2xNtpsDWMHz7r
 xHQz/ckMUJof1WteYe1FPYQNkf+CntE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-1LXEPVZ3NaWRocgqPK7KKQ-1; Fri, 03 Dec 2021 15:35:53 -0500
X-MC-Unique: 1LXEPVZ3NaWRocgqPK7KKQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 i3-20020a170902c94300b0014287dc7dcbso1161587pla.16
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 12:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZtyhJCr2hRAWrAzIrAnni83D8SnJgwhgPvjlTPQ+hU=;
 b=O88QJgNwc3gmbA/k0GzACoE9Za0zJfQ8hgTrfCyfS2JQBuAXkEB6SdHWPHpyv6DnHp
 hYnu/ZG8lQCGc+iw2/WwaM9dpuearPcshPK8qSh9kHNgQHRunXcJQSImhCALmIUTxoGt
 zlcVnIR6driMjwo5YbxDFg9ooLT13UU4DZrfOkUes0IOq32Wx2Uus/Ymk/UZNOUyeAb9
 lxHo3XJ4ygyqtS0lj5Vt9Pwjy6Xoz91d2miZJVlg6MMI3cyyX4jD7+eQbtJtZOUxpPQk
 8pbQEZwzfHfK9mFatbOObzjEQqF+D1GJDNnw6Aav+gNlDvzej/MsIkMv64mW6/UmVE9M
 xM6w==
X-Gm-Message-State: AOAM53332jN8hblEYcd8j/3PebCmGOe4/TV1FWPG67+fAqvI2AIQLyzW
 IMMyV4iq6wgtwDeEmRdXRPP6XfnWL4zAeFtKMt6pIh3xzaU3DDtgoXrswk4Wv1DnFW+vpqA796H
 BSjYLiF+/xw2FL7MGc9WSCBUpPnQIzXc=
X-Received: by 2002:a17:903:41ca:b0:142:1dff:1cb7 with SMTP id
 u10-20020a17090341ca00b001421dff1cb7mr24989841ple.37.1638563752703; 
 Fri, 03 Dec 2021 12:35:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9xbtNoFHv1eEpkx+dii8OKiU7bNY/CQwktKidzZ5qA9PA9bYwB3K/DtVTqX2E/Pk1REPmkAivdK0aocsYe3k=
X-Received: by 2002:a17:903:41ca:b0:142:1dff:1cb7 with SMTP id
 u10-20020a17090341ca00b001421dff1cb7mr24989815ple.37.1638563752444; Fri, 03
 Dec 2021 12:35:52 -0800 (PST)
MIME-Version: 1.0
References: <CAJzYwARYDA+E4wrszx-F1D_9+VAYB2dU=M-LtvzPJey02gu2qg@mail.gmail.com>
 <20211203193725.GB1127@redhat.com>
In-Reply-To: <20211203193725.GB1127@redhat.com>
From: Eduardo Lima <elima@redhat.com>
Date: Fri, 3 Dec 2021 17:35:41 -0300
Message-ID: <CAJzYwASbiKGe5n7Ggs3u+6b6-7KEyqLCHxFsv2YMh2xyU4Y1MQ@mail.gmail.com>
Subject: Re: QEMU 6.2.0 and rhbz#1999878
To: "Richard W.M. Jones" <rjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=elima@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000681b8305d243da4b"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=elima@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 03 Dec 2021 17:09:40 -0500
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
Cc: peter.maydell@linaro.org, Daniel Berrange <berrange@redhat.com>,
 sw@weilnetz.de, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000681b8305d243da4b
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 4:37 PM Richard W.M. Jones <rjones@redhat.com> wrote:

> On Fri, Dec 03, 2021 at 04:20:23PM -0300, Eduardo Lima wrote:
> > Hi Rich,
> >
> > Can you confirm if the patch you added for qemu in Fedora has still not
> been
> > merged upstream? I could not find it on the git source tree.
> >
> > +Patch2: 0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch
> > +From 1331e4eec016a295949009b4360c592401b089f7 Mon Sep 17 00:00:00 2001
> > +From: Richard Henderson <richard.henderson@linaro.org>
> > +Date: Sun, 12 Sep 2021 10:49:25 -0700
> > +Subject: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON
>
> https://bugzilla.redhat.com/show_bug.cgi?id=1999878
> https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01028.html
>
> The patch I posted wasn't correct (or meant to be), it was just a
> workaround.  However I think you're right - I don't believe the
> original problem was ever fixed.
>
Yes, I saw that your original patch had been replaced by this new one I
mentioned, so I thought it was the correct solution, but I could not find
this new one on the repository as well.

At the moment I kept it as part of 6.2.0 build, which I am just about to
push to rawhide. It builds locally, and I am only waiting for the
scratch-build to finish.

https://koji.fedoraproject.org/koji/taskinfo?taskID=79556515

Thanks, Eduardo.



>
> Let's see what upstreams says ...
>
> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat
> http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-p2v converts physical machines to virtual machines.  Boot with a
> live CD or over the network (PXE) and turn machines into KVM guests.
> http://libguestfs.org/virt-v2v
>
>

--000000000000681b8305d243da4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 =
at 4:37 PM Richard W.M. Jones &lt;<a href=3D"mailto:rjones@redhat.com">rjon=
es@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri, Dec 03, 2021 at 04:20:23PM -0300, Eduardo Lima wrote:<=
br>
&gt; Hi Rich,<br>
&gt; <br>
&gt; Can you confirm if the patch you added for qemu in Fedora has still no=
t been<br>
&gt; merged upstream? I could not find it on the git source tree.<br>
&gt; <br>
&gt; +Patch2: 0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.pat=
ch<br>
&gt; +From 1331e4eec016a295949009b4360c592401b089f7 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linar=
o.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; +Date: Sun, 12 Sep 2021 10:49:25 -0700<br>
&gt; +Subject: [PATCH] tcg/arm: Reduce vector alignment requirement for NEO=
N<br>
<br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1999878" rel=3D"no=
referrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D1=
999878</a><br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg0102=
8.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/archi=
ve/html/qemu-devel/2021-09/msg01028.html</a><br>
<br>
The patch I posted wasn&#39;t correct (or meant to be), it was just a<br>
workaround.=C2=A0 However I think you&#39;re right - I don&#39;t believe th=
e<br>
original problem was ever fixed.<br></blockquote><div><span style=3D"font-f=
amily:arial,sans-serif"><span class=3D"gmail_default" style=3D"font-family:=
arial,sans-serif;font-size:small"></span></span></div><div><span style=3D"f=
ont-family:arial,sans-serif"><span class=3D"gmail_default" style=3D"font-fa=
mily:arial,sans-serif;font-size:small">Yes, I saw that your original patch =
had been replaced by this new one I mentioned, so I thought it was the corr=
ect solution, but I could not find this new one on the repository as well.<=
/span></span></div><div><span style=3D"font-family:arial,sans-serif"><span =
class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:sma=
ll"><br></span></span></div><div><span style=3D"font-family:arial,sans-seri=
f"><span class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font=
-size:small">At the moment I kept it as part of 6.2.0 build, which I am jus=
t about to push to rawhide. It builds locally, and I am only waiting for th=
e scratch-build to finish.</span></span><br></div><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:sma=
ll"><a href=3D"https://koji.fedoraproject.org/koji/taskinfo?taskID=3D795565=
15">https://koji.fedoraproject.org/koji/taskinfo?taskID=3D79556515</a></div=
><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-family:arial=
,sans-serif;font-size:small">Thanks, Eduardo.</div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Let&#39;s see what upstreams says ...<br>
<br>
Rich.<br>
<br>
-- <br>
Richard Jones, Virtualization Group, Red Hat <a href=3D"http://people.redha=
t.com/~rjones" rel=3D"noreferrer" target=3D"_blank">http://people.redhat.co=
m/~rjones</a><br>
Read my programming and virtualization blog: <a href=3D"http://rwmj.wordpre=
ss.com" rel=3D"noreferrer" target=3D"_blank">http://rwmj.wordpress.com</a><=
br>
virt-p2v converts physical machines to virtual machines.=C2=A0 Boot with a<=
br>
live CD or over the network (PXE) and turn machines into KVM guests.<br>
<a href=3D"http://libguestfs.org/virt-v2v" rel=3D"noreferrer" target=3D"_bl=
ank">http://libguestfs.org/virt-v2v</a><br>
<br>
</blockquote></div></div>

--000000000000681b8305d243da4b--


