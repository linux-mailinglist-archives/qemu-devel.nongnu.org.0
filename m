Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C2564061
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 15:31:50 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dDx-0004Y4-Gd
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 09:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7dAb-0000Qf-EC; Sat, 02 Jul 2022 09:28:21 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:35462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7dAZ-00006m-Oq; Sat, 02 Jul 2022 09:28:21 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10be0d7476aso236148fac.2; 
 Sat, 02 Jul 2022 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JFeQwgfCxPWKFYMMVp+A+9YMXdD5H8W7+WZg0KaCAYI=;
 b=fMywRxaSoNjfEasyAERnJBV9DLRdY6+WMHkoTSYkNGRGnBuHZfMWINZU/Qrowp2OaB
 yrDMfu0IsCvjcQ4DTg+Zcw6mHjtJm0aBC+qZbWqldjFayoA2Bmxk2otfXLgQblGREcBU
 cz1UpNO5QLuz4/S/rLDqDlON86ABNLOECpmzjXDAuK1+u5XWaHDDZvIeoX6eiofHM7L+
 6oInOA6596CvvJmjzcA6vrkL1bO56q2tA4M/A9PNDAkOxRZRCj62fU0MKaSk4k7ny3Sx
 AK83IFh5BZ44YMdf6XP+dnEwNa9TXCCeHfNsjnk5GRB0x5XgfVZ8UY4bFUPlXlRbRr93
 XlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JFeQwgfCxPWKFYMMVp+A+9YMXdD5H8W7+WZg0KaCAYI=;
 b=r36GWXOvJmB2rBh3EeodDdhbbl2hcxDE1u7pyNBm+wQCErlOgCo8WmfTFrBroq4LG0
 Ep+4KbuK3QekgGlWI6yunybcKXPoUPocTdDnuTfhAjCYgMVgnBds/FQXaYs+BAzg5d73
 x81ngC4CtlqPYe27HCVKQq0qDClVc9XPCBxqvu0nkMtP0dqpj1n+5xSIP0RMOTKlIa6H
 6EqrX8f5a1YVb27vY8nPaESoshlIjNBXwl/XmslYAR5IWUHqxkxrvUCv7U2XcwGvdFj6
 0vzt9nzqqPWoxFKSh5EUyTHXs9SXZs065uUeaMWngYsvDBsdquqOcxBkk7jJRjfyAlIv
 f67w==
X-Gm-Message-State: AJIora+7J3AUpx0kHJKjw4SwyH78g4Ipu3oXus+szh5YAUoR9L4mtbdt
 9VLjyZIcC4iwM5uL8suAa/4=
X-Google-Smtp-Source: AGRyM1s1340ce/+pZEVmP+E6nls1YNkDWcCTKNzq/a1VTblZJKxeu3uzi/SU0esAO2k4RNZ4pzNzUg==
X-Received: by 2002:a05:6870:e60e:b0:101:344:1c36 with SMTP id
 q14-20020a056870e60e00b0010103441c36mr11015693oag.34.1656768498482; 
 Sat, 02 Jul 2022 06:28:18 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a056870e24800b000e686d13883sm16852594oac.29.2022.07.02.06.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 06:28:18 -0700 (PDT)
Message-ID: <4a7ea10b-9479-1ba7-5caa-f62493163913@gmail.com>
Date: Sat, 2 Jul 2022 10:28:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] target/ppc: Return default CPU for max CPU
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 mopsfelder@gmail.com, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, "Matheus K . Ferst"
 <matheus.ferst@eldorado.org.br>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220628205513.81917-1-muriloo@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220628205513.81917-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 6/28/22 17:55, Murilo Opsfelder Araujo wrote:
> All ppc CPUs represent hardware that exists in the real world, i.e.: we
> do not have a "max" CPU with all possible emulated features enabled.
> Return the default CPU type for the machine because that has greater
> chance of being useful as the "max" CPU.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

> v2:
> - Return the default CPU of the machine instead of hard-coded alias.
> 
> v1: https://lore.kernel.org/qemu-devel/20220531172711.94564-1-muriloo@linux.ibm.com/
> 
>   target/ppc/cpu-models.c |  1 -
>   target/ppc/cpu_init.c   | 19 +++++++++++++++++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 976be5e0d1..05589eb21d 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>       { "755", "755_v2.8" },
>       { "goldfinger", "755_v2.8" },
>       { "7400", "7400_v2.9" },
> -    { "max", "7400_v2.9" },
>       { "g4",  "7400_v2.9" },
>       { "7410", "7410_v1.4" },
>       { "nitro", "7410_v1.4" },
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index c16cb8dbe7..8ee0b7c785 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -47,6 +47,10 @@
>   #include "spr_common.h"
>   #include "power8-pmu.h"
>   
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/boards.h"
> +#endif
> +
>   /* #define PPC_DEBUG_SPR */
>   /* #define USE_APPLE_GDB */
>   
> @@ -6963,6 +6967,21 @@ static ObjectClass *ppc_cpu_class_by_name(const char *name)
>           }
>       }
>   
> +    /*
> +     * All ppc CPUs represent hardware that exists in the real world, i.e.: we
> +     * do not have a "max" CPU with all possible emulated features enabled.
> +     * Return the default CPU type for the machine because that has greater
> +     * chance of being useful as the "max" CPU.
> +     */
> +#if !defined(CONFIG_USER_ONLY)
> +    if (strcmp(name, "max") == 0) {
> +        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> +        if (mc) {
> +            return object_class_by_name(mc->default_cpu_type);
> +        }
> +    }
> +#endif
> +
>       cpu_model = g_ascii_strdown(name, -1);
>       p = ppc_cpu_lookup_alias(cpu_model);
>       if (p) {

