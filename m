Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2362369C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 23:31:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ostaX-0000U8-8p; Wed, 09 Nov 2022 17:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ostaL-0000Py-Bh
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:30:21 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ostaJ-0003ki-J8
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:30:17 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o4so28011566wrq.6
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 14:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XE5DGm7FvXU6qroNno/aeCApT2yqRvPGBWJreXVEYUc=;
 b=Zdwa6t+JJ+oHLr3djJnugK4Qcm3LajFRZ1N3jlbBc3PMmGm7cGvIKtyaGdUvwbWcGO
 lZYLmMPqY2zh1D1Uk06/E9Brz7lVsGhZoKfKBF+x/Jj2pQ7BcEzzc8wTpk9/qPf6ZnCD
 cjky0aaGGTFQTl8Vh+6Q1FmKHXC2QCVTfsOz6jK32kqnNFYisZF2a4Pwk15QAiO8EtNg
 Sf9i6YgmMjE16w+FZnvoLjfHcKVnWbs9sThO9CnBJNx/E/vY6DniEpgcKHHO/O4gmxNK
 OLRIcbNN2jJHOSx6WDiyEThyjtjE2SUkr8kPw/9+SxS6nDRwm394lBkfcXCcUSt9s43P
 7QFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XE5DGm7FvXU6qroNno/aeCApT2yqRvPGBWJreXVEYUc=;
 b=Vh7jAUCX3BUA2I/PsLPoyn06z9UYuEWuBlkKnsxbN9TKGYULv46CLbVsIRjJgv0Wjv
 tAlh+QAhvYksvgqemgPr8Io5nMm5h6zeYR9f5O/1eI0y4mQ295E+MqivRWpQKafT2zsU
 Nfe7ymywy0ALdnMt33B8iCB7zRlzYTa82lCBrQpgsII6cBur9HNpzeNc6RJGmWWYOpCL
 YzCa/Owr2b9SBglGqIC/3EgQswbgiiORh8v2Ro8GpYYHM4ru6H8Inz5nj00O8IcX0V+S
 jjoE3hNBntvcFuHMaIZIDOuA9J58z4P691kLZR1NjgEvE/WrOymFN3nCxZWFpOiE/trJ
 JlQg==
X-Gm-Message-State: ACrzQf0vcYbjatV1nWlnX5N0/E2xGrQgPGN3nyi+42xcD76cmtfRHSDY
 3Bp1GEZvrYwXaG9lcACCcrb2LRxiiJ8/yQ==
X-Google-Smtp-Source: AMsMyM6/wKvvAALgGupKsgdjPYbeAujULCd9Ap5L8r3zCJWws5ss6dCHe/YDvq03XITDN6WCqxNljw==
X-Received: by 2002:a05:6000:16c8:b0:236:c60d:22b9 with SMTP id
 h8-20020a05600016c800b00236c60d22b9mr36081387wrf.526.1668033013565; 
 Wed, 09 Nov 2022 14:30:13 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adfec91000000b002366e8eee11sm13950805wrn.101.2022.11.09.14.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 14:30:13 -0800 (PST)
Message-ID: <3f256e04-5f32-04e1-011b-bfd3f71a94f6@linaro.org>
Date: Wed, 9 Nov 2022 23:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH-for-7.2] hw/display: Declare build_vga_aml() out of
 "vga_int.h"
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Frederic Bezies <fredbezies@gmail.com>, Laurent Vivier <lvivier@redhat.com>
References: <20221109222312.29347-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109222312.29347-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/11/22 23:23, Philippe Mathieu-Daudé wrote:
> Commit cfead31326 declared build_vga_aml() in "vga_int.h".
> This header happens to include various other things, such
> (indirectly) pixman headers.
> 
> The freshly introduced acpi-vga.c includes "vga_int.h" to
> get build_vga_aml() declaration, but ends including the
> 'various other things' triggering this build failure (QEMU
> configured as '--enable-modules --disable-spice'):
> 
>    In file included from /home/fred/qemu-git/src/qemu/include/ui/console.h:4,
>                   from ../hw/display/vga_int.h:30,
>                   from ../hw/display/acpi-vga.c:4:
>    include/ui/qemu-pixman.h:12:10: fatal error: pixman.h: No such file or directory
>       12 | #include <pixman.h>
>          |          ^~~~~~~~~~
> 
> Resolve by declaring build_vga_aml() in a ACPI/VGA specific
> header named "acpi-vga.h". Adjust MAINTAINERS to avoid
> checkpatch warnings.
> 
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Reported-by: Frederic Bezies <fredbezies@gmail.com>
> Reported-by: Laurent Vivier <lvivier@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1308
> Fixes: cfead31326 ("AcpiDevAmlIf interface to build VGA device descs")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                |  1 +
>   hw/display/acpi-vga-stub.c |  2 +-
>   hw/display/acpi-vga.c      |  2 +-
>   hw/display/acpi-vga.h      | 10 ++++++++++
>   hw/display/vga-pci.c       |  1 +
>   hw/display/vga_int.h       |  2 --
>   6 files changed, 14 insertions(+), 4 deletions(-)
>   create mode 100644 hw/display/acpi-vga.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index caba73ec41..af4d3bd8fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1844,6 +1844,7 @@ S: Supported
>   F: include/hw/acpi/*
>   F: include/hw/firmware/smbios.h
>   F: hw/acpi/*
> +F: hw/display/acpi*
>   F: hw/smbios/*
>   F: hw/i386/acpi-build.[hc]
>   F: hw/arm/virt-acpi-build.c

Please discard in favor of
https://lore.kernel.org/qemu-devel/20221109222112.74519-1-mst@redhat.com/

Note, the MAINTAINERS part is worth salvaging.

