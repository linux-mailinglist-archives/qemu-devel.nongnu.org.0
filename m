Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AB53317DC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:58:41 +0100 (CET)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJM1Y-0000sC-2e
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJM0e-0000PG-AA
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:57:44 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:43207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJM0b-0001qn-8T
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:57:44 -0500
Received: by mail-qt1-x830.google.com with SMTP id l14so5719656qtr.10
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 11:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KJyqjlYMPQbtZKR5HtJdkLGCQkCGF+Dv65rNf1/CpDo=;
 b=igeW7byohbrSSpGZOEed8vH7D2yd6H43ykipaH5cScfdkWezBCBSqrjRi0qEkIvWSO
 KVeIeFR6omvJ3GgyXuOIc/0x+iKReOgh+mR1Y1v2di4vpnCutAvoPCmTxsZjLoeqvV8P
 hv+wYYtmY1KGQ7bI/rtWqLzvHvfHp3sohGE72IRdrSXCW5ioRF4AvkTNU169QsdKMVHT
 x5eoNNtvGrDXuMTnnsSErj4PMHyj6vRewzhiZKLZSVEFdItBbdhd8KQfTDnfH7mWBF1T
 AdV4TKFeJy+Hg0qG9dNWEedXsNQr+c3oYtxTlRrogrNFqxgrFEIjQ6ZteIhNe2LhF+TX
 VbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJyqjlYMPQbtZKR5HtJdkLGCQkCGF+Dv65rNf1/CpDo=;
 b=mmlz0KTpih2koAJMrWNRzzu0eBOWEIAErjS9bBAHwgEJs65I705ww/uO8oW5diWMkG
 xdqvVNN47EbtIzcOQkdsAB55Ef9koQ5BDTCX//a10bFRxr7xheJB74vFICA8Q5VXFVNL
 RbQK2osJPWDP0luU/RUkElYikoziLdFtXYqZpXRo6G23N1bDRr9cFMACdbg3LDQQuuJ7
 P/TrcZpfmMhCf8/PwvyHqvrhNl1ahqToZfTx/dhbfi2GfaVKJj7p8SqdWHJ452/NkQUu
 ibkkX0rzwbZE9ZE6tvG2kFedGuOEQP10WJAYr0iV9w8lATMK8jc0HPjiWrrU6qBjRiny
 UKtA==
X-Gm-Message-State: AOAM532v0lOsqVdJhiIGxQ4sqtG8NsLgosItUy/Di/6G1gZ1BKNGVcij
 EFXSHxz67V8gOsPEMxIhhnpCqOEX/biwtepD2IZ3Jg==
X-Google-Smtp-Source: ABdhPJznylaiUPNxS6xHS2MYcEw6nXQvq4lrDNbrvUysd9fSnsQIPOnFlTvCIJvPGbNSPmHArvOnQWv6F/U6opCqD1o=
X-Received: by 2002:a05:622a:303:: with SMTP id
 q3mr21489166qtw.235.1615233460008; 
 Mon, 08 Mar 2021 11:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20210307155654.993-1-imp@bsdimp.com>
 <20210307155654.993-2-imp@bsdimp.com>
 <f707c609-e2ad-4b6c-985e-1218ae40e4eb@redhat.com>
 <CANCZdfq+ocyZnMt2td3ynx3gWqdPm1csddTjuhAEbxV-QL3Gow@mail.gmail.com>
 <f48b0f77-02e7-fcf7-a8bd-9d7990c8db33@redhat.com>
 <E0C80BD2-323B-4101-8DC4-8A920B6CE5AB@yadro.com>
 <CANCZdfrSCCNuOjQYciZexmvYao3ZS3Ad+2bRLi8vVcyfv9kfcw@mail.gmail.com>
In-Reply-To: <CANCZdfrSCCNuOjQYciZexmvYao3ZS3Ad+2bRLi8vVcyfv9kfcw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 8 Mar 2021 12:57:29 -0700
Message-ID: <CANCZdfow0RmLFJch1Kk3JhVhKLbBC_W0_BzkZG_HX+VDo9ZLmQ@mail.gmail.com>
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.2 release
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: multipart/alternative; boundary="0000000000009d0f3b05bd0bd88e"
Received-SPF: none client-ip=2607:f8b0:4864:20::830;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x830.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009d0f3b05bd0bd88e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 8, 2021 at 12:51 PM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Mon, Mar 8, 2021 at 8:46 AM Roman Bolshakov <r.bolshakov@yadro.com>
> wrote:
>
>>
>> > 8 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 18:41, Thomas Hu=
th <thuth@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):
>> >
>> > =EF=BB=BFOn 08/03/2021 16.26, Warner Losh wrote:
>> >> On Mon, Mar 8, 2021 at 6:30 AM Thomas Huth <thuth@redhat.com <mailto:
>> thuth@redhat.com>> wrote:
>> >>    On 07/03/2021 16.56, Warner Losh wrote:
>> >>     > FreeBSD 12.1 has reached end of life. Use 12.2 instead so that
>> FreeBSD's
>> >>     > project's packages will work.  Update which timezone to pick.
>> Work
>> >>    around a QEMU
>> >>     > bug that incorrectly raises an exception on a CRC32 instruction
>> with
>> >>    the FPU
>> >>     > disabled.  The qemu bug is described here:
>> >>     >
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html
>> >>    <https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html=
>
>> >>     >
>> >>     > Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:
>> imp@bsdimp.com>>
>> >>     >
>> >>     > ---
>> >>     >   tests/vm/freebsd | 14 +++++++++-----
>> >>     >   1 file changed, 9 insertions(+), 5 deletions(-)
>> >>    I gave this a try, but it's currently failing in the unit tests:
>> >>    Running test test-crypto-tlscredsx509
>> >>    ** (tests/test-crypto-tlscredsx509:9999): CRITICAL **:
>> 12:56:35.157: Failed
>> >>    to sign certificate ASN1 parser: Value is not valid.
>> >>    ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed
>> to sign
>> >>    certificate ASN1 parser: Value is not valid.
>> >>    gmake: *** [Makefile.mtest:576: run-test-70] Error 1
>> >>    gmake: *** Waiting for unfinished jobs....
>> >>    Running test test-crypto-tlssession
>> >>    ** (tests/test-crypto-tlssession:10002): CRITICAL **: 12:56:35.288=
:
>> Failed
>> >>    to sign certificate ASN1 parser: Value is not valid.
>> >>    ERROR test-crypto-tlssession - Bail out! FATAL-CRITICAL: Failed to
>> sign
>> >>    certificate ASN1 parser: Value is not valid.
>> >> That's totally unrelated to my change. Was it failing before? What
>> environment was it failing in because it all seemed to work for me...
>> >
>> > It's been a while since I last ran "make vm-build-freebsd", so I can't
>> really tell whether the problem was already there before ... when I now =
try
>> to run it without your patch, it fails for me, too, but rather due to
>> FreeBSD 12.1 being out of service instead.
>> >
>> >>    I guess it's the same problem as:
>> >>    https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.htm=
l
>> >>    <
>> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html>
>> >>    ... so this would require a bug fix in the libtasn of FreeBSD
>> first? See:
>> >>    https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
>> >>    <https://gitlab.com/gnutls/libtasn1/-/merge_requests/71>
>> >>  Is this on the host that built qemu, or inside the VM or where
>> exactly?
>> >
>> > It's inside the VM ... I assume the libtasn there has the same bug as
>> the one on macOS?
>> >
>>
>> The gnutls failures on macOS and FreeBSD (with clang as main compiler)
>> won=E2=80=99t happen only if libtasn1 from master is used. Otherwise lib=
tasn1 has
>> to be compiled with -O1/-O0.
>>
>
> Forgive my ignorance...
>
> Does this come from a submodule? From something I've built and installed
> on my FreeBSD host? Or something that's installed into the FreeBSD guest
>

ah, it's inside the guest.

Warner

--0000000000009d0f3b05bd0bd88e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 12:51 PM Warne=
r Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Mar 8, 2021 at 8:46 AM Roman Bolshakov &lt;<a=
 href=3D"mailto:r.bolshakov@yadro.com" target=3D"_blank">r.bolshakov@yadro.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
&gt; 8 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 18:41, Thomas Hu=
th &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.c=
om</a>&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):<br>
&gt; <br>
&gt; =EF=BB=BFOn 08/03/2021 16.26, Warner Losh wrote:<br>
&gt;&gt; On Mon, Mar 8, 2021 at 6:30 AM Thomas Huth &lt;<a href=3D"mailto:t=
huth@redhat.com" target=3D"_blank">thuth@redhat.com</a> &lt;mailto:<a href=
=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt;&gt;=
 wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 On 07/03/2021 16.56, Warner Losh wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; FreeBSD 12.1 has reached end of life. Use =
12.2 instead so that FreeBSD&#39;s<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; project&#39;s packages will work.=C2=A0 Up=
date which timezone to pick. Work<br>
&gt;&gt;=C2=A0 =C2=A0 around a QEMU<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; bug that incorrectly raises an exception o=
n a CRC32 instruction with<br>
&gt;&gt;=C2=A0 =C2=A0 the FPU<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; disabled.=C2=A0 The qemu bug is described =
here:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://www.mail-archive.com/qe=
mu-devel@nongnu.org/msg784158.html" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html</a><br>
&gt;&gt;=C2=A0 =C2=A0 &lt;<a href=3D"https://www.mail-archive.com/qemu-deve=
l@nongnu.org/msg784158.html" rel=3D"noreferrer" target=3D"_blank">https://w=
ww.mail-archive.com/qemu-devel@nongnu.org/msg784158.html</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Warner Losh &lt;<a href=3D"=
mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a> &lt;mailto:<a h=
ref=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;&gt;<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0tests/vm/freebsd | 14 ++++++++=
+-----<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+=
), 5 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0 I gave this a try, but it&#39;s currently failing in =
the unit tests:<br>
&gt;&gt;=C2=A0 =C2=A0 Running test test-crypto-tlscredsx509<br>
&gt;&gt;=C2=A0 =C2=A0 ** (tests/test-crypto-tlscredsx509:9999): CRITICAL **=
: 12:56:35.157: Failed<br>
&gt;&gt;=C2=A0 =C2=A0 to sign certificate ASN1 parser: Value is not valid.<=
br>
&gt;&gt;=C2=A0 =C2=A0 ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRIT=
ICAL: Failed to sign<br>
&gt;&gt;=C2=A0 =C2=A0 certificate ASN1 parser: Value is not valid.<br>
&gt;&gt;=C2=A0 =C2=A0 gmake: *** [Makefile.mtest:576: run-test-70] Error 1<=
br>
&gt;&gt;=C2=A0 =C2=A0 gmake: *** Waiting for unfinished jobs....<br>
&gt;&gt;=C2=A0 =C2=A0 Running test test-crypto-tlssession<br>
&gt;&gt;=C2=A0 =C2=A0 ** (tests/test-crypto-tlssession:10002): CRITICAL **:=
 12:56:35.288: Failed<br>
&gt;&gt;=C2=A0 =C2=A0 to sign certificate ASN1 parser: Value is not valid.<=
br>
&gt;&gt;=C2=A0 =C2=A0 ERROR test-crypto-tlssession - Bail out! FATAL-CRITIC=
AL: Failed to sign<br>
&gt;&gt;=C2=A0 =C2=A0 certificate ASN1 parser: Value is not valid.<br>
&gt;&gt; That&#39;s totally unrelated to my change. Was it failing before? =
What environment was it failing in because it all seemed to work for me...<=
br>
&gt; <br>
&gt; It&#39;s been a while since I last ran &quot;make vm-build-freebsd&quo=
t;, so I can&#39;t really tell whether the problem was already there before=
 ... when I now try to run it without your patch, it fails for me, too, but=
 rather due to FreeBSD 12.1 being out of service instead.<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 I guess it&#39;s the same problem as:<br>
&gt;&gt;=C2=A0 =C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-de=
vel/2021-01/msg06750.html" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html</a><br>
&gt;&gt;=C2=A0 =C2=A0 &lt;<a href=3D"https://lists.gnu.org/archive/html/qem=
u-devel/2021-01/msg06750.html" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 ... so this would require a bug fix in the libtasn of=
 FreeBSD first? See:<br>
&gt;&gt;=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/gnutls/libtasn1/-/merge=
_requests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/gnutl=
s/libtasn1/-/merge_requests/71</a><br>
&gt;&gt;=C2=A0 =C2=A0 &lt;<a href=3D"https://gitlab.com/gnutls/libtasn1/-/m=
erge_requests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/g=
nutls/libtasn1/-/merge_requests/71</a>&gt;<br>
&gt;&gt;=C2=A0 Is this on the host that built qemu, or inside the VM or whe=
re exactly?<br>
&gt; <br>
&gt; It&#39;s inside the VM ... I assume the libtasn there has the same bug=
 as the one on macOS?<br>
&gt; <br>
<br>
The gnutls failures on macOS and FreeBSD (with clang as main compiler) won=
=E2=80=99t happen only if libtasn1 from master is used. Otherwise libtasn1 =
has to be compiled with -O1/-O0.<br></blockquote><div><br></div><div>Forgiv=
e my ignorance...</div><div><br></div><div>Does this come from a submodule?=
 From something I&#39;ve built and installed on my FreeBSD host? Or somethi=
ng that&#39;s installed into the FreeBSD guest</div></div></div></blockquot=
e><div><br></div><div>ah, it&#39;s inside the guest.=C2=A0</div><div><br></=
div><div>Warner</div></div></div>

--0000000000009d0f3b05bd0bd88e--

