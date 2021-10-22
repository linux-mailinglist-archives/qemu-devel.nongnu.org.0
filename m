Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E9437078
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 05:27:04 +0200 (CEST)
Received: from localhost ([::1]:59810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdlCx-0006Ne-4g
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 23:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdlBU-0005Ss-DU
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 23:25:32 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdlBQ-00037K-Bh
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 23:25:32 -0400
Received: by mail-io1-xd30.google.com with SMTP id o184so3616694iof.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 20:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zi/iD66Wxe147JjaGKlr/N3ukbAHB1lLA7xwYenMdtA=;
 b=YL8DLT1JLiq7SllAQNkjZg2iomfj++Lw5MFE0rkS8Z01m80+DDdWiBB/AFqor+7EVj
 /yp3MdkMdjfDQCDTf8Os0c3hf53vVbTl0ebFEVKLpzpIKqz9hcq+/UIj13eoKYCuYTm2
 O/y/rS1ZiZGMReW9ZBPVEXtSVGCpSFsDD8lFVBF++EXuCCOZTOV3k128bBOgdQQGie5t
 Zom8GSuWIBtl8iqddRz29Sj9f6PJ0r08UPWKLxKbptrYzM9V/3PA0ard7csCWFmlG8lL
 wCFMDoaH7fvy2leQrG0xCSriEcymEM9XPI24PZhif/NRwr9Ax6fj963VBjeVS4HKu03B
 /d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zi/iD66Wxe147JjaGKlr/N3ukbAHB1lLA7xwYenMdtA=;
 b=WQT0yJWDkXx3NRdtnTQu/EOkcyUG2KT/0UtH7TGiXl2Rvs4frkkWesASUOlM+om/JQ
 g5Or7DNekwIHkSTqSMEqAYnyRrNNllyf+xAfxPi/45pr7J+cgnb5LRPsMcyYDKcszcmk
 ERDzHRIi8GgZIW4LrVxHZamreY5mX1kFn67Gunh/7DnxOlX1iYrQIOeWJ7KyFlI1rFT5
 /uNulA6erjXrNP95ZHUMLzjfFiJrp59mesb+QnhuMHMU4ELPzNdtbRvzkp5viR1vWmlj
 DgvA9yC5IQ1ElTZYdUOzXTEFMHF1t+5TEUwl+Ask8ossmcq0Sad1nqLzJrqATHO7iL/5
 /o3g==
X-Gm-Message-State: AOAM530rzdl6pyAqe/721u0dwJiI5AYXV0tRjIigFMuSKmB8hGnjiIpD
 eeERjjv7bI7y7s4E2XCXNCufSdGSelWwKNzSePRYYA==
X-Google-Smtp-Source: ABdhPJwZOngL5e5vY41HUwy6jBqN7x/tENteZhOBxkzVYAbYj+GTJpJ5NowuT6ok5SkrEGOwBvqlJ7jRAKQeoiyBAUA=
X-Received: by 2002:a02:c6a5:: with SMTP id o5mr6676654jan.58.1634873126615;
 Thu, 21 Oct 2021 20:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211021162956.2772656-1-frank.chang@sifive.com>
 <20211021162956.2772656-2-frank.chang@sifive.com>
 <CAKmqyKM7kf7mFrh6i33ZSbLtf6tLC=qSUmzRTvwk=H_rFYs3ZA@mail.gmail.com>
 <07a1c82b-a8d1-cb01-e647-e777cb3aa497@linaro.org>
In-Reply-To: <07a1c82b-a8d1-cb01-e647-e777cb3aa497@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 22 Oct 2021 11:25:15 +0800
Message-ID: <CAE_xrPiMv=WsDbORLeTubTfsi58h_xgjUbLfF0bm67t0RCFe7A@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] target/riscv: zfh: half-precision load and store
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f7120d05cee88fe9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=frank.chang@sifive.com; helo=mail-io1-xd30.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair23@gmail.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f7120d05cee88fe9
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 22, 2021 at 7:28 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/21/21 3:31 PM, Alistair Francis wrote:
> > On Fri, Oct 22, 2021 at 2:30 AM <frank.chang@sifive.com> wrote:
> >>
> >> From: Kito Cheng <kito.cheng@sifive.com>
> >>
> >> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> >> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> >> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >
> > It doesn't look like this made it through to the list. I only see v3
> > on patchew:
> https://patchew.org/QEMU/20211016090742.3034669-1-frank.chang@sifive.com/
>
> It's just the cover-letter that got lost.
>
>
> https://lore.kernel.org/qemu-devel/20211021162956.2772656-2-frank.chang@sifive.com/
>
>
> > Can you rebase this on
> > https://github.com/alistair23/qemu/tree/riscv-to-apply.next when you
> > re-send it?
>
> But a rebase is probably required anyway.
>

Hi Alistair and Richard,

This patchset is already rebased on riscv-to-apply.next.
The Zfh and Zfhmin cpu properties are already moved to
/* Defaults for standard extensions */ section,
along with other Zi* extensions.

BTW, I found out my patchset won't appear at Patchew
if cover letter is only sent to qemu-riscv@nongnu.org.
(I used: "git send-email --to 'qemu-riscv@nongnu.org' ...",
instead of: "git send-email --to 'qemu-devel@nongnu.org,
qemu-riscv@nongnu.org' ...")

I will send it to qemu-devel@nongnu.org as well in my future patchset.

Regards,
Frank Chang


>
> r~
>

--000000000000f7120d05cee88fe9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Oct 22, 2021 at 7:28 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 10/21/21 3:31 PM, Alistair Fran=
cis wrote:<br>
&gt; On Fri, Oct 22, 2021 at 2:30 AM &lt;<a href=3D"mailto:frank.chang@sifi=
ve.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Kito Cheng &lt;<a href=3D"mailto:kito.cheng@sifive.com" targ=
et=3D"_blank">kito.cheng@sifive.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Kito Cheng &lt;<a href=3D"mailto:kito.cheng@sifive.=
com" target=3D"_blank">kito.cheng@sifive.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@si=
five.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifiv=
e.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.hende=
rson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; <br>
&gt; It doesn&#39;t look like this made it through to the list. I only see =
v3<br>
&gt; on patchew: <a href=3D"https://patchew.org/QEMU/20211016090742.3034669=
-1-frank.chang@sifive.com/" rel=3D"noreferrer" target=3D"_blank">https://pa=
tchew.org/QEMU/20211016090742.3034669-1-frank.chang@sifive.com/</a><br>
<br>
It&#39;s just the cover-letter that got lost.<br>
<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20211021162956.2772656-2-fran=
k.chang@sifive.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kern=
el.org/qemu-devel/20211021162956.2772656-2-frank.chang@sifive.com/</a><br>
<br>
<br>
&gt; Can you rebase this on<br>
&gt; <a href=3D"https://github.com/alistair23/qemu/tree/riscv-to-apply.next=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/alistair23/qemu/t=
ree/riscv-to-apply.next</a> when you<br>
&gt; re-send it?<br>
<br>
But a rebase is probably required anyway.<br></blockquote><div><br></div><d=
iv>Hi Alistair and Richard,</div><div><br></div><div>This patchset is alrea=
dy rebased on riscv-to-apply.next.</div><div>The Zfh and Zfhmin cpu propert=
ies are already moved to</div><div>/* Defaults for standard extensions */ s=
ection,</div><div>along with other Zi* extensions.</div><div><br></div><div=
>BTW, I found out my patchset won&#39;t appear at Patchew</div><div>if cove=
r letter is only sent=C2=A0to=C2=A0<a href=3D"mailto:qemu-riscv@nongnu.org"=
>qemu-riscv@nongnu.org</a>.</div><div>(I used: &quot;git send-email --to &#=
39;<a href=3D"mailto:qemu-riscv@nongnu.org">qemu-riscv@nongnu.org</a>&#39; =
...&quot;,</div><div>instead of: &quot;git send-email --to &#39;<a href=3D"=
mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a>,<a href=3D"mailto:q=
emu-riscv@nongnu.org">qemu-riscv@nongnu.org</a>&#39; ...&quot;)</div><div><=
br></div><div>I will send it to=C2=A0<a href=3D"mailto:qemu-devel@nongnu.or=
g">qemu-devel@nongnu.org</a> as well in my=C2=A0future=C2=A0patchset.</div>=
<div><br></div><div>Regards,</div><div>Frank Chang</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000f7120d05cee88fe9--

