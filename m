Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4622264EF67
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:39:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Des-0008KG-Nj; Fri, 16 Dec 2022 11:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6Dep-0008J7-7w; Fri, 16 Dec 2022 11:33:59 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6Dem-00035t-Rl; Fri, 16 Dec 2022 11:33:58 -0500
Received: by mail-oi1-x235.google.com with SMTP id e205so2353092oif.11;
 Fri, 16 Dec 2022 08:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4/3Vkn2xx3xz6e472kxIczxxtylkmd9wx638NPX1n+g=;
 b=PxDfk5NspAfiGuMgYRx9w72ARPiowJyWsDgy5aa1OxJquzS7M6TPGJy0JIb7BrdQzs
 sb5o5HqR9LX9d9isaynWtyGbdiGoBwLMfwjxHGXjNyJ06ddD2psvCOjUsWyaWM/BdRdW
 oQPDEwy2JVFZAJP8dt1DN5q2BPK7bZkgwkDE9toSX5fVb39C3XSu4Jwl0pgWdF6yMsWR
 PkenpDz/WH5stXitEX37TQqeCiYK+OzXX48lfZ9bPR4TNo+G3GCEScRwENofqnvYvS/x
 j5nzYUrCtaU2nv7h7Xaf/Ejl+4yMzwOMSICpCayL9Ela+qnCk/YHy8GvJUv0WyGCM6bD
 NQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4/3Vkn2xx3xz6e472kxIczxxtylkmd9wx638NPX1n+g=;
 b=I8VnQavLwHh+UIWaapwgMv4Khw72CizrnGSlAmjsr/OAv1JxGW6g3PXm7C2K0oB57M
 DxtDNIj4X3flibA3cSin7DijHqur4A/yNrxFYr9+5BtZ0GEw3+fHgeEfLNxmsahrSABn
 eIcdXJYXLRGmmTNZ7fZHVtAU0/402478UZCK8JyJ+klmeonAfRMVRat9RfafSkM73VHM
 2LbgcmSX0ZhicLrxlvmuzvDu9+SlLWra+C3TFRq56vUuTtCRbAtljDr3VxveYQVeTsn/
 2GWHKcQRj/dixC/2syVJPK11V9vInPH3K6zOZWCKYFxlSXfeu0IxwXktJpBlDqL3xX0t
 vDNw==
X-Gm-Message-State: ANoB5plR6nFRTS/On1ruLUrX42+p8MJnbLpuoAkr1YLsjsVHADjEJ9Z/
 TZ83af57rqGFXvUpoDh9FD4=
X-Google-Smtp-Source: AA0mqf4yMl9H4qx/pBHxC77dBXB3/2+tsv9C4HEzb+rdwmFr/3ZmAoYZQQhAuASsANsvY/7CWd8lZw==
X-Received: by 2002:a05:6808:64c:b0:35e:8098:786a with SMTP id
 z12-20020a056808064c00b0035e8098786amr12326399oih.45.1671208434036; 
 Fri, 16 Dec 2022 08:33:54 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 ez6-20020a0568082a0600b0035e7ed5daa1sm896391oib.26.2022.12.16.08.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:33:53 -0800 (PST)
Message-ID: <4d03a8c7-a7ef-cac8-9ca3-f06757131aab@gmail.com>
Date: Fri, 16 Dec 2022 13:33:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 2/4] hw/ppc/vof: Do not include the full "cpu.h"
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221213123550.39302-1-philmd@linaro.org>
 <20221213123550.39302-3-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221213123550.39302-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 12/13/22 09:35, Philippe Mathieu-Daudé wrote:
> "vof.h" doesn't need the full "cpu.h" to get the target_ulong
> definition, including "exec/cpu-defs.h" is enough.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/vof.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
> index f8c0effcaf..d3f293da8b 100644
> --- a/include/hw/ppc/vof.h
> +++ b/include/hw/ppc/vof.h
> @@ -9,7 +9,7 @@
>   #include "qom/object.h"
>   #include "exec/address-spaces.h"
>   #include "exec/memory.h"
> -#include "cpu.h"
> +#include "exec/cpu-defs.h"
>   
>   typedef struct Vof {
>       uint64_t top_addr; /* copied from rma_size */

