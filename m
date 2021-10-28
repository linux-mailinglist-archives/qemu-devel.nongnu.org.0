Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB243F2EF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 00:44:51 +0200 (CEST)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgE8g-0000Bi-1T
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 18:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgE66-0007kF-7f
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 18:42:15 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:46653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgE60-0003Tx-14
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 18:42:10 -0400
Received: by mail-vk1-xa32.google.com with SMTP id t127so3710936vke.13
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 15:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UtA6KPWjBGefPLgne6ojDAto2XSr5v7ACndJNCXx7to=;
 b=7I706JU11x+dR8GrN1JddUI0przNiCoYGkDVY/LoLb9NxmsIV59UrOBiGKqWlM1pzW
 g0WTxKiQsq7uN9+ErpHl4ruzDj9ZxdriGlDkughaFTd+CUzD7UKlgIlaR8liR7I5MZ87
 kFtu4Ik0jhMyp8Ifa4Sb7lDUPq0Eyph92u3kdH5CSDvbrxh4I0i0wMVi/t8wNPxkC5fS
 OG0h1PETSiJyIU825cIxLeyKfG8GqgmuvbbltruA5MDn9eUN1r90bUczQx3taKQnc3aO
 TeQ+zELWGIMsu3b0S+VaNU+cP7FPOXFDr3HIxGXs9Kp6tpMTirnDd97ZUlh8DdOo/FrO
 LHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UtA6KPWjBGefPLgne6ojDAto2XSr5v7ACndJNCXx7to=;
 b=ynHIh9U5Cf9CJq+gE+ude66ZbS6ynLvVUVl8D2PiZr0nFwwU7rFRsEh0KqsEYRpGl9
 EZB/jUJjr8bkcEkw5GdKgQjaaAw4aOYhGNdklV//8gwez17t3Csdlu8HsWBrk8cS9Pn/
 LfUi88kg6h2Rlq88tok+55oKwJ45R81lEXvmNwgmRhMhsBdbgrHH9/GquuMi1skeu28z
 k/EuigWDNhP6AL67yY5IvPe72cRyr5nZO1wmKt6McF5SrMv4WK3B7MAgn2142YJRJIwV
 TejgNxAX2aSFZobL2OcRPmhnqRf3pu+thgGWW833dsU3zGgXjUGmhv2c7odhjSYCfW7P
 58ag==
X-Gm-Message-State: AOAM533aFCjHuZVTluXzpZzS677PWWuEuUE6wcoJiObXNy+zAAJCYd2G
 yYUdta6GrmEDLh446MabHx2zyApb8fNyczFusV7jlw==
X-Google-Smtp-Source: ABdhPJzFDPdjwU3xFA0m5nDLUcfV/VsruCGTRfhhHZLCGsovefwaJ20gfRokcrCVO89S7b13P1zYk479x/CQOa4XtRA=
X-Received: by 2002:a05:6122:2e8:: with SMTP id
 b8mr7314646vko.23.1635460922119; 
 Thu, 28 Oct 2021 15:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-21-imp@bsdimp.com>
 <446e589d-7c49-f5fc-3891-195ba5a37c0f@linaro.org>
In-Reply-To: <446e589d-7c49-f5fc-3891-195ba5a37c0f@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 16:41:51 -0600
Message-ID: <CANCZdfoHStsykaxrbUJceBujmAajzmeN_x3ar-cj01SEUM8j4Q@mail.gmail.com>
Subject: Re: [PATCH 20/24] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004eaa7405cf716bcd"
Received-SPF: none client-ip=2607:f8b0:4864:20::a32;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa32.google.com
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
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004eaa7405cf716bcd
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 11:25 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > +    regs->regs[TARGET_REG_PC] = ka->_sa_handler;
>
> Surely there should be some handling of thumb addresses here.
>

Yes. I've added code to do this, but haven't run it through (a) our normal
test suite and (b) don't think I have any code that's normal mode with a
thumb mode signal handler to test it with... It will be in the next
iteration
I send out.

Warner

--0000000000004eaa7405cf716bcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 11:25 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 regs-&gt;regs[TARGET_REG_PC] =3D ka-&gt;_sa_handler;<br=
>
<br>
Surely there should be some handling of thumb addresses here.<br></blockquo=
te><div><br></div><div>Yes. I&#39;ve added code to do this, but haven&#39;t=
 run it through (a) our normal</div><div>test suite and (b) don&#39;t think=
 I have any code that&#39;s normal mode with a</div><div>thumb mode signal =
handler to test it with... It will be in the next iteration</div><div>I sen=
d out.</div><div><br></div><div>Warner=C2=A0</div></div></div>

--0000000000004eaa7405cf716bcd--

