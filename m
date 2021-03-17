Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B916133FB4E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 23:34:54 +0100 (CET)
Received: from localhost ([::1]:37706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMekf-0003EN-Bz
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 18:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMejY-0002kG-49
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:33:44 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMejV-0006zv-4u
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:33:43 -0400
Received: by mail-ej1-x634.google.com with SMTP id ce10so858968ejb.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 15:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gBqpIjisGICn4Piwu0xveYCSyzpdedgiW2LhI+5eCw8=;
 b=fhAsNvfVj8eSFKKYXSRdxeO1K69PfHmYKnhE0kl32xwCYzBG11Dm7x8aUwx+0ZFexd
 /3ZCDynOrfB7zsNh8nOKDaoHX/WyuqZ/VsSeQN5Ru/T38cx+HXLoE/C7Tm5Yemn70PkA
 zii87HhAo7Iov+EHHMWecq/oCg8TFM4zAgk2wWv32K2to40/H4FJEoqnmpBwDkrO9B/x
 Dt0fatQ+g4XXPyQXJvx+pnvPW7jht9jHqU+u8e69I37/uV0gtAyoioAQ0/UFaBJ2Jycx
 5xnaxOmTH9jRiQAlFrun3j7QDbYBM7ApR1TNh/ISbBLGf2hXxVQoXU26PZjHpH2QFNfU
 qKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBqpIjisGICn4Piwu0xveYCSyzpdedgiW2LhI+5eCw8=;
 b=Gsu+BznT6ejl8B6PcuEa+B9gcDRh8Y69uW07/+ggjyTJyu/ShaaXql+4Vi78dxySgh
 zichpcm3hzv5bp4kxd7PRq0rXKN1R/G4kzCamuTIsempHdGjWtr4flvrYwIVIf1L229/
 Fvdhshjf8Yj4BuWlncAKc1EBaTHqTD4Ze8OQKtvQvBN3IpXJbJu6OvdYV6QQdXtuwXZF
 C+ugywxBA0uz6FvdSx/QMTg6zi1JVfIQrMFeyEPdvjn2CjXumOoIzH+D9xIfP31kPPyu
 yC74yOI+cdKrvyuidny3GGmeGJ8MHyfoeNwOAwKFLm/xVWZ3CHnfbUwCHDYkh8/0QoWj
 GOsQ==
X-Gm-Message-State: AOAM532TEaAMKBUH6Q8W93iXEatl5dP+CMx6SePK4YgbjS0jxGlsOlJe
 bDDXboYEN5X6qD+15KlaKhRedtdBDPIo9kcm1DjVqA==
X-Google-Smtp-Source: ABdhPJw1IQ4JK5Aa4a7qQvsfU/lTdPuKeHL9uPLLr3ovx7a7jNJ/wYWmgyovspgL4kDso3mlSD/FSvB7FU0JLBFTm5c=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr38362015ejd.85.1616020418296; 
 Wed, 17 Mar 2021 15:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <YFJjIq45ggSZz0CX@work-vm>
In-Reply-To: <YFJjIq45ggSZz0CX@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 22:33:14 +0000
Message-ID: <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
Subject: Re: of AVR target page size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 20:17, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> Hi Michael,
>   I noticed your AVR code defines:
>
>   #define TARGET_PAGE_BITS 8
>
> and has an explanation of why.
>
> Note however that's not going to work with the current live
> migration/snapshotting code, since you're a couple of bits smaller
> than the smallest page size we had so far, and for many years
> the RAM migration code has stolen the bottom few bits of the address
> as a flag field, and has already used 0x100 up; see migration/ram.c
> RAM_SAVE_FLAG_*    - and it's actually tricky to change it, because if
> you change it then it'll break migration compatibility with existing
> qemu's.

If you want to use low bits as flags for other stuff, you
should have a compile time assert that you have the number
of bits you expect, or otherwise force a compile error.
Otherwise you'll end up with unpleasant surprises like this one...

I think that for the cpu-all.h uses of low bits we would
end up with a compile error for excessively small TARGET_PAGE_BITS
because we define the bits like this:
#define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 6))
and I expect the compiler will complain if the RHS of the '<<'
is a negative constant. But I don't know if that's deliberate
or a happy accident :-)

thanks
-- PMM

