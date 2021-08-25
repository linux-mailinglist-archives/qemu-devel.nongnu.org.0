Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698463F7D0E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 22:13:51 +0200 (CEST)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIzHS-0004Ml-HY
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 16:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIzFE-00021P-PV
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:11:32 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIzFC-00039q-Ve
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:11:32 -0400
Received: by mail-ej1-x631.google.com with SMTP id n27so962363eja.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 13:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w9AAKhiSuy/TAYHvGWIHzWWYMlz/2O/2Hns7+WgVLxg=;
 b=ELJ1fxGBYqLh4PFUjxrovg7j0FNz1WIooaS3hcTSD1zCm1Jaw+v9R2WAufMo3gsDr4
 L44WjTvUe/Awc8RmHRpYYzMo0PGv95TsDg+Og3YARhE9MEZTXuvjRNHNJIYyT1Lxv2zr
 ewTawp58RXokmXUsguMBbgEBfEfHYdPE0xfpGWZhTE+3dj3XzovqEKfPcuPHdqtmrVb1
 YPOUD8pvW/uNayRNsXc0MnAF+pA6/n6K7zft7aMcg+VRBQr5xQWqTd5vc7fdNU2Pjw+l
 StC/pvxjMuHZr5/B9/yHxCtZjy6ROIVJgTsiZ9v2/9K3D5yzwkFNEDjaqr4zBcHcrPIH
 nCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w9AAKhiSuy/TAYHvGWIHzWWYMlz/2O/2Hns7+WgVLxg=;
 b=MvDmJb+NctucEgsN9dahw5yYPCSVcEXiNQT9DuSsS6IZ30xP1tF/0XxGOHDzKhcBJs
 rTbD+OkWgsPFRxdKaqFSkxsmJLIucxLEFoyy2gxz2RaXH8NJoionydL9bNahIkgvSNNI
 Do0xS63EH5pXnEE92JnbCO4ri6H9V3C1MlJXDrzquNDe2CoE9kOpRxsD1bvfMLBuL9kB
 GxYF9c1RZoiYDAYXxwM2sBFsc4rqamU2djUaXIENBlyZKPJYoGwf9qc+ij+tip7aMF0Q
 nBa6pWMDnFhfXtpMSlP4yF1StYioSLgy0kcdMQN0v4QClIFp8yAVg1/ecVmeFjW3vpsN
 cqxQ==
X-Gm-Message-State: AOAM532KPbSCnkDpD9ClypnefvYCkRDMc0hIfTfBXEB7nXpGwIfT/aBH
 ZbDUL6Eu5PWGhfKgLgOV7JK+1/lyUM1tTnFJKQs=
X-Google-Smtp-Source: ABdhPJwT7PbMgjLLognpXXIK8e4t+3jzbwEO1lGmJV9AO09Rj9/kx87Wb4LTVmoEhBW5xhWyMA55Ab05xy3qMokERJE=
X-Received: by 2002:a17:906:4a8e:: with SMTP id
 x14mr389307eju.389.1629922289366; 
 Wed, 25 Aug 2021 13:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
 <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
 <CAJ+F1CKx=24Hssrz=yz+D8Q2nTXcgaLeMFdB5tfHfdWRAZ-p+g@mail.gmail.com>
 <CAFEAcA-_Xcep33jG91M3j=bySpWS60zKyydm-jO8nn8nKg_6aQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-_Xcep33jG91M3j=bySpWS60zKyydm-jO8nn8nKg_6aQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 26 Aug 2021 00:11:17 +0400
Message-ID: <CAJ+F1CKo2hVhwKs+fH-W5rq04gCPiwjxe5HfFsg16gvTnH5U-A@mail.gmail.com>
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000011bc3705ca67dbab"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000011bc3705ca67dbab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 26, 2021 at 12:00 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 25 Aug 2021 at 20:55, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> > fdt_check_full was added in 1.4.7:
> > https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.4.7
> >
> > Only ubuntu appears to be lagging a bit behind. I wonder if they would
> consider an update.
>
> I doubt it. You would need to wait until that actually falls off
> our supported list. You also have a couple of years to wait until
> Debian oldstable is no longer on our supported list.
>
> Maybe, I don't know why debian oldstable would have received a new versio=
n
plus fixes, and not ubuntu.

It seems we could have our own fallback copy of fdt_check_full() though..
I'll give that a try.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000011bc3705ca67dbab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 26, 2021 at 12:00 AM Pe=
ter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@l=
inaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, 25 Aug 2021 at 20:55, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt; fdt_check_full was added in 1.4.7:<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv=
1.4.7" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/=
utils/dtc/dtc.git/tag/?h=3Dv1.4.7</a><br>
&gt;<br>
&gt; Only ubuntu appears to be lagging a bit behind. I wonder if they would=
 consider an update.<br>
<br>
I doubt it. You would need to wait until that actually falls off<br>
our supported list. You also have a couple of years to wait until<br>
Debian oldstable is no longer on our supported list.<br>
<br></blockquote><div>Maybe, I don&#39;t know why debian oldstable would ha=
ve received a new version plus fixes, and not ubuntu.</div><div><br></div><=
div>It seems we could have our own fallback copy of fdt_check_full() though=
.. I&#39;ll give that a try.<br clear=3D"all"></div></div><br>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000011bc3705ca67dbab--

