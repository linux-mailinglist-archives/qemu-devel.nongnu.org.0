Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF04326DC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:49:35 +0200 (CEST)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXhW-0006ih-IF
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mcXgF-00061e-Q4
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:48:16 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:45628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mcXgE-0007xB-3C
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:48:15 -0400
Received: by mail-vk1-xa29.google.com with SMTP id n201so9067409vkn.12
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PcgavZ2KiDIlSsFtcLKlGrM6bbQHXV5nXbyq/3GgeSY=;
 b=Kf8fD4UhqiVUYPkmBcIIohG2f+bigOIV+9DtVX1KNBXlDNbig77obWWg5jZHmHaKOr
 bBliQCMaNEQ9MoPJpksiuaMQykFhRuOlo2vrHcPlC4XKwMLmBQOqeWKxt1EnjoppfBlk
 47067k+j3kPS8KMl8Pd9GIdPwvCeOTXdD5gY1bERv306mNxnC3K3mzaJzBawxby3Sw+L
 85ZDgoGA6JsH4CGCYua/fMlS9SJTU/l3WDsZLHxNnse8oWg9KbrQMnqiL8uE2+hYHVEg
 f0Pqd6LPJCFBb24vnQ7i/Ccz6DMVe5z2C/FnyPCoCIz0zVWpqjigtxUBKN3+5ammob90
 V1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PcgavZ2KiDIlSsFtcLKlGrM6bbQHXV5nXbyq/3GgeSY=;
 b=vooDvWsDD15BMGj6QU+RxuLiq74rQDlvBJnoVoS/UW7H07DU4RN8RSb8d1JY/mKdJj
 CICD+/CjwWgek56/bMgEHb1hR5tmYzus9ZxqnBe+hJOaIYAFvDLQwgQqXqzMphMV5NEq
 BXLvMs4/PufO58WBmn/akVr4v23Sv9apDuEbsYh9PF+kIHtawHXWKtAfYKxSPncaCmLi
 qTVMkPTwRvdR/WP7erXpHrHCtiVwqoMVoWWBzBUM9PL9yjERpAMoiKHfDNSW2KY1LxLi
 20ABViioTPCp0wJYuN0xf7jkd1mgVSJTx5Rz6N6x01wfiW9/xN3Oup11kDLP83fQ6NAK
 PL6Q==
X-Gm-Message-State: AOAM533rI66g3hzIArZmfwO/NwwCYsJCENnzTwiKyGY6xDim1ih0fQRF
 QujvrpoEwPOZdWO3qeiu2XSqfGkeb5gxsfpSYfNDuw==
X-Google-Smtp-Source: ABdhPJxELjZ5byiEdYDDrv/RwrOK38LSmqzdlPqD/uxzF8x1wy4anxOJpAttQfck028DMW256Vx/QzEiBH9yXtvc4JM=
X-Received: by 2002:a05:6122:181f:: with SMTP id
 ay31mr20601806vkb.18.1634582890523; 
 Mon, 18 Oct 2021 11:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211018160458.1976-1-imp@bsdimp.com>
 <20211018160458.1976-8-imp@bsdimp.com>
 <9d4a243a-de20-8ea4-fe00-6b84b6ee865d@linaro.org>
In-Reply-To: <9d4a243a-de20-8ea4-fe00-6b84b6ee865d@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 18 Oct 2021 12:47:59 -0600
Message-ID: <CANCZdfpUmPm98FOoQ3hGt=D5s3XdP5At4PUK7itLM_jfAaQdgg@mail.gmail.com>
Subject: Re: [PULL 07/23] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008bc66905cea4fc91"
Received-SPF: none client-ip=2607:f8b0:4864:20::a29;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa29.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Guy Yur <guyyur@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008bc66905cea4fc91
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 12:45 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/18/21 9:04 AM, Warner Losh wrote:
> > diff --git a/roms/seabios-hppa b/roms/seabios-hppa
> > index b12acac4be..73b740f771 160000
> > --- a/roms/seabios-hppa
> > +++ b/roms/seabios-hppa
> > @@ -1 +1 @@
> > -Subproject commit b12acac4be27b6d5d9fbe48c4be1286dcc245fbb
> > +Subproject commit 73b740f77190643b2ada5ee97a9a108c6ef2a37b
>
> You rebased with a stale submodule.
> You'll need to fix that and recreate the pull request.
>

Doh! I tried really hard *NOT* to do that.

So is this PULL v2 then?

Warner

--0000000000008bc66905cea4fc91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 18, 2021 at 12:45 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 10/18/21 9:04 AM, Warner Losh wrote:<br>
&gt; diff --git a/roms/seabios-hppa b/roms/seabios-hppa<br>
&gt; index b12acac4be..73b740f771 160000<br>
&gt; --- a/roms/seabios-hppa<br>
&gt; +++ b/roms/seabios-hppa<br>
&gt; @@ -1 +1 @@<br>
&gt; -Subproject commit b12acac4be27b6d5d9fbe48c4be1286dcc245fbb<br>
&gt; +Subproject commit 73b740f77190643b2ada5ee97a9a108c6ef2a37b<br>
<br>
You rebased with a stale submodule.<br>
You&#39;ll need to fix that and recreate the pull request.<br></blockquote>=
<div><br></div><div>Doh! I tried really hard *NOT* to do that.=C2=A0</div><=
div><br></div><div>So is this PULL v2 then?<br></div><div><br></div><div>Wa=
rner=C2=A0</div></div></div>

--0000000000008bc66905cea4fc91--

