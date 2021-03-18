Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E9D340050
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 08:39:13 +0100 (CET)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMnFQ-0005uu-8i
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 03:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lMnEE-0005Jq-Rt
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 03:37:59 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:33524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lMnEC-0004c5-Rs
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 03:37:58 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id o19so2782006qvu.0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 00:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nG48u4ZbSmrEB7ymQ8mENzTvROX551slUGAaDZenXiI=;
 b=EkGe+MNyxcXAkVT03zgZNKuNDL3TjWDZQ0wK2yqc9EEsoq/s/5LR7eSQmsRVLoMSgA
 ahjgHZynRxPcmKfy5yclEdZVaM3pxV4U55508fKCDLZTiCchn6ZIEqILRkiQdVzw/DZP
 ew+5Xc95/1JwXdnb2YLVJuo1J7yR7kH1+HeAXAIIeG3UZa2bYjYcP45v9tPtK24L98L4
 dlS5c7vM3XyTapNjJBJc6pRJi1tq/6Q4B3vvFgN1fhkUzmkHQNaTCYH/SdSI7pV1sy7O
 FNBCoJLH6sgxdC3TMDz10wVG5yeFWIHHqN8pDngFklTH0+GYc3IAOMjFQG8PbVG6AOgR
 NKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nG48u4ZbSmrEB7ymQ8mENzTvROX551slUGAaDZenXiI=;
 b=kExJ8MAKpNFGVoIM81wHBwBuqByCdQBpfuuUepcbOczw9mNgkpUdoYrfJ45NNpqB7k
 qmDjTZk6roIStFkKG9rnxh1b+gbnA+hDsYPCoW7GI5wMFr9GADc0xN+ImlWvQ8QqBNwP
 G2frEFcTS1eClpYHrePwRg7V6SSHNAMD/t1/aUA6ZmJ2wqyqu1wwsjL38v7bmOTGO6Wa
 dlCYTa+wst60mPF/yD7CTIwulJO0Gz2429wX34WqNwM0sGe18Jhckd8WBMaU74eMNTQh
 Q8aCx9XBKQbjMOaWPLUy+LDidO2GK3of4Eeq8KmOKAKvFtIZ2WiQfpz6AFh9lUXGEKGo
 MAPg==
X-Gm-Message-State: AOAM530CGjOz5XE0aOJ+60wzeyKJW4ymNvwi/XeY+ZQ0DHhqKQpL2FHt
 7heP1vwRLejXELyu2rTcnblNeK6K4raO7x5st8Q=
X-Google-Smtp-Source: ABdhPJw1P8Yn6E3urfIyjbWOW3ipqspVCGa1MOFo/QUQxJOWiKJjAuHj6MD+TaCMYCRYjsjgjLn4a8E67AUZTULgFto=
X-Received: by 2002:a05:6214:cc7:: with SMTP id 7mr3044279qvx.27.1616053073295; 
 Thu, 18 Mar 2021 00:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
In-Reply-To: <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Thu, 18 Mar 2021 09:37:17 +0200
Message-ID: <CAK4993hXtU72mpBr=6BzwFeSDPz7x6-0qZ7O7Ji5hrSzhshKqQ@mail.gmail.com>
Subject: Re: of AVR target page size
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005f3ec005bdcaadb2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=mrolnik@gmail.com; helo=mail-qv1-xf2b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005f3ec005bdcaadb2
Content-Type: text/plain; charset="UTF-8"

I guess we can add some bits TARGET_PAGE_BITS, this will make us to push
some portion of SRAM into the CPU.

Michael Rolnik

On Thu, Mar 18, 2021 at 12:33 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 17 Mar 2021 at 20:17, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > Hi Michael,
> >   I noticed your AVR code defines:
> >
> >   #define TARGET_PAGE_BITS 8
> >
> > and has an explanation of why.
> >
> > Note however that's not going to work with the current live
> > migration/snapshotting code, since you're a couple of bits smaller
> > than the smallest page size we had so far, and for many years
> > the RAM migration code has stolen the bottom few bits of the address
> > as a flag field, and has already used 0x100 up; see migration/ram.c
> > RAM_SAVE_FLAG_*    - and it's actually tricky to change it, because if
> > you change it then it'll break migration compatibility with existing
> > qemu's.
>
> If you want to use low bits as flags for other stuff, you
> should have a compile time assert that you have the number
> of bits you expect, or otherwise force a compile error.
> Otherwise you'll end up with unpleasant surprises like this one...
>
> I think that for the cpu-all.h uses of low bits we would
> end up with a compile error for excessively small TARGET_PAGE_BITS
> because we define the bits like this:
> #define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 6))
> and I expect the compiler will complain if the RHS of the '<<'
> is a negative constant. But I don't know if that's deliberate
> or a happy accident :-)
>
> thanks
> -- PMM
>


-- 
Best Regards,
Michael Rolnik

--0000000000005f3ec005bdcaadb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I guess we can add some bits TARGET_PAGE_BITS, this will m=
ake us to push some portion of SRAM into the CPU.<div><br></div><div>Michae=
l Rolnik</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 18, 2021 at 12:33 AM Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 17 Mar=
 2021 at 20:17, Dr. David Alan Gilbert<br>
&lt;<a href=3D"mailto:dgilbert@redhat.com" target=3D"_blank">dgilbert@redha=
t.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Michael,<br>
&gt;=C2=A0 =C2=A0I noticed your AVR code defines:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define TARGET_PAGE_BITS 8<br>
&gt;<br>
&gt; and has an explanation of why.<br>
&gt;<br>
&gt; Note however that&#39;s not going to work with the current live<br>
&gt; migration/snapshotting code, since you&#39;re a couple of bits smaller=
<br>
&gt; than the smallest page size we had so far, and for many years<br>
&gt; the RAM migration code has stolen the bottom few bits of the address<b=
r>
&gt; as a flag field, and has already used 0x100 up; see migration/ram.c<br=
>
&gt; RAM_SAVE_FLAG_*=C2=A0 =C2=A0 - and it&#39;s actually tricky to change =
it, because if<br>
&gt; you change it then it&#39;ll break migration compatibility with existi=
ng<br>
&gt; qemu&#39;s.<br>
<br>
If you want to use low bits as flags for other stuff, you<br>
should have a compile time assert that you have the number<br>
of bits you expect, or otherwise force a compile error.<br>
Otherwise you&#39;ll end up with unpleasant surprises like this one...<br>
<br>
I think that for the cpu-all.h uses of low bits we would<br>
end up with a compile error for excessively small TARGET_PAGE_BITS<br>
because we define the bits like this:<br>
#define TLB_DISCARD_WRITE=C2=A0 =C2=A0(1 &lt;&lt; (TARGET_PAGE_BITS_MIN - 6=
))<br>
and I expect the compiler will complain if the RHS of the &#39;&lt;&lt;&#39=
;<br>
is a negative constant. But I don&#39;t know if that&#39;s deliberate<br>
or a happy accident :-)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--0000000000005f3ec005bdcaadb2--

