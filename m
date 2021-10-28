Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD05443E775
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:43:53 +0200 (CEST)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg9RQ-0007cY-Q6
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg9Km-0006Kr-MJ
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:37:00 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:34637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mg9Kj-00042t-NA
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:37:00 -0400
Received: by mail-ua1-x931.google.com with SMTP id h4so13071647uaw.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2T3Eq2UaBRLnX/73RKe2agGyLB7Fwv1Ve04t91Gz3gg=;
 b=05ivaMR9Zi5/H60rpqv4cFUwL9qMJw0I2aqC+F6Kp5XjD6agmeDhy4DA+Jn26rgtzr
 EhKGkq7Ht8lBc+2MG7sjAjI6OgH5RyQ4l20TfyZJed2PheLvdvi/2lt1C4A+qmYVbdch
 r0IWruC9vYxjp7+I9Bw34rGvYa2zT3dA7SOHBmGKLgRwnvl35VkehNav+UDUlMWePfcB
 dfy9tqd+XB2/eFvgU3cHuekOA1rrzYEYfveWIttJQQKCzWiZaxSb7mwQNLa4FcVc0MU1
 zmWE9rfxK8b6l6Cv5kf8USLl9k8Km0922EyVA0uFyeXhM35Nv04xY/+/AMUbmNxd/l3b
 6AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2T3Eq2UaBRLnX/73RKe2agGyLB7Fwv1Ve04t91Gz3gg=;
 b=VENc3Ehc1FX+5yY2bg+O0wThKZV0qhMMC03F7nMnf+JtmEuL/Ig0DhT4w9YEtCFrw5
 06TEVKfsdTHvqVZ4ygNt6gUKFoimP13jt+2/PMnQSckhTszLeosuHzirCn9DTMAkrb1H
 RwX+EFN1K5fLlcrJkafDYcLQWc+y+oc5w+o4nug72T6xdSuuBGR27bPnbd32nHcpN00D
 UewxMnHin2JeeFl7bpmrvp7qZTaGqD2Zx1zQ52P3FSI0gWiq/GYEZtMStaIHHa9OTpu0
 WP8tFnscIiuYFkO1y2DiHtrEpuPud2w17gHHUf/0zONSK0e3A4sttm/gnC2q2re462Po
 u6Sw==
X-Gm-Message-State: AOAM532YvPO8M3/gCPwqkFqOp+97Y8KSPKiH+tnhiR9LSkqNqtlGY4Oj
 ZRQXeoguBmC5UQsVIynN+Cls+IzLq+FVu1gKYeuj7Q==
X-Google-Smtp-Source: ABdhPJz1KmmXcdmQmUy95WiDxF5wWSsx84M14vaxdv0a5IjU4+ve6l0+LdUZ63YU0MCLlfdmQSoNArYZikZhEKJ70e0=
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr6096997vsf.42.1635442615046; 
 Thu, 28 Oct 2021 10:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-5-imp@bsdimp.com>
 <426f6425-ad4f-41c3-a034-90cec903b0a1@linaro.org>
In-Reply-To: <426f6425-ad4f-41c3-a034-90cec903b0a1@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 11:36:44 -0600
Message-ID: <CANCZdfoLyv3uM7MSNQepUu37Yx9NnhA5LdSNMWm=YkeQkv+VqA@mail.gmail.com>
Subject: Re: [PATCH 04/24] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001eec9d05cf6d284c"
Received-SPF: none client-ip=2607:f8b0:4864:20::931;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>, Olivier Houchard <cognet@ci0.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001eec9d05cf6d284c
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 9:14 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > +    cpsr_write(env, regs->uregs[16], 0xffffffff, CPSRWriteRaw);
>
> This looks a bit suspicious.
> Over in linux-user we use
>
>      cpsr_write(env, regs->uregs[16], CPSR_USER | CPSR_EXEC,
>                 CPSRWriteByInstr);
>
> Are you setting something special in pt_regs that would warrant writing
> supervisor bits of
> CPSR?  In addition, CPSRWriteRaw won't rebuild hflags, which means that
> changes to Thumb
> state won't be recognized properly.
>

Now that you highlight it, the code I posted looks wrong. The above code
makes better
sense to me. I'll make the change in our bsd-user fork and run it through
the FreeBSD
test harness that we have. I'll see if it introduces any regressions. Today
I have an
environment that I maintain by hand that runs ~5900 tests, of which
bsd-user's
qemu-arm passes like ~5500. My long term goal is to get that integrated
first into the
bsd-user fork's CI and later into the optional FreeBSD CI in qemu project.
In addition,
I'll be tagging 'testing qemu-user' in the testing environment so we can
exclude things
not emulated and/or mark known problems with a bug pointer. The test takes
about
3 hours to run in emulation is the only thing I'm worried about...

Warner

--0000000000001eec9d05cf6d284c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 9:14 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 cpsr_write(env, regs-&gt;uregs[16], 0xffffffff, CPSRWri=
teRaw);<br>
<br>
This looks a bit suspicious.<br>
Over in linux-user we use<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpsr_write(env, regs-&gt;uregs[16], CPSR_USER | CPSR_EX=
EC,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPSRWriteByInstr);<=
br>
<br>
Are you setting something special in pt_regs that would warrant writing sup=
ervisor bits of <br>
CPSR?=C2=A0 In addition, CPSRWriteRaw won&#39;t rebuild hflags, which means=
 that changes to Thumb <br>
state won&#39;t be recognized properly.<br></blockquote><div><br></div><div=
>Now that you highlight it, the code I posted looks wrong. The above code m=
akes better</div><div>sense to me. I&#39;ll make the change in our bsd-user=
 fork and run it through the FreeBSD</div><div>test harness that we have. I=
&#39;ll see if it introduces any regressions. Today I have an</div><div>env=
ironment that I maintain by hand that runs ~5900 tests, of which bsd-user&#=
39;s</div><div>qemu-arm passes like ~5500. My long term goal is to get that=
 integrated first into the</div><div>bsd-user fork&#39;s CI and later into =
the optional FreeBSD CI in qemu project. In addition,</div><div>I&#39;ll be=
 tagging &#39;testing qemu-user&#39; in the testing environment so we can e=
xclude things</div><div>not emulated and/or mark known problems with a bug =
pointer. The test takes about</div><div>3 hours to run in emulation is the =
only thing I&#39;m worried about...</div><div><br></div><div>Warner</div><d=
iv><br></div></div></div>

--0000000000001eec9d05cf6d284c--

