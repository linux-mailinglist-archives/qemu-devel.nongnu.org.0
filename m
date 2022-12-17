Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BD964FC69
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 22:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6eaM-0000lh-Fm; Sat, 17 Dec 2022 16:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6eaK-0000lW-63
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 16:19:08 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6eaI-0007VX-HP
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 16:19:07 -0500
Received: by mail-pl1-x631.google.com with SMTP id l10so5551086plb.8
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 13:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QOqlqcKgzJyp0Oa7PIcYh3PmyEpC+0QwxfMDvzx9mik=;
 b=sYub3jFVZ+4rN3AJATNcIYzNjusQjXWsd5TZtL4ZodaowjreQ7NOHXeeqjee/SS5Is
 cOkdRa35J9IEHXmqZgkjbv8kRmf6a8OyH5nftEJKYlxWHE8+rMWI4Oqted3IIf1SBJnS
 DKADkMP42sgF3U62kZxHImGqQTz/dMhaX5ZXrsqyIGW7HFx5a+ec/T6wMX/3vwzCMZsL
 AEqEmOyBddmPts90Zl6Mnop5vf8j7hVGM4Jxgjk4p2GLvyYIomDyNuy6yjdGLijGWfXR
 A8VwvjM0kB5/zQFczyI95JyhJyX7mk3Ot02cYGd8IDkr7Ug4rym/kDAIbpQjs32JtG8O
 B23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOqlqcKgzJyp0Oa7PIcYh3PmyEpC+0QwxfMDvzx9mik=;
 b=4eEfmEbgLVKALQgeNt7xcWl3RzsLq5vIJparMek7yuubnS9Cn0bNrGk37q0/Sn1bt9
 NA8nyAtyxn8WLKHHIPl5wGqrqI4L1B/wtSF76GkPwDy2rEmfdvQjDpX+dsaRBXcOoZ43
 KMbJc7HL4pBxrZGuBYlUcHDIwym8NQ0AWtgfuX3C7Z+TD/hFl+3E9lKCYkhQ7f8HMfZA
 aundNbVT3CX5qkKop5FjbPYrA2d9v8S6fP03yxdxx7PymFeMMAERAxBPQo9zigQEd9ie
 0PT7/Ngd+ZsGx9Ihe+ZxSLDblkVEhvoo1Wzw+i6HGTb0tSztPBU7FllICDn9R9EhfqZs
 BSDw==
X-Gm-Message-State: AFqh2koRZNgEwxPYubHCsuYNNM3C00mgNqiEUe3cgvEDW5UbRXTxSXP3
 rL+QzZIyepjxQFewxhMh92T+pTeOu9ymUXa7z+Fn8k/PxmrZ0g==
X-Google-Smtp-Source: AMrXdXtuQl34tdpr9tyFGLDlO+h1n0zDUlPWlD+c5poB5jvyDCP6eSBEKV9zpJCvsBciSF3HLMn5kNGjJutlfgWsp3I=
X-Received: by 2002:a17:90b:146:b0:219:94b2:2004 with SMTP id
 em6-20020a17090b014600b0021994b22004mr1342215pjb.215.1671311944248; Sat, 17
 Dec 2022 13:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Dec 2022 21:18:52 +0000
Message-ID: <CAFEAcA8h0iZQTpd0Pbkm4_Tv1QV0TEgqwuBvCknTz+sc0mUMjg@mail.gmail.com>
Subject: Re: [PULL 00/36] reset refactoring patches
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Fri, 16 Dec 2022 at 21:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This pull request collects up various reset-related patches
> that I sent out and had reviewed during freeze. I've sent
> them all here because they touch various devices across
> the tree, and this seems more efficient than splitting them
> across different submaintainer trees.
>
> thanks
> -- PMM
>
> The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:
>
>   Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221216
>
> for you to fetch changes up to a0c2e80afc98a9771b109eb5ce0b47edd7c78155:
>
>   hw/pci-host/pnv_phb3_msi: Convert TYPE_PHB3_MSI to 3-phase reset (2022-12-16 15:59:07 +0000)
>
> ----------------------------------------------------------------
> reset refactoring queue:
>  * remove uses of qdev_reset_all(), qbus_reset_all(), device_legacy_reset()
>  * convert various devices to 3-phase reset, so we can remove their
>    uses of device_class_set_parent_reset()
>




Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

