Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16663D681A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 22:23:37 +0200 (CEST)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m878S-0005y4-H1
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 16:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m877d-0005Hw-59
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:22:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m877b-0007jX-NT
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:22:44 -0400
Received: by mail-ed1-x529.google.com with SMTP id x90so5914216ede.8
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 13:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l4FFvZP2tXQubXiEAhztVxsysssM4vfPQ3LQb+RLFCE=;
 b=dPs2Lj5ETzztzugXI+Yi+z1qD9BtyyRknOFQaBB5Z+TNhi8COG8aqqyAjMTY33hL2M
 8sQTeVwoS0y/0fzxJU5oBLSRvh3VhJ5/jWbKvKNZDRGNG5HQHynoUsA5nYc6iN0mtwv3
 rW+1QWFAc7vDoe71JnWRoFeae0bW3HYIZcdQ98wrwmezdAcd1VIe1oDK7JDE2rIew1zJ
 Fu1+ssRIkBPd7L1LMMv4yccEBY4by25XBlkTzbIEQR894Fq57kC8I3UMyMFbI+WW329f
 VI9A7ZyO9SgheMqZGT6sb1K2h0OSGGL/8Jn5LMe9oT6vORFOu1QDKLCxDyDFwPjRgrRn
 mdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l4FFvZP2tXQubXiEAhztVxsysssM4vfPQ3LQb+RLFCE=;
 b=efM251Ph1n+WmslxeGZjN5iwlWHpxG7QANZfG++hOSamBhA7E8I/vAvjK4dPwqUU49
 MTSZNllmObwpDNmkYm7FWEWjtIL0//Jk3UWVkbJjdN8xoK5YROHaqUu+j0/ccDLqcrRb
 HGaC76IFr3DeKd3JLcaQ+AHmQW2uEgIBNcakXmHV+wXimrDqUCr4hxrRkKMdRI389KcL
 tGIFMZJd1NyTi5TWCy5bIOXje6Z0JG+DMXToV0JA20iRZV63tE5TUUAUREZn7Iu89jaQ
 D+SXQED0dZilcXclshZEu57Sz+qxC0Jz2u2IM8f7ZAlKkJ9vHXoms39ZClsCIrl2nJKv
 /shw==
X-Gm-Message-State: AOAM531Yn8FFqMgmCGUWJDFc2hGFOSsDgzxsB1zEGqumNhod7PvZXwq5
 EUbkAobLbHlmvU96+syn87sNImxM2lHVx71rVvfJMg==
X-Google-Smtp-Source: ABdhPJyWfn0m6ShQZs6UXpwX8odnq0dMhbBmeyPZ2ghBzWEnUKGnYbdRMLkWw8rLC+LOWBoZ0Ezb8h4g48gdnsyKCT0=
X-Received: by 2002:aa7:d30e:: with SMTP id p14mr4760417edq.204.1627330962192; 
 Mon, 26 Jul 2021 13:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210726201109.1875632-1-richard.henderson@linaro.org>
In-Reply-To: <20210726201109.1875632-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 21:22:00 +0100
Message-ID: <CAFEAcA_h9v9CHBwftHcC9ZsLP+N-awQCQf7YJMvXO8fO47R-VA@mail.gmail.com>
Subject: Re: [PATCH] fixup! target/arm: Add sve-default-vector-length cpu
 property
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> ---
>  docs/system/arm/cpu-features.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 79b87f7c5f..67847a5cc1 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -385,5 +385,6 @@ defined to mirror the Linux kernel parameter file
>  is in units of bytes and must be between 16 and 8192.
>  If not specified, the default vector length is 64.
>
> -If the default length is larger than the maximum vector length enabled
> -with ``sve<N>`` properties, the actual vector length will be reduced.
> +If the default length is larger than the maximum vector length enabled,
> +the actual vector length will be reduced.  Note that the maximum vector
> +length supported by QEMU is 256.

Thanks. I've squashed that into the patch in target-arm.next.

I plan to send this as part of a pullreq for rc1 tomorrow probably
midday-ish UK time, unless somebody speaks up now to say they'd
rather have more time for review/testing/whatever. (That wouldn't
mean it missed 6.1, as a bugfix-of-sorts this can go in rc2 if
necessary.)

-- PMM

