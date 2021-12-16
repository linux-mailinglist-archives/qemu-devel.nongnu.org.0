Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E41476733
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 02:01:51 +0100 (CET)
Received: from localhost ([::1]:46712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxf9a-0003Xq-2a
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 20:01:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxf81-0001ph-S5
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:00:13 -0500
Received: from [2607:f8b0:4864:20::635] (port=43934
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxf7y-0008FP-94
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:00:13 -0500
Received: by mail-pl1-x635.google.com with SMTP id m24so18030645pls.10
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 17:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ikWd3VQC2+20Vp7/OjWqaJ5RoJxCOwU9bWwA9EvIPRQ=;
 b=wN3XH4LOOUH5FaBfYwE1jHAtxyqI+Av63gp+tg2M1UHzA1SVIKpqQslnmM1UIJe8PD
 oR90H8ZSo5MOU4wz78q7SXprqs7OlF1OmYKkGGqoVA+xPNjlUzuUpvagO433MME2x0oC
 kEjPS3VZoVzw72+p0oUQ/N1KTB/DtNmo2LuBYWTaBRZZAxf59RYb7omNRuwwmGj9Vypa
 ulayrCMw3xxA5Z+IRnVB0m1O5WGuo2XsUttJrDxYx3ivYOrdyIPGsJ9siFHiSPDbal9V
 yMOkAYm2qwYj3oRLW54JwGClLEIM6/d/k73MhEMw7vTgJ8zOyTP1ny/5YrOr5lNsCW8n
 0zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ikWd3VQC2+20Vp7/OjWqaJ5RoJxCOwU9bWwA9EvIPRQ=;
 b=eMcv2P+zMm2Az7OMNI8d00naqduGxTxnHJVB3CuOpmSsHz53kOnLCOxJjCgCiQw1ez
 FUzik6I1DmxcTuKrVN7fXL/ITfy47U8y4nKxSrgD/Q4Vq/5ujYl9c6D/7KpjXFYDDWrb
 CHN+fXIb4cQmFb586lkd5Twz0sg6WBDGezhW0vikmZsxQLoQWD7JRAbKv/PZ8sPHzBzt
 dcY65Q5/8G0pbeMIGk4BimsqtY7LMZHtMBDe5BXaq/MG7x06sFRFXq+ZbA6IkGybas6c
 3qaN5O/igQDzqqAXBlztwRzYPYS31zf0IaaXPL6QUOeXjCB/awhTlC/RFPnPUiCJE//1
 fFqQ==
X-Gm-Message-State: AOAM531s3NMuF9ddoKsuZrJ5pUh2c7rtKRiMuy21qdLIZGWpnRdKxto3
 NGivIN5qM+GijQzOB/sAJ2uM8gYpUbTSJQ==
X-Google-Smtp-Source: ABdhPJzdbSSM8dC86nechScdbAQzuLuJOrYBN3246PFPTf9RLoFkQyr3zX61uGoALBO0l/ABF9ZgEQ==
X-Received: by 2002:a17:902:d488:b0:141:f3a3:d2f4 with SMTP id
 c8-20020a170902d48800b00141f3a3d2f4mr14042798plg.86.1639616408648; 
 Wed, 15 Dec 2021 17:00:08 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b18sm3707933pfl.121.2021.12.15.17.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 17:00:08 -0800 (PST)
Subject: Re: [PULL 00/13] Block device patches patches for 2021-12-15
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211215140222.769652-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f31b13b7-4ab7-1e9a-3516-2792b0612bdf@linaro.org>
Date: Wed, 15 Dec 2021 17:00:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215140222.769652-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 6:02 AM, Markus Armbruster wrote:
> The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-14 12:46:18 -0800)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-block-2021-12-15
> 
> for you to fetch changes up to 95fd260f0a3663ed229b8e0d2ef111a9f8bd93ad:
> 
>    blockdev: Drop unused drive_get_next() (2021-12-15 14:56:14 +0100)
> 
> ----------------------------------------------------------------
> Block device patches patches for 2021-12-15
> 
> ----------------------------------------------------------------
> Markus Armbruster (13):
>        hw/sd/ssi-sd: Do not create SD card within controller's realize
>        hw: Replace trivial drive_get_next() by drive_get()
>        hw/arm/npcm7xx_boards: Replace drive_get_next() by drive_get()
>        hw/arm/versatilepb hw/arm/vexpress: Replace drive_get_next() by drive_get()
>        hw/arm/imx25_pdk: Replace drive_get_next() by drive_get()
>        hw/arm/mcimx6ul-evk: Replace drive_get_next() by drive_get()
>        hw/arm/mcimx7d-sabre: Replace drive_get_next() by drive_get()
>        hw/arm/xlnx-versal-virt: Replace drive_get_next() by drive_get()
>        hw/microblaze: Replace drive_get_next() by drive_get()
>        hw/arm/xlnx-zcu102: Replace drive_get_next() by drive_get()
>        hw/arm/xilinx_zynq: Replace drive_get_next() by drive_get()
>        hw/arm/aspeed: Replace drive_get_next() by drive_get()
>        blockdev: Drop unused drive_get_next()
> 
>   include/sysemu/blockdev.h           |  1 -
>   blockdev.c                          | 10 ----------
>   hw/arm/aspeed.c                     | 21 +++++++++++++--------
>   hw/arm/cubieboard.c                 |  2 +-
>   hw/arm/imx25_pdk.c                  |  2 +-
>   hw/arm/integratorcp.c               |  2 +-
>   hw/arm/mcimx6ul-evk.c               |  2 +-
>   hw/arm/mcimx7d-sabre.c              |  2 +-
>   hw/arm/msf2-som.c                   |  2 +-
>   hw/arm/npcm7xx_boards.c             |  6 +++---
>   hw/arm/orangepi.c                   |  2 +-
>   hw/arm/raspi.c                      |  2 +-
>   hw/arm/realview.c                   |  2 +-
>   hw/arm/sabrelite.c                  |  2 +-
>   hw/arm/stellaris.c                  | 15 ++++++++++++++-
>   hw/arm/versatilepb.c                |  4 ++--
>   hw/arm/vexpress.c                   |  6 +++---
>   hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>   hw/arm/xlnx-versal-virt.c           |  3 ++-
>   hw/arm/xlnx-zcu102.c                |  6 +++---
>   hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>   hw/misc/sifive_u_otp.c              |  4 ++--
>   hw/riscv/microchip_pfsoc.c          |  2 +-
>   hw/riscv/sifive_u.c                 | 15 +++++++++++++--
>   hw/sd/ssi-sd.c                      | 29 +----------------------------
>   hw/sparc64/niagara.c                |  2 +-
>   26 files changed, 78 insertions(+), 84 deletions(-)

Applied, thanks.

r~


