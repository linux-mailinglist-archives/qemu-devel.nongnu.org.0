Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F741D690
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:43:33 +0200 (CEST)
Received: from localhost ([::1]:50690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsbE-0006Qk-J9
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mVsYy-0004LV-A4
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:41:12 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mVsYw-0007CL-0y
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:41:11 -0400
Received: by mail-ed1-x532.google.com with SMTP id s17so19503491edd.8
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UncZKiMNSEy9uBtzahFZI3CWkZfU/Avb9ILzeJS2iTw=;
 b=dw+8U15Uzqn67ONibuCvxP2lJH9ALTrWVzu5jvH4vx8qURLBDMaPW0CWUfTcyIG6Ca
 CMYPCdUaE19+7aab5U3aRNdRc+ajYSI2nDOcaft6AmucPZoEdSUwvLq1RqaOuMO07zTb
 wFUDRP/o5y27TkjWXbDfZzOdmp2bnTmFEZaWcVu8wN7wQSsXhSKEJ+2wnEG24dXd2P04
 IDL0fo7NTbYPMQCsXriMs0f00ETNg7+8CW9BLhqXonOeiNaXqVnshjlrWqMXsFMDtcjB
 wDdnV+W0NRc9AEdAJg/y63coCaOlInY748QOYqeNVouiujfTcYzyUWYP01JXCKokdX+w
 PRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UncZKiMNSEy9uBtzahFZI3CWkZfU/Avb9ILzeJS2iTw=;
 b=sW025vAxE6FFBirRtEnFGxMWU4H3wK6x1rh7oAa5sGz8LNy8Pw0fpc2bunm2WuSbWN
 tE9nbfsERixp/u8w1jdUjnpGKM1pojmBt4OwvLBshOXGZiLuigUvsc8tMsQIWPkNcBv3
 FIQIUpYefUIbVa1gZTD4LmnbzpXHO+WhyMiMsJOeSdAHOxu7gDw5/W+N4GvZFSjg6Hbt
 LT3hchlrMbljELmhmZmVpzgDocqB1OUUw0rv3UyksW/Jcav0KS38KnrJcy+D/z7/84NU
 p9G2bmX0xnv1ZLur/tJFtzZu9k1If7Upc9aI16g/NcR18fH+v3rjvUYTUwhxngZKhSvi
 ROLw==
X-Gm-Message-State: AOAM5316i0Gq2ylkXx9X5ab+7vSmtlsIJRbnm2dcZqOYpMlw0GPouUl7
 VasUxxOBMxcxPWzsAh0fpfmUq75vOhKFhmFdXvb00a7Yd5k=
X-Google-Smtp-Source: ABdhPJyUdugnsWvZC46GdX6UrdEIud+bcnY5aE6R2CFv7QCBYlH6RQl8gz/arXu9PK+3EgGFh2rq+YDqjzcaTEwWF9k=
X-Received: by 2002:a17:906:4cc1:: with SMTP id
 q1mr5324373ejt.415.1632994867983; 
 Thu, 30 Sep 2021 02:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210916053733.3457822-1-ani@anisinha.ca>
In-Reply-To: <20210916053733.3457822-1-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 30 Sep 2021 15:10:57 +0530
Message-ID: <CAARzgwyN1tFNWYjua5S_eEwBgjA_g-_6KC2+cSkEaih4piSDiw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a reviewer for KVM guest cpu
 related changes
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000006cfe305cd333fe7"
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x532.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000006cfe305cd333fe7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I take this back. I=E2=80=99m not sure if I=E2=80=99ll have a lot of spare =
time to review
patches in this area. Sadly there is no means to monitor changes/commits in
a particular area without taking on review responsibilities. Essentially
there has to be a =E2=80=9Cwatchers=E2=80=9D category. Badly needed IMHO. S=
omeone mentioned
this in the forum too.

On Thu, Sep 16, 2021 at 11:08 Ani Sinha <ani@anisinha.ca> wrote:

> I have looked into cpu features for KVM guests as a part of a different
> project. Would be interested to follow and review patches in this space.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6c20634d63..3a3167c499 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -364,6 +364,7 @@ Guest CPU Cores (KVM)
>  ---------------------
>  Overall KVM CPUs
>  M: Paolo Bonzini <pbonzini@redhat.com>
> +R: Ani Sinha <ani@anisinha.ca>
>  L: kvm@vger.kernel.org
>  S: Supported
>  F: */*/kvm*
> --
> 2.25.1
>
>

--00000000000006cfe305cd333fe7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I take this back. I=E2=80=99m not sure if I=E2=80=99ll ha=
ve a lot of spare time to review patches in this area. Sadly there is no me=
ans to monitor changes/commits in a particular area without taking on revie=
w responsibilities. Essentially there has to be a =E2=80=9Cwatchers=E2=80=
=9D category. Badly needed IMHO. Someone mentioned this in the forum too.</=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Sep 16, 2021 at 11:08 Ani Sinha &lt;<a href=3D"mailto:ani@anisin=
ha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">I have looked into cpu features for KVM guests as a part of a different<=
br>
project. Would be interested to follow and review patches in this space.<br=
>
<br>
Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_=
blank">ani@anisinha.ca</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 6c20634d63..3a3167c499 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -364,6 +364,7 @@ Guest CPU Cores (KVM)<br>
=C2=A0---------------------<br>
=C2=A0Overall KVM CPUs<br>
=C2=A0M: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D=
"_blank">pbonzini@redhat.com</a>&gt;<br>
+R: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@=
anisinha.ca</a>&gt;<br>
=C2=A0L: <a href=3D"mailto:kvm@vger.kernel.org" target=3D"_blank">kvm@vger.=
kernel.org</a><br>
=C2=A0S: Supported<br>
=C2=A0F: */*/kvm*<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000006cfe305cd333fe7--

