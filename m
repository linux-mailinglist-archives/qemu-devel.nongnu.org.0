Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3902C42A1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 16:09:11 +0100 (CET)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khwPu-0006kV-Tq
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 10:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khwOz-0006JO-H7
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:08:13 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khwOx-0003cH-OB
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:08:13 -0500
Received: by mail-ej1-x62e.google.com with SMTP id mc24so3473854ejb.6
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 07:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/6L1ZfFtcTyz4ijVs3mG1hAd778ZuxWbfkMAq8VrCqc=;
 b=ra2XXFGrJiIhJs7vFSsbiSjv5N2D3NMJ8TS67MOlyBsILAMq+V2KIIzDP+zQjqNjNs
 1DM6sjy5+W2dHbKmc0SGZ5RZ2dpjStiwHdFFchYV/qyOyUzA2TRzti0KB0oy5Pf/PnOG
 3tTCEDt3HeujL2+dI030q2IjHb1lbuEvjwmKBXn/yyRdkkZj5j7BdBVQRz8NAM1ixtjA
 DSKDSWlNWxkXRcT94TY1fqW2uj03Cn/zmcYJqtEZz3XTfFi28Qrg1GbOfvEDw/thFrQJ
 JIr/Ts9iQ++gnh3btwfO2V6QqviUmbagWW8791HdDhkEpR8el70loxERYL1zG/hoO02Z
 Jzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/6L1ZfFtcTyz4ijVs3mG1hAd778ZuxWbfkMAq8VrCqc=;
 b=Ms64I03SdIu1ZsglxTVwmVTihQAsHccPMYbCL2nqkL2f0GAPFE7M442E7OCzy0RIPI
 35jJZO26+69x2U29E9oEzmGv03BQk7rQ6audpskAtLbnr7x9SQrtFcl1uSRrDyXF6VJH
 xNwsGthONXdqjkbNLRejVHPbZYybiW5RUnUFMUNJV/CLoTAN04GRDOkR3qKc4w0V8xzK
 oa08mVg4QApsrYr6W1RxFUOxcTzPaIPdtSAFieVmhO/h8q1UKWreGeg44nM1GCxuw1kn
 tb3swgKQOLUWtiMqxVfm3Y2cRiNu6fTMc7NQo6X7NHdScjj3y4f8OL0NvNwQR1EYkGRU
 8OPw==
X-Gm-Message-State: AOAM532xBHwIW6g+sGK6UT5G1TO0lHiBY9iqnCd443jq0NU1Ub/twI0h
 qkLnYBUwcJB8AhT/jruJBlbGLVipw7clFHh7fq0=
X-Google-Smtp-Source: ABdhPJwDV5dHPf8kM8OiYJWNKkxLGaAqKhbENrxHg9smwS6Zuzhg77+NqJo51wh6EZVZrATC9OjzED0OriCzY0i2Cg0=
X-Received: by 2002:a17:906:c298:: with SMTP id
 r24mr3514978ejz.381.1606316889363; 
 Wed, 25 Nov 2020 07:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20200928125859.734287-1-philmd@redhat.com>
 <20200928125859.734287-3-philmd@redhat.com>
 <CAFEAcA9qi+Nyva7c8Pj8NtZ+shXzzkA+WaybZiFGZ0sa3fToig@mail.gmail.com>
In-Reply-To: <CAFEAcA9qi+Nyva7c8Pj8NtZ+shXzzkA+WaybZiFGZ0sa3fToig@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 25 Nov 2020 19:07:57 +0400
Message-ID: <CAJ+F1C+d0nUJJri-3viYzDA_uT3jmSBazmkGYPowAZK-VLtvQw@mail.gmail.com>
Subject: Re: [PATCH 2/3] qemu/atomic: Drop special case for unsupported
 compiler
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000965bc305b4efcb62"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000965bc305b4efcb62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 28, 2020 at 5:49 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 28 Sep 2020 at 14:12, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
> wrote:
> >
> > Since commit efc6c070aca ("configure: Add a test for the
> > minimum compiler version") the minimum compiler version
> > required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.
> >
> > We can safely remove the special case introduced in commit
> > a281ebc11a6 ("virtio: add missing mb() on notification").
>
> > -/*
> > - * We use GCC builtin if it's available, as that can use mfence on
> > - * 32-bit as well, e.g. if built with -march=3Dpentium-m. However, on
> > - * i386 the spec is buggy, and the implementation followed it until
> > - * 4.3 (http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D36793).
> > - */
> > -#if defined(__i386__) || defined(__x86_64__)
> > -#if !QEMU_GNUC_PREREQ(4, 4)
> > -#if defined __x86_64__
> > -#define smp_mb()    ({ asm volatile("mfence" ::: "memory"); (void)0; }=
)
> > -#else
> > -#define smp_mb()    ({ asm volatile("lock; addl $0,0(%%esp) " :::
> "memory"); (void)0; })
> > -#endif
> > -#endif
> > -#endif
>
> You need to be a bit cautious about removing QEMU_GNUC_PREREQ()
> checks, because clang advertises itself as GCC 4.2 via the
> __GNUC__ and __GNUC_MINOR__ macros that QEMU_GNUC_PREREQ()
> tests, and so unless the code has explicitly handled clang
> via a different ifdef or feature test clang will be using
> the fallback codepath in cases like this. So you also need
> to find out whether all our supported versions of clang
> are OK with the gcc-4.4-and-up version of this code...
> (I think that deleting this set of #ifs means we end up
> with the "just use __sync_synchronize()" version of smp_mb()
> later on in the header?)
>

With clang 3.8 (xenial amd64) __ATOMIC_RELAXED is defined, so the chunk to
remove which is x86-specific anyway, isn't reached.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000965bc305b4efcb62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 28, 2020 at 5:49 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, 28 Sep 2020 at 14:12, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; Since commit efc6c070aca (&quot;configure: Add a test for the<br>
&gt; minimum compiler version&quot;) the minimum compiler version<br>
&gt; required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.<br>
&gt;<br>
&gt; We can safely remove the special case introduced in commit<br>
&gt; a281ebc11a6 (&quot;virtio: add missing mb() on notification&quot;).<br=
>
<br>
&gt; -/*<br>
&gt; - * We use GCC builtin if it&#39;s available, as that can use mfence o=
n<br>
&gt; - * 32-bit as well, e.g. if built with -march=3Dpentium-m. However, on=
<br>
&gt; - * i386 the spec is buggy, and the implementation followed it until<b=
r>
&gt; - * 4.3 (<a href=3D"http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D3679=
3" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.org/bugzilla/show_bu=
g.cgi?id=3D36793</a>).<br>
&gt; - */<br>
&gt; -#if defined(__i386__) || defined(__x86_64__)<br>
&gt; -#if !QEMU_GNUC_PREREQ(4, 4)<br>
&gt; -#if defined __x86_64__<br>
&gt; -#define smp_mb()=C2=A0 =C2=A0 ({ asm volatile(&quot;mfence&quot; ::: =
&quot;memory&quot;); (void)0; })<br>
&gt; -#else<br>
&gt; -#define smp_mb()=C2=A0 =C2=A0 ({ asm volatile(&quot;lock; addl $0,0(%=
%esp) &quot; ::: &quot;memory&quot;); (void)0; })<br>
&gt; -#endif<br>
&gt; -#endif<br>
&gt; -#endif<br>
<br>
You need to be a bit cautious about removing QEMU_GNUC_PREREQ()<br>
checks, because clang advertises itself as GCC 4.2 via the<br>
__GNUC__ and __GNUC_MINOR__ macros that QEMU_GNUC_PREREQ()<br>
tests, and so unless the code has explicitly handled clang<br>
via a different ifdef or feature test clang will be using<br>
the fallback codepath in cases like this. So you also need<br>
to find out whether all our supported versions of clang<br>
are OK with the gcc-4.4-and-up version of this code...<br>
(I think that deleting this set of #ifs means we end up<br>
with the &quot;just use __sync_synchronize()&quot; version of smp_mb()<br>
later on in the header?)<br></blockquote><div><br></div><div>With clang 3.8=
 (xenial amd64) __ATOMIC_RELAXED is defined, so the chunk to remove which i=
s x86-specific anyway, isn&#39;t reached.</div><div><br></div><div>Reviewed=
-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.c=
om">marcandre.lureau@redhat.com</a>&gt; </div><br clear=3D"all"></div><br>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br>=
</div></div>

--000000000000965bc305b4efcb62--

