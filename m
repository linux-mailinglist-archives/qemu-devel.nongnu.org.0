Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D0A6ADEFD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:42:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWe5-0005dS-CJ; Tue, 07 Mar 2023 07:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZWe3-0005aP-OS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:42:19 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZWe2-0002rV-5R
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:42:19 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so16371599pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 04:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678192937;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p7tvJcFT6FZorBL747CXlGploW1SnIjFPEW25jOs89g=;
 b=pg40ZRH1hwMGzftArdjcEPrUwVqtOS0N9zxRlkFvozHUXtkejdS7o7VJnglurJIav3
 a6irH2P2H+shKSB/FiJIAltPSWVtDS0BeHwPZO99SokE/Ck3sp2vETpOi0GCKXT66ihF
 llAK9VMxCbqe8ZwwwJNOFnT4ZD9c2I54yUukyScbJXAv8nx9lEzC0RFRTz4GO+R1RuUu
 Vi4LsJvln4mqlskjuQiwVM7GUUZT1D6ddpxuJJcaNc8G0CVJMvG2D1jUWXVu+qGIqwpU
 d9iXGlKiiDEKiyxH+oCew/3xrkIQPP2R5Mg6Pk2EVnchyQ4bvxu1R9bzvjt0aTLLjnwT
 O0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678192937;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p7tvJcFT6FZorBL747CXlGploW1SnIjFPEW25jOs89g=;
 b=3Fw0GzkiHFI1J1f32V4145AY7u4ZRMrXJ6O8S4WJuBbOpPop9/rheOfZqHTEfbHmq/
 HdsebcFcJAgsDwTiBPhRVpcaYErMEiyOdciSifLXvgeRaDBxv9KrcNMt+fUj+BWctF4R
 il1L7CazQRZ6aerBU5OcXuCfp6Dh0Mj0+jIeI3FGP3RJ1WCqfh8UTBY6jQfsWUzDLdaU
 sTc5MoFjCRFSNDAskMqESyL6s2NknwiBE2dKEXV+3IyS6n80xAL43vhIejNIJki9o7RW
 BHtbA1DFO4UkcWjxYVbdCoccttDn5b76RjCkTvYAzlifi4DhFOrYNjUklE4ZFtCXenQ1
 dkvw==
X-Gm-Message-State: AO0yUKVqSxlBKtF9eSoxL17rvoGpw7T5ZhtkxGsd5DLAKUdoHlEPpMop
 YFSHesgN9rsA4Zk8gvaopgzTwE2crNw4psSODYkRQaExLuq/2+4l
X-Google-Smtp-Source: AK7set8XLliVOueFOflZ1f+jE70AWM/cc7j4k0ts6lsMSBlh1urZDsdtjDPN735GhLLrQvdO1srdlCCaTz8JgJRdSWE=
X-Received: by 2002:a17:90b:1298:b0:234:87a7:f180 with SMTP id
 fw24-20020a17090b129800b0023487a7f180mr5329232pjb.0.1678192936674; Tue, 07
 Mar 2023 04:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20230306153435.490894-1-peter.maydell@linaro.org>
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 12:42:05 +0000
Message-ID: <CAFEAcA8Tf6u6qeaWOWHWqEdo7i2JZur7Jg_PYR25j+govzSNwg@mail.gmail.com>
Subject: Re: [PULL 00/21] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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

On Mon, 6 Mar 2023 at 15:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit f003dd8d81f7d88f4b1f8802309eaa76f6eb223a:
>
>   Merge tag 'pull-tcg-20230305' of https://gitlab.com/rth7680/qemu into staging (2023-03-06 10:20:04 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230306
>
> for you to fetch changes up to 2ddc45954f97cd1d7ee5cbca0def05e980d1da9f:
>
>   hw: arm: allwinner-h3: Fix and complete H3 i2c devices (2023-03-06 15:31:24 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * allwinner-h3: Fix I2C controller model for Sun6i SoCs
>  * allwinner-h3: Add missing i2c controllers
>  * Expose M-profile system registers to gdbstub
>  * Expose pauth information to gdbstub
>  * Support direct boot for Linux/arm64 EFI zboot images
>  * Fix incorrect stage 2 MMU setup validation
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

