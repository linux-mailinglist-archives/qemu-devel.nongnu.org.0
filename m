Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802A55BFA3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:55:23 +0200 (CEST)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o670E-0006Sp-CB
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o66Np-0005vj-2t
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:15:41 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:43786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o66Nm-0002bj-5p
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:15:40 -0400
Received: by mail-lj1-x235.google.com with SMTP id by38so13912896ljb.10
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CP3xzwITTLyAieK/68CY4q8i4RE7Oc6xq+hQ3xLawCI=;
 b=Wf1QOybnWyP02/oJfjrRPr/FAWgCGS9wvnwsKZXxbNEf76ztjv7OvT0suPOJTMauA8
 VyfQbCXRp64++/dMoiJcAD436CY9bMg57g+zKiBOKIHNrfQEWtrJLFTx+W+2iXglFcIj
 3P8np5+vTugDDl1Q1h9qwpgRe+qi3s3qcPf6r3ra2xOOKTgzY/UHsSsNB8wZR/TOEI26
 PjsW6eqEFMPgfD7ppG5i3MIpeCJCn/eAe/Fq5FlbmIJ2Zxw2zISNHu40Ye6VGjX7Q8dC
 l66HN8q8afdd6AOm71zzUQbs/Zm7XytADXaq0q6I+ySDAD72lZpSbFIn62DDW86YK2fR
 hlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CP3xzwITTLyAieK/68CY4q8i4RE7Oc6xq+hQ3xLawCI=;
 b=k5nA/k8sFrwr11Pv3I5NNL06BsvcEJbqYMnmPJOiPNJ5RDjZYpVp3pJtZFFstIV/77
 4NDN+3zWDOkp50ZE+aPzdZPyayeE2kEOfh93Kiaoqnyp8/kEJE/9IvT/7tasGISjw5ng
 l+I5nRMJLbWPDMfuwssOMafdXBNpjsw6QUItrhxUe3sAWm7/oSo++HZOHOKBGOhV8Boc
 5Djb5layDnabEphdmJJdN/ocmkH2x7da7uId4Qx1MQnTbJ9GbIzzuZf24h/4+gbu2sbI
 2SBKsq0FqxdxoaJuksxtQVE7+Wbq4vZ56rsWKaSlk43R97akUW+Rn9Qg5EUy6LN9hR4u
 85mw==
X-Gm-Message-State: AJIora9IREJo4C4hzz5HqPSzohYtPmo17Xfj0dFZqtJR8s6wOZIGkyqN
 NNXfq76mmY5uyTu08DNH5Ani3Me4RkDFYEf5su/3USwhzuc=
X-Google-Smtp-Source: AGRyM1sYX2jXifZIRR162MY3wECw9O7ALyBXmG51E0etHp5LeNUelcXHmsCwCcYfgGaHNKSecdRgNk7fdnr9Mb5dYDE=
X-Received: by 2002:a2e:a801:0:b0:24a:ff0b:ae7a with SMTP id
 l1-20020a2ea801000000b0024aff0bae7amr8880588ljq.287.1656404134834; Tue, 28
 Jun 2022 01:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Jun 2022 12:15:23 +0400
Message-ID: <CAJ+F1CLv2UfT2cL_JSMAmw6VkEN0gmDZ6=k-4F+mF3=KgHv15w@mail.gmail.com>
Subject: Re: [PATCH 0/9] Preliminary patches for subproject split
To: QEMU <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000fb56905e27da485"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000fb56905e27da485
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus

On Thu, Jun 16, 2022 at 4:48 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> Here is another subset of the large "subproject(qga)"" series I intend to
> send
> soon after (https://gitlab.com/marcandre.lureau/qemu/-/commits/qga).
>
> Thanks
>
> Marc-Andr=C3=A9 Lureau (9):
>   monitor: make error_vprintf_unless_qmp() static
>   error-report: misc comment fix
>   error-report: introduce "detailed" variable
>   error-report: simplify print_loc()
>   error-report: introduce ErrorReportDetailedFunc
>   error-report: add a callback to overwrite error_vprintf
>   qapi: move QEMU-specific dispatch code in monitor
>   scripts/qapi-gen: add -i option
>   scripts/qapi: add required system includes to visitor
>

This is mostly your area of maintenance. Do you have time for the remaining
reviews? (The progress feels very slow, compared to what is left in the
queue, I'd like to flush this before next year!)

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000fb56905e27da485
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Markus<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 16, 2022 at 4:48=
 PM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Hi,<br>
<br>
Here is another subset of the large &quot;subproject(qga)&quot;&quot; serie=
s I intend to send<br>
soon after (<a href=3D"https://gitlab.com/marcandre.lureau/qemu/-/commits/q=
ga" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/marcandre.lurea=
u/qemu/-/commits/qga</a>).<br>
<br>
Thanks<br>
<br>
Marc-Andr=C3=A9 Lureau (9):<br>
=C2=A0 monitor: make error_vprintf_unless_qmp() static<br>
=C2=A0 error-report: misc comment fix<br>
=C2=A0 error-report: introduce &quot;detailed&quot; variable<br>
=C2=A0 error-report: simplify print_loc()<br>
=C2=A0 error-report: introduce ErrorReportDetailedFunc<br>
=C2=A0 error-report: add a callback to overwrite error_vprintf<br>
=C2=A0 qapi: move QEMU-specific dispatch code in monitor<br>
=C2=A0 scripts/qapi-gen: add -i option<br>
=C2=A0 scripts/qapi: add required system includes to visitor<br></blockquot=
e><div><br></div><div>This is mostly your area of maintenance. Do you have =
time for the remaining reviews? (The progress feels very slow, compared to =
what is left in the queue, I&#39;d like to flush this before next year!)<br=
></div><div><br></div><div>thanks<br></div><div>=C2=A0<br></div></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></di=
v></div>

--0000000000000fb56905e27da485--

