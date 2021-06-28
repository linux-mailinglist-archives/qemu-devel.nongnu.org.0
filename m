Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A93B6B07
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:40:31 +0200 (CEST)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzva-0000Dt-4P
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taylor.qemu@gmail.com>)
 id 1lxzuW-00080r-Iq
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:39:24 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <taylor.qemu@gmail.com>)
 id 1lxzuT-0000S4-Gp
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:39:24 -0400
Received: by mail-wm1-x330.google.com with SMTP id o22so11562533wms.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIO3ojpdUKG/KYeTQaaHtNzqKrPmFXvl8dIlZ5z69+A=;
 b=M2YQs3BStCpWiFasKTcLGNBjcYzREQQdcrc7kphucp9hQIJmdfYpUwxA1MI7Ra7l08
 bXdGuINCmpb8z9lMtvFo6NQOxoQGukoEj3m2l6eHSckZpfx0JaK0V+SG2B4/pp1WKP6G
 e379jeDgkJtJXxOP1wAj+C3uzsUKHrFJvZW50pAyyXgL2PjHU/amuKk0foYPXYch8iXD
 IhfUsJ6y6opDWfl+51XI2uHyRcZhAN6/SSMGp8cx2GxLlJJmeTvlH+qnKzueeVui9s9Z
 gZdw3Sx0MS8haY8rUmzCbyRJPOwTPld6RlVJ1/e/Emtan5N5zSloHRSe2U6z/C7Uwu+v
 7Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIO3ojpdUKG/KYeTQaaHtNzqKrPmFXvl8dIlZ5z69+A=;
 b=G68m0nCkj6QmkcsPuCCD2xrJBqM4ErLG2mMcB+2QiO+J79ehs4dd+Ez2CSvZjjY4IB
 XuWBgANzHYUKyvXe22LSzCwKx6c8cXtXamwQG2vLWuaB/0aSeKz04GAZTdApvbNu4I6p
 7kxiFDsNa6IOMiPcTuiMltwuqQxu0Z5g1bxgdHq8ad5cHo4YHGyQDYUsoc72ZGGOoN5B
 RfLv8Z2tcrlk/hyIpB9HGCqu08guPAUh0tN0NB+Op09uN9uJ9AURXpMOG+xnESihAowz
 Y+pZjNaITDuzii94CDALWPSSEPYY9+J2XNtPI5f6l8jh5SBi6+tQEbsx473R8bDepQzW
 FfVQ==
X-Gm-Message-State: AOAM533etI6tSaWNDIo17SM/dDjoF1V8oseBfGQDhLqxegZBBya+0wcy
 jxNQQvoOUiAuAhPgrN3BiOPOGfBxsEVVJCeGc3A=
X-Google-Smtp-Source: ABdhPJxFBpXmZG/iJNoH+ILLufGQuQPWnXJZJxbR4Lo16iITZqdHo89CQSor56adJRbdn+MGY4c1mOHO3gqq2zNmuJA=
X-Received: by 2002:a05:600c:1d23:: with SMTP id
 l35mr27534869wms.134.1624919959080; 
 Mon, 28 Jun 2021 15:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-14-ale.qemu@rev.ng>
 <CANji28b-AWkJ0C-Co5dYop2ykKgjjR96bw6e+MoaYtukUXKWEg@mail.gmail.com>
In-Reply-To: <CANji28b-AWkJ0C-Co5dYop2ykKgjjR96bw6e+MoaYtukUXKWEg@mail.gmail.com>
From: Taylor Simpson <taylor.qemu@gmail.com>
Date: Mon, 28 Jun 2021 17:39:08 -0500
Message-ID: <CANji28Y8pCFg9AShdV6_Fanw2KnkqoEq-xqmd8fMhkOyOkJ8Yg@mail.gmail.com>
Subject: Re: [PATCH v5 13/14] target/hexagon: import additional tests
To: Alessandro Di Federico <ale.qemu@rev.ng>
Content-Type: multipart/alternative; boundary="000000000000f310ea05c5db28d4"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=taylor.qemu@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f310ea05c5db28d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 25, 2021 at 6:56 PM Taylor Simpson <taylor.qemu@gmail.com>
wrote:

>
>
> On Sat, Jun 19, 2021 at 4:49 AM Alessandro Di Federico via <
> qemu-devel@nongnu.org> wrote:
>
>> From: Niccol=C3=B2 Izzo <nizzo@rev.ng>
>>
>> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
>> Signed-off-by: Niccol=C3=B2 Izzo <nizzo@rev.ng>
>> ---
>>
>
>
>
> +    .text
>> +    .globl _start
>> +
>> +_start:
>> +    {
>> +        call init
>> +    }
>> +    {
>> +        r0=3D#1
>> +        memw(sp+#0)=3Dr0.new
>> +    }
>>
>
> You haven't set up the stack, so you shouldn't use sp.  Even if the stack
> were set up, you should allocframe first.
>
>
My apologies - the stack *is* set up in linux-user mode.  So, it is OK to
reference sp after you do an allocframe.

You can disregard the other comments in the review about setting up the
stack.


Thanks,
Taylor

--000000000000f310ea05c5db28d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Jun 25, 2021 at 6:56 PM Taylor Simpson &lt;<a href=3D"mailto=
:taylor.qemu@gmail.com" target=3D"_blank">taylor.qemu@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sat, Jun 19, 2021 at 4:49 AM Alessandro Di Fed=
erico via &lt;<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qe=
mu-devel@nongnu.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Niccol=C3=B2 Izzo &lt;nizzo@rev.ng&gt;<br>
<br>
Signed-off-by: Alessandro Di Federico &lt;ale@rev.ng&gt;<br>
Signed-off-by: Niccol=C3=B2 Izzo &lt;nizzo@rev.ng&gt;<br>
---<br></blockquote><div>=C2=A0</div><br><br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0=3D#1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memw(sp+#0)=3Dr0.new<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>You haven&#39;t set up=
 the stack, so you shouldn&#39;t use sp.=C2=A0 Even if the stack were set u=
p, you should allocframe first.<br></div></div><br></div></blockquote><div>=
<br></div><div>My apologies - the stack *is* set up in linux-user mode.=C2=
=A0 So, it is OK to reference sp after you do an allocframe.</div><div><br>=
</div><div>You can disregard the other comments in the review about setting=
 up the stack.</div><div><br></div><div><br></div><div>Thanks,</div><div>Ta=
ylor</div><div><br></div></div></div>
</div>

--000000000000f310ea05c5db28d4--

