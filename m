Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F339C968
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 17:13:28 +0200 (CEST)
Received: from localhost ([::1]:42334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpXzK-0005Ju-Ly
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 11:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lpXya-0004YR-1W
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 11:12:40 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lpXyX-0006OE-Fo
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 11:12:39 -0400
Received: by mail-ej1-x62e.google.com with SMTP id og14so13752937ejc.5
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3CV7wDE26oDLLpQh/eR6VaAW/5e025vDXByspCc/Lfk=;
 b=KOSS1lNk70Hcb7AJCmOVzEQH/H52HnpROlYfQTitTJ1GvgPxJ1TVtkuODrEvpa3ATC
 0PPcqiUlvfFWc+rHjsq5JWxgbNrfXJi4j3f9CDU+zW0JJy+lUgnx7S0jVXnf2uvv/yO2
 gYuLmmGuIzle9WThNs3z6iegmfxvpnQ7mdQCcSjid+1t5j+VKgPilz98y1nBQQi7ln1p
 9dtJmFVsN7avormjxaKTLXPteUNPcoFMWe1E9ygqx8IHf4DYcUsnYXElmKjIX7v5UuQb
 g0HzUTYbKNrxKsvfpwbMnni9yTTOYCjSKbUsz2WUI3dcx87TbR93/2jjjaSiEIXNvLam
 bgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3CV7wDE26oDLLpQh/eR6VaAW/5e025vDXByspCc/Lfk=;
 b=cnKiLSQv8QRLui60l8DhlQRXWJprD5WyBQgqKJchJrAeHwceaLAZ0CTa6y4X9N06YN
 Q7p+pC2R/bWgp1wnAcfeRCFbdSyulEIYeGwOLATx4V532SRm69eqHwZ/CrJSUY2aCADG
 CNYCgD7WqWidVk7QvWOZuHBHU3Dnawdvl23p9BqSmZSD5Oupbbj1lFtU2WA3hnGCvQ36
 8X4uXjNbFl4pqQWDBe0g6mo5Fl0EvRm3opu5EsoZ0ktyo/P9rUISgcVuw509/+w/Ey96
 Qr3x0senW8us8PndLY70KxUU8kq8PofwVnoFvzWMVGUMJeC/EtGq/Kr2VFBAE+XYyeN0
 liCg==
X-Gm-Message-State: AOAM532mOVtUSULM9SjTjLXxdpb6ZBj+Z4KLp/DRAL1C3P3/ERYXAgtg
 /Wc0Kb+Z+v+FOkARYajO4ZUWsvdLrZQDqQC8bJcE+w==
X-Google-Smtp-Source: ABdhPJyrLzltSbK9pYqa+jxqCramn05uISu6qOuNndTAsFhgzS0bQ1VQSSMxA6/S35Sm0oGJU6mmlJuNtX0MhEiU4aI=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr9605490ejb.407.1622905954659; 
 Sat, 05 Jun 2021 08:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210604201210.920136-1-richard.henderson@linaro.org>
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Jun 2021 16:11:59 +0100
Message-ID: <CAFEAcA-kW_s8CZYgP_cOCt6syMn3-AhHZR8VNkEwmNNBfFyhtA@mail.gmail.com>
Subject: Re: [PULL 00/15] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Fri, 4 Jun 2021 at 21:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 1cbd2d914939ee6028e9688d4ba859a528c28405:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-04 13:38:49 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210604
>
> for you to fetch changes up to 0006039e29b9e6118beab300146f7c4931f7a217:
>
>   tcg/arm: Implement TCG_TARGET_HAS_rotv_vec (2021-06-04 11:50:11 -0700)
>
> ----------------------------------------------------------------
> Host vector support for arm neon.
>
> ----------------------------------------------------------------
> Richard Henderson (15):
>       tcg: Change parameters for tcg_target_const_match
>       tcg/arm: Add host vector framework
>       tcg/arm: Implement tcg_out_ld/st for vector types
>       tcg/arm: Implement tcg_out_mov for vector types
>       tcg/arm: Implement tcg_out_dup*_vec
>       tcg/arm: Implement minimal vector operations
>       tcg/arm: Implement andc, orc, abs, neg, not vector operations
>       tcg/arm: Implement TCG_TARGET_HAS_shi_vec
>       tcg/arm: Implement TCG_TARGET_HAS_mul_vec
>       tcg/arm: Implement TCG_TARGET_HAS_sat_vec
>       tcg/arm: Implement TCG_TARGET_HAS_minmax_vec
>       tcg/arm: Implement TCG_TARGET_HAS_bitsel_vec
>       tcg/arm: Implement TCG_TARGET_HAS_shv_vec
>       tcg/arm: Implement TCG_TARGET_HAS_roti_vec
>       tcg/arm: Implement TCG_TARGET_HAS_rotv_vec


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

