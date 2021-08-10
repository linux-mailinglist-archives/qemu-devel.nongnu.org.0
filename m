Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F35D3E81D7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 20:05:42 +0200 (CEST)
Received: from localhost ([::1]:39164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDW8D-0005RN-EA
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 14:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDW79-00043O-5A
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:04:35 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:43598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDW75-0004U5-UE
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:04:34 -0400
Received: by mail-qt1-x835.google.com with SMTP id l3so7727569qtk.10
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 11:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MpAzQ3Z0HpJO1rnGKYEk5mNaST5ApfWcLGQp7Y1z/Zw=;
 b=PaS8xmiPqCvjLIFo+z4dQrq+W8U6hSDJeOQJAvJNVoOgJLloa9zW74kcrI3pnxl7JF
 jB8bExFOpq1A4KN5caSYQgt+uF85wq/k6srsz2bh8HVUVfJSe3KzzTm6sbHjGmAkydia
 XcsWm1MxT3aC8w4GedYcdV4J/cDmGotOvNK1psu1HXlUfxCilUkbJ8oyAT9fZyCLHlUk
 bNOfhtID4BZAnvfB04q/UNOXD6T/SuJhS2X/Eep+1vR8ZlXzr/jhFvedOmhSOXNpxSPv
 oevh6eGq1bcmmWpo+lj13gFxB2UHjz9gRmqq7Cc66WpxYBnwd2b47WzahBKF/h28HwWm
 FCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MpAzQ3Z0HpJO1rnGKYEk5mNaST5ApfWcLGQp7Y1z/Zw=;
 b=YMkRY57Tku2WSKgTzI2fOJAnf+uca895aqa50KupalPZHu8izbURB0L8RV0uToyUxS
 IT8lokC/WPAeN2TmPlsFkFzWF27nFfK9QGgOac+X0AT0vA7ShhjIKuud+FWG2P9GXj7n
 Hq4P7/Hx5CHUSbQdKPLekjSsLAyLexKmES3gbHp2umTdfEb8u7mX4ENGCj315NR/Ze7U
 jE54t7ls09LWdJcDFwCkBx7xdPbuRbPAIl/ut6fEVruZE6XNxh7Yu6I8xB/Em1SOvslG
 2F8ke6+OYb/kzUd62LpbPAONtyErbOtP5SypaHMx1eCsfgncjlCQ7zkmo3ZhMP7eEcFE
 PLjQ==
X-Gm-Message-State: AOAM532HRenFt9tyrmiP3f3W5gRJQEoEGd3wP+QYexEue6PcUbri1zHt
 3N6fPDUwqhLe5LEHN+Nt0CgslOd4eZalI5cIzK/IOg==
X-Google-Smtp-Source: ABdhPJxWFs/qhH2eBWrjBdLMsmHgx14eRa4n8H9Yrkv0FTo+54ZbNM8m5+V0dvEo13MU+YSBhVk0A/bCPU34p6wv++E=
X-Received: by 2002:ac8:118a:: with SMTP id d10mr1598061qtj.101.1628618670470; 
 Tue, 10 Aug 2021 11:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-46-imp@bsdimp.com>
 <b866c4a7-9726-497a-dcc3-672a4e3039e1@linaro.org>
In-Reply-To: <b866c4a7-9726-497a-dcc3-672a4e3039e1@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 10 Aug 2021 12:04:19 -0600
Message-ID: <CANCZdfriP7v0dM94Fa6FQ0HXF2LK43V=4c0TmZ-BxWjojEpqzQ@mail.gmail.com>
Subject: Re: [PATCH for 6.2 45/49] bsd-user: Make guest_base an unsigned long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000054096705c93855e4"
Received-SPF: none client-ip=2607:f8b0:4864:20::835;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x835.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000054096705c93855e4
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 10, 2021 at 11:58 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > From: Warner Losh <imp@FreeBSD.org>
> >
> > Make the guest_base a plan, uneigned long rather than a uintptr_t. It
> > isn't really a pointer.
>
> NACK: 5ca870b9f6c.  It most certainly is a host pointer.
>

OK. I'll drop this one and redo in our other branch. Shouldn't be hard.

--00000000000054096705c93855e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 10, 2021 at 11:58 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; From: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; Make the guest_base a plan, uneigned long rather than a uintptr_t. It<=
br>
&gt; isn&#39;t really a pointer.<br>
<br>
NACK: 5ca870b9f6c.=C2=A0 It most certainly is a host pointer.<br></blockquo=
te><div><br></div><div>OK. I&#39;ll drop this one and redo in our other bra=
nch. Shouldn&#39;t be hard.</div><div><br></div></div></div>

--00000000000054096705c93855e4--

