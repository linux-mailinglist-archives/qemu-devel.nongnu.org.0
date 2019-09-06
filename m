Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D16AB954
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 15:34:52 +0200 (CEST)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6EO3-0006gA-LE
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 09:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i6EN8-0006By-LF
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 09:33:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i6EN7-0008T7-Fa
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 09:33:54 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44719)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i6EN7-0008Sg-9s
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 09:33:53 -0400
Received: by mail-ot1-x341.google.com with SMTP id 21so5699011otj.11
 for <qemu-devel@nongnu.org>; Fri, 06 Sep 2019 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NS/1UMTaDY0XCtVgUqxtS3Q4KQf/c0k8Z4z/bVFMdpY=;
 b=FIbqUarH52LiwfX+EGgj/r+HqVEIlhJ3rFYeur1IzMmFfBOyv/II4fU2UlNq2cZPMQ
 kpvqJgSpjK54VA4NOcdjsv7akR1Unl3VrwRJar6JNjwvo8qQws7TrYkV6nSzz31kTu7A
 /NAnwKxYpFlKd1nSa/QW/FaefhCGqLwePEFwIu+huKWZCo7dsDVYIpRn5bVo6nr7QD8g
 Gljqx7iEwdyvFSQfQiNNCJNQCjaRWKXHl1bXktaiEH5mj9WI3CGksbQiBzUhUvz9Ml6h
 L/GinfpptiEtuKS2xyi70KExbX37E4lodYWnxHSmQyCiXbwHYe0ndkDZUiiIUhKR0i0v
 fGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NS/1UMTaDY0XCtVgUqxtS3Q4KQf/c0k8Z4z/bVFMdpY=;
 b=i5prBVzgOdAQXfLKh4chweZkpVeR7yP8vP5mWsISKbS7gACzqJ2xg41Ie2oMuFEIUe
 UFQlZYzz3J4TDz3TyeLvFJh/Dlch3qP6uW/p8fM3i7DpCGSfMtXB7x1mxkPbfLl38QCP
 Vu90JtOuRGhUkEcX7xsMV5iCArN8i7OFkybIVNXSOUXqtDXY/HOCVFxdW+pQAebK9xqy
 LCh1KbAnIR7KDs7SiV8AyiFZiVsAb7nhMU4DwNj3mr8SyI8HX/meRXsM1A+8vBTiNtW+
 RCKJKkQ7PCW021I1/MQh1lYz3Q/g2SohFLDNFMP/RmQczP1GvxxCPArMF0UKfdV4gcR9
 +h3A==
X-Gm-Message-State: APjAAAWcVQWDvcpf46vcE/e9ndDiOcZxaamoIOYwMf7r27fSL456Zus5
 gHLrL6ntHraYCGa17IOZivOmCemOVpPClmGaFj1ZoQ==
X-Google-Smtp-Source: APXvYqxi8BWFEkSb61Cl0Rx76KJ8dq2sBMjbSlqz/nqd/dSpHIO7nnZNUaxeUWuNl7uClmm6q3/jPdKnTZMy64pGZWM=
X-Received: by 2002:a9d:7504:: with SMTP id r4mr6913867otk.221.1567776832049; 
 Fri, 06 Sep 2019 06:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190906124706.19145-1-alex.bennee@linaro.org>
 <20190906124706.19145-3-alex.bennee@linaro.org>
 <CAFEAcA84VXqw+ZGP9Nv=Wy069ZU_C0WkVdv0h28GVbnzyx6w6w@mail.gmail.com>
 <87a7bhzhsn.fsf@linaro.org>
In-Reply-To: <87a7bhzhsn.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2019 14:33:41 +0100
Message-ID: <CAFEAcA-r9D71LoLowae8vm=sp1oojUBhppm0t97sUck4s5tp1Q@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v3 2/4] target/arm: handle A-profile
 semihosting at translate time
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Sep 2019 at 14:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 6 Sep 2019 at 13:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> >
> > Doesn't this accidentally enable semihosting via SVC for
> > M-profile ?
>
> We must have done that before then.

No, we didn't do it before, because we were handling it in
arm_cpu_do_interrupt(), which is A/R-profile only. The
M-profile code goes via arm_v7m_cpu_do_interrupt() which doesn't
check for semihosting when it sees an EXCP_SWI.

> Just gate it with && !arm_dc_feature(s, ARM_FEATURE_M) then?

Yes, I think that's the right fix.

thanks
-- PMM

