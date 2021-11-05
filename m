Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E3446771
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:58:21 +0100 (CET)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2Xk-0005Gr-LY
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj2Vc-0004IL-1d
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:56:09 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj2VV-0000Gu-Kr
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:56:07 -0400
Received: by mail-ua1-x936.google.com with SMTP id b3so18295829uam.1
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImBtKANwzFYMJGF7A5lGmEMS0YIFDEnFYBubhVvo7oM=;
 b=vq26P66n7twtKGThpwd46OGDw45+hgysng4VHkL5t/RsoUNWasajBS6MoYNF1Tkalh
 Fe+FJaurVypqDOJ61NwusmFGG5gGhvZL+Z+utTAfqm+cNgRuHw5ukWK1SZiPiJXa3h+7
 /TJmAmlcKIgbSJdG8iI6cg6lJUsC35ZyRsGNzaHs7qG3sjtOHOO5b5GhZ6f+5gX2Lkxx
 +TPleDhX0JFYfaLtRr+lW5Pp+56lDQ2JE42eQ9g9gFZXdRvr0PnOeURVsp1VwVY8Up5C
 xkzF6an4zavZKaoY4v8azpgoaH0wKK9Ac+lNoBxjUR376L9dulL7PyKPDSN1gji7Zhjk
 PK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImBtKANwzFYMJGF7A5lGmEMS0YIFDEnFYBubhVvo7oM=;
 b=jKBrJxUTZgJJq5GbUFaJwHQmTUKmvmIbe6ERV4vrSYLtazr1J0wL/zAh6vtAFEVzZ/
 K6KBcscedZq6mA3PaNu+YaRqulXHZIOoxaWxzkuKjyz0tMOdajX+ygW47zb4afP8l+XX
 frleiTCjBp6118+watElktBoL2pz6ycxC710YBettAfuOuWs0a3qmYOl8+zZQ+DSiB+B
 VC2EwIHw1QgVoaV08R4XbQ2ASFDrdZtxQ1rm4vEPYx8RXZI5W70ujN9SMeHlqQt50BRK
 9104yFMs9O2Z6sB5tp776taNdNH2ABerAMae8jzLYrKDENHKVQ9WV5oRidbS74FAZUBC
 gZzw==
X-Gm-Message-State: AOAM533l7gQ7mYP/ts0nBQPzN6HFHz/9iJBRe2Z6YxWz1s4IGpS7ZVSp
 ZL1Omk1f6n0s7B7XvN4MGUXTJ/lgyAsfL87spMMvOw==
X-Google-Smtp-Source: ABdhPJwA/B0XgGIY44iph0jNldqf/DcJxk8AuTlFoNvT7vMBcRpqieI+7RDwZPrVP8xp82dZIY/fQeRxNsPdPPJBC+A=
X-Received: by 2002:ab0:6010:: with SMTP id j16mr55693143ual.69.1636131360346; 
 Fri, 05 Nov 2021 09:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-8-imp@bsdimp.com>
 <ba0e1487-ec74-1d8b-b371-c33ea9ca0d74@linaro.org>
 <CANCZdfpwYPRb9mt7G3Oojx5BkfNHjtMFDZHeckzs0qhAepaJFw@mail.gmail.com>
In-Reply-To: <CANCZdfpwYPRb9mt7G3Oojx5BkfNHjtMFDZHeckzs0qhAepaJFw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 5 Nov 2021 10:55:49 -0600
Message-ID: <CANCZdfrHdPyOZAEDwaopvqtLRSg3Ltu+VXq9QuUtTb6vtPcmFQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/36] bsd-user/i386: Move the inlines into signal.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008a5a5005d00d8473"
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008a5a5005d00d8473
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 10:45 AM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Fri, Nov 5, 2021 at 10:21 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 11/4/21 11:18 PM, Warner Losh wrote:
>> > +abi_long set_sigtramp_args(CPUX86State *env, int sig,
>> > +                           struct target_sigframe *frame,
>> > +                           abi_ulong frame_addr,
>> > +                           struct target_sigaction *ka);
>> > +abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int
>> flags);
>> > +abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int
>> srflag);
>> > +abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
>> > +                                abi_ulong *target_uc);
>> >
>> >   #endif /* TARGET_ARCH_SIGNAL_H */
>>
>> You should use the CPUArchState typedef, instead of CPUX86State directly,
>> and place these
>> declarations in a shared header.
>>
>
> Will do! Thanks!
>

FYI: I'm going to add a change that moves this to target_os_ucommon.h after
I've
made i386 and x86_64 use the functions. That way all revisions will still
compile
and I don't have to deal with the 'half-way' state. I'll then tweak the arm
commits
later in the series to not add them arm specific prototypes to the
target_arch_signal.h
file.

Warner


>
>
>> Otherwise,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>

--0000000000008a5a5005d00d8473
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 5, 2021 at 10:45 AM Warne=
r Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, Nov 5, 2021 at 10:21 AM Richard Henderson &lt=
;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard.=
henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 11/4/21 11:18 PM, Warner Losh wrote:<br>
&gt; +abi_long set_sigtramp_args(CPUX86State *env, int sig,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct target_sigframe *frame,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong frame_addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct target_sigaction *ka);<br>
&gt; +abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int =
flags);<br>
&gt; +abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int =
srflag);<br>
&gt; +abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_s=
f,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ulong *target_uc);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#endif /* TARGET_ARCH_SIGNAL_H */<br>
<br>
You should use the CPUArchState typedef, instead of CPUX86State directly, a=
nd place these <br>
declarations in a shared header.<br></blockquote><div><br></div><div>Will d=
o! Thanks!</div></div></div></blockquote><div><br></div><div>FYI: I&#39;m g=
oing to add a change that moves this to target_os_ucommon.h after I&#39;ve<=
br></div><div>made i386 and x86_64 use the functions. That way all revision=
s will still compile</div><div>and I don&#39;t have to deal with the &#39;h=
alf-way&#39; state. I&#39;ll then tweak the arm commits</div><div>later in =
the series to not add them arm specific prototypes to the target_arch_signa=
l.h</div><div>file.</div><div><br></div><div>Warner</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div clas=
s=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000008a5a5005d00d8473--

