Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C186E495658
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 23:25:34 +0100 (CET)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfs5-0005Ku-Hv
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 17:25:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAazE-000125-LW
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 12:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAaz9-0006Qs-Ah
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 12:12:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642698730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pXGkivrRQGwnw35OJMAOIVi589Esv8jglmSYx+fD9gg=;
 b=NuRSW19k3sDAoTr15To42IjE28oj3jPvR8I/ZSYR/s3lHcz+LRVs01/GCJ2ZRD+z7F4jA8
 kdV/RqxGOxIwwWCkeA9oB3p4ZJW1SiQuGcLPmOfYE4YAcs74cCFOWwzxXpodKK2VufdqW4
 yXB60XeOtcBAArsIFtHf0fvB6gTrZsM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-vrk_qIuoOTq4JGrmTRZ7xw-1; Thu, 20 Jan 2022 12:12:01 -0500
X-MC-Unique: vrk_qIuoOTq4JGrmTRZ7xw-1
Received: by mail-vk1-f197.google.com with SMTP id
 z84-20020a1f9757000000b0031ba7827bcaso1002017vkd.6
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 09:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pXGkivrRQGwnw35OJMAOIVi589Esv8jglmSYx+fD9gg=;
 b=ftN4AXq2rgOmKP+BbdGbquUaP2oRI4TNjdslr5WUguHq8SmtAyeJrT8CbEPzH1boU4
 QjMNOfQ5q8cq+Jo8aMDos5JzIIDj3uXF3XJALT3A7XthYtmGgft7/tjkmefyzDUD5C3s
 qgPUZLS0vFOzHBSnp/qvXSzw/GqZeugUOO/dNxcdsn1lI8qLJoeF0ruxd85m6w1QXHhG
 5/y+i0dTI7sNTeFK/e3NWrOOKGy6uoJQAjMv/l2ht9nhykBsYGZE46RqHH2hXqJUMnGh
 3VCTTATCT7p+uPY145Bxzni1TF0eVBhiUiYHcAvhLB46x3GKwiwGvP3IAJp6eRv7bMUp
 KgHg==
X-Gm-Message-State: AOAM532aM4ZvSI5gDWm17RqD2LJ6CWOg2GLzbpRZOW3zncs/29xJajH0
 O4epdS6e+q7Rc7I6BKLV0/oWArl1ztRZGXCgUYwYR2F2GWywBn3qyb8EZgGq57JjuGPxqztol0Q
 99DjmbCfuJBFT1fMlLZDKusyMBQieYEI=
X-Received: by 2002:a05:6102:3019:: with SMTP id
 s25mr3177974vsa.38.1642698721141; 
 Thu, 20 Jan 2022 09:12:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdZufix5ppNT8tErJHWW2CAFiSJ1vj2mpCmJ3qpFviJC2qfw10mz3VX/gAQsgOcGY85Lt81b5Jxp1C/udgZ20=
X-Received: by 2002:a05:6102:3019:: with SMTP id
 s25mr3177946vsa.38.1642698720884; 
 Thu, 20 Jan 2022 09:12:00 -0800 (PST)
MIME-Version: 1.0
References: <20220119193916.4138217-1-jsnow@redhat.com>
 <20220119193916.4138217-6-jsnow@redhat.com>
 <Yeknr1ZvsyppLY0d@redhat.com>
In-Reply-To: <Yeknr1ZvsyppLY0d@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 20 Jan 2022 12:11:50 -0500
Message-ID: <CAFn=p-ZJ6u8rU8opwEhDib+Akb=H7pZTLvE9Mmh0cpsz+sTS5Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] python/aqmp: add socket bind step to legacy.py
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bb503205d6069949"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bb503205d6069949
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022, 4:13 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Wed, Jan 19, 2022 at 02:39:16PM -0500, John Snow wrote:
> > The old QMP library would actually bind to the server address during
> > __init__(). The new library delays this to the accept() call, because
> > binding occurs inside of the call to start_[unix_]server(), which is an
> > async method -- so it cannot happen during __init__ anymore.
> >
> > Python 3.7+ adds the ability to create the server (and thus the bind()
> > call) and begin the active listening in separate steps, but we don't
> > have that functionality in 3.6, our current minimum.
> >
> > Therefore ... Add a temporary workaround that allows the synchronous
> > version of the client to bind the socket in advance, guaranteeing that
> > there will be a UNIX socket in the filesystem ready for the QEMU client
> > to connect to without a race condition.
> >
> > (Yes, it's ugly; fixing it more nicely will unfortunately have to wait
> > until I can stipulate Python 3.7+ as our minimum version. Python 3.6 is
> > EOL as of the beginning of this year, but I haven't checked if all of
> > our supported build platforms have a properly modern Python available
> > yet.)
>
> RHEL-8 system python will remain 3.6 for the life of RHEL-8.
>
> While you can bring in newer python versions in parallel,
> IMHO it is highly desirable to remain compatible with the
> system python as that's the one you can guarantee users
> actually have available by default.
>

I agree, but over time my hand will be forced. Libraries are beginning to
drop support for Python 3.6 upstream, and it's only a matter of time before
it becomes implausible to support an EOL python version.

I actually go out of my way to ensure compatibility with the very oldest
versions I possibly can - *extremely* out of my way - but there's only so
much I can reasonably do. Supporting 3.6 and 3.11 simultaneously may prove
challenging.

Either way, I'm not bumping the version here in this series. I'm just
stating that this hack is kind of the best I can (quickly and easily) do
until 3.7.

(3.7 adds start_server=3DFalse to start_unix_server which allows the
separation of steps without needing to muck around with the socket object.)


>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :
>

--000000000000bb503205d6069949
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Jan 20, 2022, 4:13 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Wed, Jan 19, 2022 at 02:39:16=
PM -0500, John Snow wrote:<br>
&gt; The old QMP library would actually bind to the server address during<b=
r>
&gt; __init__(). The new library delays this to the accept() call, because<=
br>
&gt; binding occurs inside of the call to start_[unix_]server(), which is a=
n<br>
&gt; async method -- so it cannot happen during __init__ anymore.<br>
&gt; <br>
&gt; Python 3.7+ adds the ability to create the server (and thus the bind()=
<br>
&gt; call) and begin the active listening in separate steps, but we don&#39=
;t<br>
&gt; have that functionality in 3.6, our current minimum.<br>
&gt; <br>
&gt; Therefore ... Add a temporary workaround that allows the synchronous<b=
r>
&gt; version of the client to bind the socket in advance, guaranteeing that=
<br>
&gt; there will be a UNIX socket in the filesystem ready for the QEMU clien=
t<br>
&gt; to connect to without a race condition.<br>
&gt; <br>
&gt; (Yes, it&#39;s ugly; fixing it more nicely will unfortunately have to =
wait<br>
&gt; until I can stipulate Python 3.7+ as our minimum version. Python 3.6 i=
s<br>
&gt; EOL as of the beginning of this year, but I haven&#39;t checked if all=
 of<br>
&gt; our supported build platforms have a properly modern Python available<=
br>
&gt; yet.)<br>
<br>
RHEL-8 system python will remain 3.6 for the life of RHEL-8.<br>
<br>
While you can bring in newer python versions in parallel,<br>
IMHO it is highly desirable to remain compatible with the<br>
system python as that&#39;s the one you can guarantee users<br>
actually have available by default.<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I agree, but over time my hand will be f=
orced. Libraries are beginning to drop support for Python 3.6 upstream, and=
 it&#39;s only a matter of time before it becomes implausible to support an=
 EOL python version.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I a=
ctually go out of my way to ensure compatibility with the very oldest versi=
ons I possibly can - *extremely* out of my way - but there&#39;s only so mu=
ch I can reasonably do. Supporting 3.6 and 3.11 simultaneously may prove ch=
allenging.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Either way, I=
&#39;m not bumping the version here in this series. I&#39;m just stating th=
at this hack is kind of the best I can (quickly and easily) do until 3.7.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">(3.7 adds start_server=3D=
False to start_unix_server which allows the separation of steps without nee=
ding to muck around with the socket object.)=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br><br>
<br>
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
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div></=
div>

--000000000000bb503205d6069949--


