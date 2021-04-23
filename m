Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A3369D8F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:48:53 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la5XY-00010v-Do
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1la5WP-0000az-De
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:47:41 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1la5WN-0005Z5-Ue
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:47:41 -0400
Received: by mail-qk1-x732.google.com with SMTP id x11so51266739qkp.11
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=buorBgkPp9vuF+iAgNlRHAode17kmtKbGYe63YbGfHY=;
 b=ZuHdBiLTUnn8Rynd17xJLO04AHqMXTWJRrNdUmbxkvIdRWwkxW2URetewh24qU/G4G
 /iDidsev0gbNXgrQ9CtJeM42l91tu7TjxBswrw9D1IxGXAHyTt8v5R6/RkwRpcpmLrw9
 ZasCmc5IrNZGgQO6k6RakC29M7s6CzsOK6kAgfJ/7A6/tbGJrPWQzJ9Rt7IpbWG+TL7M
 tlVM2GWkk77Fo7rglE/ci42k6rPkeDoZYD3E6ncw1BUVPGVaQDHFPNn7WMED55e5W8/W
 BjQ4LNyvYxJq+b3iLp/sFS4KE02Aht5SQhQI8VaA5/BKSl2IHJC6d7Y6xTwYE4cwpQ5j
 XYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=buorBgkPp9vuF+iAgNlRHAode17kmtKbGYe63YbGfHY=;
 b=madharELCSneedb4vCxYSLv+r4CpJGgTBiyX4qFIdT5UVvnc6eXqa0LwxkH51IcDAK
 7Hb6POxYrWAke8YBIe+pp5rCWPtQQ9s4l+b4FeOXEV4fQlotxE90RkJgimERcC95NOmy
 Q36gqNN64fRw5UlWYXYo5+RT4QPwUPpgV8hwEHd8L4HkUsvKAyWgL+RWA/l7nDx/JgDj
 inbBW2W8hDrPHb/BR1fO76RGsBYQEA/7Iq8uga6wJs9uTQ3hi+r79KOHn1WZUaM5ZxvG
 fPqI2FQ/9+OX9ZyQI4Ptm+VVAsOgAmfW0JsT2laR8WjfYF499Mg4Py9wmvO7DEsdFVpv
 ZjKA==
X-Gm-Message-State: AOAM531klXP+pCp3APsn+Z+yxoRCqJGv/V83cfm3PTsupddH9qwXh69X
 WrqOnGMEf3RzPq27vsDc4C9ZxeXGoks5TGlLkmbHyQ==
X-Google-Smtp-Source: ABdhPJwqAukfMcthvgDuzD04C2FpuCGrvRkmfsbyrXnwJjUNe6uBHC0TmAFRJ9UOePS4VLqSu7FJYlxVLPSKh+4T/Xk=
X-Received: by 2002:a37:6492:: with SMTP id y140mr6523494qkb.89.1619221657608; 
 Fri, 23 Apr 2021 16:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-12-imp@bsdimp.com>
 <e36d6f1a-895d-edeb-4194-00d2694e7e78@linaro.org>
In-Reply-To: <e36d6f1a-895d-edeb-4194-00d2694e7e78@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 23 Apr 2021 17:47:26 -0600
Message-ID: <CANCZdfpyh6kiufSxiFG7S4r5WQms=rg_-W=stegv=jqaWJsZZQ@mail.gmail.com>
Subject: Re: [PULL 21/24] bsd-user: add arm target_signal.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b6fb8105c0ac6b4f"
Received-SPF: none client-ip=2607:f8b0:4864:20::732;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x732.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Alex Richardson <arichardson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b6fb8105c0ac6b4f
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 5:19 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> > +static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
> > +{
> > +    return state->regs[R_ESP];
> > +}
>
> Shall we just wait until arm actually compiles?
> This won't, being a copy from x86...
>

OK. Fair point. I'll drop this for now and pick it up when more of the arm
is in place. Good catch.


>
> r~
>

--000000000000b6fb8105c0ac6b4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 5:19 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 4/23/21 1:39 PM, <a href=3D"mailto:imp@bsdimp.com" tar=
get=3D"_blank">imp@bsdimp.com</a> wrote:<br>
&gt; +static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return state-&gt;regs[R_ESP];<br>
&gt; +}<br>
<br>
Shall we just wait until arm actually compiles?<br>
This won&#39;t, being a copy from x86...<br></blockquote><div><br></div><di=
v>OK. Fair point. I&#39;ll drop this for now and pick it up when more of th=
e arm is in place. Good catch.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000b6fb8105c0ac6b4f--

