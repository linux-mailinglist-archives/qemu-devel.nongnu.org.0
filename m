Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B27B44AD5A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:17:03 +0100 (CET)
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkQ3i-0006IE-FH
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:17:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkQ0v-0002s0-AZ
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:14:09 -0500
Received: from [2a00:1450:4864:20::432] (port=38463
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkQ0s-0003fV-M0
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:14:08 -0500
Received: by mail-wr1-x432.google.com with SMTP id u18so32581252wrg.5
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 04:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BTHG+IHioR9XckfE607EcSZwJKlKt7tdKJYmzr/90Lk=;
 b=h/hjxf2A8HrwYBgmLk9geoNcFlrWyQrqoRm4G2xNsfGHr9AWX54AkmqJ5otghyIBjW
 A+FNm9GpLiA257FOt4SKn7OjEH7WlQnNBZg6TWXsO79X+N50W0qcMYq64RL7Qd70bmOx
 JBWQOAmC7HO1zm3UZm5qdGsh5Kw3TH0qO2XF+XdLtOQucg8a0qZpFrDkfyL87v5xvLzx
 GhbbIi1I36RkPYShEqzPoZ86qNwE68CoRyf6jjDr/NwzINeTgEqVxBsbxGZVB6Hb2GIf
 +SbFPEP2eUSTLyVBZthUFFZO/UTUZeWWAwh+3mdRf+z+XXq6yiRCHd6SLAEu+1hM8+nc
 Ojgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BTHG+IHioR9XckfE607EcSZwJKlKt7tdKJYmzr/90Lk=;
 b=XY9em+JR/CeAHmq/xhUSy6Vxr1Gfg/XjP1HX2FZHPmyg78pomW43oKdzjPkSrt0YZx
 sO/lmN9m5oNsjMGHz2jFbnBppUkEqme5CuMky3iMmsjwDIuUSX7prxSQ/27W+r4Y7ijO
 XS04H+l1wH3G6AKwDmlz25X8pPM3p+H6xYC90AOKHMCTQ4lgw2vud5eW4B0eNvgYQZ/s
 vfNzCEEH+pBMll82wm4KvvUWPDBOzjCUe2fas4p0XZfchxB3ZWvnFQ1jSncF+7KmACiq
 z2QFsu0eyd3iglwbWAtvZptcFaE0zKroBJ4ashUZZZsnc/5YlnFXLfVtpfmmQUj9Vju5
 ue5A==
X-Gm-Message-State: AOAM5320eTZkCbqzp8Yu2r45Gtsa8jDfDypXA4zReoMKdgZnCfPyp64y
 +c7NDFRQenNXmf9CkVnizikWZQ==
X-Google-Smtp-Source: ABdhPJzjqq2NFK2z8tOpRRN9ODkv2sE4OX28Sf3nLayGSwWu0EWN3ph0D4l/3st/3jjVSpHL4DSoWw==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr8645036wrv.73.1636460045190;
 Tue, 09 Nov 2021 04:14:05 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id t4sm2295435wmi.48.2021.11.09.04.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 04:14:04 -0800 (PST)
Subject: Re: [PULL 0/6] Trivial branch for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211109091238.817997-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fce90156-5bfb-5d39-a96d-10125ddbee9a@linaro.org>
Date: Tue, 9 Nov 2021 13:14:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109091238.817997-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 10:12 AM, Laurent Vivier wrote:
> The following changes since commit f10e7b9f6fc18be390b3bc189e04b5147eb8dbf8:
> 
>    Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-6.2-20211109' into staging (2021-11-09 07:18:33 +0100)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
> 
> for you to fetch changes up to 66d96a1901b7d9cfdbc454d407710ca8bfb90947:
> 
>    docs/about/deprecated: Remove empty 'related binaries' section (2021-11-09 10:11:27 +0100)
> 
> ----------------------------------------------------------------
> Trivial branch patches pull request 20211109
> 
> ----------------------------------------------------------------
> 
> BALATON Zoltan (1):
>    hmp: Add shortcut to stop command to match cont
> 
> Laurent Vivier (1):
>    tests/qtest/virtio-net: fix hotplug test case
> 
> Philippe Mathieu-Daudé (4):
>    hw/m68k: Fix typo in SPDX tag
>    .mailmap: Fix more contributor entries
>    meson: Fix 'interpretor' typo
>    docs/about/deprecated: Remove empty 'related binaries' section
> 
>   .mailmap                       | 4 ++++
>   docs/about/deprecated.rst      | 3 ---
>   hmp-commands.hx                | 4 ++--
>   hw/char/goldfish_tty.c         | 2 +-
>   hw/intc/goldfish_pic.c         | 2 +-
>   hw/intc/m68k_irqc.c            | 2 +-
>   hw/m68k/virt.c                 | 2 +-
>   hw/misc/virt_ctrl.c            | 2 +-
>   include/hw/char/goldfish_tty.h | 2 +-
>   include/hw/intc/goldfish_pic.h | 2 +-
>   include/hw/intc/m68k_irqc.h    | 2 +-
>   include/hw/misc/virt_ctrl.h    | 2 +-
>   meson.build                    | 2 +-
>   tests/qtest/virtio-net-test.c  | 2 +-
>   14 files changed, 17 insertions(+), 16 deletions(-)

Applied, thanks.

r~


