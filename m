Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C606673A3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFy02-0003Ga-9X; Thu, 12 Jan 2023 08:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFxzK-0002pa-76
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:51:33 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFxzI-0003jJ-I9
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:51:25 -0500
Received: by mail-pl1-x62a.google.com with SMTP id c6so20295080pls.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 05:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A4Ch8zixRPZ0LoKpQ4bZiOA7EkwaQ0SpluQUngufXkw=;
 b=P8wtoW3jHl/Ry2OUDBPTNqIV2yeVO7CTEPy+Ba2Q8i6JhCy8aG7jKmfpm1+gQmEAt4
 XqI1AV6MOFJ9mk1A851ywBg/poIbvP6uC5cktp2CsaMe2zDhGhq4T9rD+Itu3gJBTGUE
 Q8XJGCvTZhyJbIDOxbV8933AFgvbjNPsNgMaZr80g0xz0UrI2PKSSLJXsuXrUliWydNm
 lgULidi/4LChaPxOMuMmokJCP71gg9fY7+tww6LHIu1CkfO628IFSd2YmR8/jiOvzd6P
 9+4XQ9G89Y2l6jyIPdH3+AXkzyyos0VPrgatpGxZsArpiRkeLF1yvnjljGukib+33WWX
 s23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A4Ch8zixRPZ0LoKpQ4bZiOA7EkwaQ0SpluQUngufXkw=;
 b=dORim8ure/3ZNLGlEV+auXcSL6Jn8yFFtd1UzVYZyAE020/EqemrlgU/ojLM3nP+CK
 waGHmacS26RJdPQks2PULYUtf0NsB7/wIaESA7vJcl76GgPUPgn1w4dh7MmxJa5eQaWu
 S9iMGZM9/R0bLwj8jQGTmFFZO0+i7xlkywKCL5WBokHKhb3059ADxgARN7CkM0hQd5X8
 sVgaRC7kVFL4be0Rnqn4syYLWdJ+geh3FYQuk7vuQ6oU3MbzjwdK0hb83k3baW58YtgZ
 vlK3kxD2LVy1Mm+ibeWXH63lIFPBovuJbd+DJVWoQh7iV5l4q1JEq+9Q/d0FG3A7koS8
 aYBw==
X-Gm-Message-State: AFqh2koNgsh/4bbE9maVkZbVQ8oK0yPOvXkJPhuV6r6B/AljzvHP2nuI
 YrkAS/BAMIaXNtqYAAWI0Lxv7TmgOtMZC3K05fOlUA==
X-Google-Smtp-Source: AMrXdXshgwu2McVsn/wuloIcmOSe3F5gi/ZTHX29w7pW+CXLNrQQ0EJKn5nlhfeEb6xVsw6cYTnNL/PXyVVlkFtJJ9s=
X-Received: by 2002:a17:903:28d:b0:194:6083:fd50 with SMTP id
 j13-20020a170903028d00b001946083fd50mr162808plr.19.1673531482917; Thu, 12 Jan
 2023 05:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20230111075213.70404-1-its@irrelevant.dk>
In-Reply-To: <20230111075213.70404-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 13:51:11 +0000
Message-ID: <CAFEAcA-vQK1hHMs-JpxNTpUOworZRTbG6Ep73hhaxrJntgNwCg@mail.gmail.com>
Subject: Re: [PULL 0/6] hw/nvme updates
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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

On Wed, 11 Jan 2023 at 07:52, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 528d9f33cad5245c1099d77084c78bb2244d5143:
>
>   Merge tag 'pull-tcg-20230106' of https://gitlab.com/rth7680/qemu into staging (2023-01-08 11:23:17 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/birkelund/qemu.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 973f76cf7743545a5d8a0a8bfdfe2cd02aa3e238:
>
>   hw/nvme: cleanup error reporting in nvme_init_pci() (2023-01-11 08:41:19 +0100)
>
> ----------------------------------------------------------------
> hw/nvme updates
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

