Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013182EA742
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 10:26:59 +0100 (CET)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwicE-0000Ty-2u
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 04:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwiZ6-0007V9-6t
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:23:44 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwiYv-000099-Nh
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:23:44 -0500
Received: by mail-wr1-x430.google.com with SMTP id t16so35434607wra.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 01:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=l+lUEQuZFIcc0NWF7nlafJJcRfNM4V3YFWuroiahE3M=;
 b=uatrzF6NqStRIz07y+fxWdQ4YvH/lkpj5pQNAHnHPMRjcZzZr1xyALExT/YwuDFjFE
 yF9dClfLYtkvNqiXRLfeV+rxNvW8/p/6oAvpOc9wsdFd/ZcSvsraB8Vny4U1b2QILtkm
 PsKKFgOs5agDosKY6eBAb7m/3oYJUkDR9oeqj3q/e44ZBT07YWbLNZm9dSOoFw/SP+Oc
 2a+yZ4re1zZvaf/ooMhoPy9uPrLX0X3V7afC5hUAjPCD2vzk+LwPS3o6jCuKyqLjLBxJ
 7xD+4Tvlzh4u1JZuBeOZNmOXT3GdSTmgJZCsxLzMEknSn0XVLkKCjKOXhx9HYQO2pGJC
 H03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=l+lUEQuZFIcc0NWF7nlafJJcRfNM4V3YFWuroiahE3M=;
 b=EXE25IHLizJ/U4+s4bEBS8my24gDi5SFRRt1XVnaSzwL80UMPj0/PoscjKjV+rYU3h
 GqaGpM2RC9jfbYQDMdJWCwyURzcmI0lIrKaMackeEeMuyfAvxFSjcOAdSUWiJ6s8YD+I
 hIp0a3Suzh5ahl5hS3auqMAQzZDtSJqEwYH35f34tC64f4uC+d0LNfQyrOO7WIH4iXwM
 37ciZzjEYuymvvMiycOLQBHKdgZ+22P3R+y2/cGVu3R2QmfVNny06vTLN6E5FYeWNX26
 DUxscBFxVYW7KShOLlpJDTDDg0JIcsiyWIuwcBseNkMKW1Sck76ITkcnJ5tDZAhfwHqk
 9e8A==
X-Gm-Message-State: AOAM532i1G8AAfaJASR1AKzmrExvQ1WJc6kK2mhoNxD9HqN9OC0g5OfA
 5l/IRGB46nq0RzVPNYWWEF09Wg==
X-Google-Smtp-Source: ABdhPJyTzgFMPXFI4iPff1fqZCmWelpCK/aB5/A+h3FO8f+1GS3J94BK5lnulVAiensBa8hRC9SK/w==
X-Received: by 2002:adf:90e3:: with SMTP id i90mr59318858wri.248.1609838611543; 
 Tue, 05 Jan 2021 01:23:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z63sm3565187wme.8.2021.01.05.01.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 01:23:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A9E9C1FF7E;
 Tue,  5 Jan 2021 09:23:29 +0000 (GMT)
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Tue, 05 Jan 2021 09:23:21 +0000
In-reply-to: <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
Message-ID: <87o8i33ffy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

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
>   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x5c scl.gp=3D0x55
>   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
>   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x6d scl.gp=3D0x6c
>   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
>   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0xcb scl.gp=3D0x5
>   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
>   MMC:   FSL_SDHC: 0, FSL_SDHC: 1
>   Loading Environment from MMC... *** Warning - No block device, using de=
fault environment
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
>   =3D>
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

