Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D351C4459C4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 19:31:17 +0100 (CET)
Received: from localhost ([::1]:37016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mihW8-00028n-5U
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 14:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mihT9-00012Q-6Q
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 14:28:11 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:33333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mihSu-0000pf-Ko
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 14:28:10 -0400
Received: by mail-ua1-x92f.google.com with SMTP id b17so12748380uas.0
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 11:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jdNa0kYxJXzn0cNFRTuC0tDh3IKGzoI63WkwEE70q2U=;
 b=m1m1WJdTTgROBhBNNCkAN/HhEL1ts8UMl7isbSDoiQxV5aKQPHd2vBlvpJzOpltVW+
 5ns5okh5MkIU4VoMxZmK7m8RysyQtwNHGjl3eJNODJ9wNqPNGgmfzRSRRy7upiAKbNzh
 C3eI/tmSZlKZeccMSHnlJwza9pq0dv04SmkrReekf8R6J/l/GPZwMjGepekamxVfyqjd
 7GybTu2Z8KuQeTmcRpUF4AC9799dedcMFuValPEFoitqC6HmjmrOMFf0rLB00V/4CZvL
 p2uyASDJ80GZTjksRkAJzw6RQkXLYiC1RzbSM5+/eoQKvJ6P4WWsogktLdDkQ7SJxiM9
 iMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jdNa0kYxJXzn0cNFRTuC0tDh3IKGzoI63WkwEE70q2U=;
 b=0/rCEbdzhBgUdpk+d03kC0ff6R6xop6TMHexrUle4o/hnYwEPkQLyWXxXs6JIbXkjx
 xBYeMu83tmnvxmwxT1CTfPmCc+5sID+YCzESiX6xhBwfpQH7gDXriy7MO6pmskqsF+X3
 pfnVBDQ7LVEXNAQflkID4PJUJ3zPWvldz6jmX+PEBqgEjPXhE82gqCZbvcpZoWn9mVB+
 lVeLQcpZ/ph1rNMXNoktx7X1dbKWOk5uQuofk5p45c6s/4FnnH+18bcq8faRBXuRlNIu
 sDH7pxcyCwdO/X/6pGncl4xwF3+4zVM9e1CEn5WjJnN/DNkOWSq0BZp/5GyRJUjcksAD
 Mn8w==
X-Gm-Message-State: AOAM533cEcN8HuZTDP9KfhlxEthTuq69xpp09C2Jgt393OCQzUSUO00J
 smE3yu7/qrEaAqSuWUKSZ2PWUyF6mtNUclCcoGbQ2Q==
X-Google-Smtp-Source: ABdhPJw6F6B9io/N4guRp7dfBJKQELIKgbXtUujaxek/v8wJAO8HjK/0g73f0PoH7vhhdkeC3VI156Hv4hIupqr4+9Y=
X-Received: by 2002:a05:6102:10c7:: with SMTP id
 t7mr49239068vsr.44.1636050475287; 
 Thu, 04 Nov 2021 11:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211104140536.42573-1-imp@bsdimp.com>
 <20211104140536.42573-20-imp@bsdimp.com>
 <1262504d-1ce4-4720-31e4-e373d74e2b39@linaro.org>
 <CANCZdfpo_VwtWGrKVM1x=qZrBOMnWy-w6A6PfdswUE0yJH-EcQ@mail.gmail.com>
In-Reply-To: <CANCZdfpo_VwtWGrKVM1x=qZrBOMnWy-w6A6PfdswUE0yJH-EcQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 4 Nov 2021 12:26:10 -0600
Message-ID: <CANCZdfp8gem1_BPa0pv2c49uN8+_uk2vXS0U9ck2j2YGVZ-jCQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/29] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006a1cda05cffaaffd"
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006a1cda05cffaaffd
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021, 11:58 AM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Thu, Nov 4, 2021 at 11:49 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 11/4/21 10:05 AM, Warner Losh wrote:
>> > +typedef struct target_mcontext {
>> > +    uint32_t    __gregs[32];
>>
>> sys/arm/include/ucontext.h has
>>
>> #define _NGREG          17
>> typedef __greg_t        __gregset_t[_NGREG];
>>
>
There is already a TARGET__NGREG so I'll use that.

With s/32/17/ here,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>
> Will do.
>
> And I'm going to add compile time asserts for the size of mcontext and
> ucontext in a future
> patch series. It won't test for layout, but will keep things like this
> from happening again by accident.
>
> Warner
>

--0000000000006a1cda05cffaaffd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Nov 4, 2021, 11:58 AM Warner Losh &lt;<a href=
=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 4, =
2021 at 11:49 AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@=
linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 11/4/21 10:05 AM, Warner Losh wrote:<br>
&gt; +typedef struct target_mcontext {<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __gregs[32];<br>
<br>
sys/arm/include/ucontext.h has<br>
<br>
#define _NGREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 17<br>
typedef __greg_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 __gregset_t[_NGREG];<br></block=
quote></div></div></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">There is already a TARGET__NGREG so I&#39;ll use that.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
With s/32/17/ here,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</=
a>&gt;<br></blockquote><div><br></div><div>Will do.</div><div><br></div><di=
v>And I&#39;m going to add compile time asserts for the size of mcontext an=
d ucontext in a future</div><div>patch series. It won&#39;t test for layout=
, but will keep things like this from happening again by accident.</div><di=
v><br></div><div>Warner=C2=A0<br></div></div></div>
</blockquote></div></div></div>

--0000000000006a1cda05cffaaffd--

