Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2883876F3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:53:05 +0200 (CEST)
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixLU-0003wC-A8
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liwhA-00064x-Gf
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:11:24 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liwh8-0000io-G2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:11:24 -0400
Received: by mail-ej1-x630.google.com with SMTP id p24so12425987ejb.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0g+pFa/DzICscQu6RgE/f+E9D7HVx4tXnlMtNWP5dbg=;
 b=a3Pj4M73LKiuuP+iwW1QkHtba76p0IN/ZBF6Q39VRA/AWNJatihyqPGELIVP4bCX9J
 COSKsqMARUlVI85goWDIZYf/0SlYwK+jE0xR3wfcx4fNLp2/nuK6h23VPr2t39bkRrzP
 kseyUJu0XDPQpioQXt9J8EnanBXQxPm3YIovML5oD7F+y+vaK+7RyWMqv982ay49V64o
 WZm70t4/65/pO+GjktvteE4Js4+SiChkIOopTwy0hhyKniV/2Qjg8/wG8740W77qiJ1h
 /xhRXmbgjSZEm+5aWkwtSg9qI2zK4HY1OyN0frJQD4Yfgv/X+RMF/TRnGfn9AgguX33W
 LL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0g+pFa/DzICscQu6RgE/f+E9D7HVx4tXnlMtNWP5dbg=;
 b=pw1jwg0Xq+VEX9htCTj8Ii6QygBD+Z3X87I3zAtzJGP3NSg5zsM4hG9tp1K+0+ye88
 6Hcg1vbF/W6eYT+/ZIBfbnxKaKbZ4WRzOBHe8i+DQ/XB/jIFkpFiRIQpSS1g2ooMHi4o
 1/K+TB8/3dXJWNImZ4Y5m/TazYPj0MLcN/WjoTf8ZSbaFRy8hwtAezTHQJPZrPYPy7/5
 B2K+qN1eqzuIwOIoNMwk/P7A2a/3U6d7FiJ1dMn6HOkb3DxvrIukIYBrSR44aXLk5+Fn
 0GCjV7bApyYNp5rOTKHwyorD8a8WHQuJp6yW9kWennbX4q9MQFO9zMLx5YpuxwmjFIXT
 sPRA==
X-Gm-Message-State: AOAM531qh5tv2aSy8DYe/50mhHcf+OkPJ4quwJPujfBZjLewgyWxxJcG
 AxdbjdjJUgO7Ei+jMBlzsxg/EImWosgWXIs9c6QmU+CYjiI=
X-Google-Smtp-Source: ABdhPJz7dfnDTguOcO9FYd8LyVsWqUW7iKyfqXgrg6U4uvOyUeOEgFmWdaUhOsT82nG5jE49DNW+CwEICGt0drTX3oM=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr5214936ejb.482.1621332679425; 
 Tue, 18 May 2021 03:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210516123431.718318-1-richard.henderson@linaro.org>
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 11:11:03 +0100
Message-ID: <CAFEAcA9=COZMtbtSfrRdqbZ3q+MN-xTxPQw8Hi9_tdHxZ4so6A@mail.gmail.com>
Subject: Re: [PULL 00/46] softfloat: Convert float128 to FloatParts (part 1)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 May 2021 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have 46 of 72 patches reviewed, and they include ones that
> are of express intrest to David, for s390x.  Let's merge these
> so that the next patch set is much smaller.
>
>
> r~
>
>
> The following changes since commit 6d34aa9969ff85ca6eaeb4dc1988a4d4e13e7d79:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/rtd-pull-request' into staging (2021-05-14 17:20:08 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-fp-20210516
>
> for you to fetch changes up to 463b3f0d7fa11054daeb5ca22346f77d566795bf:
>
>   softfloat: Move round_to_int_and_pack to softfloat-parts.c.inc (2021-05-16 07:13:51 -0500)
>
> ----------------------------------------------------------------
> Reorg FloatParts to use QEMU_GENERIC.
> Begin replacing the Berkeley float128 routines with FloatParts128.
>   - includes a new implementation of float128_muladd
>   - includes the snan silencing that was missing from
>     float{32,64}_to_float128 and float128_to_float{32,64}.
>   - does not include float128_min/max* (written but not yet reviewed).


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

