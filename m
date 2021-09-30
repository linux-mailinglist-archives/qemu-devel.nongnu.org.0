Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08ED41DA17
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 14:44:11 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVvQ2-0003IM-Cy
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 08:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVvNk-0001iZ-EX
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 08:41:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVvNg-00041x-JI
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 08:41:48 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso4265247wme.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 05:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSyHRHsYs+AnSS0bNHuEGBrbg1RhSpChGg259dP8q4k=;
 b=TQrMPSYZGfY66Z9fkLf5JiAZZHZQY0uGHhPnMTlihymfGb0aka7xaYLQYUHLlJHTl7
 ylaKCatVJa3X4WzBB/4/GyqxxPubLYEFmVRV9xQ6alKQprtM8fup6DbZ8hSJkWe+nznR
 9wVNPJvfPI7Ip4XkMM28uOwtPeN0BFEQ4a+M1bHDIoZB7aWvkvO+/pmxgARcwD+z38HT
 G5IDmzDNjsVzv4ZBzklZLiVp5Jm8CVYN+j69tdtQadYbbL2dau9Bt9jFSdOq8qlgg7Wt
 m7RIqqmBvfve1jP1BBvXazoe/oxCw4z/Jozl3cb2u0EQv7TVG72BNXQoE+LsNiPhyG5Z
 g1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSyHRHsYs+AnSS0bNHuEGBrbg1RhSpChGg259dP8q4k=;
 b=ecvZtvUb3bRRS1JVcdfuZPWuxhyuvKzHjBlhFhlFZ8cFENsKqoJeEtrygEiZFZ88pg
 aomUKXvH5XjBtj1zPE+JSrH7Xk11iE0/p2n/jOkltt7+DGowY3aSrMOKNeaofCUdoLCx
 Zz5tIn9vzcEVArsdA19qUEC1vqS7AtfMDLg3FolDs6nprmVhDVqm8Ep96yM8E45A4H54
 Q+9CQpdkmGEBeoRf3cJSe8ta1NIUaqPXgTotGg0CUSwdEr0BZBLHY82bYLiSrjH79WO9
 JnirQC9hRuc10KjTU4181MMOej/oOuSesosTtYeNFtlV9ObwFtpoZUgdGusHq9bPb2Ii
 FrWw==
X-Gm-Message-State: AOAM532xZXFTJKlm2yM1Ux1VuNYD7PT2my9ErnlbW0idgUFlP9Pm/sgx
 nKfJNAov6zTHRvFSfv0ZRCSmvCiVgSpi5UGqSufRsA==
X-Google-Smtp-Source: ABdhPJz+c4sPd0st0wG/hpRvPg5vyc/LfCLTGuhRSKXrulcMXkfoD3+moXBmZMvfG7Goru5p2UJC2Ie78VRWqyANYD4=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr16326247wmc.126.1633005703080; 
 Thu, 30 Sep 2021 05:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210927142825.491-1-xchengl.cn@gmail.com>
In-Reply-To: <20210927142825.491-1-xchengl.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 13:40:49 +0100
Message-ID: <CAFEAcA-LhN+Q20xeQ-dh+9a9_Z2ccfmH7caKjNuicNmS0nC_=Q@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: sabrelite: Connect SPI flash CS line to
 GPIO3_19
To: Xuzhou Cheng <xchengl.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>,
 groeck7@gmail.com, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sept 2021 at 15:28, Xuzhou Cheng <xchengl.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> The Linux spi-imx driver does not work on QEMU. The reason is that the
> state of m25p80 loops in STATE_READING_DATA state after receiving
> RDSR command, the new command is ignored. Before sending a new command,
> CS line should be pulled high to make the state of m25p80 back to IDLE.
>
> Currently the SPI flash CS line is connected to the SPI controller, but
> on the real board, it's connected to GPIO3_19. This matches the ecspi1
> device node in the board dts.

Thanks for the effort you put in to track down the root cause of
this bug! Applied to target-arm.next.

-- PMM

