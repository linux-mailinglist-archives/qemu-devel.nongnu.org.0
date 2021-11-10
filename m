Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22744C4F7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:21:48 +0100 (CET)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqM6-0001uH-UZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:21:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkqKv-00018V-P5
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:20:33 -0500
Received: from [2607:f8b0:4864:20::a2f] (port=34564
 helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkqKt-0003nC-CJ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:20:33 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id bc10so1662447vkb.1
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i98YwD8nZK+9LHc5tEDM2dAFWdyJ51LpmO5e30dP2Y8=;
 b=o5kzNBVJI0EbW9DcJFGe30RAiEE3qpxJcmrScyxHIaCPBDhvPE5sBd4Es0S2nkgJpE
 nLpKtIy4PIkTXlcP93KAt4MRDUK10IJzRvUGP5/DfePDWu/+5d5QAnGcAKEZiv5s93RM
 +QHp4NhSsNfvdrOWmK9YJ8rKi4PqFDd/+1btxJT6wxdJNAAtwZd2tSZL1dQAtTWuPjZa
 Vz15zYCRK+UNaGecjdO8ynj450HSi0DQiAAUyRNnVdbE3GEA2hBcEewrZ06CGnX5TyuD
 8NMfLs0/wm3Pk3BEKaCBxidr/Q3Ne9Dj1UMG21eGfAxGwGjcPrReOceDmWt8+DyEJG4F
 Astw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i98YwD8nZK+9LHc5tEDM2dAFWdyJ51LpmO5e30dP2Y8=;
 b=IS6zc8/QNfL6MdETdFjZI+TkXhwSQMr1UPa2H5FPzpeOH5/4YDRVqoo+8dHcbyczJk
 dO7NwGksWgY86C6fohBywdWLxjqfZwXqvdWjdeqagvF/GSFxOP9KPzaEb+n/kbbSyPGR
 GxVfoaUvg4VtvYO1HYceTpUNk+F7J8oj42V8X1TgChlqYOw41QnZp57m21JhJOcLAD6H
 8OL8SVrtlEzEaSIbpAILsWaAIe3ad4mMM6mZ7pw1BaqdCzH6phSl1xcisvjJ7l0opOea
 KCw/xGATkhc0eMj/FttTwsU0GyYH91lVXeKAMcLyG+j1B1zbFRAtu8q/qnpMmyvZNIxs
 sPdQ==
X-Gm-Message-State: AOAM533SYXjLd8RnUroSrIYsg2Yj5ST3O5LSAXQmYtAQvthU92MG7uLQ
 9e78pMYixqPFjIRHP0lg2WuOlwog6/B0Kh9IsTFeAg==
X-Google-Smtp-Source: ABdhPJyRtIKA2+vVyrWpaOlEVqZ7VDvWq2pjL2h0fSYStnrsgUwi6J/2kt9gWtosGKzhU/RTeaprZUUqbZdTwD6AATk=
X-Received: by 2002:a05:6122:114c:: with SMTP id
 p12mr95616vko.21.1636561229986; 
 Wed, 10 Nov 2021 08:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-3-imp@bsdimp.com>
 <fa216460-3fa2-a5bc-f974-ea2c8cf6430e@linaro.org>
 <CANCZdfq5SbUE8Wq8MKsHHJdWuu++suZNuL490E7gqEjGHY+V0g@mail.gmail.com>
In-Reply-To: <CANCZdfq5SbUE8Wq8MKsHHJdWuu++suZNuL490E7gqEjGHY+V0g@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 10 Nov 2021 09:20:19 -0700
Message-ID: <CANCZdfokdTN7QvNwhSCw1VoiZo5qvHM_c+XOU9JF+CMV3GZFjA@mail.gmail.com>
Subject: Re: [RFC 2/4] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c44c7905d0719acf"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c44c7905d0719acf
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 8, 2021 at 9:39 AM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Mon, Nov 8, 2021 at 8:07 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 11/8/21 3:37 AM, Warner Losh wrote:
>> > All instances of rewind_if_in_safe_syscall are the same, differing only
>> > in how the instruction point is fetched from the ucontext and the size
>> > of the registers. Use host_signal_pc and new host_signal_set_pc
>> > interfaces to fetch the pointer to the PC and adjust if needed. Delete
>> > all the old copies of rewind_if_in_safe_syscall.
>> >
>> > Signed-off-by: Warner Losh<imp@bsdimp.com>
>> > ---
>> >   linux-user/host/aarch64/hostdep.h | 20 --------------------
>> >   linux-user/host/arm/hostdep.h     | 20 --------------------
>> >   linux-user/host/i386/hostdep.h    | 20 --------------------
>> >   linux-user/host/ppc64/hostdep.h   | 20 --------------------
>> >   linux-user/host/riscv/hostdep.h   | 20 --------------------
>> >   linux-user/host/s390x/hostdep.h   | 20 --------------------
>> >   linux-user/host/x86_64/hostdep.h  | 20 --------------------
>> >   linux-user/signal.c               | 18 +++++++++++++++++-
>> >   8 files changed, 17 insertions(+), 141 deletions(-)
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Although I think we can fairly safely drop HAVE_SAFE_SYSCALL.  It is
>> required for proper
>> operation.  As with host-signal.h, really.
>>
>
> Yes. The only possible use I can see for it is to allow people to bring up
> new platforms more easily by deferring the signal-safe system call details
> until later in that process.
>

If we do, we'd need to remove the linux-user on a mips host tests from the
CI pipeline. Those are the only ones left that don't use this that we test.

Warner

--000000000000c44c7905d0719acf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 8, 2021 at 9:39 AM Warner=
 Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Nov 8, 2021 at 8:07 AM Richard Henderson &lt;<=
a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/8/21 3:37 AM, Warner Losh wrote:<br>
&gt; All instances of rewind_if_in_safe_syscall are the same, differing onl=
y<br>
&gt; in how the instruction point is fetched from the ucontext and the size=
<br>
&gt; of the registers. Use host_signal_pc and new host_signal_set_pc<br>
&gt; interfaces to fetch the pointer to the PC and adjust if needed. Delete=
<br>
&gt; all the old copies of rewind_if_in_safe_syscall.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0linux-user/host/aarch64/hostdep.h | 20 -------------------=
-<br>
&gt;=C2=A0 =C2=A0linux-user/host/arm/hostdep.h=C2=A0 =C2=A0 =C2=A0| 20 ----=
----------------<br>
&gt;=C2=A0 =C2=A0linux-user/host/i386/hostdep.h=C2=A0 =C2=A0 | 20 ---------=
-----------<br>
&gt;=C2=A0 =C2=A0linux-user/host/ppc64/hostdep.h=C2=A0 =C2=A0| 20 ---------=
-----------<br>
&gt;=C2=A0 =C2=A0linux-user/host/riscv/hostdep.h=C2=A0 =C2=A0| 20 ---------=
-----------<br>
&gt;=C2=A0 =C2=A0linux-user/host/s390x/hostdep.h=C2=A0 =C2=A0| 20 ---------=
-----------<br>
&gt;=C2=A0 =C2=A0linux-user/host/x86_64/hostdep.h=C2=A0 | 20 --------------=
------<br>
&gt;=C2=A0 =C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 18 +++++++++++++++++-<br>
&gt;=C2=A0 =C2=A08 files changed, 17 insertions(+), 141 deletions(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
Although I think we can fairly safely drop HAVE_SAFE_SYSCALL.=C2=A0 It is r=
equired for proper <br>
operation.=C2=A0 As with host-signal.h, really.<br></blockquote><div><br></=
div><div>Yes. The only possible use I can see for it is to allow people to =
bring up new platforms more easily by deferring the signal-safe system call=
 details until later in that process.</div></div></div></blockquote><div><b=
r></div><div>If we do, we&#39;d need to remove the linux-user on a mips hos=
t tests from the CI pipeline. Those are the only ones left that don&#39;t u=
se this that we test.</div><div><br></div><div>Warner=C2=A0</div></div></di=
v>

--000000000000c44c7905d0719acf--

