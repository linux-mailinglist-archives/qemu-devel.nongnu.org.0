Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB732E319C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 15:53:24 +0100 (CET)
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXQB-00079j-Cd
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 09:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXOt-0006iW-GY
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:52:03 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:32999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXOr-0007vv-HB
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:52:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id n16so5923698wmc.0
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 06:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wuYiECpgOxEqfW5U4bFAzxTeOsTPl/53AETSPcKe5Uo=;
 b=s+pOnLVUEwb+aVnbOEe1GCaDn/HsyhRKGQXnVqmz1DUL/KVTZ/rSKxaQkMQJD4jz/f
 diD3kQp4keCkCG3HCx4optRksd1GNk9xxGJ4ffPwJcWELAT7l9K3ZN2+MQQ6dIquRAyO
 ZHv/eWzKL4Xizkgln6ojylFHKATguElWnImShU+YswgN0RG2uvwTGpV3mfqwdWsBtaqW
 3NB0SBD2RzAnSt8LL/omw64TdCteqetyQ9VDBrVRru4AJsiIzEe7mARkeHHT28/17XK/
 vj4md7rO1Uv3myu5dmNmTjsAjGTcyco66xdtIwyqoJK4EkVX0UlgTQZ5PjFeZBsg8ZT1
 YJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wuYiECpgOxEqfW5U4bFAzxTeOsTPl/53AETSPcKe5Uo=;
 b=HuO2kHPSw/lDIxI+PFHGILHT+9HUjSL8PLxPj0EgAdaQWs+rra6mvHUJuZbSAPiXdY
 Woj0TvihYCDznlZUjK1VpFqSTj6CJVrl2Oq9rlmH39Jk17/1xDil7GuAIIwucdIQg8Ji
 USrnAcIQraRtwbdH4li/QyqaACZnyca0gJZl2JEZgJxe74mTzIfNSPtgDHY9CAwj6soz
 eQ2U+n1dzmqRI4Oafz3f19Wn7XkmlLE/tBJiWk3FprINYZluJ8tnYiM5R1i6jgTplF9C
 IHzgzMgIaDnf0hnTbLd3IRBQBki1OLlOxc0ds7JtsM5o32wTbr7FKvY8j3CBOd27f8nd
 D8Rg==
X-Gm-Message-State: AOAM533+EYioKD/YEC5Aft1LduNGT4WuqUrGH3kadGaTpiZErEv3k8yB
 TOFFnQu0UjP/2hN8QpJRUpY=
X-Google-Smtp-Source: ABdhPJxgDYkZwqt0th6wnXBlZby++pRJqWAc5hQMeUNSjY0LgN3EHsEJKh5Mrsf297NadRbLPu+HEQ==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr16697815wme.99.1609080720031; 
 Sun, 27 Dec 2020 06:52:00 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id a12sm56310398wrh.71.2020.12.27.06.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 06:51:59 -0800 (PST)
Subject: Re: [PATCH 10/12] vt82c686: Remove unneeded includes and defines
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <731de10b2fd4e878146939bc8b0a5129913fd173.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ca5b05dc-4c13-1539-b500-e6c46a8b7664@amsat.org>
Date: Sun, 27 Dec 2020 15:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <731de10b2fd4e878146939bc8b0a5129913fd173.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
> These are not used or not needed.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 789459bcae..6dff2bc67d 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -12,22 +12,16 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/isa/vt82c686.h"
> -#include "hw/i2c/i2c.h"

Maybe squash this one in patch 8 "Remove vt82c686b_pm_init"?

>  #include "hw/pci/pci.h"
>  #include "hw/qdev-properties.h"
> -#include "hw/isa/isa.h"

Used for isa_bus_new().

>  #include "hw/isa/superio.h"
> -#include "hw/sysbus.h"

OK.

>  #include "migration/vmstate.h"
> -#include "hw/mips/mips.h"

Indeed I can't see anything in commit edf79e66c02 ("Initial support
of vt82686b south bridge used by fulong mini pc") requiring it.

>  #include "hw/isa/apm.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/i2c/pm_smbus.h"
>  #include "qapi/error.h"
> -#include "qemu/module.h"

type_init().

>  #include "qemu/timer.h"
>  #include "exec/address-spaces.h"
> -#include "qom/object.h"

OK.

>  #include "trace.h"
>  
>  typedef struct SuperIOConfig {
> @@ -137,8 +131,6 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>      }
>  }
>  
> -#define ACPI_DBG_IO_ADDR  0xb044
> -
>  struct VT686PMState {
>      PCIDevice dev;
>      MemoryRegion io;
> 

