Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D792D39A5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 05:34:48 +0100 (CET)
Received: from localhost ([::1]:50874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmrBf-0007Hn-7i
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 23:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kmrAM-0006qO-Gu
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 23:33:26 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kmrAH-0000b1-6l
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 23:33:26 -0500
Received: by mail-wr1-x442.google.com with SMTP id 91so244457wrj.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 20:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JQfRzIMFyVF09HLi4MeQ3xGIAdaWGHeQuaRAOhWeEKE=;
 b=yxUcBPrUMsO/5+fg8DtIcKMv1bfW6zgB3rWHFyRTG+05PZcKjN6xWHYjGfi45XajXe
 MIs/IMxcfUzK+kTTn1Sd/4fSdypxCJCY/KIvhE+tYShCYeibvSHBHouclkY2QS+ZR4Ic
 xies8pl6JdklyYXEZoST07AypWpDkSVO74zbP3JdbIbb8Xs4Wvete5Wy8D+wlgO7f+J2
 jMuTDbv9z5qAuyQtaAIN3AaF9MI0YZkRcSSFyuRbDLbdh4wok2L38QgRSTj0czOB+li5
 JxbUvvfQ4m3WT3ZOpM35lvmJx0fgwDheiYpluxt7dPs/eyrJ74Lby58DQFKDYFsbpnq3
 X8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JQfRzIMFyVF09HLi4MeQ3xGIAdaWGHeQuaRAOhWeEKE=;
 b=ZkLedFukDA2Q43NxI+QY/0rihFOXBgpJ6JdTi84y6HQsWrwteejqSFdT5sBDm22tIN
 e1KazuY9jm9016ySDi3TRKU3u7vDkOMR4w3x2yZa9wuKBTMtty/x4x8tyZue2yWa4RZh
 EBv7nP2GM07w2Gt9JJu+jJsWXVgm9M+rIN4d5T7lUVElAJNhOVr5falEtlMBPGMTDbxT
 4MQ6UApnPTDga5bzjC/4eDAlQa4UxdTmbG0zG4nOPqJu6ZgcQ4Hffy1gQgiNDZWfu7Ro
 4ld6TVZRoBaIyYNUGOJ9gfMsbIkiLnfkCGFCDzrSLIwaLhGSePfHUdWgciLfXJX/xnjE
 A3ug==
X-Gm-Message-State: AOAM533Wgs4/50vLGop6FNNtRayeX480kZ/4mXlyv/r5eHYW5ibXB9YH
 ln6UNjBLi8jW6Zu6iYe5buzlY3tc5gFZwwg6TxrviA==
X-Google-Smtp-Source: ABdhPJzREhoVZn0uE4cVzjSgIHHvUGLXOGHg5V1j4lLB7fXCqkqhls032JzhuZnBDJfnCR8uL0GspJ9LnC9WXNyymUg=
X-Received: by 2002:adf:f401:: with SMTP id g1mr451401wro.258.1607488398755;
 Tue, 08 Dec 2020 20:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20200921093325.25617-1-ani@anisinha.ca>
 <20201015165215.GE5733@habkost.net>
 <CAARzgwwQAaJV=Mp=nB7FmCeZqmQO+gEBrkPiCWaVSESYYwGcbg@mail.gmail.com>
 <20201104155935.GU5733@habkost.net>
In-Reply-To: <20201104155935.GU5733@habkost.net>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 9 Dec 2020 10:03:07 +0530
Message-ID: <CAARzgwz7nOu3=OViWn=jRuSgaUwJGMGj_SLfOAV45mhDwA0ORQ@mail.gmail.com>
Subject: Re: [PATCH v3] qom: code hardening - have bound checking while
 looping with integer value
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fd1be805b6008e9f"
Received-SPF: none client-ip=2a00:1450:4864:20::442;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x442.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fd1be805b6008e9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2020 at 21:29 Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Sat, Oct 31, 2020 at 09:51:38PM +0530, Ani Sinha wrote:
> > On Thu, Oct 15, 2020 at 10:22 PM Eduardo Habkost <ehabkost@redhat.com>
> wrote:
> > >
> > > On Mon, Sep 21, 2020 at 03:03:25PM +0530, Ani Sinha wrote:
> > > > Object property insertion code iterates over an integer to get an
> unused
> > > > index that can be used as an unique name for an object property.
> This loop
> > > > increments the integer value indefinitely. Although very unlikely,
> this can
> > > > still cause an integer overflow.
> > > > In this change, we fix the above code by checking against INT16_MAX
> and making
> > > > sure that the interger index does not overflow beyond that value. I=
f
> no
> > > > available index is found, the code would cause an assertion failure=
.
> This
> > > > assertion failure is necessary because the callers of the function
> do not check
> > > > the return value for NULL.
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > >
> > > Queued on machine-next, thanks!  My apologies for the delay.
> >
> > Any idea when this will be pulled?
>
> I was planning to send a pull request before soft freeze,
> (October 27) but this was the only patch in the queue at that
> moment, so I decided to wait.
>
> As we're beyond freeze now, the pull request will be sent
> immediately after 5.2.0 is released.


Gentle reminder since 5.2.0 has now been released.


>
>

--000000000000fd1be805b6008e9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 4, 2020 at 21:29 Eduardo Habkost &lt;<a href=3D=
"mailto:ehabkost@redhat.com">ehabkost@redhat.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Sat, Oct 31, 2020 at 09:51:38PM +0530, Ani =
Sinha wrote:<br>
&gt; On Thu, Oct 15, 2020 at 10:22 PM Eduardo Habkost &lt;<a href=3D"mailto=
:ehabkost@redhat.com" target=3D"_blank">ehabkost@redhat.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; On Mon, Sep 21, 2020 at 03:03:25PM +0530, Ani Sinha wrote:<br>
&gt; &gt; &gt; Object property insertion code iterates over an integer to g=
et an unused<br>
&gt; &gt; &gt; index that can be used as an unique name for an object prope=
rty. This loop<br>
&gt; &gt; &gt; increments the integer value indefinitely. Although very unl=
ikely, this can<br>
&gt; &gt; &gt; still cause an integer overflow.<br>
&gt; &gt; &gt; In this change, we fix the above code by checking against IN=
T16_MAX and making<br>
&gt; &gt; &gt; sure that the interger index does not overflow beyond that v=
alue. If no<br>
&gt; &gt; &gt; available index is found, the code would cause an assertion =
failure. This<br>
&gt; &gt; &gt; assertion failure is necessary because the callers of the fu=
nction do not check<br>
&gt; &gt; &gt; the return value for NULL.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.=
ca" target=3D"_blank">ani@anisinha.ca</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:b=
errange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Queued on machine-next, thanks!=C2=A0 My apologies for the delay.=
<br>
&gt; <br>
&gt; Any idea when this will be pulled?<br>
<br>
I was planning to send a pull request before soft freeze,<br>
(October 27) but this was the only patch in the queue at that<br>
moment, so I decided to wait.<br>
<br>
As we&#39;re beyond freeze now, the pull request will be sent<br>
immediately after 5.2.0 is released.</blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Gentle reminder since 5.2.0 has now been released.</div=
><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><b=
r>
<br>
</blockquote></div></div>

--000000000000fd1be805b6008e9f--

