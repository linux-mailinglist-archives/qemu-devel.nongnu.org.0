Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171583E17F9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:28:16 +0200 (CEST)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfI7-0004ad-6R
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBfH7-0003wG-Dk
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBfH5-0005PB-HI
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628177230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vW6rT93MGJcVg/mHdCM0h/jC1U6cdPc+or4EXJEkZ6k=;
 b=fNKVpvpTWdMEso2asunISJ4YdAJ5fyL6zD7/8TMdZ89tOTBcROrwAcpO6lVViSBVVFFBkL
 P+NI3jINgXTEHzc/E5pllHTJa0236IYb+7dhKOfu3UYOFCudILs+j/ZEcnLFGstTn7teI0
 gkn9rkbmbvwGrpHd1N02WeGgLM5mYsU=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-h85KWP6xOPqreqrV49zXXQ-1; Thu, 05 Aug 2021 11:27:06 -0400
X-MC-Unique: h85KWP6xOPqreqrV49zXXQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 r7-20020acaf3070000b029026241cf3dbfso2898451oih.16
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 08:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vW6rT93MGJcVg/mHdCM0h/jC1U6cdPc+or4EXJEkZ6k=;
 b=F6wIefzTyi+VZklaOh1fYeTKvtN9sfGl+zMsgbZMQq0UM2Mz9xZp73u+FdxsAArGbr
 LVphTY4x1c2ZYGS50+Cax3yQzOUQZZVpNbDMQl89TT53sIrw16nGMTOS5PC/nPfidHUh
 +eEundXTqWRdHBawrWxESjF/YrlahmQY0LASLbUOUIaRXh7Ud4DQ5YaNp3YnKOQAWX4L
 nf2cpVZFkH/hdZwE4alrq75ESUHZAQe9xepTbDDpUaWcBgudc6IF5Eq2MhOeV389Z55N
 mu+bVpurpU9A1aFzfbPeum+l8TVODjqgPukmnq+Nxz1Wr2SRoTnivlbgnxVQfe6VsHhD
 34XA==
X-Gm-Message-State: AOAM533qWvFQPHs2AX7wXBlhd1Qt5saQuO7oSfOztjcxO3Q6n9EG+WGJ
 m1QKJQYwD9WyVn9cdhq37oY5fFoXXB9fEuspsG5L+ANlqxVFCc9UpymmTNLYkhQnpOYRVTmKMRz
 lgA/cxIsgSiQSm6RVMKtImceU0ZEjuMg=
X-Received: by 2002:a05:6808:695:: with SMTP id
 k21mr1196134oig.52.1628177226125; 
 Thu, 05 Aug 2021 08:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKLQ1hGICpWKzh8mWcGmMBObUO6I+Vnd/ZRn8iGfaWtY2+r5cEp7oIuJ6eayp8XhT/4ZqLTz75CMSm8wKAojM=
X-Received: by 2002:a05:6808:695:: with SMTP id
 k21mr1196124oig.52.1628177225991; 
 Thu, 05 Aug 2021 08:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210804005621.1577302-1-jsnow@redhat.com>
 <20210804005621.1577302-7-jsnow@redhat.com>
 <877dh0ks24.fsf@linaro.org>
In-Reply-To: <877dh0ks24.fsf@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Aug 2021 11:26:55 -0400
Message-ID: <CAFn=p-YAcnS8iEYw2XBLc5MLLjzgUEsoGQydETDfTkREKTXFxQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] docs/devel: create "Miscellaneous Topics" subsection
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002fdb4505c8d18d9e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002fdb4505c8d18d9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 5, 2021 at 8:13 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> John Snow <jsnow@redhat.com> writes:
>
> > The hallmark of any truly great taxonomical reorganization: the bin of
> > leftover bits and pieces that didn't neatly fit elsewhere.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/devel/index.rst        |  9 +--------
> >  docs/devel/section-misc.rst | 15 +++++++++++++++
> >  2 files changed, 16 insertions(+), 8 deletions(-)
> >  create mode 100644 docs/devel/section-misc.rst
> >
> > diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> > index da579a7b666..ef14f3302e1 100644
> > --- a/docs/devel/index.rst
> > +++ b/docs/devel/index.rst
> > @@ -14,11 +14,4 @@ modifying QEMU's source code.
> >     section-testing-debugging
> >     section-tcg
> >     section-subsystems
> > -   control-flow-integrity
> > -   decodetree
>
> decodetree is TCG as per Peter's comment
>
> > -   s390-dasd-ipl
> > -   qom
>
> I feel as though QOM should be in the Developing QEMU section as it's a
> fairly core part of the programming experience. Maybe?
>
>
I'm guilty of doing a lot of things in parallel, because I wasn't sure
which things would be accepted quickly and which might lead to a longer
process, but I intend to create an "API" section that covers QOM, qdev,
QMP, etc -- I just recently converted the qmp/qapi docs, so there's enough
for a nice subsection there.


> Anyway it's an improvement:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>
Thanks. I'll have to re-spin anyway because of the QAPI doc work I did, so
there's time to talk about this one.

--js

--0000000000002fdb4505c8d18d9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 8:13 AM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt; The hallmark of any truly great taxonomical reorganization: the bin of=
<br>
&gt; leftover bits and pieces that didn&#39;t neatly fit elsewhere.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/devel/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +-----=
---<br>
&gt;=C2=A0 docs/devel/section-misc.rst | 15 +++++++++++++++<br>
&gt;=C2=A0 2 files changed, 16 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 create mode 100644 docs/devel/section-misc.rst<br>
&gt;<br>
&gt; diff --git a/docs/devel/index.rst b/docs/devel/index.rst<br>
&gt; index da579a7b666..ef14f3302e1 100644<br>
&gt; --- a/docs/devel/index.rst<br>
&gt; +++ b/docs/devel/index.rst<br>
&gt; @@ -14,11 +14,4 @@ modifying QEMU&#39;s source code.<br>
&gt;=C2=A0 =C2=A0 =C2=A0section-testing-debugging<br>
&gt;=C2=A0 =C2=A0 =C2=A0section-tcg<br>
&gt;=C2=A0 =C2=A0 =C2=A0section-subsystems<br>
&gt; -=C2=A0 =C2=A0control-flow-integrity<br>
&gt; -=C2=A0 =C2=A0decodetree<br>
<br>
decodetree is TCG as per Peter&#39;s comment<br>
<br>
&gt; -=C2=A0 =C2=A0s390-dasd-ipl<br>
&gt; -=C2=A0 =C2=A0qom<br>
<br>
I feel as though QOM should be in the Developing QEMU section as it&#39;s a=
<br>
fairly core part of the programming experience. Maybe?<br>
<br></blockquote><div><br></div><div>I&#39;m guilty of doing a lot of thing=
s in parallel, because I wasn&#39;t sure which things would be accepted qui=
ckly and which might lead to a longer process, but I intend to create an &q=
uot;API&quot; section that covers QOM, qdev, QMP, etc -- I just recently co=
nverted the qmp/qapi docs, so there&#39;s enough for a nice subsection ther=
e.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
Anyway it&#39;s an improvement:<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks. I&#39;ll have to re-spin anywa=
y because of the QAPI doc work I did, so there&#39;s time to talk about thi=
s one.</div><div><br></div><div>--js<br></div></div></div>

--0000000000002fdb4505c8d18d9e--


