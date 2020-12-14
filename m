Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE92D9647
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:26:46 +0100 (CET)
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kol41-0008Cc-6e
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kol2L-0006m6-8i
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:25:01 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kol2J-00016n-9s
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:25:01 -0500
Received: by mail-wm1-x343.google.com with SMTP id g185so14778293wmf.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8wEBO+mN6+K30SOyAyMzzX3KO6gOsRFLDKI9Px8tqrA=;
 b=uA4/EQ/AVBpgVJ+P2lkXhyDfBQyw9o/dAliVqVEqObGVAv7zf/pqAFUr9C9q1Qiq56
 1YlK0TI0T9P46R4zrZGkeggIG3j10ISyaUo8TxgEIauxH6A113jj97jE092H6Jksgs68
 /KgK7PD7MBIDELrAiFtJRAM0xWD3haEG1dXoaO/zlJn2+fRCDJfJfm2eSt8dT1uzPAq2
 5gIB1cip63zGfJlvRjWcA4qaYtbSHi/8dmd/kEBhIC/XDArCdG2BYBy/g+cTW7uwv91j
 zKwUJWqV5uBHap4IFeyfprKoiwCk2EQdh6/4yoTzu24qSh/c1ky351qeasG0m0JJ1etL
 po3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8wEBO+mN6+K30SOyAyMzzX3KO6gOsRFLDKI9Px8tqrA=;
 b=LK0KehoOEi0JuP+ohmBy+UBemeWH9wF52E6j6KTxKtyIlDBQhvKuVbxeytVRfb/luB
 tPpsyXAFynKQC7KNtNNhekfS1VoUWNMbnGJttR95UiVEKfzoOgpyoPX9qpMFbW6M7gch
 +5TGhchYRLRn6/n/NXlFd4I4gAv8rYTyFM2z4tHN9tk273ydw5wt1QYln3Fm3Q5bTdmu
 xKC1ex8//WnFgWyUvJEO4PEjpXiQo8hH7HfEXKqTdOqwQPnu4R6b/MDEPVz4Gw56WsyF
 xegZkI+ay5I/XKLdNpusSt6fAux5iqfZEzhEGule5pI767Q0y+acRMpvEDQMyHxxViBR
 IJEg==
X-Gm-Message-State: AOAM531g6j81CLKYKgKzauy8IRnXbL8DXh+whFcgT/ccvq+vsu725QCs
 dVFl2stRTAfCwFSJxfRpwNcoXQ==
X-Google-Smtp-Source: ABdhPJxm72UMZEc7RNYchDMUr1c4HecSFrPvgJbrpftSgO9033ZNyX0UNRxlbTIY2VSOs+kRagFKHQ==
X-Received: by 2002:a1c:2785:: with SMTP id n127mr3090226wmn.148.1607941497825; 
 Mon, 14 Dec 2020 02:24:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p15sm22151900wrt.15.2020.12.14.02.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 02:24:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0358E1FF7E;
 Mon, 14 Dec 2020 10:24:56 +0000 (GMT)
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: sabrelite: Improve emulation fidelity to
 allow booting upstream U-Boot
Date: Mon, 14 Dec 2020 10:23:54 +0000
In-reply-to: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <87eejsvg5k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present the upstream U-Boot (as of today, v2021.01-rc3) does not
> boot on QEMU sabrelite machine.

Are there any public build artefacts for u-boot on saberlite that could
be used for an acceptance test?

> This fixes several issues to improve emulation fidelity of the i.MX6
> sabrelite board. With this series, upstream U-Boot can boot to U-Boot
> command shell.
>
>
> Bin Meng (3):
>   hw/misc: imx6_ccm: Update PMU_MISC0 reset value
>   hw/msic: imx6_ccm: Correct register value for silicon type
>   hw/arm: sabrelite: Connect the Ethernet PHY at address 6
>
>  hw/arm/sabrelite.c | 4 ++++
>  hw/misc/imx6_ccm.c | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)


--=20
Alex Benn=C3=A9e

