Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DDF4A38BE
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 20:47:27 +0100 (CET)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEGAY-0004Ro-AR
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 14:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEG28-0002ZA-1p; Sun, 30 Jan 2022 14:38:44 -0500
Received: from [2a00:1450:4864:20::333] (port=52875
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEG26-0002Ia-FS; Sun, 30 Jan 2022 14:38:43 -0500
Received: by mail-wm1-x333.google.com with SMTP id v123so8768852wme.2;
 Sun, 30 Jan 2022 11:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=se8wSDAh7T/fYxF6TOXbwzNWYEVC+EVgFuohKBrq0pM=;
 b=G070xyz+I3nvwNyK6g3NkzOj509YIix3NeVmbnoWt1szcIES9MIjFHkdoqITqO5Cl9
 tI3KYRTCY0vPbjUCZL518yHL/7k+YrY2trca+Ak1/5o1V4FY33gxejTXXbuO46TZ1gDC
 T2LgksoWNGcpgqOJyJZIowM14pKN8dFzj5CNRRv1Ktt2HyFpsZUKADJynD5wzi1A+cDz
 oTmlim+TbTApvXV4YiI9rQg6KVC0kdo3MfufnIxChW57prxnefr/72uHiSCfoF8ixeoS
 M/2yk9fvkniZa30msU+7klsHmIAAggHXaP3S/QwdxjHsSdOIO1yXDW3nqZXQAiwV3bdc
 EYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=se8wSDAh7T/fYxF6TOXbwzNWYEVC+EVgFuohKBrq0pM=;
 b=u+0pFVM1GHsWzj5g/qSYmFvE9gkHeXSHKC9qCmfMizA2HltUVFVeScFKFih69Zgd4g
 IxmDpSfsOIxLJFc8GlRRTIzQZazOAfdm6+3rayEDLdAfCMbDPX+1TWxZxD5dD1OhgYkT
 Mo4hxrMG5eXQ2zSUpVn+jQf31ZOxSd6Q8jMqaxvQYEAvA62m2gfzG4lAdD+d0qxk1GMk
 j+lPXZZDKfbeSShXBTHQUH6PaM/UTNspdMNY87h2BpRDar1PL/dg9LtwMOX2MsQmiJ4H
 Q+qHIb8wDyBSmjLJddS4ZaEc5WK2qk4PKA5ZSn6QgtDZazNwY+UPy+EMT7SfrcwK5Fs1
 593g==
X-Gm-Message-State: AOAM53058tZxJSzLqwwXwvwhx71dpJyFS8GkZ8DaigFnfFJj6t2YSDGO
 ycl2nzJKPUvlLAorbuUBOnKNBtR256A=
X-Google-Smtp-Source: ABdhPJwP1f/YiQVs3mllLoPAV858x/YxQp0p6VTWASQXYLnBiaMOCBJtZzD9Rc6Yo6WrNgUf8WrvjQ==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr16210611wmq.13.1643571520170; 
 Sun, 30 Jan 2022 11:38:40 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y15sm14405333wry.36.2022.01.30.11.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 11:38:39 -0800 (PST)
Message-ID: <cac5809d-87d0-28dc-8681-e2b8c92a9534@amsat.org>
Date: Sun, 30 Jan 2022 20:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/ppc/vof: Add missing includes
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org
References: <20220122003104.84391-1-f4bug@amsat.org>
In-Reply-To: <20220122003104.84391-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Cc'ing qemu-trivial@

On 22/1/22 01:31, Philippe Mathieu-Daudé wrote:
> vof.h requires "qom/object.h" for DECLARE_CLASS_CHECKERS(),
> "exec/memory.h" for address_space_read/write(),
> "exec/address-spaces.h" for address_space_memory
> and more importantly "cpu.h" for target_ulong.
> 
> vof.c doesn't need "exec/ram_addr.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ppc/vof.c         | 1 -
>   include/hw/ppc/vof.h | 5 +++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index 73adc44ec2..2b63a62875 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -16,7 +16,6 @@
>   #include "qemu/units.h"
>   #include "qemu/log.h"
>   #include "qapi/error.h"
> -#include "exec/ram_addr.h"
>   #include "exec/address-spaces.h"
>   #include "hw/ppc/vof.h"
>   #include "hw/ppc/fdt.h"
> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
> index 97fdef758b..f8c0effcaf 100644
> --- a/include/hw/ppc/vof.h
> +++ b/include/hw/ppc/vof.h
> @@ -6,6 +6,11 @@
>   #ifndef HW_VOF_H
>   #define HW_VOF_H
>   
> +#include "qom/object.h"
> +#include "exec/address-spaces.h"
> +#include "exec/memory.h"
> +#include "cpu.h"
> +
>   typedef struct Vof {
>       uint64_t top_addr; /* copied from rma_size */
>       GArray *claimed; /* array of SpaprOfClaimed */


