Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2AB40DCF1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:37:22 +0200 (CEST)
Received: from localhost ([::1]:51578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsVt-0003ow-Cr
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQsTP-0002CO-7V
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:34:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQsTL-0005xB-KV
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631802882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wLEoDRPg9XasEqt67hZMZUs8X7iPr10Sv9PBKxdjid8=;
 b=acoZtpEnXt66bQjoKkBre5jBmMTh2i0moD8wivJNgilHnc/LRd3BIDpwTpu09RLGXTcGw+
 ICBf/0PQnfckLDLujJqou1whRLUtrPeqKaZU7ZO74WXCt0M+wc7kKL/5Mm/ZtMGF9dg0QL
 dklz3Fu4X0ZWDmzeb7zYDnDQ6xbIHB0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-3gzZhhs-O5Kfm6Yu5VJ13Q-1; Thu, 16 Sep 2021 10:34:40 -0400
X-MC-Unique: 3gzZhhs-O5Kfm6Yu5VJ13Q-1
Received: by mail-oo1-f70.google.com with SMTP id
 p188-20020a4a2fc50000b029028b072e133dso28422320oop.19
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 07:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wLEoDRPg9XasEqt67hZMZUs8X7iPr10Sv9PBKxdjid8=;
 b=qZvIOTdtf1r/FWpmVGu9ecKy5xjgw0dvjXjDfeDsho6f25Ti6taVlVDwPpjNVKmtNb
 xfe30xkihjJ8hRk+qLJ0eBVf+VZKPiIHZUwskdLe3kc7f9jTGyKAqNKlwO7uFyxqptkO
 po/Qum0OlKxmpT6cm2AJVUyV3MNTy4C8IEuwDu52SRr8m25qbKx2VODoHlLklZemvGYG
 dgbanW7r82cD8oa9spAxjltg3XjumdIiqzV9Zv0vIZuhWOaI7tnCF0B0p0/SmoIMF8Vr
 6ogX6v0/CFVCzpkwIzvScs4g0rvHfxjs/O6DA6y/Thmk3anxlEyqQxq9iL1jRXYW8rat
 wUoQ==
X-Gm-Message-State: AOAM530g5vbF8Mzp2UcctcRAy2ej7uPjEvG7AZ3h2Siqs35xrVfMqEFi
 YfXer4ozo5tE8rwzA7sE2ZJRZAuIjAisdhSg6cOccce+OhpUwT7IZbkxNJZCm+I86AMEN9mn5kL
 drkuRUnsdyIuiwqxRWFD28xS+tSRi7+w=
X-Received: by 2002:aca:f386:: with SMTP id r128mr9373863oih.168.1631802879113; 
 Thu, 16 Sep 2021 07:34:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZnEOYxlS0JDWCPVMRaKz8wuqiYWMGjA5vSgJoel8R9BoDbvGUEXGDGwDKW/087uBKuvl7fyKXz8RBRDkYNcc=
X-Received: by 2002:aca:f386:: with SMTP id r128mr9373822oih.168.1631802878442; 
 Thu, 16 Sep 2021 07:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-2-jsnow@redhat.com>
 <87mtoctzqm.fsf@linaro.org>
In-Reply-To: <87mtoctzqm.fsf@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Sep 2021 10:34:27 -0400
Message-ID: <CAFn=p-YR5zzPsOjZKAQ7t=VWLXc-yvNhxRfmJ-5HmvrjjAB8=w@mail.gmail.com>
Subject: Re: [PATCH v3 01/16] python: Update for pylint 2.10
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e9d17e05cc1db642"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e9d17e05cc1db642
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 9:30 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> John Snow <jsnow@redhat.com> writes:
>
> > A few new annoyances. Of note is the new warning for an unspecified
> > encoding when opening a text file, which actually does indicate a
> > potentially real problem; see
> > https://www.python.org/dev/peps/pep-0597/#motivation
> >
> > Use LC_CTYPE to determine an encoding to use for interpreting QEMU's
> > terminal output. Note that Python states: "language code and encoding
> > may be None if their values cannot be determined" -- use a platform
> > default as a backup.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> I've cherry-picked this one into my testing/next because it fixes a
> failure but in case you get it merged elsewhere:
>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> --
> Alex Benn=C3=A9e
>
>
Dan had some comments here:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04031.html

I'm waiting for his reply, but feel free to use this as a build fix in the
meantime for testing, I don't think it should hurt anything.

--000000000000e9d17e05cc1db642
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 16, 2021 at 9:30 AM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt; A few new annoyances. Of note is the new warning for an unspecified<br=
>
&gt; encoding when opening a text file, which actually does indicate a<br>
&gt; potentially real problem; see<br>
&gt; <a href=3D"https://www.python.org/dev/peps/pep-0597/#motivation" rel=
=3D"noreferrer" target=3D"_blank">https://www.python.org/dev/peps/pep-0597/=
#motivation</a><br>
&gt;<br>
&gt; Use LC_CTYPE to determine an encoding to use for interpreting QEMU&#39=
;s<br>
&gt; terminal output. Note that Python states: &quot;language code and enco=
ding<br>
&gt; may be None if their values cannot be determined&quot; -- use a platfo=
rm<br>
&gt; default as a backup.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
I&#39;ve cherry-picked this one into my testing/next because it fixes a<br>
failure but in case you get it merged elsewhere:<br>
<br>
Tested-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" t=
arget=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br></blockquote><div><br></div><div>Dan had some comments here: <a href=3D=
"https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04031.html">https=
://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04031.html</a></div><di=
v><br></div><div>I&#39;m waiting for his reply, but feel free to use this a=
s a build fix in the meantime for testing, I don&#39;t think it should hurt=
 anything.<br> </div></div></div>

--000000000000e9d17e05cc1db642--


