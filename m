Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2EB1A69A6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 18:16:35 +0200 (CEST)
Received: from localhost ([::1]:46232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jO1lC-0001L0-5i
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 12:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1kF-0000no-Iq
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:15:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1kE-0007yX-KL
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:15:35 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34876)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jO1kE-0007yF-G8; Mon, 13 Apr 2020 12:15:34 -0400
Received: by mail-io1-xd41.google.com with SMTP id w20so9888961iob.2;
 Mon, 13 Apr 2020 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gQ1lX+0Zv2ErLXbq8TUvD9X/ClSwnHxElXLxffzrnBI=;
 b=rVWm/zl2U5zZTO16oqrMAOqgRfbM6645LAqDylahwlWIFdt34OZU3gQZyX9t2zDctP
 vci+uhFcpvDTAHIbFFMDlxVNzYtMRc0CoOLD/M9iRA9JT6vlUGVQWKiYvjRJlr5aHIWi
 rlTk68ZsGjrp87aZzPyqdEGUAozyWInFjaH0byQBhFxrZvK4hWsJsy0SElg8AL40OsMb
 svvVbhw3PiyyJnJgYazW233+bQ0r7cLX8fpNISjZJUMkr+BQj6AsXrr46wKK3cM45u4c
 6PHYdgau2whp0gcgOBbEvfPclbHpL7fVLiH5DYIlzuyMSV/Jc4wwq7pNB+eDmeE8iLwT
 4afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQ1lX+0Zv2ErLXbq8TUvD9X/ClSwnHxElXLxffzrnBI=;
 b=JK901Ol+a7FZJARzCaGkcG004qqzWlbQgAYBFtB/F5r3NQhBF33mrBA104ie06JCpX
 W8U2aLtiXdEG969Hoqn6LbQ2nI0vyGz5EirC6nIOXGIfH7TFnJ1QbryvKqbx4lhpayk6
 cNr6q1riRjKLWbMNnj8nJH5PfCDDPWAqy/i0CTMzqe1APAnsIojrN0w0xFFS8fhLL0aq
 12PUm9ObYryeuEUSlty0wlMDLuHyGQdCu74cq11XVhizxvggV2BVBjHsSkwRIVH7mroj
 gpfdKMHbtm9vjUw5C+CdEPxiDGPY58y+nZP4qIAjbTH0dEjTb2wegtLG5ClGUZEJgUof
 6KPw==
X-Gm-Message-State: AGi0PuZfY+jY8juTg7bNWG6lTsWYMCtIZqs8/ADYfDfRsCDDmTMX8hFP
 pKsuoXPg21yunQ7XKMExTd62NlrSxoxzcu4phrQ=
X-Google-Smtp-Source: APiQypIZafK5jHVYphHV/7hP2F2rLzWb4Z7lAXCe1I7Id/jttu2EbvU4DJ8fc+p2i7XLWDFH7niBSBvW3gOn7zS/m2g=
X-Received: by 2002:a6b:3989:: with SMTP id
 g131mr17018872ioa.202.1586794533709; 
 Mon, 13 Apr 2020 09:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-22-richard.henderson@linaro.org>
In-Reply-To: <20200326230838.31112-22-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 13 Apr 2020 18:15:29 +0200
Message-ID: <CABoDooNE=R_jQjg-dZrdaK-atmuQ4XjMkGjKnmebKvuXcTpDQg@mail.gmail.com>
Subject: Re: [PATCH 21/31] target/arm: Implement SVE2 integer absolute
 difference and accumulate long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
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
Cc: rajav@quicinc.com, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, apazos@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 27, 2020 at 12:18 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
[...]
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index a3653007ac..a0995d95c7 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -1216,6 +1216,30 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
>
>  #undef DO_ZZZ_NTB
>
> +#define DO_ABAL(NAME, TYPE, TYPEN) \
> +void HELPER(NAME)(void *vd, void *va, void *vn, void *vm, uint32_t desc) \
> +{                                                              \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                     \
> +    int sel1 = (simd_data(desc) & 1) * sizeof(TYPE);           \
> +    int sel2 = (simd_data(desc) & 2) * (sizeof(TYPE) / 2);     \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
> +        TYPE nn = (TYPEN)(*(TYPE *)(vn + i) >> sel1);          \
> +        TYPE mm = (TYPEN)(*(TYPE *)(vm + i) >> sel2);          \
> +        TYPE aa = *(TYPE *)(va + i);                           \
> +        *(TYPE *)(vd + i) = DO_ABD(nn, mm) + aa;               \
> +    }                                                          \
> +}

ABAL is either top or bottom not a mix of two.  So only sel1 is needed
and its multiplicand should be the number of bits of TYPEN.
vd is both a source and a destination so a temporary should be used.

Laurent

