Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22912364FC7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 03:19:28 +0200 (CEST)
Received: from localhost ([::1]:60556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYf30-0000TL-PV
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 21:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYf1u-0008Pt-Lc
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 21:18:18 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:34373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYf1p-0000Mx-Ds
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 21:18:17 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 m25-20020a4abc990000b02901ed4500e31dso1174220oop.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 18:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=La//RfGONs+3JM2I8X+3GiKclBW0ANPQpSJqOXhZrnM=;
 b=RRGrvdxv7qZcTO34CfYRr3wV0xkNgkr778j5i3ZQ2XTYpE0Hva34lYnL1aFFJOvZzc
 QYpvMQ2KICeh6N2iCUqeoAfl30WbRnoDdvamM5NMjiQ1XDOgt1sjV9VP2RHmtNFtwDdJ
 NKX69wT5axwmLhV394Eh0wFtILCSqwtg9at9slKCejg406Ygqtax4ZZvpUVnLO1Vh96C
 VasQoFRFjphR8Q6C2vqzyrSQ+nrrJQVhh3fMMYQbUvuYLj5R3f89VhVsQLb4/G6cpL8T
 PVQE5nhGjBKJvuqQJaTS5cawpqLbOJ+SaZ5vEtPLmVgmCQIxOTH53TyFp0T3WgD5inyB
 pmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=La//RfGONs+3JM2I8X+3GiKclBW0ANPQpSJqOXhZrnM=;
 b=b6n/GsBKxfTr1D76t99D4dbd08UPkpbDyCB/gYivSqNaw7/lbFg5xmWk951V64khl5
 8c8lCtPBbuzt3CWg6U/CYp4lBzLPV9VXiDTpfJo9Ih76fPvDmdR9UI/RmDtARl3/MAEl
 7uIzMYJWk7CgkEtdfylgo6ONE4h6mIUwE+kxoPdHD6l3TIvjgCtYyUZRNyYMfUj544zU
 7uuvw6IABf+umY6RrniabfSJF3uIV6MWU/67+LRRDv0VvL9iobPBz8p+89yCDNLj2Who
 VVAGjST643iYYKqsm4Ln76jYQ2WGcXhMb234pZjRUX8w2B6g0ctuV1MXofh/NPsqYBcW
 cWUQ==
X-Gm-Message-State: AOAM532aGoPgz7laG4Nmvj6jl0oW+0htmp1FrNqNq4JzqFmi1B4r+vvW
 WWzmYyYKfQ7RhO99NnTj/I4EeAijuxKejztCt74BLA==
X-Google-Smtp-Source: ABdhPJyx586kcz2CYe7Z8rMX0w8Snca2th2YWygOeWMv3F12QxVeIEwOy5W7FiOjFLZStP7qwR7Y91AU2vdqp+RiTjY=
X-Received: by 2002:a4a:d685:: with SMTP id i5mr15256719oot.32.1618881491011; 
 Mon, 19 Apr 2021 18:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210419055614.28361-1-frank.chang@sifive.com>
 <448d86ca-28b0-6523-d84b-4f9e867cf01b@linaro.org>
In-Reply-To: <448d86ca-28b0-6523-d84b-4f9e867cf01b@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 20 Apr 2021 09:18:01 +0800
Message-ID: <CAE_xrPhW1eE_-yLXd3J4vovCKeq3xtHDXB1Dn5kQe3c5gSgjwA@mail.gmail.com>
Subject: Re: [PATCH] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000034a42b05c05d38e1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=frank.chang@sifive.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000034a42b05c05d38e1
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021 at 11:28 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/18/21 10:56 PM, frank.chang@sifive.com wrote:
> > +#elif defined(TARGET_RISCV)
> > +    /*
> > +     * For RISC-V, InvalidOp is set when multiplicands are Inf and zero
> > +     * and returns default NaN.
> > +     */
> > +    if (infzero) {
> > +        float_raise(float_flag_invalid, status);
> > +        return 3;
> > +    }
> > +
> > +    if (is_nan(a_cls)) {
> > +        return 0;
> > +    } else if (is_nan(b_cls)) {
> > +        return 1;
> > +    } else {
> > +        return 2;
> > +    }
>
> This second half of the function made me go look into the spec to make
> sure you
> had got that selection right.  But RISCV is always in default_nan mode, so
> all
> this is unused (and overridden in pick_nan_muladd).
>
> I think for avoidance of confusion, you should use
>
>      if (infzero) {
>          float_raise(float_flag_invalid, status);
>      }
>      return 3; /* default nan */
>
>
> r~
>

Sure, I'll update my patch and resend again.

Thanks
Frank Chang

--00000000000034a42b05c05d38e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Apr 19, 2021 at 11:28 PM Richard =
Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hende=
rson@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 4/18/21 10:56 PM, <a href=3D"m=
ailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> =
wrote:<br>
&gt; +#elif defined(TARGET_RISCV)<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* For RISC-V, InvalidOp is set when multiplicands=
 are Inf and zero<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* and returns default NaN.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (infzero) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 float_raise(float_flag_invalid, status);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 3;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (is_nan(a_cls)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 } else if (is_nan(b_cls)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
This second half of the function made me go look into the spec to make sure=
 you <br>
had got that selection right.=C2=A0 But RISCV is always in default_nan mode=
, so all <br>
this is unused (and overridden in pick_nan_muladd).<br>
<br>
I think for avoidance of confusion, you should use<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (infzero) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0float_raise(float_flag_invalid, status);<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return 3; /* default nan */<br>
<br>
<br>
r~<br></blockquote><div><br></div><div>Sure, I&#39;ll update my patch and r=
esend again.</div><div><br></div><div>Thanks</div><div>Frank Chang</div></d=
iv></div>

--00000000000034a42b05c05d38e1--

