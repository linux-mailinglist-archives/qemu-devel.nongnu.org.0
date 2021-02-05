Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B0310CD3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:00:58 +0100 (CET)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82bR-0000jP-99
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82ZL-0008FU-1T; Fri, 05 Feb 2021 09:58:47 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82ZI-0000QS-W3; Fri, 05 Feb 2021 09:58:46 -0500
Received: by mail-ej1-x62c.google.com with SMTP id i8so12352548ejc.7;
 Fri, 05 Feb 2021 06:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6x7jYRdLvIzMcciYOMf1Fxfpu+l/EBO99NN0NllskSs=;
 b=ZDZHGf/C9gO0Q/JcvDONMFRVduO9QvsdPrWxzKTZIpq8f9+u1uYDgqPoy+PaG7TQ3O
 9jr3HdKWS9D5EOGzUpsAi+yqvn70LHUiNimirlhyouAwVK372saB0afhcgdQxRLaywYH
 1K0h8yAwmHKV0x9xNXm/LGqFU9ZjBnkkHnEbYa/N4YjpxRJXLZ1aAqgiHHOB364PUs0V
 rmEEMrwLq6h87j+FXIzOktuAffgfL9ncOWX+ScU1RbwDmUV86BpZswX0ONZsLowT6a5I
 2aJoCoRPYOj4VW2cISyoK1Y7PuiQU4RDEPH+AqbQWJFhtoSuezR4NGC/ELwO0HDDDE7d
 1c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6x7jYRdLvIzMcciYOMf1Fxfpu+l/EBO99NN0NllskSs=;
 b=XVoeuUm/YohTJBT5aGBHOdEWRHux/Bf6fBJ/phExvLCxOobsglENfUHoYTnzwtjn0Z
 9c6svv2dOHRwJPIoJrT0AZRcb5wQo+T+dYqJvpmE4HcIwDY3ATLB4rTKlAKbs84LiX1v
 R4Q2ULnplKOyXhIaWael4mPXe8xEoPjUu2vP5K/YXIAgekC9fOjIG/7a5r0Fjjrdwzyi
 Kk42yzAuCW4A8JXbv/iMO2HmLjIAS1s4bpcW+nrrFHVzwy1LFQR41P9I0rttdcNaXwOw
 RRm5zm8xAYSSXRnJLG+xPtE5t0XX9+qXycgatd02Og2WYG2qc4m+dN0N3//tSmR89BdC
 WmUQ==
X-Gm-Message-State: AOAM530W9JZDvX08Mr3CKcBi0LI9zZxBMeEvLLsfrsNj+tbBN13M7IJ8
 YLg7/oZLjQDKJh+FJXsRONk=
X-Google-Smtp-Source: ABdhPJwyIoTyB0qds7KKVUhH5+r2fNt0fdo6Splp9xeipsENwRAG3A64TF3L41E8EwMOhYRKUfG/wA==
X-Received: by 2002:a17:906:ada:: with SMTP id
 z26mr4371286ejf.218.1612537121928; 
 Fri, 05 Feb 2021 06:58:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z22sm4042644edb.88.2021.02.05.06.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 06:58:41 -0800 (PST)
Subject: Re: [PATCH 5/9] hw/arm/virt: Improve CPU name in help message
To: qemu-devel@nongnu.org
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-6-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <281cac4e-fda8-ebfb-2f3a-39050d2cf109@amsat.org>
Date: Fri, 5 Feb 2021 15:58:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 3:43 PM, Philippe Mathieu-Daudé wrote:
> When selecting an incorrect CPU, there is a mismatch between the
> CPU name provided and the one displayed (which is some QEMU internal
> name):
> 
>   $ qemu-system-aarch64 -M virt -cpu cortex-a8
>   qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported
> 
> Strip the suffix to display the correct CPU name:
> 
>   $ qemu-system-aarch64 -M virt -cpu cortex-a8
>   qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm

Grrr wrong paste. Should be:

  qemu-system-aarch64: mach-virt: CPU type cortex-a8 not supported

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/virt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 399da734548..7802d3a66e8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1829,7 +1829,10 @@ static void machvirt_init(MachineState *machine)
>      finalize_gic_version(vms);
>  
>      if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
> +        int len = strlen(machine->cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> +
> +        error_report("mach-virt: CPU type %.*s not supported",
> +                     len, machine->cpu_type);
>          exit(1);
>      }
>  
> 

