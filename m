Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38B6D6CA0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 20:51:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjljj-0001Pi-Ht; Tue, 04 Apr 2023 14:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjljb-0001IV-1B
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:50:23 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjljY-0008Oe-GM
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:50:21 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b20so134565251edd.1
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680634218;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L/GGcYcudD8fyOxAszK2U1EOmksx7bJ3j/1ejdkEK08=;
 b=RdrL0mTpM4sfIJ9li/5FamdESTB1rWarFwcHJdHnG5PwpasZ9Rid4TW4v0a3KnONJX
 j0iQFe3vqV8jKHg8c/r4XTXNKI0CjiX0IF+SZ5EdllCeB0LogIhwBEUpc9K26JoVtetf
 8USvAF5okgb1PGKrfq4Npk3KbF+cL2AA4nGjQAirQG2rjbekvfI5gWKbpsqmqans3XBj
 R3LD97oKFqtqSParnOSLBjQ6MgO+A2esIBIkVgZwVzzjHOffR9FHzN78qAivC3jwcbRD
 YDUT9DO+IJBn6IU1QlI/d/qyBYpo+rhPu8yt3yzhUlLYMYTaS/Pv4augctBBHoeo3myt
 Xbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680634218;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/GGcYcudD8fyOxAszK2U1EOmksx7bJ3j/1ejdkEK08=;
 b=OeZtE9a0d9fqAFYhbidrfvUD1ch2gNDEUbN8ZSBDz2ubwREmzVu0CwheMvh4NYgM2m
 Dwh41XG1zXcECXjY7aoSfY9MABl+heHy8BX2Ga5UzQ7ggeAiBsffiDrQZbFKR6WQ3tAj
 nJamLzIpZMyzb2wVJ1dO99wcgrs6Vg+edgiTywKba8FLKSw0p8OX5pzdt0tYXAhp75Ae
 j+bDr4DGpFukl0bvcd8lhuehMY1haM3xMjXMch8R/LvLf3GBowPA2Nm8RNz3H4gK7WYb
 fv8OGccp+8XwPaRmGqGAvtHN/BcZWMJk6p+h6BzOnZOrQXZ1SewE9qmkLliXTroHGQzO
 6Ofw==
X-Gm-Message-State: AAQBX9e78CZuOYUwlVRSDs2egEB0Pi6kfUpBQEfhGUKsd1xRz4xpOUr0
 PGt1SB4raeGhvBJR+nxAHnRfTDsMO4CPvJkG92EbBCkaYpYTjJYh
X-Google-Smtp-Source: AKy350Y0qXotR7mgMdX+p5OZzNgl3vVh2YsnrxRA9bu40VR5HNnQjyIgm++LL0biFB/lT+PvsMHvMOqOhfrZyVMDvUI=
X-Received: by 2002:a17:906:b6cd:b0:8b1:cd2e:177a with SMTP id
 ec13-20020a170906b6cd00b008b1cd2e177amr285786ejb.6.1680634218404; Tue, 04 Apr
 2023 11:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230404155220.1572650-1-richard.henderson@linaro.org>
In-Reply-To: <20230404155220.1572650-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 19:50:07 +0100
Message-ID: <CAFEAcA-L997zVveoQQRBc16N6L9DZZxXJ=_nqAWKt2Nn9sqTLA@mail.gmail.com>
Subject: Re: [PULL 0/4] last minute tcg fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 4 Apr 2023 at 16:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 51a6dc9d394098e8f4141fad869a1ee9585f54f8:
>
>   Merge tag 'pull-target-arm-20230403' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-04-03 17:01:47 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230404
>
> for you to fetch changes up to 1ffbe5d681b06ea95b1728fc556899f63834553a:
>
>   tcg/sparc64: Disable direct linking for goto_tb (2023-04-04 08:43:04 -0700)
>
> ----------------------------------------------------------------
> Revert "linux-user/arm: Take more care allocating commpage"
> accel/tcg: Fix jump cache set in cpu_exec_loop
> accel/tcg: Fix initialization of CF_PCREL in tcg_cflags
> tcg/sparc64: Disable direct jumps from goto_tb
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

