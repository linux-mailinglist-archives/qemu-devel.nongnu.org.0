Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA0612A18
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 11:29:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op5Y4-0002NV-7W; Sun, 30 Oct 2022 06:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1op5Y2-0002LQ-8X
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 06:28:10 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1op5Y0-0004if-FA
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 06:28:10 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s196so8443042pgs.3
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xn4QjccaG1LtoaUltTNObSkDsh+lEsjZ9UFLYvc0QqE=;
 b=Lo+/utIUjSacCh8dqDDg34hNe+6/VuIqqFN1LMDexAGpqFb9Ol7T30XxkZa/BY04Ew
 OjMtEW2nb5oVhDS/zRshPtNymFTzjK769kTZnUXSzR3xKX9XQYhKddKOGm4UadftLyAF
 8PeKaEVGG/6FxDgdI2mK7gfNFeFi4CS6tQZfsecQvcyYcgJXXZIABTcRAfdrMdKlDgoC
 4tuO5IHbudeMYnzKLw3+dyiATzW01Ye8mr9NeNytvpEScJV3OuxlHkJyXMtjXbZ3tt/2
 lRz6zi/+ketUTKsIn1a1M34J4FsTYMCI0WPXuU5qhDs+PiUIQJFoZ1yH008Srs+AIsWH
 Ao4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xn4QjccaG1LtoaUltTNObSkDsh+lEsjZ9UFLYvc0QqE=;
 b=QCYbHtQ0USSNrVQXqRoaw0/McGjkK1aTqjrIx4hmjIWhCTMuYo5hBLrqYUiQVr8TlI
 ogFxYs5rCOOLRxqX87S9Mn38E4KBkPyfNw8HB1aZBwmUdW+qM41U4uGt529RmSRNyBXP
 rzYIDZpSgWGX/dS5LH71nqExxWkBk29bFkXof51lLl4i9K3cSsNP6JO9sA7SywAoSY8G
 SoRWz7Zhvx+qH2aBrDRrPE+YfvhuC3bNkaW/NX/mVHviVmsVy6MB6EDKlDmVP4kCT/UM
 WMp5ICRN7375p0cM99bZ2b17lTHWNIqVgSEO92XxOLL5fvVUzBhGxLRQUQA1haCarFdi
 dW2A==
X-Gm-Message-State: ACrzQf2/RzWRv2FBoWxkMgCX7eSJzTrck1TY7041krRQXpM77KXo3m66
 +sN/d9AjI/g73HY6cwMzZK+O2wldf0oeQrkQFrPhLQ==
X-Google-Smtp-Source: AMsMyM7cnxVzpd0Bv8f4ThybfYo1ITRlgwxbCTn9zZIxZ/l+y1Yu7TbJ3uA9i5nMITI58t2lYAwmlrLmv/m2FCq5ySU=
X-Received: by 2002:a63:85c8:0:b0:46e:c387:c85f with SMTP id
 u191-20020a6385c8000000b0046ec387c85fmr7578873pgd.105.1667125686328; Sun, 30
 Oct 2022 03:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221028072145.1593205-1-uwu@icenowy.me>
 <f28c1d8f-d30d-fc24-ce4e-88aba776abe2@linaro.org>
 <8e47bd2257004301fcd3ae17705e6b5351875f83.camel@icenowy.me>
In-Reply-To: <8e47bd2257004301fcd3ae17705e6b5351875f83.camel@icenowy.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Oct 2022 10:27:54 +0000
Message-ID: <CAFEAcA_Zh6nU6E=rtKRj13-hhB-7RGPvyaHdtxh09KJjMMMx0Q@mail.gmail.com>
Subject: Re: [PATCH] tcg/tci: fix logic error when registering helpers via FFI
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 29 Oct 2022 at 01:45, Icenowy Zheng <uwu@icenowy.me> wrote:
>
> =E5=9C=A8 2022-10-29=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 06:28 +1100=EF=
=BC=8CRichard Henderson=E5=86=99=E9=81=93=EF=BC=9A
> > Oh my.  I'm surprised any test cases at all worked.
> > Queued to tcg-next, with the declaration of j moved to the loop
> > itself:
> >
> >         for (int j =3D 0; j < nargs; ++j)
>
> Ah I think this is a C99 feature. Is our C standard baseline high
> enough to use it?

Mmm, my instinctive reaction was that our style probably
doesn't permit that. But if you do
  git grep 'for (int'
we already use it quite a bit...

-- PMM

