Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C303630B757
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 06:47:21 +0100 (CET)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6oX2-0004uJ-Ct
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 00:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1l6oW9-0004PQ-Gl
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 00:46:25 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:40032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1l6oW6-0007g6-W7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 00:46:25 -0500
Received: by mail-lj1-x236.google.com with SMTP id s18so22554438ljg.7
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 21:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=q5XmDhy7kaOETvFuLk3+U6luxno6+Mnd9UnyfCbZPIY=;
 b=RkngDPQ63v4PRb/tZPDD+wwk+3cMGW/QXt22IPTa6zzeoYezdOPbFjVXxfgfqcAeFx
 Tm6ezO/Eqv++/jFmrcKnFWCopbaw5IIvV9x9jtug7E4IMna8usP9UtebX/n3uWNL4Iyi
 Shwt5CUMO1TrmJPZu3KgZ4KlRKWgC6Tj47LxfWAURgrP86mhg562ttZ2hLRtSCDS9WC2
 8+2zObZBQlYo/3++cRRZWvemBnaRcA33SC16NogAAbWOGtT4/gWOccu0QOEcLJKVrvoy
 z4BfjHo3mWqYwsJ7DV0dHClLzM46K0B1MeN0aW4kMRm9A6MRgKOuX925G0CpX/wauFQy
 NmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=q5XmDhy7kaOETvFuLk3+U6luxno6+Mnd9UnyfCbZPIY=;
 b=mbp/B/LL7EJx+/+m0ON/EJfirIP3yFg4/OhO/NHA72kTfuSw8sHpFaywDnlNPbN4UK
 nDRdq046TodtWLRWE13z5jGoMx3+8Te6fyvk08CbxaYsOQN4HWt67Y+KJZDqsVXdZi9F
 IGuufOoTaISuf07uhRAvylPagCUnmtkAbrLaleSRdm7YMxYPH8KT1MY1uzdyYdCd26a1
 5lEymP7pe+aSIURVsQIf0jE05KTbPo0Nb/VB8xbutbigYfbDuOIc2DECAjTKKzpdV91m
 WJx1gnJTjlKtkHH0TyCvMT40xmyzHMIlEnircGJDMJM7NUNjbIaoU3GuVh0jjDAtT1/V
 eYaQ==
X-Gm-Message-State: AOAM5324G6nV2KCyly+60zdZNR5yOKJQj8mR6XRVQAOAA9MsIft47nms
 92An3W5iJkm3vDlvlVU6q37yMmjhXa8HPMblZis=
X-Google-Smtp-Source: ABdhPJwIuWvCDcwacoA+cOJp4wir/H9ZqdtvJxugihA3ncg78kvQsc6d9kFKOHWmSY8w747XMpQPw2l+MeeC4re1igQ=
X-Received: by 2002:a2e:7e03:: with SMTP id z3mr12138574ljc.204.1612244780523; 
 Mon, 01 Feb 2021 21:46:20 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Tue, 2 Feb 2021 13:46:08 +0800
Message-ID: <CAE2XoE9rrHMB6YtqjZjBf3h=3mQ8BVOixNLhx1rh1MOEPJc+6w@mail.gmail.com>
Subject: Re: macOS (Big Sur,
 Apple Silicon) 'make check' fails in test-crypto-tlscredsx509
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006f341c05ba53fd44"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=luoyonggang@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Cc: Alexander Graf <agraf@csgraf.de>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006f341c05ba53fd44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

SHA-1: 94c13c1048378cbffe552b6fe5c960dc04eaefb2

* gcrypt: test_tls_psk_init should write binary file instead text file.

On windows, if open file with "w", it's will automatically convert
"\n" to "\r\n" when writing to file.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Is this related?

On Wed, Jan 27, 2021 at 12:37 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> My Big Sur/Apple Silicon system fails "make check" in
> test-crypto-tlscredsx509:
>
> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> G_TEST_SRCDIR=3D/Users/pm215/qemu/tests
> G_TEST_BUILDDIR=3D/Users/pm215/qemu/build/all/tests
> tests/test-crypto-tlscredsx509 --tap -k
>
> ** (tests/test-crypto-tlscredsx509:35180): CRITICAL **: 16:23:34.590:
> Failed to sign certificate ASN1 parser: Value is not valid.
> ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to
> sign certificate ASN1 parser: Value is not valid.
> make: *** [run-test-70] Error 1
>
>
> Does this failure ring any bells for anybody?
>
> Here's the crypto part of the meson-log:
>
>   Crypto
>                      TLS priority: "NORMAL"
>                    GNUTLS support: YES
>                         libgcrypt: NO
>                            nettle: YES
>                               XTS: YES
>                      crypto afalg: NO
>                          rng-none: NO
>                     Linux keyring: NO
>
>
> thanks
> -- PMM
>
>

--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000006f341c05ba53fd44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">SHA-1: 94c13c1048378cbffe552b6fe5c960dc04eaefb2<br><br>* g=
crypt: test_tls_psk_init should write binary file instead text file.<br><br=
>On windows, if open file with &quot;w&quot;, it&#39;s will automatically c=
onvert<br>&quot;\n&quot; to &quot;\r\n&quot; when writing to file.<br><br>S=
igned-off-by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luo=
yonggang@gmail.com</a>&gt;<br><div>Is this related?</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 27, 20=
21 at 12:37 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">My Big Sur/Apple Silicon system fails &quot;make =
check&quot; in<br>
test-crypto-tlscredsx509:<br>
<br>
MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}<br>
G_TEST_SRCDIR=3D/Users/pm215/qemu/tests<br>
G_TEST_BUILDDIR=3D/Users/pm215/qemu/build/all/tests<br>
tests/test-crypto-tlscredsx509 --tap -k<br>
<br>
** (tests/test-crypto-tlscredsx509:35180): CRITICAL **: 16:23:34.590:<br>
Failed to sign certificate ASN1 parser: Value is not valid.<br>
ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to<br>
sign certificate ASN1 parser: Value is not valid.<br>
make: *** [run-test-70] Error 1<br>
<br>
<br>
Does this failure ring any bells for anybody?<br>
<br>
Here&#39;s the crypto part of the meson-log:<br>
<br>
=C2=A0 Crypto<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0TLS priority: &quot;NORMAL&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GNUTLS=
 support: YES<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libgcrypt: NO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0nettle: YES<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XTS: YES<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0crypto afalg: NO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rng-none: NO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linux=
 keyring: NO<br>
<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =E6=AD=A4=E8=
=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=
=A0 sincerely,<br>Yonggang Luo<br></div>

--0000000000006f341c05ba53fd44--

