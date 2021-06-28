Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F3A3B69A8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:31:01 +0200 (CEST)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxxuF-0002YI-Mw
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lxxsP-0001JL-VJ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lxxsL-0005Po-Og
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624912140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=divCttqqlu5eYqlApQA5QQQltA4Zns6BUZyLxD3qVHs=;
 b=CZR6Yv3epIX9XeEwTrHcPW6qOgBNnezgUzcxHjUJJZLOqnQNAKe/d8+Sv9evYTxZm9Hrgy
 xDfJO30WziQgDNZ9n5FWe5LPEzg+DVG+Az075GnE5LJX/52+Jze8iFZwwe9WBR5avn99fe
 GXmI12nfWplT10Ihwy6xV+PqcTcNgIg=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-fJsfkTL3Omy3BM46qXIV9A-1; Mon, 28 Jun 2021 16:28:58 -0400
X-MC-Unique: fJsfkTL3Omy3BM46qXIV9A-1
Received: by mail-oi1-f199.google.com with SMTP id
 t22-20020a0568081596b029023a41b03dc9so8264130oiw.1
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 13:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=divCttqqlu5eYqlApQA5QQQltA4Zns6BUZyLxD3qVHs=;
 b=EdKP/m3dr6b3y5qTiZ5YJ2Pfp33XbUrFLmqWvNvLPWcJ5uNdsiQaX3+U8L9qat90Ml
 CUO3JFe7+2Lc/dFzGvfiEOt12l/Rbc9IDOSV60Bdt3MvWFd2LTgRV5EoaBCUXRT4uLk3
 28bCNIqmWBke8zu3N7L/SsyKGUSISosTzK9XpwARCQnI7Emrtu/Ha8k+67WkktL+Ooq9
 Nhq3qrYeqWswDcPQKL3cRHdRCVG/6W8+/5Hu/oesg8eeEZDSWw/oDxmJgEh63NL624Ga
 A4MCaxatRv02KB4NPzxXOzDrj7bU3KeqAE3xqc+wpzX8pRCrrrqGYzqpzfo3SZTiQc9m
 RM1w==
X-Gm-Message-State: AOAM531BNBNCX3hxO6HGdzSXyMBOSZ/9o5vAcP1Clob4/bLF7ZVv3jRc
 /vYiVncAznAyiv57hECB7Tixb4qr+6/GcuUdWHPU2V3B9VQZeQST6+jZOfDp4BwpWVpAJUL7zIT
 jQzhjYZKoWA+heso5Wls/syQFjAhwpNQ=
X-Received: by 2002:aca:2212:: with SMTP id b18mr11916981oic.52.1624912137421; 
 Mon, 28 Jun 2021 13:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoOtg7VU3a89kRh9VqSD4/Qx8k0zttcJ1ZkfE06H7ykRYn+Z+EFsurAWkZ17N4YtekHiWKczqaRvf3rg4IIHE=
X-Received: by 2002:aca:2212:: with SMTP id b18mr11916972oic.52.1624912137295; 
 Mon, 28 Jun 2021 13:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-2-jsnow@redhat.com>
 <0550dc79-de0a-f6e4-8e85-38a22a0e19da@redhat.com>
In-Reply-To: <0550dc79-de0a-f6e4-8e85-38a22a0e19da@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 28 Jun 2021 16:28:46 -0400
Message-ID: <CAFn=p-ZwTULuF1piMpR5udgeRdrer_oLGj9swJ4eTpoHQk4yZg@mail.gmail.com>
Subject: Re: [PATCH 01/11] python: expose typing information via PEP 561
To: wainersm@redhat.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bc28f905c5d9568d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bc28f905c5d9568d
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 4:12 PM Wainer dos Santos Moschetta <
wainersm@redhat.com> wrote:

> Hi,
>
> On 6/25/21 12:45 PM, John Snow wrote:
> > https://www.python.org/dev/peps/pep-0561/#specification
> > Create 'py.typed' files in each subpackage that indicate to mypy that
> > this is a typed module, so that users of any of these packages can use
> > mypy to check their code as well.
> >
> > Note: Theoretically it's possible to ditch MANIFEST.in in favor of using
> > package_data in setup.cfg, but I genuinely could not figure out how to
> > get it to include things from the *source root* into the *package root*;
> > only how to include things from each subpackage. I tried!
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/machine/py.typed | 0
> >   python/qemu/qmp/py.typed     | 0
> >   python/qemu/utils/py.typed   | 0
> >   python/setup.cfg             | 4 ++++
> >   4 files changed, 4 insertions(+)
> >   create mode 100644 python/qemu/machine/py.typed
> >   create mode 100644 python/qemu/qmp/py.typed
> >   create mode 100644 python/qemu/utils/py.typed
>
> Just double-checking that you did not add a single py.typed on the root
> "python" dir, so that all modules inherit from it, because this is a
> namespace package. Right?
>

Yes, that's right. Each sub-package here can technically be typed or not
independently from one another, even though the packaging script I have
written at the moment will bundle all three of these packages together.
Complying with PEP 561 requires package-level information.

(So far as I am aware at-present, anyway.)


> Anyway,
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>

Thanks!
--js

--000000000000bc28f905c5d9568d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 28, 2021 at 4:12 PM Waine=
r dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com">wainersm@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
On 6/25/21 12:45 PM, John Snow wrote:<br>
&gt; <a href=3D"https://www.python.org/dev/peps/pep-0561/#specification" re=
l=3D"noreferrer" target=3D"_blank">https://www.python.org/dev/peps/pep-0561=
/#specification</a><br>
&gt; Create &#39;py.typed&#39; files in each subpackage that indicate to my=
py that<br>
&gt; this is a typed module, so that users of any of these packages can use=
<br>
&gt; mypy to check their code as well.<br>
&gt;<br>
&gt; Note: Theoretically it&#39;s possible to ditch MANIFEST.in in favor of=
 using<br>
&gt; package_data in setup.cfg, but I genuinely could not figure out how to=
<br>
&gt; get it to include things from the *source root* into the *package root=
*;<br>
&gt; only how to include things from each subpackage. I tried!<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/py.typed | 0<br>
&gt;=C2=A0 =C2=A0python/qemu/qmp/py.typed=C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 =C2=A0python/qemu/utils/py.typed=C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 =C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ++++<br>
&gt;=C2=A0 =C2=A04 files changed, 4 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 python/qemu/machine/py.typed<br>
&gt;=C2=A0 =C2=A0create mode 100644 python/qemu/qmp/py.typed<br>
&gt;=C2=A0 =C2=A0create mode 100644 python/qemu/utils/py.typed<br>
<br>
Just double-checking that you did not add a single py.typed on the root <br=
>
&quot;python&quot; dir, so that all modules inherit from it, because this i=
s a <br>
namespace package. Right?<br></blockquote><div><br></div><div><div>Yes, tha=
t&#39;s right. Each sub-package here can technically be typed=20
or not independently from one another, even though the packaging script I
 have written at the moment will bundle all three of these packages=20
together. Complying with PEP 561 requires package-level information.</div><=
div><br></div><div>(So far as I am aware at-present, anyway.)</div></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Anyway,<br>
<br>
Reviewed-by: Wainer dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@red=
hat.com" target=3D"_blank">wainersm@redhat.com</a>&gt;<br></blockquote><div=
><br></div><div></div><div>Thanks!</div><div>--js<br></div><div>=C2=A0</div=
></div></div>

--000000000000bc28f905c5d9568d--


