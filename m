Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A140C6BB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:53:18 +0200 (CEST)
Received: from localhost ([::1]:36592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVLh-0002tg-54
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQVKe-0001LM-S1
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:52:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQVKd-0004q9-3Y
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:52:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so2076548wml.3
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 06:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fuUJjzAQiMmiHuOPxrxYQRpf9m2uaAmKpoiweI38Jd8=;
 b=Cvk0TkIzCC8BS0fClNuMPqctdvkLyovZF/2WvSOWw9Lm5nIpNRdzqPvFsUyBAIz20e
 GlCdUAtKzFfUZRmLTvBy1hUSo5K/PPAnjdk5nrKfqRsu3FB3kHg5mIq3lwRXE53MwoPg
 NreP4FM9UKUBG+gS2wWydlIVxlDXtY6DgfyDTyZGefz+5inOMExCcat38mrftjwhgcV8
 8yDInDJZk0jVSKhQzEkHfZoOmO7LK9oQ/MGuhKlkhVW4RHwMfuT0prurwsbafDPZUX7E
 Nz4fMuumhlkqj5wuBsR5852mOJnLiXn5KdQFlcyDLUutlkRqczF0tBlvkWkj6Bp8eCJj
 9IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fuUJjzAQiMmiHuOPxrxYQRpf9m2uaAmKpoiweI38Jd8=;
 b=pdVmnSqSI+y6Sl4LUt0KhX5d5wXMLChYdSG8MqM72uBK5V/1rWRZal/OS3EaHtUxVC
 XWL/qy6d5u/04PJVGnDoCLscLRF790t/JKxkFjytPSk66r5zsoJYtpI42S0pcBLbYZtS
 5kVx1vZFLSLwxR8I76ZLU0BEcKaZuuHJy7nzWLMRS/9jVvC/8w93O5+qwoITLJHGD61k
 C2kgVjn18z2mf3djru3XDYom1OzFMsx3MjpsuGR0JS6F5YV/ad1xyuDq3ANF3HYHDmR8
 NL2QwE305/ltb6dXMCZ1advyHegTQwi3t6kaoypR5u+Klcw7ReM4Gz/P8NIwRUrC7mr2
 6yhA==
X-Gm-Message-State: AOAM533c3GmfRaitDFvIOvDSU+pWFT4EoVDTM9Vecs6hrzctQ98o4yEg
 L0/kM6YnsUP7f9VV0tEHyCKhSVELd5DV8KwnMDQLVQ==
X-Google-Smtp-Source: ABdhPJx81ex/ZR18EYn5BEhO1Aa7Pia3FgrlzHGmisflxkjYQ5yIc/6uT8i0SOy2G+1XbowIi7R9cusrQ6eSq4awgPM=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr4577051wmm.133.1631713929327; 
 Wed, 15 Sep 2021 06:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210914193133.1388599-1-richard.henderson@linaro.org>
In-Reply-To: <20210914193133.1388599-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Sep 2021 14:51:18 +0100
Message-ID: <CAFEAcA_3s0K6DMacMbqwbP-cUncYxkLLpimqdRNQUwg5LXZYLw@mail.gmail.com>
Subject: Re: [PULL v4 00/43] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

On Tue, 14 Sept 2021 at 20:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 4: Drop the cpu_loop noreturn patch.
>
>
> r~
>
>
> The following changes since commit 4c9af1ea1457782cf0adb293179335ef6de942aa:
>
>   gitlab-ci: Make more custom runner jobs manual, and don't allow failure (2021-09-14 17:03:03 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210914-4
>
> for you to fetch changes up to e028eada62dbfcba134ac5afdefc3aa343ae202f:
>
>   tcg/arm: More use of the TCGReg enum (2021-09-14 12:00:21 -0700)
>
> ----------------------------------------------------------------
> Fix translation race condition for user-only.
> Fix tcg/i386 encoding for VPSLLVQ, VPSRLVQ.
> Fix tcg/arm tcg_out_vec_op signature.
> Fix tcg/ppc (32bit) build with clang.
> Remove dupluate TCG_KICK_PERIOD definition.
> Remove unused tcg_global_reg_new.
> Restrict cpu_exec_interrupt and its callees to sysemu.
> Cleanups for tcg/arm.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

