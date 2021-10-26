Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADE743B9D7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:44:10 +0200 (CEST)
Received: from localhost ([::1]:59270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRQf-0007ir-BG
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfRJe-0007Yn-FO
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfRJX-0003MV-AS
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635273404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A1FVa/Xlx/tz1Stay2aztVoZjErW5j/p5pdrJX0MHOg=;
 b=Axp726YVC7qSapW9SMu/icRZ/9O49pMWXjBX5SKmoUrdBCJTJAa9kqt9QEwQLj5R0JgHLB
 g1UHJ1b5xQBa9qRF9264Q24KLwzWBSUkJM+AkxULpUeq2Ha5SFzBmLR/Zf37R7anN/yL7C
 qqIm+y8QDut9vb0J6a2jmCY4On5WtyQ=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-65T1seGwMDaq_NFl8dtoKA-1; Tue, 26 Oct 2021 14:36:43 -0400
X-MC-Unique: 65T1seGwMDaq_NFl8dtoKA-1
Received: by mail-vk1-f200.google.com with SMTP id
 r3-20020a1fc103000000b002dc60ab179cso139064vkf.23
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A1FVa/Xlx/tz1Stay2aztVoZjErW5j/p5pdrJX0MHOg=;
 b=QtABGZuhpo1IgrpmbgEzl0RkZswqMuGg5kF/fly4f43s3M6JHxlpoJuI6PFCFXii3+
 PEXkEWXQDq3ypjlVr8/APK6J3W8tqhluyMIaC0WQ2yqV7ciqkl9J/Act2inxN09DPhXg
 zLNJNuyBmBLx6m3/mNRD2NuEV99QEJYwJgGISJXFjBa7E5vkK/V/UnH5Eu5FeUSUe8Zv
 XmMhef5Uo4NttC4Mr1rw8lee4O3uSEJ2izH5X3yGuYfTl20Eni7YEbJqYXqFtySOKErQ
 K5m3b1gmaWMvwakRHGe0c9Tgcj4579Q1WMH307DMTece/GA7MAu4mB+4w6Vy9mp/GdbW
 iLCQ==
X-Gm-Message-State: AOAM530LL55TCvEdjAld8m3tPGmJiM1pJ78gnuwVVbNUyOTYfBzLOycq
 ZFBiwBWH/zXHSeDMW9l/J2JoaSUXn7cNPLwQ1xt4oP80bCQ/Gqn7b8LreoJhEzZATJYC8I1UH10
 34dqc1VNx9q+ppR59kECosMjVyrNbfSo=
X-Received: by 2002:a67:f685:: with SMTP id n5mr25187587vso.31.1635273402779; 
 Tue, 26 Oct 2021 11:36:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGAS/S7DQQvzOdYfXkuj0hIvTp68AE48QSlhkErcjG4UXZvI3R2DETOLkStOqpTIqxB5fsXWRPnaw7P8jkb7o=
X-Received: by 2002:a67:f685:: with SMTP id n5mr25187557vso.31.1635273402585; 
 Tue, 26 Oct 2021 11:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-13-jsnow@redhat.com>
 <df8bd300-1d04-7df8-7916-8b004766d173@redhat.com>
In-Reply-To: <df8bd300-1d04-7df8-7916-8b004766d173@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 14:36:31 -0400
Message-ID: <CAFn=p-ZrKaxnefmOJZRxt718jcSAe3TqeJAUch3DOaEne92cwg@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] iotests/linters: Add entry point for linting via
 Python CI
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000045a79405cf45c26c"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000045a79405cf45c26c
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 6:57 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 19.10.21 16:49, John Snow wrote:
> > We need at least a tiny little shim here to join test file discovery
> > with test invocation. This logic could conceivably be hosted somewhere
> > in python/, but I felt it was strictly the least-rude thing to keep the
> > test logic here in iotests/, even if this small function isn't itself an
> > iotest.
> >
> > Note that we don't actually even need the executable bit here, we'll be
> > relying on the ability to run this module as a script using Python CLI
> > arguments. No chance it gets misunderstood as an actual iotest that way.
> >
> > (It's named, not in tests/, doesn't have the execute bit, and doesn't
> > have an execution shebang.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/linters.py | 27 +++++++++++++++++++++++++++
> >   1 file changed, 27 insertions(+)
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
Thanks! I'll endeavor to try and clean up the list of exempted files to
continue cleaning up this mess, but it's not a top priority right now. I'll
put it on the backburner after I finish typing the QAPI generator. A lot of
the weird compatibility goop will go away over time as I consolidate more
of the venv logic.

(I think this series is good to go, now? I think it could be applied in any
order vs my other series. If you want, if/when you give the go-ahead for
the other series, I could just stage them both myself and make sure they
work well together and save you the headache.)

--js

--00000000000045a79405cf45c26c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 6:57 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 19.10.2=
1 16:49, John Snow wrote:<br>
&gt; We need at least a tiny little shim here to join test file discovery<b=
r>
&gt; with test invocation. This logic could conceivably be hosted somewhere=
<br>
&gt; in python/, but I felt it was strictly the least-rude thing to keep th=
e<br>
&gt; test logic here in iotests/, even if this small function isn&#39;t its=
elf an<br>
&gt; iotest.<br>
&gt;<br>
&gt; Note that we don&#39;t actually even need the executable bit here, we&=
#39;ll be<br>
&gt; relying on the ability to run this module as a script using Python CLI=
<br>
&gt; arguments. No chance it gets misunderstood as an actual iotest that wa=
y.<br>
&gt;<br>
&gt; (It&#39;s named, not in tests/, doesn&#39;t have the execute bit, and =
doesn&#39;t<br>
&gt; have an execution shebang.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/linters.py | 27 +++++++++++++++++++++++=
++++<br>
&gt;=C2=A0 =C2=A01 file changed, 27 insertions(+)<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks! I&#39;ll endeavor to try and c=
lean up the list of exempted files to continue cleaning up this mess, but i=
t&#39;s not a top priority right now. I&#39;ll put it on the backburner aft=
er I finish typing the QAPI generator. A lot of the weird compatibility goo=
p will go away over time as I consolidate more of the venv logic.<br><br></=
div><div>(I think this series is good to go, now? I think it could be appli=
ed in any order vs my other series. If you want, if/when you give the go-ah=
ead for the other series, I could just stage them both myself and make sure=
 they work well together and save you the headache.)<br></div><div><br></di=
v><div>--js<br></div></div></div>

--00000000000045a79405cf45c26c--


