Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD2D4101F4
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 02:03:14 +0200 (CEST)
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRNp3-0008Jd-JH
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 20:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRNnx-0007cu-9I
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 20:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRNnl-0004om-Qd
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 20:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631923313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rOIcTVZwaS8sqGXCzx5wWymvxi2J5KwzInkRMIGGQQE=;
 b=L+g54GIFKaLFyh40hPUqIBJZrNIWJJdubvaJC3rqlZM8vECssXTbShJP72ZZYHWSliEnl1
 sr8Wvkm+G9J350zoQ0BsxdMxfQ+wcJdllA6gfNcDssufLkmz1DM6QyxTfkuqU7u8bVaUvG
 TxDCceAjOguwMN6668D06ATJazTz27E=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-vrfrlwOGP9i4PO-QJ42GrQ-1; Fri, 17 Sep 2021 20:01:49 -0400
X-MC-Unique: vrfrlwOGP9i4PO-QJ42GrQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 d18-20020a4a9cd2000000b0029afc2f9586so1726544ook.19
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 17:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rOIcTVZwaS8sqGXCzx5wWymvxi2J5KwzInkRMIGGQQE=;
 b=TPyPkj0Tm9lgmMM1mC59r9VLap26YFX1FantbxeipIvh9HICgKkkf6KOlvfeCHEWPA
 5oqUabPOWtkCS5yd48wZb4MBP1MaC9xL46pVCRJJ2NZHK+WVAzSgHrwjLEYm9fhMcqAs
 i8URy+Y0+QzNhpO0ybsS8f09DTT/kRkUeVlvjfn9yc3YcDARAuGLDah2/0kcZ4KUYIjI
 RAj9+DMmoPhGqYBjyjYakvOnIiepohcXmRnOLX9RWPVe0YBi2bZ5bouy5suYS2tLxgBd
 1/CXp3YhbjmS/h0EfnJrM6mDix65JHmQBbPToLQMIHoBN6PJT0//dGhTPcbFTp66QqD8
 3W5A==
X-Gm-Message-State: AOAM532iKSq8P0SIzZtyjhhlJnVNc2bguktfCdE8e0Thwarb+qN8rCUx
 tpVHPncnVqhlAukftdtUtBv/RV74oj0FGL2+4RUxVR66M52dVhGH4NbIspg2lh1Sw1KwCOra0gu
 YZohhi5QhuFsU3LcZmjvrcWPF/U5/pCU=
X-Received: by 2002:a05:6830:2685:: with SMTP id
 l5mr8208735otu.129.1631923309146; 
 Fri, 17 Sep 2021 17:01:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+juZl+sHb4F1INEdmH13G+Tk1L1O7OgeAywQXMVXfxosSEQuNxilmgFaas8nD+19Ia5yoEjpEfzSEWFwa1qs=
X-Received: by 2002:a05:6830:2685:: with SMTP id
 l5mr8208717otu.129.1631923308899; 
 Fri, 17 Sep 2021 17:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-12-jsnow@redhat.com>
 <5896598a-ebd3-daf4-aff2-0bee44ea8d5e@redhat.com>
In-Reply-To: <5896598a-ebd3-daf4-aff2-0bee44ea8d5e@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 20:01:38 -0400
Message-ID: <CAFn=p-ZQ-gpSc7EvM5hiCD2QFFngsHiBW4q35WJTf9F9X-MX+g@mail.gmail.com>
Subject: Re: [PATCH 11/15] python/aqmp: Create sync QMP wrapper for iotests
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000020c23b05cc39c1e4"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000020c23b05cc39c1e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 10:23 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > This is a wrapper around the async QMPClient that mimics the old,
> > synchronous QEMUMonitorProtocol class. It is designed to be
> > interchangeable with the old implementation.
> >
> > It does not, however, attempt to mimic Exception compatibility.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/aqmp/legacy.py | 131 ++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 131 insertions(+)
> >   create mode 100644 python/qemu/aqmp/legacy.py
>
> Looks reasonable to me, although I can=E2=80=99t give an R-b in good
> conscience.  I=E2=80=99m tempted to give a neo-tag (=E2=80=9CLooks-okay-t=
o:=E2=80=9D), but let=E2=80=99s
> just be boring and do an
>
> Acked-by: Hanna Reitz <hreitz@redhat.com>
>
>
The mischief maker in me wants to add the custom tag, but I suppose I'll be
kind to the people who crunch the stats and use the vanilla tag. :)

Thanks a bunch!

--js

--00000000000020c23b05cc39c1e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:23 AM Hann=
a Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.=
21 07:40, John Snow wrote:<br>
&gt; This is a wrapper around the async QMPClient that mimics the old,<br>
&gt; synchronous QEMUMonitorProtocol class. It is designed to be<br>
&gt; interchangeable with the old implementation.<br>
&gt;<br>
&gt; It does not, however, attempt to mimic Exception compatibility.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/legacy.py | 131 +++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 131 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 python/qemu/aqmp/legacy.py<br>
<br>
Looks reasonable to me, although I can=E2=80=99t give an R-b in good <br>
conscience.=C2=A0 I=E2=80=99m tempted to give a neo-tag (=E2=80=9CLooks-oka=
y-to:=E2=80=9D), but let=E2=80=99s <br>
just be boring and do an<br>
<br>
Acked-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D"_b=
lank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>The mischief maker in me wants to add =
the custom tag, but I suppose I&#39;ll be kind to the people who crunch the=
 stats and use the vanilla tag. :)</div></div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">Thanks a bunch!</div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">--js<br></div></div>

--00000000000020c23b05cc39c1e4--


