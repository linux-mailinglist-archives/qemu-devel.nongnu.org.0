Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD8AE2CD0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 11:07:21 +0200 (CEST)
Received: from localhost ([::1]:35862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNZ5U-0002Mq-Lo
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 05:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iNZ3m-0000so-61
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iNZ3l-0000dG-1a
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:05:34 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iNZ3k-0000cO-RW; Thu, 24 Oct 2019 05:05:32 -0400
Received: by mail-wr1-x444.google.com with SMTP id z11so1776898wro.11;
 Thu, 24 Oct 2019 02:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=VAqQalthoG+xbrZURmZhEGl6mSw37NtdImucMDrxq9c=;
 b=PDWJcV+P+qfaTI4Uk9WRKGz1XZ203NYg01OliYBmrrFXFRzkVXtznWDoTWEZy37umI
 wL3rKi/e1/qDbBC54UrxrKRT8gjMZn/N7ADbJ2V3AT5TECH/0/w6z7u11xg9muSuZ8WX
 PB5fSuKU+vW6kPhAp5f4RjQFHdSZ2ni6YCvIqqZnBUmEfsgyLGDg2bY7xnLc4IfNXR1H
 hIf8aJrKkRo+kWvhAYPlHVXkAvNz3DxdAg1h0n0+2QgxNBFGu2WzK+jolf9aW9VDKBqJ
 HlXvHSArd2zq4v3xIlLlhv/wyZMemCXS4Jjwy4QhHMZkiHlUp5mhXuuWOfGdOjCLISNR
 hWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=VAqQalthoG+xbrZURmZhEGl6mSw37NtdImucMDrxq9c=;
 b=teDp0nZ4kYqQmbZesGjGEJjJd/pK3zxmCVK9kqLz933BahVuQ11alchYMyrZ1ijHQs
 13INZd4uW6w7ghBBD49w/xRaya59tKEd0ve4tkfalv3RUcGIkPrJvfgLOdUV1nDSuyG8
 ROX5n+KA8oaQk1390Kbva56lf0pMVaQgg5Iv3Uflj7YDYZjaj0FstK7mO5Z6pAnlVHdq
 4G7R0dPk2P0A06yi5ZNisug+KgaQ0gOIckSC9tdPt6KXQTSoECY4n5wo3WlpOcKpuoRr
 0Ni0ZpGOce/q/bV1MfQwG54tWqjxzZNvl1NhTNbvvNBKDKwzIhF6nukramQ4kZzULvX4
 9gPQ==
X-Gm-Message-State: APjAAAWg8ea4r/gmR2hvpA/46PvBZJRnb07SW2W6xVhDrCwv6Oj4nPTh
 rrmBUX34rUfOyQrLt1r41pT87CCTtnrQEQ==
X-Google-Smtp-Source: APXvYqx+LNc8c1dbejTMi3x2WgCZPF7Xq26BOkR01LGOSyAsD30rdEefY2o3905WjtSADwI2gOR7sg==
X-Received: by 2002:adf:aacc:: with SMTP id i12mr2796325wrc.15.1571907930926; 
 Thu, 24 Oct 2019 02:05:30 -0700 (PDT)
Received: from Icho (x590ef5e8.dyn.telefonica.de. [89.14.245.232])
 by smtp.gmail.com with ESMTPSA id w9sm17839792wrt.85.2019.10.24.02.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 02:05:30 -0700 (PDT)
Message-ID: <ff4e0bbb9bfdadace1e0442fee0fdcf7fc34ca4f.camel@gmail.com>
Subject: Re: [RFC PATCH 14/14] hw/arm/raspi: Add the Raspberry Pi 4B board
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  qemu-devel@nongnu.org, Pekka Enberg
 <penberg@iki.fi>,  =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>
Date: Thu, 24 Oct 2019 11:01:29 +0200
In-Reply-To: <20190904171315.8354-15-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-15-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
> The Raspberry Pi 4 uses a BCM2711 SoC (based on a BCM2838).
> The SoC can handle up to 8GiB of SDRAM, but we limit it to 4GiB
> (no 8GiB models in the market yet).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index b4db39661f..59ee2f82b4 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -39,11 +39,13 @@ enum BoardIdChip {
>      C_BCM2835 = 0,
>      C_BCM2836 = 1,
>      C_BCM2837 = 2,
> +    C_BCM2711 = 3,
>  };
>  
>  enum BoardIdType {
>      T_2B = 0x04,
>      T_3B = 0x08,
> +    T_4B = 0x11,
>  };
>  
>  enum BoardIdRevision {
> @@ -56,6 +58,7 @@ enum BoardIdRevision {
>  static const char *processor_typename[] = {
>      [C_BCM2836] = TYPE_BCM2836,
>      [C_BCM2837] = TYPE_BCM2837,
> +    [C_BCM2711] = TYPE_BCM2838,
>  };
>  
>  typedef struct BoardInfo BoardInfo;
> @@ -90,6 +93,12 @@ static const BoardInfo bcm283x_boards[] = {
>          .ram_size_min = 1 * GiB,
>          .ram_size_max = 1 * GiB,
>      },
> +    [4] = {
> +        .board_id = 0xc42,
> +        .board_rev = { T_4B, R_1_1, C_BCM2711, M_SONY_UK },
> +        .ram_size_min = 1 * GiB,
> +        .ram_size_max = 4 * GiB,
> +    },
>  };
>  
>  typedef struct RasPiState {
> @@ -336,4 +345,24 @@ static void raspi3_machine_init(MachineClass
> *mc)
>      mc->default_ram_size = 1 * GiB;
>  }
>  DEFINE_MACHINE("raspi3", raspi3_machine_init)
> -#endif
> +
> +static void raspi4_init(MachineState *machine)
> +{
> +    raspi_init(machine, 4);
> +}
> +
> +static void raspi4_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Raspberry Pi 4B";
> +    mc->init = raspi4_init;
> +    mc->block_default_type = IF_SD;
> +    mc->no_parallel = 1;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->max_cpus = BCM283X_NCPUS;
> +    mc->min_cpus = BCM283X_NCPUS;
> +    mc->default_cpus = BCM283X_NCPUS;
> +    mc->default_ram_size = 1 * GiB;
> +}
> +DEFINE_MACHINE("raspi4", raspi4_machine_init)
> +#endif /* TARGET_AARCH64 */
Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>


