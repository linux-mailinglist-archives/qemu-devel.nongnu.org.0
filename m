Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307053907A7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:29:01 +0200 (CEST)
Received: from localhost ([::1]:41674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llarU-0004Tu-A9
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llZxR-0002fQ-5N
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:31:08 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llZxL-0003Xq-UI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:31:04 -0400
Received: by mail-ej1-x631.google.com with SMTP id s22so48089831ejv.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=YgOI9+jIGzlQ1ka8wF1e43VGILevJEK2Fp5mvrLoldE=;
 b=pdnkoXP8MuUBCq7J2XFwYlofkkc6Gz5JyX1CH0yO5EiBQIUbDJwLLm7Uj8BsRFwhNV
 o7nt2Q5+Q8bmotoj+KjU1vQ9u52CV60NqjygIE61RpCOV5kc2HsDzqCWhcKqC8Ec6jXY
 Nzp8G6O8H9ulp0FejiH04BiL/fBPxsfQMbes12P1bIXGck0hdIUlxTo952F4nb7e6kIB
 3dzLBSoEibzBfj4xwqRjQVUun1yTGn5eWqgxI8H7cI8H2IJ4LxPSwn8E3ShCWhcRc8gR
 xECeDx6m8/0sDwyhkMn3Ql5m8zoZPSDgbqewnS7lVcfq/JJkNmDNie34GT1QXGc6OV/d
 A3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=YgOI9+jIGzlQ1ka8wF1e43VGILevJEK2Fp5mvrLoldE=;
 b=DvH5wQvWv+oq4K/2e/lKp7+X8DUkBEzXJPyHAKZwcXdXicI3fRxSeU5HuPo1vTvFxW
 xuqUBSZoco7k99+M5kBszhFuroIvohOSoDvcVNj9Uzzlbcq49pSVaqT5aUH1w7yL5iNr
 lNL1G6iSStvWcZkurfASId0VRPuH6x3AxrbGBYdizMt9ENc3MwXe3QzY0feBOw7hZ9oo
 pW9p6iVzggR2PBUa/abeFBol95JVZh+hMxmzaZIfFP9y/oqlj3VZgvgHwi1z+WGjuNHn
 I25CXpe29xa9eruqkyx4j/0M8rlksm7UNisFUMxlZCD8KhtTDkVvYA2Z9aS0fXnNwIDV
 6PBw==
X-Gm-Message-State: AOAM533IbB7LDDkiCb3JvmwlmSLrrpbWn9VhZiE8Uuj2GdomO7+4hDw6
 uasOc/jiKtp6rK/MfZ/qSSSz8Quk9C2yxHUw0/fL2DF+B8c=
X-Google-Smtp-Source: ABdhPJwyBBiNKVJNMdGDDwhWBNfLYPaXe54Alc2D2636PItxxaVgix8VRV/G1taw+MACS0hkw7ikF3bFKI3tbKr/ZP4=
X-Received: by 2002:a17:906:4812:: with SMTP id
 w18mr17701503ejq.4.1621960256531; 
 Tue, 25 May 2021 09:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210525150324.32370-1-peter.maydell@linaro.org>
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 17:30:32 +0100
Message-ID: <CAFEAcA8iLe56Sx6YM9C0AVaTNzw8p5zdbMHaNHF4LVETg1=1dQ@mail.gmail.com>
Subject: Re: [PULL 000/114] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 May 2021 at 16:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Big fat pullreq this time around, because it has all of RTH's
> SVE2 emulation patchset in it.
>
> -- PMM
>
> The following changes since commit 0dab1d36f55c3ed649bb8e4c74b9269ef3a63049:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-05-24 15:48:08 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210525
>
> for you to fetch changes up to f8680aaa6e5bfc6022b75157c23db7d2ea98ab11:
>
>   target/arm: Enable SVE2 and related extensions (2021-05-25 16:01:44 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Implement SVE2 emulation
>  * Implement integer matrix multiply accumulate
>  * Implement FEAT_TLBIOS
>  * Implement FEAT_TLBRANGE
>  * disas/libvixl: Protect C system header for C++ compiler
>  * Use correct SP in M-profile exception return
>  * AN524, AN547: Correct modelling of internal SRAMs
>  * hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
>  * hw/arm/smmuv3: Another range invalidation fix
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

