Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16C474023
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 11:11:31 +0100 (CET)
Received: from localhost ([::1]:57548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx4mQ-00086T-6t
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 05:11:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mx4kB-0006yh-0y
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:09:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mx4k7-0008V7-4I
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639476545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KuBhY0zAyF1Cxv9cTdCUUlZUtZYIfruDgB4WUyi14o0=;
 b=IrTLUYuHzTCZGM+YNijIERzWPaIeNygIqLmkDf3GqXNe6KWQhh9P/8+yfuy9jae69Y6zQz
 qZh5aKEXr/FPOtBpYcS2mzlGjxdR4vYMI4ROT89BfBLdcA0CDQrqG3Id/Dr2iQDJbrdNaZ
 +Z9HB+vLNd4coMfXkxSd5aK38NAmC1Y=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-DEuNz0C9N32RtRZszXtFqQ-1; Tue, 14 Dec 2021 05:09:03 -0500
X-MC-Unique: DEuNz0C9N32RtRZszXtFqQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 q12-20020a9f2b4c000000b002ddac466f76so12414621uaj.12
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 02:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KuBhY0zAyF1Cxv9cTdCUUlZUtZYIfruDgB4WUyi14o0=;
 b=7u4cKTCELHhn4R8qt4gdMJzZxxZmDnSc8+egB38TmgDp2NKAFMNLyLHy7s4meFPFC5
 mYQfsCgWsgJk+U3w7QO9+gzM5S2+FVkCz0/VhmNsZAdqf1A3YDAFBoJlJxo0+Tae+Slb
 /mxp7Gapr/ZjZNjN/E7MiSVp1UELNegPckwPSrsY141hHUQosMi2KURU6TYs7+Rc7ruD
 kwm2ERNq5/CEnpxy2jPy18NwfihE821qQeaJxKQbjYXnsB22672wClAbdWSJy67AHQiR
 6FA4T9Pzp3Ljyhm/ywMRVBf6sIa5Fu6RO5+pPid/EKid2Yri29l+BtjDo5wi7+jE3q08
 gyxg==
X-Gm-Message-State: AOAM532qOvK4vsnYRFHy0KvzHsF0nSOe2G0Bg608J9ovHpY2z7AVSXlM
 gWuCuSsY47dWNoxlhWIsifCpX7nvBY1zz8Xt/L3xSG6BkpTkvVFCAIRoyJ/L6QmxluSXmfJMoWa
 yzqm/frX75nWr6O7PfUY5MWKC9oQNy3Y=
X-Received: by 2002:a67:6bc6:: with SMTP id g189mr3877683vsc.63.1639476542348; 
 Tue, 14 Dec 2021 02:09:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8skTh5G37s2zP2rWHkEOAUMO+WFZ+f6Zaeu7jZFRJoCacxl47W7JpU1Mcxea+5E/q13T0VEa9BgEZ7dFirqc=
X-Received: by 2002:a67:6bc6:: with SMTP id g189mr3877651vsc.63.1639476541750; 
 Tue, 14 Dec 2021 02:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20211214075424.6920-1-zhanghailiang@xfusion.com>
 <fc7b5d91-98f6-b146-4a67-5e6800bccadc@redhat.com>
 <YbhiU8ARoS5LcORY@redhat.com>
In-Reply-To: <YbhiU8ARoS5LcORY@redhat.com>
From: Juan Quintela <quintela@redhat.com>
Date: Tue, 14 Dec 2021 11:08:49 +0100
Message-ID: <CAGiv1-XXxAvM-CXaFd6yMHt5hZHY2oFLq8xsmmjtEpte+PpGqQ@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Change my email address
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e394c505d31860b5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 David Gilbert <dgilbert@redhat.com>, Gonglei <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e394c505d31860b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021, 10:22 Daniel P. Berrang=C3=A9 <berrange@redhat.com> w=
rote:

> On Tue, Dec 14, 2021 at 10:04:03AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 12/14/21 08:54, Hailiang Zhang wrote:
> > > The zhang.zhanghailiang@huawei.com email address has been
> > > stopped. Change it to my new email address.
> > >
> > > Signed-off-by: Hailiang Zhang <zhanghailiang@xfusion.com>
> > > ---
> > > hi Juan & Dave,
> > >
> > > Firstly, thank you for your working on maintaining the COLO framework=
.
> > > I didn't have much time on it in the past days.
> > >
> > > I may have some time in the next days since my job has changed.
> > >
> > > Because of my old email being stopped, i can not use it to send this
> patch.
> > > Please help me to merge this patch.
> >
> > Can we have an Ack-by from someone working at Huawei?
>
> Why do we need that ? Subsystems are not owned by companies.
>
> If someone moves company and wants to carry on in their existing
> role as maintainer that is fine and doesn't need approva from their
> old company IMHO.
>

Hi Daniel

I think what phillipe wants is a way to.know that he is the same person.
I.e. we have one email telling that he font work animate at huawei and that
this is his new address.  I guess that it is a question of trust.  Anyone
that says that they belong to the same person will be enough.

Later, Juan.


Regards,
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

--000000000000e394c505d31860b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Dec 14, 2021, 10:22 Daniel P. Berrang=C3=A9 &l=
t;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Tue, Dec 14, 2021 at 10:04:03AM=
 +0100, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; On 12/14/21 08:54, Hailiang Zhang wrote:<br>
&gt; &gt; The <a href=3D"mailto:zhang.zhanghailiang@huawei.com" target=3D"_=
blank" rel=3D"noreferrer">zhang.zhanghailiang@huawei.com</a> email address =
has been<br>
&gt; &gt; stopped. Change it to my new email address.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Hailiang Zhang &lt;<a href=3D"mailto:zhanghailiang=
@xfusion.com" target=3D"_blank" rel=3D"noreferrer">zhanghailiang@xfusion.co=
m</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; hi Juan &amp; Dave,<br>
&gt; &gt; <br>
&gt; &gt; Firstly, thank you for your working on maintaining the COLO frame=
work.<br>
&gt; &gt; I didn&#39;t have much time on it in the past days.<br>
&gt; &gt; <br>
&gt; &gt; I may have some time in the next days since my job has changed.<b=
r>
&gt; &gt; <br>
&gt; &gt; Because of my old email being stopped, i can not use it to send t=
his patch.<br>
&gt; &gt; Please help me to merge this patch.<br>
&gt; <br>
&gt; Can we have an Ack-by from someone working at Huawei?<br>
<br>
Why do we need that ? Subsystems are not owned by companies.<br>
<br>
If someone moves company and wants to carry on in their existing<br>
role as maintainer that is fine and doesn&#39;t need approva from their<br>
old company IMHO.<br></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Hi Daniel</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I think what phillipe wants is a way to.know that he is the same person.=
=C2=A0 I.e. we have one email telling that he font work animate at huawei a=
nd that this is his new address.=C2=A0 I guess that it is a question of tru=
st.=C2=A0 Anyone that says that they belong to the same person will be enou=
gh.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Later, Juan.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--000000000000e394c505d31860b5--


