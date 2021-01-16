Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1842F8D86
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 15:06:23 +0100 (CET)
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0mDe-0003EX-08
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 09:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0mBg-0002OX-Um; Sat, 16 Jan 2021 09:04:20 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0mBc-00077G-1H; Sat, 16 Jan 2021 09:04:20 -0500
Received: by mail-yb1-xb34.google.com with SMTP id x78so3468051ybe.11;
 Sat, 16 Jan 2021 06:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+9nb/K8vwwd5x39k2McpOKj8Lo9D+53Dc4FSxYQOg4A=;
 b=pMUS/1dgVdfzcIPIGC20v0SBAHICPI5PRaPb1QjLk1nN6Kn8WvWc9zyrysXATj1M76
 Mi2G5ZoID26pG8vbQgaIWckyCQ9T1jLVr21FDl6Z1K/Gtx4pepBB7YY5elouTWPN9s1Y
 f5SfDndipbljMArCmuRnbUon9CLXayNMXaxtlIgFagpixhjWC2f0rqpJ0CW/h3rtIxFu
 TMSqBCNCoAfM5Xz8rwuiQBuByJkwRNWTqcGfql0AO/FZ6EfO0zC6n2jzO4GPosQ2tbCR
 5vD54z8gqkOrAKHOeBEAkokt3A9rZ1F4q53lXWjAkniXpS7cBPuZPTVs56TysYuYYD5o
 fM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+9nb/K8vwwd5x39k2McpOKj8Lo9D+53Dc4FSxYQOg4A=;
 b=AqeXlLf67WpUDCLNbUxOhi37wu1Q0lwJ0kevLlzr6wmplyc1iWtO56iCP7NejJ4E73
 DFsaNx41W2cVzgqCSyOAc8LpOf1C5/mNx33ur3tT4UyIzdSJhdrRvvdkNexaRJxHBBjf
 8c/Sk+P+ibpO6BKCDaZ7ghSHUN65YrHT9KlS2jcGfEVW3qGkDjc7PQLSrHFj7kj38VE0
 hgP+/VSHOHpbecrg4x956XFY4UH7asuFt3ZOidyZoIfYxPZlwqpx8MO/josJbaHURCfz
 UIJStw5CEAcFA2Oef7hq1NCmse/ASVEHgOcpaasQuYViULxAYb58fhdLRR+1gKN8xAZN
 XgrQ==
X-Gm-Message-State: AOAM531NPbyt05xyST99Z87H63eQfo/NNOedYZSy5FUPE164ZqHsIenp
 7EzwFf4X76Kx3tHwWvpPNxID8qpgwBlpY89jGzg=
X-Google-Smtp-Source: ABdhPJw3XKV2wdlvhoNzf156h1sqIlvq2DHHzXE0Hw8MKMnBgAjv6jaMYGmUOUBMZSOzTaS1RTnFX+ule3qB3dub8Qs=
X-Received: by 2002:a25:2041:: with SMTP id g62mr26121504ybg.152.1610805854382; 
 Sat, 16 Jan 2021 06:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20210115153049.3353008-1-f4bug@amsat.org>
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 16 Jan 2021 22:03:59 +0800
Message-ID: <CAEUhbmXVLKTqQ0GmoYSDtkeiYA96KkuickvLyFm_L6idTNJPkw@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Fri, Jan 15, 2021 at 11:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Hi,
>
> This is how I understand the ecSPI reset works, after
> looking at the IMX6DQRM.pdf datasheet.
>
> This is a respin of Ben's v5 series [*].
>
> Since v6:
> - Dropped "Reduce 'change_mask' variable scope" patch
> - Fixed inverted reset logic
> - Added Juan R-b tags
> - Removed 'RFC' tag as tests pass
>
> Based-on: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
> (queued on riscv-next).
>

This series dropped my imx_spi_soft_reset() change that has the
imx_spi_update_irq() moved from imx_spi_reset(). May I know why?

Regards,
Bin

