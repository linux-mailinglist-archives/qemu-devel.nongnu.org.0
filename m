Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63DD319C59
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 11:10:02 +0100 (CET)
Received: from localhost ([::1]:35440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAVOi-0004xu-EO
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 05:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAVMq-0004PW-Jm
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 05:08:04 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAVMo-0007jA-8b
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 05:08:04 -0500
Received: by mail-ed1-x531.google.com with SMTP id s11so10068743edd.5
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 02:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ClciA5Gl7cdrE25nurIGhgoXS+1tdwzvu29aPHnwBGk=;
 b=A8p5fgOujO0iWL/XGirJYfLLBucqY/lKmIdjSlF1Y+LRIZkd1YlaVTnxq/PmWxoCXd
 MnPkcIfjXIWGmYV8zOCIoE8HbGUdPm4TmTcttns+7ID1eMrXBL/7wvzxrSENV1S7TIZu
 hJX/kdDckfWKI4NrdvKfqggOONzNI3zhs7L5WNnVkBBXu4wbkqx7Nts+j/cmL42xVnXV
 FkYOe/LBqpD4AoScT3UKKdn9/uXPnkTWp2KDc93EpjT6imlMtMYS2oZd851TamMx6wX4
 g3Ua7dNYxQ/TtTUwRzU2XkMRCAsSdOworZnWESd3COaJHOqyJKsxNrpjpib9NZa8UP+X
 Ifzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ClciA5Gl7cdrE25nurIGhgoXS+1tdwzvu29aPHnwBGk=;
 b=cK2aZas7VOqDdCEzA/rUUT4Ckn4fFfQ3cEKCc7XYJrINkKtejBkzYze2Kzwcm8/ApD
 5fW/oxbDc8BJRUJGvHn1uuJveP4L8HK0qfiSkuTxUEbnVH1xxn6zQWhVwuy6LjnWtexe
 5+eirnEerozVxX8wgCxD25v/9THgVPEy0Htvn3mu5fTmoewOu+6Wy6NE5QQq31d7TSoL
 NBHd6uXka0QH6OI1R2J1kpohIpPp2op2BUtXnfmn5XbRa9ZTGEh57tL8AtUZbZCVY25q
 OEy8X4IlHXhZ7gNQaKsAEx6BI+p5BnX1KKNbVF68V+OL7vT+RJ+yDD4In9jyIWETTn1H
 MKfA==
X-Gm-Message-State: AOAM533rAnks8Nrtcmwho5E7KI9ewO3ekzRIyYjLbxMA1mma2Jzunj23
 3GGWsAIKb5WXgRU0p4UFNfPMaOVSzFiDXxOrLj9n4EHInpU=
X-Google-Smtp-Source: ABdhPJyhbHlTsLDcaGYSK60SOtuBE+PWaSIZYPRCrB+r+XGDt3UATxBMLMJ877OCmg2KtmE0Amft1yUqlHjF2002rL8=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr2488679edd.100.1613124480097; 
 Fri, 12 Feb 2021 02:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20210211195731.6039-1-peter.maydell@linaro.org>
In-Reply-To: <20210211195731.6039-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 10:07:49 +0000
Message-ID: <CAFEAcA_KzL4xKHw2AGad3qV-BWux9nhWb8L31qzYVd-Ftaso6w@mail.gmail.com>
Subject: Re: [PULL v2 00/11] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Thu, 11 Feb 2021 at 19:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Massively slimmed down v2: MemTag broke bsd-user, and the npcm7xx
> ethernet device failed 'make check' on big-endian hosts.
>
> -- PMM
>
> The following changes since commit 83339e21d05c824ebc9131d644f25c23d0e41ecf:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-02-10 15:42:20 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210211-1
>
> for you to fetch changes up to d3c1183ffeb71ca3a783eae3d7e1c51e71e8a621:
>
>   target/arm: Correctly initialize MDCR_EL2.HPMN (2021-02-11 19:48:09 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Correctly initialize MDCR_EL2.HPMN
>  * versal: Use nr_apu_cpus in favor of hard coding 2
>  * accel/tcg: Add URL of clang bug to comment about our workaround
>  * Add support for FEAT_DIT, Data Independent Timing
>  * Remove GPIO from unimplemented NPCM7XX
>  * Fix SCR RES1 handling
>  * Don't migrate CPUARMState.features


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

