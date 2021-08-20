Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026123F2570
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 05:49:34 +0200 (CEST)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGvXB-0005P8-Vs
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 23:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mGvW8-0004hI-6c
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:48:28 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:45805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mGvW5-0005H0-Q9
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:48:27 -0400
Received: by mail-qt1-x82a.google.com with SMTP id d9so6437915qty.12
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 20:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xhI2YvQT5wLGA0IkdSwcaec1NS9RnQ7kzpI7wDS9pQA=;
 b=TTsCDk+n12wbErWyfACbUHmoQLxUShHRGr2m18EKDN3BnrkCo08PLyYr0xehSx13mh
 kwu7NJzZCh6MDECitoDXocbtP0EMEc6iGZm3MBqxbEhfD8V/yJxPVAzN/BPucjlLgOHJ
 V8Ygc59m9aIOFs1C5U5Jv6E9ZsQ0ZRr5/wmwr+NRZgWtDCqQhwQaTW5J9vnPoyRVBrtI
 1uTbEmfPWu5XQWKaOTG4PzubL+qhaAJk8nOlkay4mPn8DiMrrh9CEYeSRDcEqagQrWfn
 ITu+uS4+j3aikWpkgN4Xv+zktCC6IXDsacRQoFLPAx/q/jCKE9PP63euRHfYxEPOJskf
 Ho8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xhI2YvQT5wLGA0IkdSwcaec1NS9RnQ7kzpI7wDS9pQA=;
 b=MiVGzLQlddad70oTYw5FT311R0R6EOSSpRYtlpTxzSjEXwQtdJ5kGFVvLExU/xM3FP
 MqTfWlsV+OJDxXc/hxOqU26oLHFQzRGNvYwqvcEWg5DHxjPZRYd6yAqi8RTMDky/BMbm
 +peWMcN1YH0ZzIcf72/Hn63UQpXSDJgrkuusDkx2qLjh1dpJBMH1PWKbDUF7kN5f5qf/
 T36U63EuWtRbNLCqwNVFxwE92oJyGlEUnMb+m2xrN8QNsJgw7Mmli3Ply/cJlLO6Z9D5
 IAeFr5b7eD60Ke4ZyF+O5TQh5NuaeJnJ4iuilqXPrOosqd3Enl8OzhruF2vAi0hPf9eY
 Li/g==
X-Gm-Message-State: AOAM531PdsORProm+1WRq30NU2lQkbsWnLuivNR/PW9Wee0QzcYNgrF5
 B9+f1P6WBxXuhDxFojG6gCSEGfdXg0km94FAgYPWSQ==
X-Google-Smtp-Source: ABdhPJyUV+KKz3XTZFLGPpZPvwrpcH2jTUyTYnUqyEhT02GpSnlhuA0b0SJRkR1boLZVF+bOWM6btAD/6EqjOF088CU=
X-Received: by 2002:ac8:777a:: with SMTP id h26mr15709961qtu.235.1629431304499; 
 Thu, 19 Aug 2021 20:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-29-imp@bsdimp.com>
 <5ac9c3db-b7e0-9439-b2b5-a6ff3ed38b18@linaro.org>
In-Reply-To: <5ac9c3db-b7e0-9439-b2b5-a6ff3ed38b18@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 19 Aug 2021 21:48:14 -0600
Message-ID: <CANCZdfrQQhXqvbZh1APdTp8PnjVnf_F+gDBpZi_+SftLUWz9GQ@mail.gmail.com>
Subject: Re: [PATCH for 6.2 28/49] bsd-user: Move stack initializtion into a
 per-os file.
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000017517b05c9f58ac9"
Received-SPF: none client-ip=2607:f8b0:4864:20::82a;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82a.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000017517b05c9f58ac9
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 9, 2021 at 3:00 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > +static inline int setup_initial_stack(struct bsd_binprm *bprm,
> > +        abi_ulong *ret_addr, abi_ulong *stringp)
> > +{
> > +    int i;
> > +    abi_ulong stack_hi_addr;
> > +    size_t execpath_len, stringspace;
> > +    abi_ulong destp, argvp, envp, p;
> > +    struct target_ps_strings ps_strs;
> > +    char canary[sizeof(abi_long) * 8];
> > +
> > +    stack_hi_addr = p = target_stkbas + target_stksiz;
> > +
> > +    /* Save some space for ps_strings. */
> > +    p -= sizeof(struct target_ps_strings);
> > +
> > +#ifdef TARGET_SZSIGCODE
> > +    /* Add machine depedent sigcode. */
> > +    p -= TARGET_SZSIGCODE;
> > +    if (setup_sigtramp(p, (unsigned)offsetof(struct target_sigframe,
> sf_uc),
> > +            TARGET_FREEBSD_NR_sigreturn)) {
> > +        errno = EFAULT;
> > +        return -1;
> > +    }
> > +#endif
>
> Hmm.  The x86 version you just added always returns -EOPNOTSUPP.
> Therefore I conclude
> that TARGET_SZSIGCODE is unset.
>
> Perhaps a better interface would be
>
>    p = setup_sigtramp(p, ...);
>    if (p == 0) {
>      // fail
>    }
>
> then you don't need to expose TARGET_SZSIGCODE or have conditional
> compilation here.
>
> Perhaps for the to-do list...
>

I'll add it to the todo...


> > +    /* Add canary for SSP. */
> > +    arc4random_buf(canary, sizeof(canary));
>
> You should use qemu_guest_getrandom_nofail here.
>

OK.


> > +    /*
> > +     * Deviate from FreeBSD stack layout: force stack to new page here
> > +     * so that signal trampoline is not sharing the page with user stack
> > +     * frames. This is actively harmful in qemu as it marks pages with
> > +     * code it translated as read-only, which is somewhat problematic
> > +     * for user trying to use the stack as intended.
> > +     */
>
> A decent short-term solution.
>
> I'll draw your attention to my vdso patch set for linux-user:
>
> https://patchew.org/QEMU/20210706234932.356913-1-richard.henderson@linaro.org/
>

I'll look at that as well...

Warner


> Modulo randomness,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>

--00000000000017517b05c9f58ac9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 9, 2021 at 3:00 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; +static inline int setup_initial_stack(struct bsd_binprm *bprm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ulong *ret_addr, abi_ulong *stringp)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong stack_hi_addr;<br>
&gt; +=C2=A0 =C2=A0 size_t execpath_len, stringspace;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong destp, argvp, envp, p;<br>
&gt; +=C2=A0 =C2=A0 struct target_ps_strings ps_strs;<br>
&gt; +=C2=A0 =C2=A0 char canary[sizeof(abi_long) * 8];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 stack_hi_addr =3D p =3D target_stkbas + target_stksiz;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Save some space for ps_strings. */<br>
&gt; +=C2=A0 =C2=A0 p -=3D sizeof(struct target_ps_strings);<br>
&gt; +<br>
&gt; +#ifdef TARGET_SZSIGCODE<br>
&gt; +=C2=A0 =C2=A0 /* Add machine depedent sigcode. */<br>
&gt; +=C2=A0 =C2=A0 p -=3D TARGET_SZSIGCODE;<br>
&gt; +=C2=A0 =C2=A0 if (setup_sigtramp(p, (unsigned)offsetof(struct target_=
sigframe, sf_uc),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_FREEBSD_NR_sigreturn=
)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EFAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
<br>
Hmm.=C2=A0 The x86 version you just added always returns -EOPNOTSUPP.=C2=A0=
 Therefore I conclude <br>
that TARGET_SZSIGCODE is unset.<br>
<br>
Perhaps a better interface would be<br>
<br>
=C2=A0 =C2=A0p =3D setup_sigtramp(p, ...);<br>
=C2=A0 =C2=A0if (p =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0// fail<br>
=C2=A0 =C2=A0}<br>
<br>
then you don&#39;t need to expose TARGET_SZSIGCODE or have conditional comp=
ilation here.<br>
<br>
Perhaps for the to-do list...<br></blockquote><div><br></div><div>I&#39;ll =
add it to the todo...<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 /* Add canary for SSP. */<br>
&gt; +=C2=A0 =C2=A0 arc4random_buf(canary, sizeof(canary));<br>
<br>
You should use qemu_guest_getrandom_nofail here.<br></blockquote><div><br><=
/div><div>OK.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Deviate from FreeBSD stack layout: force stack =
to new page here<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* so that signal trampoline is not sharing the pa=
ge with user stack<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* frames. This is actively harmful in qemu as it =
marks pages with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* code it translated as read-only, which is somew=
hat problematic<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* for user trying to use the stack as intended.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
A decent short-term solution.<br>
<br>
I&#39;ll draw your attention to my vdso patch set for linux-user:<br>
<a href=3D"https://patchew.org/QEMU/20210706234932.356913-1-richard.henders=
on@linaro.org/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QE=
MU/20210706234932.356913-1-richard.henderson@linaro.org/</a><br></blockquot=
e><div><br></div><div>I&#39;ll look at that as well...</div><div><br></div>=
<div>Warner<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Modulo randomness,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--00000000000017517b05c9f58ac9--

