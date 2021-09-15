Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D88440C32A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 11:58:48 +0200 (CEST)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQRgk-00073p-Ne
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 05:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.lyon.oss@gmail.com>)
 id 1mQRfn-0006N6-Ke; Wed, 15 Sep 2021 05:57:47 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:43628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophe.lyon.oss@gmail.com>)
 id 1mQRfk-0008Pt-KX; Wed, 15 Sep 2021 05:57:47 -0400
Received: by mail-io1-xd36.google.com with SMTP id n24so2590935ion.10;
 Wed, 15 Sep 2021 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gqcGDXwA6e97UbMcLuLWlqD9l/Qn0L/bVAx+xa8t5Q=;
 b=mNLTlZbpQM+0GiSVJqpzf0vi35KNG3uOWJGeXwz8p0VtFe3Nk2tYwW/RigH+O3nSJf
 +unrBsE8Kh1A0WZIgP7HIcCDa0mWUuoKcN+qlKGEQ4UWV52hZx8nc0pzkHAWK42l436L
 uUyYqLNXnWw6KlxuXeABc7KLvSj5DvPiE0Q7FT25aXBMr0KyPyRLOnE2YCfABMnwkbGn
 yQ5bB4XOutcXsKVTyKcuS8+tmCBD610YGtThij9BnUxE93h3CoBnbZXUqjCxRNGuY8Up
 ktqobqIuZ2BN9GLEMOlXJGESF6L8Agwucp5+aeJ9kfALdqRHzzW6h7BOjfGlLczWhpR+
 Sf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7gqcGDXwA6e97UbMcLuLWlqD9l/Qn0L/bVAx+xa8t5Q=;
 b=6g2vTebP83iCwpwjlPNe28vYzQunMWLGFirXTzR/Fe34BJNeV5qIFyUDsIuJuswnOr
 JDGWnWEC5IKWjYRvJDS+cSLNK3NkCrAyka7MdAfuBerdGFTMjO3Egn4Jfxduqj5oC7l1
 jCCMLv001BIyMIfcc1GkCVlr8m7I/D1vBkaeRYBNEfJ3TGBKvONYP8F1SbvhNvB9c1AI
 2LkujFV0dQemrclvIt4ETUINpm6R1Hd7e2HZgAQdCzE5ThGo6nCBum8yxaQlpqmae5ir
 +HofMatRSwUb2BFUEuBIVNDRpYXCPWPprJVO+T9auv8zuxsmJQTpo7Vnw7x+SMeRVTEY
 A+Ww==
X-Gm-Message-State: AOAM532npnAiDoL55D8UlvaADazcTG/epYxXrApytf7RHOR3LxnguRUQ
 rwQEptuCI/ZRXHKyJBsa6ZTohetYEp6KOqQ/O9CiYfk5
X-Google-Smtp-Source: ABdhPJzhvuLW+18UUeoRTBZl3NUrZGbI/aCv4cChi77MFLWXniciofH1aWuqqA34MFYzxLYHwwfqCsZRmF8wnVC3IvY=
X-Received: by 2002:a6b:dc1a:: with SMTP id s26mr13887784ioc.191.1631699862696; 
 Wed, 15 Sep 2021 02:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210914120725.24992-1-peter.maydell@linaro.org>
In-Reply-To: <20210914120725.24992-1-peter.maydell@linaro.org>
From: Christophe Lyon <christophe.lyon.oss@gmail.com>
Date: Wed, 15 Sep 2021 11:57:31 +0200
Message-ID: <CAKhMtSJ7dsK=fZoj5fP2fHa0-93KuJgf-iSXp0MjkGOSOrQDew@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Set FPSCR.LTPSIZE for user-mode
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b236bc05cc05baf5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=christophe.lyon.oss@gmail.com; helo=mail-io1-xd36.google.com
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b236bc05cc05baf5
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thanks for the prompt patches!

On Tue, Sep 14, 2021 at 2:08 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> This patchset fixes https://gitlab.com/qemu-project/qemu/-/issues/613
> which is a bug where we weren't setting FPSCR.LTPSIZE correctly
> out of reset for the user-mode emulator. The effect is that
> when using an M-profile CPU with the low-overhead-branch or MVE
> extensions (ie the Cortex-M55) with the linux-user QEMU the 'LE'
> instruction would take a UserFault and MVE instructions would
> be incorrectly predicated.
>
> This is the result of some over-exuberant ifdeffery in the
> arm_cpu_reset() function. Patch 1 fixes that so that most of
> the M-profile-specific reset handling is not ifdeffed, and
> when we're in user mode we specifically set the FPU state up
> cleanly. Patches 2 and 3 are just follow-on tidyup.
>
> Christophe, if you are in a position to test this series with:
>  M55 (has Security, MVE and LOB)
>  M33 (has Security extension but not MVE/LOB)
>  M7 or M4 (no Security, but does have FPU)
> that would be ideal. I don't really have much in the way of
> test cases for usermode to hand, so it's possible that I
> forgot something in the init of the FPU state that might break
> one of those combinations. (It does fix the test case attached
> to the bug report.)
>

I ran the GCC testsuite with these configurations, and found no regression
compared to qemu-6.0, thanks.

In the M55 case, this also enabled many more tests, which is great!

Christophe


> thanks
> -- PMM
>
> Peter Maydell (3):
>   target/arm: Don't skip M-profile reset entirely in user mode
>   target/arm: Always clear exclusive monitor on reset
>   target/arm: Consolidate ifdef blocks in reset
>
>  target/arm/cpu.c | 39 ++++++++++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 11 deletions(-)
>
> --
> 2.20.1
>
>
>

--000000000000b236bc05cc05baf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>Thanks for the pro=
mpt patches!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Sep 14, 2021 at 2:08 PM Peter Maydell &lt;<a href=3D"ma=
ilto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">This patchset fixes =
<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/613" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/613</=
a><br>
which is a bug where we weren&#39;t setting FPSCR.LTPSIZE correctly<br>
out of reset for the user-mode emulator. The effect is that<br>
when using an M-profile CPU with the low-overhead-branch or MVE<br>
extensions (ie the Cortex-M55) with the linux-user QEMU the &#39;LE&#39;<br=
>
instruction would take a UserFault and MVE instructions would<br>
be incorrectly predicated.<br>
<br>
This is the result of some over-exuberant ifdeffery in the<br>
arm_cpu_reset() function. Patch 1 fixes that so that most of<br>
the M-profile-specific reset handling is not ifdeffed, and<br>
when we&#39;re in user mode we specifically set the FPU state up<br>
cleanly. Patches 2 and 3 are just follow-on tidyup.<br>
<br>
Christophe, if you are in a position to test this series with:<br>
=C2=A0M55 (has Security, MVE and LOB)<br>
=C2=A0M33 (has Security extension but not MVE/LOB)<br>
=C2=A0M7 or M4 (no Security, but does have FPU)<br>
that would be ideal. I don&#39;t really have much in the way of<br>
test cases for usermode to hand, so it&#39;s possible that I<br>
forgot something in the init of the FPU state that might break<br>
one of those combinations. (It does fix the test case attached<br>
to the bug report.)<br></blockquote><div><br></div><div>I ran the GCC tests=
uite with these configurations, and found no regression compared to qemu-6.=
0, thanks.</div><div>=C2=A0</div><div>In the M55 case, this also enabled ma=
ny more tests, which is great!</div><div><br></div><div>Christophe</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
Peter Maydell (3):<br>
=C2=A0 target/arm: Don&#39;t skip M-profile reset entirely in user mode<br>
=C2=A0 target/arm: Always clear exclusive monitor on reset<br>
=C2=A0 target/arm: Consolidate ifdef blocks in reset<br>
<br>
=C2=A0target/arm/cpu.c | 39 ++++++++++++++++++++++++++++-----------<br>
=C2=A01 file changed, 28 insertions(+), 11 deletions(-)<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000b236bc05cc05baf5--

