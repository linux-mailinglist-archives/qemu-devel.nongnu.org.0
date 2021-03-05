Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A6032ECD0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:13:07 +0100 (CET)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBCU-0001tt-9m
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBAj-0000uN-Up
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:11:18 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBAh-0006cA-VP
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:11:17 -0500
Received: by mail-ed1-x535.google.com with SMTP id b13so2789946edx.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j/DKl3G/LtZDtxWR9akFOXs2U+ksZxUPIRkDwj8Ld7E=;
 b=EV1PPtgNet0UkE/uI52uk5Xy+1jzaH58HWIATmXQMX7igRuBlFhuyNtiLYNmzd7aTa
 9ZHq48krkYkjtr4ayZRR8j5gv9bLh4N3FKwd9lDTzM/B3sCQ6t9dZzen8sawecT81mqW
 ln0ZoTSer7GoBL5ql0KK+x3GvexGZVhtbYZtEsPZPBVyHROmvUS2Smb2xBj4+uBBGtt3
 DGuIJLzbaROfOKH4BFU+HmwyHWe8aM3rQe7dSfpnUBQfuGLnao/B9lElsHtIHQgIwYoE
 3YuXslMsvjV9uLzRfiXAnz3IWxNLJZm3DGI8HMvK7/QtWMmECdVO+gSpnNG0mR2X9O/0
 lTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j/DKl3G/LtZDtxWR9akFOXs2U+ksZxUPIRkDwj8Ld7E=;
 b=r2LrzwsvGtIxpPbHcZCtU66zOx8Pns11zhsfAh422odxkzh22p//5000ZNdun+rGhn
 oSi5U7C8DO3YzO1zw1aIrZlvRWQ0TDxnk8vH8M2QD8eFTc4VSZgxoW94Ahm8qe3394ip
 r65ru/VYlDzuNVYcZMfbkMw9oCvtLzDxX03yHoYnJwuKNW2RyK/vQ8gXaObFdDbv7SOJ
 rMvxm1NTt3eFsfsOqqzWBwZEO597Jxc+6qV/i42q09qelom0lCab8aUsan2bus82vp5P
 J4GwyDAoZvDKj74/+Zdhj+uRGB5Av+0Vm4HT2jzAmAX1mQsXSwxYW807adqqc9n/wAZY
 /sOw==
X-Gm-Message-State: AOAM533aLtjWIHDgC3zsKphEDCi8s/eGsImNUG106mKgP5yc4DpffYFQ
 LL7tcyGH/x3qEDuVGSrM3elZOB5fGRexgWn4LLzpwg==
X-Google-Smtp-Source: ABdhPJwpZCPGgY5OQ4rwrRUgfg1C2Gc7oDB8z2orBfQV367LGUrApF/CwmA8s1amcmJ3GFEJZ/zLv+4lZd0eelHJiW4=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr9052839edu.100.1614953474350; 
 Fri, 05 Mar 2021 06:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
In-Reply-To: <20210305135451.15427-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:10:58 +0000
Message-ID: <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Keith Packard <keithp@keithp.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Bug 1915925 <1915925@bugs.launchpad.net>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 13:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> I'm not sure this every worked properly and it's certainly not
> exercised by check-tcg or Peter's semihosting tests. Hoist it into
> it's own helper function and attempt to validate the results in the
> linux-user semihosting test at the least.
>
> Bug: https://bugs.launchpad.net/bugs/1915925
> Cc: Bug 1915925 <1915925@bugs.launchpad.net>
> Cc: Keith Packard <keithp@keithp.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/tcg/arm/semicall.h      |   1 +
>  semihosting/arm-compat-semi.c | 129 +++++++++++++++++++---------------
>  tests/tcg/arm/semihosting.c   |  34 ++++++++-
>  3 files changed, 107 insertions(+), 57 deletions(-)
> +#else
> +    limit =3D current_machine->ram_size;
> +    /* TODO: Make this use the limit of the loaded application.  */
> +    info.heap_base =3D rambase + limit / 2;
> +    info.heap_limit =3D rambase + limit;
> +    info.stack_base =3D rambase + limit; /* Stack base */
> +    info.stack_limit =3D rambase; /* Stack limit.  */
> +
> +    if (cpu_memory_rw_debug(cs, arg0, &info, sizeof(info), true)) {

Blatting a C struct into guest memory has endianness and padding
problems. Why not just do things the way the old Arm code did it ?

Also, you don't seem to have the correct "is the CPU in
32-bit or 64-bit mode" test here: you cannot rely on target_ulong
being the right size, you must make a runtime check.

I suggested in the other email the way I think we should fix this.

thanks
-- PMM

