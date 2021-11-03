Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0FF4448E1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 20:21:08 +0100 (CET)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miLop-0000EN-La
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 15:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miLn6-0007o3-8D
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 15:19:20 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:33401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miLn4-0005UA-O8
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 15:19:19 -0400
Received: by mail-ua1-x930.google.com with SMTP id b17so6552339uas.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 12:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQ9c+iHRuqaXprFxWNV+LUdIWRAkDlxuO7yG3cuxZ1w=;
 b=qeMuUbWJyFa5N6BcD1evbqlkv5fAgrEanNzsAT9IDulwF2ini1OcoOgyk0qi20b5+4
 5q1dFj8LqX/MKrv+Ds9jveacyFav4mnh1oz9GH/T6wvlTaw3vNzS3kAjqj7FKzmAuqRb
 hRQTa7g4DBb3WU+S1s90b3Az+C3es0YoXpgy+ntpaZwXUwOgsgKN0hb8+eA+BLKatEkN
 KOHgz2CFKReNOa6leZW4ayt1OMq3Uq+EIEeDkHZZ8+S5LDU6mxSLKxI7wlcVAXD7NEd1
 cAOc/DIaQTwawriMmGZ3agb+0L1frhHhzJhkOWCzYg6inQr6VDcEpn2dVb8MwaTxVeGB
 LoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQ9c+iHRuqaXprFxWNV+LUdIWRAkDlxuO7yG3cuxZ1w=;
 b=10zeVI7g/n+vLEDcAWGiUybxUDvNX5zu+ehepfee77Ebd+IkpmqpYIeVNXiIR12BIB
 CkNaOvlKmj3Yw/6pHXIC5s09Lx9WkLVjpzLj1hVkf1EJq/QkOPj1A5bsuen5dFWSi0oX
 J4hmN8Wyl5D/BSNGb5fHxq8AiAT//tEpUSG9Ex2NPvBbS58QhNIhl+pqD6DaJlT5hfRx
 UknsaCA1eC9G8/eQwS1PEnvysPPs3QeDawYhxVbjRjP1b1AFicAkEN/mLoyDinuTSUJx
 TYWRfEMwCFLbAewWO83ozKOGEHGJWGuWzJK0p4rEtb9cHfuTDtlC29TK9DnUdhJRZxV1
 jXlA==
X-Gm-Message-State: AOAM531ycqBnjd1+AS5YEl8mGtQYZxz5anEz4jj48Bfe+jH7gxMIFv3E
 GopPO8PyAQq98GcXrzA+hUAfDydinnVZHW4Xz3KUtA==
X-Google-Smtp-Source: ABdhPJyvdNKQPPmW0zr38wGkyFtQY1FPjjNAYX4Yr5R7Fs33YzVmg/mAXftyWp29Pc8UjV02WcbgqsrnYtLdauX9tVg=
X-Received: by 2002:a9f:21d7:: with SMTP id 81mr25798670uac.39.1635967156526; 
 Wed, 03 Nov 2021 12:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-25-imp@bsdimp.com>
 <d4673836-df0b-064d-50e5-2f301a7bf1f1@linaro.org>
In-Reply-To: <d4673836-df0b-064d-50e5-2f301a7bf1f1@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 3 Nov 2021 13:19:04 -0600
Message-ID: <CANCZdfp=OxoNh5hZUj_MzbUTgJs-P7eBsU6wMCQ0B3kCCWC+1w@mail.gmail.com>
Subject: Re: [PATCH v2 24/30] bsd-user/arm/target_arch_signal.h: arm
 set_mcontext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003ab75605cfe7493a"
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003ab75605cfe7493a
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021 at 9:40 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/2/21 6:52 PM, Warner Losh wrote:
> > +    env->regs[15] = tswap32(gr[TARGET_REG_PC]);
>
> This will be able to crash qemu with an odd pc in thumb mode.
> You'd have to artificially create this mcontext of course.
>

Sure. And if you did this natively, you'd also get SIGILL or something
similar and the process would die and/or coredump.
Is there something different about qemu-user that I'm missing in this
context?

Warner


> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>

--0000000000003ab75605cfe7493a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 2, 2021 at 9:40 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/2/21 6:52 PM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 env-&gt;regs[15] =3D tswap32(gr[TARGET_REG_PC]);<br>
<br>
This will be able to crash qemu with an odd pc in thumb mode.<br>
You&#39;d have to artificially create this mcontext of course.<br></blockqu=
ote><div><br></div><div>Sure. And if you did this natively, you&#39;d also =
get SIGILL or something similar and the process would die and/or coredump.<=
/div><div>Is there something different about qemu-user that I&#39;m missing=
 in this context?</div><div><br></div><div>Warner</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000003ab75605cfe7493a--

