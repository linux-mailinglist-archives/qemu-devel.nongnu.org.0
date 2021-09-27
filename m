Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169041922D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:22:37 +0200 (CEST)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnmO-0000qL-4a
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUnci-0004iP-Hr
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:12:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUncg-0003Dd-U2
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:12:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id i23so50985392wrb.2
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BfghJtw5yvTzVUMWrUsk+gH7KRuMJI70dHEi46aSe8I=;
 b=MTupWbDRHNedrtYDiFj3ypJWdjuBENRjZITtZ8VviUTLMI8y+5KDBQOz+SgYb8od/o
 +V1QjKkwuHh+IUybJ57jn6ttC37Qf/L80zq9DUpCJ4Otw6dKKir1keoNwVrNEPcLwioR
 abbaJv5iUPSArrzxmA7kEmEBMbUIQ86lGT0xdBZmQ23mWBprRyBpNlDvNJOz0yyHZTcw
 IzmrPIGuT6BD/4sWscT3dAWppatFVKLiNoK32TazGNI8J4yEHnYYQq+4N5B81TkrLjnN
 wFtYDoJ25A0522CcfoSRS5kmt3Lrx/I/mdImTCwMA5FAYufkD5KLvy21s9+gl8sQGR4M
 49RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BfghJtw5yvTzVUMWrUsk+gH7KRuMJI70dHEi46aSe8I=;
 b=DXRaTZwvTNToMftcbaoNQh03n27duX053CkyBvqEXf/cBfhlD8pqcEgBMkyOezRSyb
 0Zagy2CccCCo0IAY4o7Lq0spRbOQf8dPMm62g8f/hEJ/LGWT/ZmDWme62vWgKzIiEAxp
 z2rEo0rWGufj3X/TBAW8gabMWxfXN0N5eRhryfcYo9MqXX77vvRDdcYNEqmQHTBFVuZ7
 yKa9PU+8OdkcOfY/PUVv+MCkxkyI2cJh500neNcg/e6zZiZ6Y2NQUsnxbU0SFcsaphvm
 y91aAs1ILLtff6zNtN8NZdCpXYnW7w9DaW4V4hCrqbFUDCzoD/ug3OZJCBYxXCqFh/v5
 ONvw==
X-Gm-Message-State: AOAM532gzRA22On5wSO0O0WfjhoR6+iWmlOO2Ab58rqxJbR89oK6+6D3
 wE7SHaNGjOtoZzEwhILGEQzjGxw9rngxNFvO4ASnlA==
X-Google-Smtp-Source: ABdhPJyWoFgxc2guu+8G+syA13RbobkNeJvBLNyupoNzqA7+emDRbpL/sVTSSSIATs0cZLu0qzw617qc2ySnJnaCq80=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr26321618wrw.376.1632737552646; 
 Mon, 27 Sep 2021 03:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210920203931.66527-1-agraf@csgraf.de>
 <CAPan3WpYNJgOE9AVpHPegf4Njm=80YXDQYT_jKhKKhUm=r2=hA@mail.gmail.com>
In-Reply-To: <CAPan3WpYNJgOE9AVpHPegf4Njm=80YXDQYT_jKhKKhUm=r2=hA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 11:11:39 +0100
Message-ID: <CAFEAcA8QQcaBzxMXyWhs+4FQnnEvErfjqoj3idJtgrTjEpiXwQ@mail.gmail.com>
Subject: Re: [PATCH] allwinner-h3: Switch to SMC as PSCI conduit
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sept 2021 at 20:41, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Hi Alexander,
>
> I've tested your patch on the acceptance tests and they all pass:
>
> ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
> ...
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 116.08 s
>
> Also the latest linux kernel is working OK with all cores booting up fine.
>
> At first I couldn't really figure out why simply changing the conduit there works, without also changing the Linux kernel to match.
> But it turns out we just override the provided DTB for this in fdt_add_psci_node() in hw/arm/boot.c and the Linux kernel then uses that to decide between HVC and SMC.
>
> So looks fine to me:
>   Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>   Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Applied to target-arm.next, thanks.

PS: if you put spaces in front of 'Reviewed-by' type tags, the automated
tooling doesn't recognize them.

-- PMM

