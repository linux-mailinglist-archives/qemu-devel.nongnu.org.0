Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC32441350D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 16:10:59 +0200 (CEST)
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSgU7-0008EX-1g
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 10:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSgRg-0006hb-6N
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 10:08:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSgRe-0003ff-8G
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 10:08:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d6so39381303wrc.11
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q2pXf3ry3gCpm8n6139kI9eHLA3cFnsnVFZLzyuoSrc=;
 b=nWcX4LxuQMu7Z1GoT3HEqjkCCOp47Kc/lW5qBKbbUaIPJ2MkEfrlSbzVY08BN0zRpP
 X+1kzPTl5mBgoBhmkhyjztw6Lm6RTSrw4rnMNQ9FKaSH3gP8OkSwQThtV2rf52mrqk5O
 sLnfdWt1VcP/DQam2yC05ZKI2j813I2Lrhg66G3okCVKCXzUjygUnNrD/WPigtyeahbv
 9HremiSf3rjk4gyUOlGkXpP86+uCvMBApYgJtvTpUpheNHfs0To7vn6LcvAzEqEHitm+
 oJfZC8F7mWsAghW757t2iQpxZyaB+MoytAE949kW6DsUvb/nVur/1ATCegxEcRYf6Ry0
 CDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q2pXf3ry3gCpm8n6139kI9eHLA3cFnsnVFZLzyuoSrc=;
 b=T3UqkffTjvqUyq2ES+TPjI0B12w9yzZOzNRSdWIKivRCMrSk6xKmdS5Sr1rnJxC3Gq
 LmtF7g5L/wx+VmYZuDQolM3QheeTB0HNjv4Jxj36yMP5TXhwct4f1F4FRFWePh0rOOjZ
 XiVm6/LeaRfiW03+O/nh/991nwmw10yijzILjyhpLPOMWqvjM4Tz34cvGp7/7c9VUF5L
 hg0I7O2CngXeVKWIc1I5YARmA56Mpdo46U9amR6h8gL3SukhPyxQAOf3kpysaxRp8bRU
 KWxRY5E/wo+g00TtZsCaMYTpbATaukGX1G5j1Wr1BuSMwWFCo6PpxwGpV9HrGKKtN+X8
 3udg==
X-Gm-Message-State: AOAM531S8bATX3IXacy3qrj/A/Sv9XBqBiwdGNnu7Mz/Ht5p+KghACYU
 shrpVyjXb1lHDHG/t/VgvZt1y93Y4h3ibDTO7TNZJA==
X-Google-Smtp-Source: ABdhPJwgqWkh/ENj6fx/kAbLgZDt2tWVyHa4LWSEf4ey12ikidHNlMYHLFiPxiZtcBXEGXvM7fE9E1na8OJl7CIrm5s=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr4918049wmm.133.1632233304289; 
 Tue, 21 Sep 2021 07:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210920080928.1055567-1-clg@kaod.org>
In-Reply-To: <20210920080928.1055567-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 15:07:32 +0100
Message-ID: <CAFEAcA_7OojtAnd611zH2YFa7cpLxmowQSp+1QfqaZpxn8XGDw@mail.gmail.com>
Subject: Re: [PULL 00/14] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 09:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit c99e34e537f13a431a80e3e414e5904e9dd0a1=
16:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.2-p=
ull-request' into staging (2021-09-16 21:09:18 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210920
>
> for you to fetch changes up to febbe308bf9477767ca92e8ed5f265b0001fcef9:
>
>   hw/arm/aspeed: Add Fuji machine type (2021-09-20 08:50:59 +0200)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * MAC enablement fixes (Guenter)
> * Watchdog  and pca9552 fixes (Andrew)
> * GPIO fixes (Joel)
> * AST2600A3 SoC and DPS310 models (Joel)
> * New Fuji BMC machine (Peter)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

