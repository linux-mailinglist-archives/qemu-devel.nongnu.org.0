Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A812331224
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:28:08 +0100 (CET)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHnj-0004bU-2K
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJHmj-00049u-BM
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:27:05 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:34019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJHmh-0001aV-F7
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:27:05 -0500
Received: by mail-qt1-x831.google.com with SMTP id 2so7786839qtw.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 07:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YKXjQNSsXNRm45AXYq11Pycqa5kqZLYZ+jDQbiYX3Pk=;
 b=MRzeVsxG1iaMmIEXJi0vgmfBU6o1Pa88fAHlTPAi8hU4Ha1E0Dh+FTlvAuzgVe0AJq
 1Gy3+4flHN2ooOZXbZtVPQ1OV1+uTOfb4alP0Eo0WMZq6C+vCX2kqHydf2nDvXG4eDwC
 RaMuEWH8PizGgsFe+lXYDUzpEERd0L+vM7G3DLcvJpR4v6oriZG+NfngvvgGVJUZW81k
 rHivGLsZxGgvOIt0bEW7Rs1RM6wJe+mCFH2WpWNxN4bRDTOzVVfT8ERPIm/qYnY3PrsO
 m6xfb+6WgzJxtE2PZuG8EwXW90h2j0sWrw9j9X777HXWQlv161xhF4qp6GYYbW8/VJKj
 5nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKXjQNSsXNRm45AXYq11Pycqa5kqZLYZ+jDQbiYX3Pk=;
 b=ioL/DzjlTm1eKCzn2ckJ3dsBwmUpftN0c1M3vWSnKazv0yT84LMOVHt0lsog7PRzjg
 8ZvT5LHs+7SOSCbqcuW5jMOBPLSKMMx+yylMi2ishTGM5OxmQ9skR4OSouEIxKEsFCN7
 B1KamTEQGY8DvztifEqVi2xTI8ZFVjkWbn+umDX/Zq54umHJmELujeWPMqrzRaz/LJzG
 nD2ao1H1bPEzjZNkjuNkehWAfFLsvsS5FCHJRckV0r4olaCgaDOcD5Z4rutLVgzH7KOo
 dsnIJP+SY17XeEJHa0wQ/0bttgBnhFRXA8jpIdqtDzatop0u6+goWrKCJn3l98nSH82e
 W/EA==
X-Gm-Message-State: AOAM532aCws5vFa8jfPnfkrFQ+nhNEBqVk6ndiOds0mlSIBo5GaDzZTo
 ymdXOa+z6ZRGaISB95/0oUBHtsi+/z9SDtVe6m2lMQ==
X-Google-Smtp-Source: ABdhPJw+/4kWIVAifhZ/da/ZqOo+BGtnK8Wsiv+8iMaYKo62CvGVzdmQZGY8DyqrBM1ADGFJo/kCmwrOWtSFs4NSDpg=
X-Received: by 2002:a05:622a:1c9:: with SMTP id
 t9mr21216938qtw.244.1615217222206; 
 Mon, 08 Mar 2021 07:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20210307155654.993-1-imp@bsdimp.com>
 <20210307155654.993-2-imp@bsdimp.com>
 <f707c609-e2ad-4b6c-985e-1218ae40e4eb@redhat.com>
In-Reply-To: <f707c609-e2ad-4b6c-985e-1218ae40e4eb@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 8 Mar 2021 08:26:50 -0700
Message-ID: <CANCZdfq+ocyZnMt2td3ynx3gWqdPm1csddTjuhAEbxV-QL3Gow@mail.gmail.com>
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.2 release
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c3d82e05bd081009"
Received-SPF: none client-ip=2607:f8b0:4864:20::831;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x831.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c3d82e05bd081009
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 8, 2021 at 6:30 AM Thomas Huth <thuth@redhat.com> wrote:

> On 07/03/2021 16.56, Warner Losh wrote:
> > FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
> > project's packages will work.  Update which timezone to pick. Work
> around a QEMU
> > bug that incorrectly raises an exception on a CRC32 instruction with the
> FPU
> > disabled.  The qemu bug is described here:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> >
> > ---
> >   tests/vm/freebsd | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
>
> I gave this a try, but it's currently failing in the unit tests:
>
> Running test test-crypto-tlscredsx509
>
> ** (tests/test-crypto-tlscredsx509:9999): CRITICAL **: 12:56:35.157:
> Failed
> to sign certificate ASN1 parser: Value is not valid.
> ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to sign
> certificate ASN1 parser: Value is not valid.
> gmake: *** [Makefile.mtest:576: run-test-70] Error 1
> gmake: *** Waiting for unfinished jobs....
> Running test test-crypto-tlssession
>
> ** (tests/test-crypto-tlssession:10002): CRITICAL **: 12:56:35.288: Failed
> to sign certificate ASN1 parser: Value is not valid.
> ERROR test-crypto-tlssession - Bail out! FATAL-CRITICAL: Failed to sign
> certificate ASN1 parser: Value is not valid.
>

That's totally unrelated to my change. Was it failing before? What
environment was it failing in because it all seemed to work for me...


> I guess it's the same problem as:
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html
>
> ... so this would require a bug fix in the libtasn of FreeBSD first? See:
>
> https://gitlab.com/gnutls/libtasn1/-/merge_requests/71


 Is this on the host that built qemu, or inside the VM or where exactly?

Warner

--000000000000c3d82e05bd081009
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 6:30 AM Thomas=
 Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 07/03/2021=
 16.56, Warner Losh wrote:<br>
&gt; FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD=
&#39;s<br>
&gt; project&#39;s packages will work.=C2=A0 Update which timezone to pick.=
 Work around a QEMU<br>
&gt; bug that incorrectly raises an exception on a CRC32 instruction with t=
he FPU<br>
&gt; disabled.=C2=A0 The qemu bug is described here:<br>
&gt; <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg78415=
8.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/q=
emu-devel@nongnu.org/msg784158.html</a><br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/vm/freebsd | 14 +++++++++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+), 5 deletions(-)<br>
<br>
I gave this a try, but it&#39;s currently failing in the unit tests:<br>
<br>
Running test test-crypto-tlscredsx509<br>
<br>
** (tests/test-crypto-tlscredsx509:9999): CRITICAL **: 12:56:35.157: Failed=
 <br>
to sign certificate ASN1 parser: Value is not valid.<br>
ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to sign <=
br>
certificate ASN1 parser: Value is not valid.<br>
gmake: *** [Makefile.mtest:576: run-test-70] Error 1<br>
gmake: *** Waiting for unfinished jobs....<br>
Running test test-crypto-tlssession<br>
<br>
** (tests/test-crypto-tlssession:10002): CRITICAL **: 12:56:35.288: Failed =
<br>
to sign certificate ASN1 parser: Value is not valid.<br>
ERROR test-crypto-tlssession - Bail out! FATAL-CRITICAL: Failed to sign <br=
>
certificate ASN1 parser: Value is not valid.<br></blockquote><div><br></div=
><div>That&#39;s totally unrelated to my change. Was it failing before? Wha=
t environment was it failing in because it all seemed to work for me...</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I guess it&#39;s the same problem as:<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2021-01/msg06750.html</a><br><br>
... so this would require a bug fix in the libtasn of FreeBSD first? See:<b=
r>
<br>
<a href=3D"https://gitlab.com/gnutls/libtasn1/-/merge_requests/71" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/gnutls/libtasn1/-/merge_req=
uests/71</a></blockquote><div><br></div><div>=C2=A0Is this on the host that=
 built qemu, or inside the VM or where exactly?</div><div><br></div><div>Wa=
rner</div></div></div>

--000000000000c3d82e05bd081009--

