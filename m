Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623144CD9BF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:08:23 +0100 (CET)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBPi-00076s-FG
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:08:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQB5r-0005Je-GV
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:52 -0500
Received: from [2607:f8b0:4864:20::112d] (port=39366
 helo=mail-yw1-x112d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQB5m-0007Ot-GR
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:50 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2dc348dab52so64105417b3.6
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o3ZXayr8P5xgBWJs55wVm/Z61UeeFHEL5BrAUAESTqA=;
 b=Gdvom1DMA70sZaqMpWu0VZI/nyxvXWmCrLB+dC9+3Ez+7L5FHnae1mEY/dS/4tyrig
 wZpMNi5yaGSOJSJx0ngteKvW2MKaa+T7te6xu5Cp1ojbmLtU4p8YvfVZPbMyZzxtDzsN
 Tn4NXB2dWh3PIrVpjB/GkaEg8t57jAYStNzdK61Hp55OWIy2qrgBiCrPyX0NsMp6hVgo
 XNljf6YxnA7qvGexCyp5CCul83IC5Me/zHmf8759yKLZdoXM9bG7FJh0Q1NOz4XHKC0K
 hFoCHcUOTzLIzMfbYKuspLkBFPG0t24n2dHrefL6XQSZWe/7/p8HHUjApylJ6j4isLzW
 zabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o3ZXayr8P5xgBWJs55wVm/Z61UeeFHEL5BrAUAESTqA=;
 b=JXe6tDwfyPjYJhAPM2WYdg8Kwvg4UhsYdhg86Z2hv+JiEwQbN8QeRvdt2PbiurkMOF
 9Bx1v1lVY1yvC/OOTwX8TtMeAibWfoZrqS4wKUpTUWb8DvYlWeAibjfO03OwgcHDQe8o
 SrCSvg5/VPMroIFve/u9GdEXFWC4JqYU1zLjzHAXM+Vf4Em0ZN8MJyl6G4bpIBAppStO
 HOkN793Oz8hV87HF7yo3rxyLAJoUAfGd0/c8aPB5KPRJ/l+n1McC7NVKjq6sJc7RSdei
 iVsPqDLXUkUP7TmCVR4Sa+NVPuqQE3KxuJ9aS3oLoCX+JPE44xwj5k6gPY4wW00+NeQJ
 RaOg==
X-Gm-Message-State: AOAM530ZF6l84dSRwqZpiWeoXWk+bXLjIp/8vvtsyO+mMUf83nNhTWFF
 s+bOr8+jNL3SCAkgKLgX4pHKYHsZClm+rJEObJcthQ==
X-Google-Smtp-Source: ABdhPJwEIlENhfVBDU7bBJJtKm7RYr0MWVMnFTDTv49Q8Z87dTWh2sItjI3aiv/k3R4Hn31fNfXonDVjEi/ipaNOdx8=
X-Received: by 2002:a0d:e2c9:0:b0:2dc:1f22:e349 with SMTP id
 l192-20020a0de2c9000000b002dc1f22e349mr12377833ywe.10.1646412464982; Fri, 04
 Mar 2022 08:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20220304062443.352515-1-its@irrelevant.dk>
In-Reply-To: <20220304062443.352515-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 16:47:33 +0000
Message-ID: <CAFEAcA-eSzKppAQwsPTbZdhjkO1C1rPsVPMRY3fzEDUszNO16Q@mail.gmail.com>
Subject: Re: [PULL 0/6] hw/nvme updates
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 06:24, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> Last round of hw/nvme updates for v7.0.
>
> The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' into staging (2022-03-02 12:38:46 +0000)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 44219b6029fc52d5e967a963be91a9cf33f9f185:
>
>   hw/nvme: 64-bit pi support (2022-03-03 09:30:21 +0100)
>
> ----------------------------------------------------------------
> hw/nvme updates
>
> - add enhanced protection information (64-bit guard)
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

