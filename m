Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA503DEDB8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 15:37:08 +0200 (CEST)
Received: from localhost ([::1]:41888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMXrv-0001dz-Re
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 09:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMXp5-0006ve-D0
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 09:34:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMXp0-000666-7E
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 09:34:11 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44371)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMXp0-00065x-0z
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 09:34:06 -0400
Received: by mail-ot1-x343.google.com with SMTP id 21so10946937otj.11
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZNqAJ4uR7GFdKZVdzmNIMtD5AszbtgBt5jxTontpdJQ=;
 b=S0J3dXo1CE7aORBD6vk5KeQQtUq1m3iCfdZX4CM87BY0o2TN2v7LZbv7/jQ4/chSIp
 1tSoCWZfm2xVWxOc5218MYVilR8fUBIQrZNCRWb4lgOOb7W1yhujLiKtEYnKG3k1SSH7
 7gSEitgV658juL0lvhTuOj07smAWlqKetch3MLsxNgBtKQCahjTXLttWLC/zN/Yjb/pV
 biJfa+YP/suY+IeLOrtYi7fh/e+JU5FjIJNXzsDDhx2yzxL/AVK8t7kBGnGWN1PO8mJ6
 9Yzp9o0lNMrwNjl4CFr/hIIOnXU/qYACKEm9bX0B6X2SJTAXkqhAaKUySbmY7mRV+XUF
 BD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZNqAJ4uR7GFdKZVdzmNIMtD5AszbtgBt5jxTontpdJQ=;
 b=qU3AR80FzQ8y6aNmAKYeRUcTIBtbjImNlOP7HO8gxLppqRwbcVmRZrga3kSLVaI4KU
 B9AFSyH176zCRauIV/F3E8hBNhPq1t11MyFS907zcv/PbrJ4a0LqAwbZL1uAUv5e5klv
 vHt1KRkLnrhahLoJQYgnpd9o1UykSVCHNtVv75Kf1V5ocApgh2fw3lXOAmSzyn/g5YHb
 j/jKxh/9kUWh9NQF9R6gRV6k93oBMEwvSELkoDSnoKfDBmzsjjj3lGcTs/189f/VBqUJ
 BL4eSNAYnIURjKO+t46u0xqWoXHjc4tCPSIadaNiKfbDlstWwut3+kCHfBnH9eQCqQ1Y
 nb/Q==
X-Gm-Message-State: APjAAAXKHlhpksPENKm1E1yWewE/A7WuGqY5CHzjTlUMoKIu3vpF14yr
 R8sPKUX+mG0eYZm4LJhm1tyBtSu8yTMzsZOLLEc/IA==
X-Google-Smtp-Source: APXvYqzlhECIryGVO7oZWNbzZYYBQAD19Yndo/fdautAV/Zw0YOxp5x33RQJfJNs35BfGriic7II/90qmx7+Y1QUII0=
X-Received: by 2002:a9d:398a:: with SMTP id y10mr17802204otb.97.1571664845181; 
 Mon, 21 Oct 2019 06:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191021132916.27818-1-alex.bennee@linaro.org>
In-Reply-To: <20191021132916.27818-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 14:33:53 +0100
Message-ID: <CAFEAcA_Ru29Y_CXsOnOZKLsmDs-DTj1uYPD5mfcJ40CQrzKGvA@mail.gmail.com>
Subject: Re: [PATCH] cputlb: ensure _cmmu helper functions follow the naming
 standard
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Oct 2019 at 14:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We document this in docs/devel/load-stores.rst so lets follow it. The
> 32 bit and 64 bit access functions have historically not included the
> sign so we leave those as is.
>
> The few places that use signed code loads are fixed up to do the
> casting themselves.
>
> Fixes: 282dffc8
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index e752bd06093..f7d3b3e4fdc 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -231,7 +231,7 @@ static int cris_fetch(CPUCRISState *env, DisasContext=
 *dc, uint32_t addr,
>      case 2:
>      {
>          if (sign) {
> -            r =3D cpu_ldsw_code(env, addr);
> +            r =3D (int16_t) cpu_lduw_code(env, addr);
>          } else {
>              r =3D cpu_lduw_code(env, addr);
>          }

Why not provide the cpu_ldsw_code() that returns an int16_t ?

thanks
-- PMM

