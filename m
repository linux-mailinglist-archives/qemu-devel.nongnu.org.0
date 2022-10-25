Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B660D7F3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 01:33:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onTN7-0005Eg-Tw; Tue, 25 Oct 2022 19:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTN5-00052O-PH
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:30:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTN0-00005h-LH
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:30:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so272348wme.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=APGCYcij2GsVt8OaufgS3UmBfsHUAq1IFBMthXFCCEs=;
 b=x2vg6AB1P3wBZNH/3F7icolJJmh6aA215Qht149XzCAeh5ZU8omyt2lDq7rRk+Vf+/
 0rmTjmesyliCdHHlX5jHJC5tOi6lR1QqigtsGEW6V+xpuAlpr90I4mrkfvJldHDVlTnB
 kojvhVTxgqFPZOLd7Y8FzNqpsFMtkoACGzemNsw8tEiqriUGUj+j4TT+CgUZSmttpN4z
 7zDCvCeoy72Yr6cFdrlmm35LCUrtr3eL+vLdq+UuK7DlRn0JKxkPQNmf20L5lG2+ZhS9
 muSs1C/0b2YXeP6GIp6gwiCo0JRekxi+hVUkHPW1hmbcoLodRoFpZMypLnuPgJHYAEjW
 NWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=APGCYcij2GsVt8OaufgS3UmBfsHUAq1IFBMthXFCCEs=;
 b=V9BLgUzXO5E7ybqU2Y/GBaOWRH4/LRqIOJgGu2vnGegIF8ScGYJGnAezTzhyXKNC27
 OWC6oBAA3s60mCuSJkhj98lw/S/jhNkkGPfXzvcM/4+GUzWrJcWUMH9EqFiN32/Q6Php
 0aaMmYap1Y+pkQ37Lf/toQqTRp8/mOF5AMM39aH1Zow++UkYtgXcFWWI9UNPiJ9rImWk
 DcEJgxmjHXuxQy+zHtsky1fvsELtsFCe4XJLQK06Bkn7kN9hv9rJj1IYosbIb7CStnSf
 8DLbzOH57yVG0wjanHPrzTTMzVxNb4u0ga7wyhhas9e8crLi9+/4URhs1vtYP0+sp04y
 Fpnw==
X-Gm-Message-State: ACrzQf0CsZQP6YzGu4UZjrIrUUiDfK4GNxSkUcjElCWxCnwE4Ht/EBy9
 sAPwabrVd8PHySby24fMs9sGNQ==
X-Google-Smtp-Source: AMsMyM7+0F2m1r7rfj1n/fF2PT9aAcNxLPK2J+qSctwNSYtigyH+u00Yy15UdHl2yyKQKAq+0UVr6A==
X-Received: by 2002:a05:600c:681:b0:3c6:bafd:cb48 with SMTP id
 a1-20020a05600c068100b003c6bafdcb48mr409234wmn.57.1666740604792; 
 Tue, 25 Oct 2022 16:30:04 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b0022cd27bc8c1sm4697310wrf.9.2022.10.25.16.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 16:30:04 -0700 (PDT)
Message-ID: <c7e07496-ca62-ce91-b2d4-a49b12d51c49@linaro.org>
Date: Wed, 26 Oct 2022 01:30:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 08/43] hw/ide/piix: Introduce TYPE_ macros for PIIX IDE
 controllers
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-9-shentey@gmail.com>
Content-Language: en-US
In-Reply-To: <20221022150508.26830-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/10/22 17:04, Bernhard Beschow wrote:
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c     | 3 ++-
>   hw/ide/piix.c         | 5 +++--
>   hw/isa/piix4.c        | 3 ++-
>   include/hw/ide/piix.h | 7 +++++++
>   4 files changed, 14 insertions(+), 4 deletions(-)
>   create mode 100644 include/hw/ide/piix.h

> diff --git a/include/hw/ide/piix.h b/include/hw/ide/piix.h
> new file mode 100644
> index 0000000000..ef3ef3d62d
> --- /dev/null
> +++ b/include/hw/ide/piix.h
> @@ -0,0 +1,7 @@
> +#ifndef HW_IDE_PIIX_H
> +#define HW_IDE_PIIX_H
> +
> +#define TYPE_PIIX3_IDE "piix3-ide"
> +#define TYPE_PIIX4_IDE "piix4-ide"

I'd have added that to include/hw/southbridge/piix.h, but I
understand some machines want to include parts of PIIX, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



