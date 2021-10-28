Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC15F43E999
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:36:50 +0200 (CEST)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgC8n-0002x3-IE
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgBpx-00007W-Dy
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 16:17:21 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:37746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgBpr-0007W2-H7
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 16:17:20 -0400
Received: by mail-lf1-x130.google.com with SMTP id i13so6516773lfe.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 13:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2r/BkAHCtVJiWWd1wOFLaDrTTzvKTPIbX7MqljplsH4=;
 b=ZSDG14X/VduxeycHHU8iW6GO8h9hngJMTKu1Yj+YmYCFQFpHjFTwjtzzGwFhk/sFXJ
 r1zWdiwnXDrScNi/ICLgMCNehH9WzQkJD6WAerLX4Kvd6h3S8oFuTqPJxJyOa2zdg/Xg
 NLVEMh90RJK6IceindJT48eckpJFHfYeyRgXK3ZLIqiqghml4XDlF3zmN7MMFxF5EkgC
 SkybXWq29PY5jNqFz/g5R+xu418mZqLygGONSZxaLSQqCJrA2HqpKprW7py4Mgk2/2oa
 ID+YYKvYCIQ0Wj1BHyqdJxdEam1TNlg09U0Ynfzx3M3LaYd2uwVXGNogsXaW24xMXX/+
 ZyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2r/BkAHCtVJiWWd1wOFLaDrTTzvKTPIbX7MqljplsH4=;
 b=GkqkBQEV2RkJlhlcLqcJ1eK+zLnnVnmjw/SFvBXSc48wW9V00QJXtE1kveRp0F2zB+
 v14n2djmpL3Ugk5DJXzsJsPOfRe+haehLlkIMRX9vN1kUDwQIG6uUCyMwZXT+b2xiJQt
 k/N2PHcY11NBEq1qG2eIoIe5LrRtnE5hJ/xJ0nMYca8if3t1qdx1c9cbHF/gRgTQgP9x
 EUnVW5KcSAU0K9LJ6hbpYVyrplut81qEzVPZY4ElulakAO7pTDs6WiNZquYf/WgavLRe
 WSQzCV3irjdyCRYRs9eOmQl89W8GTEQM+SESS/3IhLSdEHfZf1h/Qz5Yt2QQk96Q+jjx
 6L5w==
X-Gm-Message-State: AOAM5332Y05ID6scri4+SQsN/0w39vnUXVeBo/U8vF3UicWgwg89KrLJ
 /vuAibH1iUWhgR+R6C5cwcqDP0rwVf0Ps/kcGaVXhg==
X-Google-Smtp-Source: ABdhPJx+/8RfTHpYASUbhJ1HlPStJiOLMrtlPc6jgQxfWPthyXquPtlJ/vciI1FCN++FaHkTsDTB72vYnaIaSANVG/E=
X-Received: by 2002:a05:6512:b81:: with SMTP id
 b1mr6412611lfv.301.1635452233606; 
 Thu, 28 Oct 2021 13:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-19-imp@bsdimp.com>
 <b4289206-5b16-574d-34bc-42bce93837bc@linaro.org>
In-Reply-To: <b4289206-5b16-574d-34bc-42bce93837bc@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 14:16:59 -0600
Message-ID: <CANCZdfojSzi=WchQ8_cd1Yi3L2pRMQrU3oeWqHu9+m1rNNdskg@mail.gmail.com>
Subject: Re: [PATCH 18/24] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006e7a3605cf6f6557"
Received-SPF: none client-ip=2a00:1450:4864:20::130;
 envelope-from=wlosh@bsdimp.com; helo=mail-lf1-x130.google.com
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Klye Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006e7a3605cf6f6557
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 11:18 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > +typedef struct {
> > +    uint32_t    __fp_fpsr;
> > +    struct {
> > +        uint32_t    __fp_exponent;
> > +        uint32_t    __fp_mantissa_hi;
> > +        uint32_t    __fp_mantissa_lo;
> > +    }       __fp_fr[8];
> > +} target__fpregset_t;
> > +
> > +typedef struct {
> > +    uint32_t    __vfp_fpscr;
> > +    uint32_t    __vfp_fstmx[33];
> > +    uint32_t    __vfp_fpsid;
> > +} target__vfpregset_t;
> > +
> > +typedef struct target_mcontext {
> > +    uint32_t        __gregs[TARGET__NGREG];
> > +    union {
> > +        target__fpregset_t  __fpregs;
> > +        target__vfpregset_t __vfpregs;
> > +    } __fpu;
> > +} target_mcontext_t;
>
> This doesn't match what I see in sys/arm/include/ucontext.h at all.
> I don't even see the string "fstmx" anywhere in the source tree.
>

Yea. This appears to be a copy mostly from mips and is totally
wrong for ARM. However, despite that, it works by accident because
the general registers all wind up in the right places and we don't
actually write to the full context....

I'll respin with the correct headers and any code tweaks that
are needed. As to 'how this happened' I'm at a loss: git blame
shows that it came in when the sbruno repo was created which
is the earliest history I have for the project.

Warner

--0000000000006e7a3605cf6f6557
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 11:18 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; +typedef struct {<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __fp_fpsr;<br>
&gt; +=C2=A0 =C2=A0 struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __fp_exponent;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __fp_mantissa_hi;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __fp_mantissa_lo;<b=
r>
&gt; +=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0__fp_fr[8];<br>
&gt; +} target__fpregset_t;<br>
&gt; +<br>
&gt; +typedef struct {<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __vfp_fpscr;<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __vfp_fstmx[33];<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __vfp_fpsid;<br>
&gt; +} target__vfpregset_t;<br>
&gt; +<br>
&gt; +typedef struct target_mcontext {<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 __gregs[TARGET__NGR=
EG];<br>
&gt; +=C2=A0 =C2=A0 union {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 target__fpregset_t=C2=A0 __fpregs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 target__vfpregset_t __vfpregs;<br>
&gt; +=C2=A0 =C2=A0 } __fpu;<br>
&gt; +} target_mcontext_t;<br>
<br>
This doesn&#39;t match what I see in sys/arm/include/ucontext.h at all.<br>
I don&#39;t even see the string &quot;fstmx&quot; anywhere in the source tr=
ee.<br></blockquote><div><br></div><div>Yea. This appears to be a copy most=
ly from mips and is totally</div><div>wrong for ARM. However, despite that,=
 it works by accident because</div><div>the general registers all wind up i=
n the right places and we don&#39;t</div><div>actually write to the full co=
ntext....</div><div><br></div><div>I&#39;ll respin with the correct headers=
 and any code tweaks that</div><div>are needed. As to &#39;how this happene=
d&#39; I&#39;m at a loss: git blame</div><div>shows that it came in when th=
e sbruno repo was created which</div><div>is the earliest history I have fo=
r the project.</div><div><br></div><div>Warner</div></div></div>

--0000000000006e7a3605cf6f6557--

