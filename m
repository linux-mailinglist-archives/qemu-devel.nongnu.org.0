Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757B22EA41D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 04:53:11 +0100 (CET)
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwdPC-0002Jf-J4
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 22:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwdNs-0001Bn-L9; Mon, 04 Jan 2021 22:51:48 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:41116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwdNr-0006Jb-1b; Mon, 04 Jan 2021 22:51:48 -0500
Received: by mail-yb1-xb35.google.com with SMTP id w127so28046841ybw.8;
 Mon, 04 Jan 2021 19:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7nz4pSBdnZxedE+I2ZOXRhBAJyTs41Fb/2bnB3jz19g=;
 b=ZhtwQ9g7QbRdkDk6VfKb37KDATaSLgEYaRC/CayKmTh6XuEEqoL6871jFUe9tFsHCL
 p3ZNFCSuFrTKeJe2/ovxW8Zkeq9fMsoybgKiQhh9p5xyOByFcCMqxsZujU7h9Yq4nK9x
 rCPkQ/W0XEnZ1BMpRAZ52iRH8yyGECQniQz7Yzs8T5ij6hWR2BT6qG+lvUeyga+ymKkc
 Bgj4pu/pFo6KCz2RkVUVnofzsKpgavYwiEFkJYaPAQp8Sbr1MOFFbXMthByVQnGvll7F
 LeMhFn6XOwxOOveVxD+NZVBs1U+72zmIzHPqJswsaJr/rEW+TD+SYpBywSFpFEI+tbEH
 dd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nz4pSBdnZxedE+I2ZOXRhBAJyTs41Fb/2bnB3jz19g=;
 b=hSk90VTR5siHxGywFkbBJM9brbFIT0tsUmfH/b69Q4W7Lu9rAYj2lx2TGRUgJapkFU
 Ko9DLsrdaQ7OFQLm4n6xXzXKXp0fCIZIJrIa5UFtNcgkLhYq8Je3C9GJA1rHtAeMQM+3
 sCUk/RdAnyBWYU7M2ANNvQAYRWZld1GoWCnSSXsTNnqei3WBCOBciVJ4hvfHpjVss/aV
 FXhGld3chrLfER3t2nvkyDR7N09WnB6BoJUU1X01iltuLGgfkOUGja8Ad6RtObUufbYs
 E60CB4DNZZ50Qs8Q+be4cz/XZQu5tuVGrNxRYE2WeXvvtwV2NKLgfKYpRT5uJs9bhglH
 sAwA==
X-Gm-Message-State: AOAM5313xp/5Q7RnoEogIfJcdm/u45Cg01SRDBDLqeuJH/OPEWb+HTJN
 0sYavZz8aBlDQyxiiNQrA14PLEVtNOxCSuAsaos=
X-Google-Smtp-Source: ABdhPJypV0rDKMFF0gmp3BqnsdrUG6nE31YBHZNckMvZXavpLChwHUA45Z4r3SY84KD9cfKGNUfQXsoOIZWffAEvzu8=
X-Received: by 2002:a25:e70e:: with SMTP id e14mr50592011ybh.332.1609818705824; 
 Mon, 04 Jan 2021 19:51:45 -0800 (PST)
MIME-Version: 1.0
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 11:51:34 +0800
Message-ID: <CAEUhbmURMNzT5T_LOVvi+m0658jVZhXrEuP=JhJL+pVCbDFuLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 23, 2020 at 2:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> U-Boot expects PMU_MISC0 register bit 7 is set (see init_bandgap()
> in arch/arm/mach-imx/mx6/soc.c) during boot. This bit indicates the
> bandgap has stabilized.
>
> With this change, the latest upstream U-Boot (v2021.01-rc3) for imx6
> sabrelite board (mx6qsabrelite_defconfig), with a slight change made
> by switching CONFIG_OF_SEPARATE to CONFIG_OF_EMBED, boots to U-Boot
> shell on QEMU with the following command:
>
> $ qemu-system-arm -M sabrelite -smp 4 -m 1G -kernel u-boot \
>     -display none -serial null -serial stdio
>
> Boot log below:
>
>   U-Boot 2021.01-rc3 (Dec 12 2020 - 17:40:02 +0800)
>
>   CPU:   Freescale i.MX?? rev1.0 at 792 MHz
>   Reset cause: POR
>   Model: Freescale i.MX6 Quad SABRE Lite Board
>   Board: SABRE Lite
>   I2C:   ready
>   DRAM:  1 GiB
>   force_idle_bus: sda=0 scl=0 sda.gp=0x5c scl.gp=0x55
>   force_idle_bus: failed to clear bus, sda=0 scl=0
>   force_idle_bus: sda=0 scl=0 sda.gp=0x6d scl.gp=0x6c
>   force_idle_bus: failed to clear bus, sda=0 scl=0
>   force_idle_bus: sda=0 scl=0 sda.gp=0xcb scl.gp=0x5
>   force_idle_bus: failed to clear bus, sda=0 scl=0
>   MMC:   FSL_SDHC: 0, FSL_SDHC: 1
>   Loading Environment from MMC... *** Warning - No block device, using default environment
>
>   In:    serial
>   Out:   serial
>   Err:   serial
>   Net:   Board Net Initialization Failed
>   No ethernet found.
>   starting USB...
>   Bus usb@2184000: usb dr_mode not found
>   USB EHCI 1.00
>   Bus usb@2184200: USB EHCI 1.00
>   scanning bus usb@2184000 for devices... 1 USB Device(s) found
>   scanning bus usb@2184200 for devices... 1 USB Device(s) found
>          scanning usb for storage devices... 0 Storage Device(s) found
>          scanning usb for ethernet devices... 0 Ethernet Device(s) found
>   Hit any key to stop autoboot:  0
>   =>
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v1)
>
>  hw/misc/imx6_ccm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Ping?

