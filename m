Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71296693429
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 23:21:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQyEv-0000oe-62; Sat, 11 Feb 2023 17:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pQyEt-0000oQ-Lb
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 17:20:59 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pQyEr-0002M9-IN
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 17:20:59 -0500
Received: by mail-ej1-x634.google.com with SMTP id rp23so23769613ejb.7
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 14:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KvqPvQy4liFz5HBAiO30CyNhmNAriB7KQMDakFfhI+Y=;
 b=CcZgoTr2/760wcrvQsgAcJbwOAVWES6JSce+3UO8669zii8I2m9EGIAMg2y/euaLZf
 udaKHfaw8NI/vFxDXVM0GoaoZa0qLSaJ1pxBP17fBzNu/y3wB9tRBrgxzmhGtlZL3Ja3
 EiTpibyMXU3donC/pEF8/5R/4pmT84HsHTuGiViNcxhfr3VM+v+Zr7c7Q9jV9gp6z5Zp
 ss5eA+y+j3pcOH17wusnzG/aAwN2bnXRoSo8gYpNjDnH3kweu+CUa+ztDSJXhptpVc/q
 A26bL/kN3j9L4XsO5ggVV4E2eTOac9VbfG87XEkTn4qlVHNFlbGfCut+BM83qv/qrT+C
 1BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KvqPvQy4liFz5HBAiO30CyNhmNAriB7KQMDakFfhI+Y=;
 b=NWBII7EUsDho7ilPyUkPfnLvhRsnNyDk420goSpEC0E52JiyO2m4qj5iZZMS23UayH
 S+ewiUPvhN8KL8n+qaJ9/v7TMFRAF3c3wK+g3/aNPyWRVvqTlR/324kcUDM5yr2flVc/
 tS4O/Xzj3E7IpnSNvDjKQ1cnsK/CLrRRj2SR5XRgoWj7SEo9KnhAf6axiiVlR7egMvar
 Ga06nhCXXjZNlBwJCKZVBaLzOcSQ9n9kcs0Ttv5I6TBnbuV3L2AT7Pn+G6WWaNH2nuiX
 4/gu3IYEVl60XHNU5H7SiWgupD9ODoVjGsa4oul4VlMgQZvplFYDc515MPez1rUJe02H
 SduA==
X-Gm-Message-State: AO0yUKWjBrV8ERrJqSZPM8r4HhEOq8duT6W99Ou4zyHUaiBDpPzZ5Iq7
 +N5vjXhh/T2VUSG3/g4XKZWHdxyFaHoeufEg3tDyaw==
X-Google-Smtp-Source: AK7set8WIvYHdFWgYvLXjLNgZuIa+BP4pjEbQTRFLPcimWfwf9oO/SXe9PRpaRCN/kTs+YZeuJ1RilFb/3BZq4x5NXQ=
X-Received: by 2002:a17:906:3d69:b0:877:e539:810b with SMTP id
 r9-20020a1709063d6900b00877e539810bmr2676654ejf.2.1676154046671; Sat, 11 Feb
 2023 14:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20230210231829.39476-1-imp@bsdimp.com>
 <4ffbeeb3-5126-3e29-34c0-a2b6f0740f88@linaro.org>
In-Reply-To: <4ffbeeb3-5126-3e29-34c0-a2b6f0740f88@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 11 Feb 2023 15:20:39 -0700
Message-ID: <CANCZdfo7ZmU4RMTC9DtVOSJbi9mRJX3C7bPHX+WdNnR-7XcoxQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] 2023 Q1 bsd-user upstreaming: bugfixes and sysctl
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008a7fdf05f4740629"
Received-SPF: none client-ip=2a00:1450:4864:20::634;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000008a7fdf05f4740629
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 12:30 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/10/23 13:18, Warner Losh wrote:
> > There's
> > several static functions that aren't used until the end of the patch
> > series... Not sure the best way to suppress the build warnings there
> (but since
> > they are just warnings...).
>
> Are they just warnings?  --enable-werror is default...
>
> Anyway, I've used
>
> static type G_GNUC_UNUSED function(args...)
>
> in the past to ensure bisection, removing the UNUSED marker when they
> become used.
>

I like that suggestion, and it's easy to implement. Thanks for this and the
reviews so far. I've
updated things with your comments, but will give it another day or two
before I send v2 for
others to comment.

Warner

--0000000000008a7fdf05f4740629
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 11, 2023 at 12:30 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 2/10/23 13:18, Warner Losh wrote:<br>
&gt; There&#39;s<br>
&gt; several static functions that aren&#39;t used until the end of the pat=
ch<br>
&gt; series... Not sure the best way to suppress the build warnings there (=
but since<br>
&gt; they are just warnings...).<br>
<br>
Are they just warnings?=C2=A0 --enable-werror is default...<br>
<br>
Anyway, I&#39;ve used<br>
<br>
static type G_GNUC_UNUSED function(args...)<br>
<br>
in the past to ensure bisection, removing the UNUSED marker when they becom=
e used.<br></blockquote><div><br></div><div>I like that suggestion, and it&=
#39;s easy to implement. Thanks for this and the reviews so far. I&#39;ve</=
div><div>updated things with your comments, but will give it another day or=
 two before I send v2 for</div><div>others to comment.<br></div><div><br></=
div><div>Warner <br></div></div></div>

--0000000000008a7fdf05f4740629--

