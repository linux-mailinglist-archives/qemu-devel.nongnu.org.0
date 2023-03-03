Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58F6A950A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:17:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2S7-0006Nd-OZ; Fri, 03 Mar 2023 05:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2S6-0006MV-AM
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:15:50 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2S4-0000w7-AA
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:15:50 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l1so1688468wry.12
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677838546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OdoP+zNS352Ldv0xPO0LUJLGgWyE5Oog1llpZ74DCCc=;
 b=LLaQfiH2lv33lbhVDmH2Nr69Z8helPy08qKxoXBsYtPuBBEpwxq9mLrgcYWRDiYK8x
 zOHmB8koWOGWFiCQLdWkh13wVOUYjdEvD6yX4/GnuElk1HNtkWPO6K22N+Bs6EZ+Duqo
 ZsECehfqS5nE5VqKP0X6X6yy+rZEmWuRHo2atoX1ea27vv0F2bIq06UZvcSvzSYOKwOD
 z48SJwdjz2Ng2vPYUjwpMwkcgdOCoV84oSps/Gw+YNJ2g9/7OpVymneH583X1U9TJo85
 0gsyVmuWMaCxu8Wakw9DiCohjYVg/OVlLcwsgFYVkJ5sBmK+mVREypZEIxTz1pYxCP7Z
 eKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677838546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OdoP+zNS352Ldv0xPO0LUJLGgWyE5Oog1llpZ74DCCc=;
 b=h0tqM3CDCh41vAzFhdCPWNjR/DaImGDnFqB4GqobbdvDdI7FkmO3YoF2AY0ZCMRwNg
 Y2HLrFfjyyx9PmFTgAQIYIp7YT8x8MDxCnREJkRX63M3XR8DBzVR9Uwqz0WbpyJWGIIU
 yHeTGcGSYVFIy/AdtvpuDa5AtAV++IV2PPPdOcSSrToScV4Du3++ngYZM4Cvke8TrO0O
 S/PQQKgaIJcc1zx7odziVXlsiVber/ljtr885a73dkYsXDSObFaRu8YcqPzn5AMVyFU2
 oWUmZrQ0ZUdx6sf7qUMw2OcrXvyDHPVnfjPaJOq+NThqoaFhLpWdge+XOHnDjXW6Na4+
 jkVw==
X-Gm-Message-State: AO0yUKWmWTSnNw6dwNy7OVGLC1ifw9eocnPlSviEC8xBphcIFo6O/3E+
 HZTgUM/aGQVaBN9Gm1JekAYiiA==
X-Google-Smtp-Source: AK7set873DHO5NJxK+sErOmxAQTub9W1kd9EK71Icfb78w3M5NaHDdmG1m81bBoQMn0RS/iO+znsOA==
X-Received: by 2002:a5d:456a:0:b0:2c9:bae4:8e4a with SMTP id
 a10-20020a5d456a000000b002c9bae48e4amr924750wrc.26.1677838546581; 
 Fri, 03 Mar 2023 02:15:46 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d610b000000b002c5a790e959sm1776360wrt.19.2023.03.03.02.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:15:46 -0800 (PST)
Message-ID: <dfb74ad1-a228-4a63-a01b-70e935de57d0@linaro.org>
Date: Fri, 3 Mar 2023 11:15:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 6/6] Add the AEHD implementation.
Content-Language: en-US
To: Haitao Shan <hshan@google.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Haitao Shan <haitao.shan@google.com>,
 "open list:Android Emulator..." <emu-dev@google.com>
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303022618.4098825-6-hshan@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303022618.4098825-6-hshan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/3/23 03:26, Haitao Shan wrote:
> Implement the AEHD accelerator including the AEHD AccelClass,
> AccelCPUClass, AccelOpsClass.
> 
> Signed-off-by: Haitao Shan <hshan@google.com>
> ---
>   hw/i386/x86.c                     |    2 +-
>   include/exec/ram_addr.h           |    2 -
>   include/sysemu/aehd.h             |   87 ++
>   include/sysemu/hw_accel.h         |    1 +
>   target/i386/aehd/aehd-accel-ops.c |  119 ++
>   target/i386/aehd/aehd-accel-ops.h |   22 +
>   target/i386/aehd/aehd-all.c       | 1020 +++++++++++++++
>   target/i386/aehd/aehd-cpu.c       |  150 +++
>   target/i386/aehd/aehd-cpu.h       |   41 +
>   target/i386/aehd/aehd-stub.c      |   22 +
>   target/i386/aehd/aehd.c           | 1915 +++++++++++++++++++++++++++++
>   target/i386/aehd/aehd_i386.h      |   26 +
>   target/i386/aehd/aehd_int.h       |    2 +-
>   target/i386/aehd/meson.build      |    4 +
>   target/i386/cpu.c                 |   12 +-
>   target/i386/cpu.h                 |    5 +-
>   target/i386/helper.c              |    3 +
>   target/i386/meson.build           |    1 +
>   18 files changed, 3428 insertions(+), 6 deletions(-)

I'm not going to review a 3000+ LoC patch, sorry.

1/ it is too big for my brain and I'm going to miss things
2/ it is likely duplicating KVM identical code; if so we
    should refactor to use common code. In particular because
    we can fix bugs once.

>   create mode 100644 target/i386/aehd/aehd-accel-ops.c
>   create mode 100644 target/i386/aehd/aehd-accel-ops.h
>   create mode 100644 target/i386/aehd/aehd-cpu.c
>   create mode 100644 target/i386/aehd/aehd-cpu.h
>   create mode 100644 target/i386/aehd/aehd-stub.c
>   create mode 100644 target/i386/aehd/aehd_i386.h


> --- /dev/null
> +++ b/target/i386/aehd/aehd-accel-ops.c
> @@ -0,0 +1,119 @@
> +/*
> + * QEMU AEHD support
> + *
> + * Copyright IBM, Corp. 2008
> + *           Red Hat, Inc. 2008
> + *
> + * Authors:
> + *  Anthony Liguori   <aliguori@us.ibm.com>
> + *  Glauber Costa     <gcosta@redhat.com>

In various files you add in this series you use incorrect
author / (c). While you copy/paste their implementation,
they didn't authored this AEHD implementation (which is based
on their work).

