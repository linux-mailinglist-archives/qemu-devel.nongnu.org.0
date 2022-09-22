Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCB55E6153
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:40:57 +0200 (CEST)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKZa-0003L5-MK
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJoO-0002Dn-TY; Thu, 22 Sep 2022 06:52:08 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJoN-0004nh-8F; Thu, 22 Sep 2022 06:52:08 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d24so8436607pls.4;
 Thu, 22 Sep 2022 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=yWw2QFoUgj6ZIN44TSjStv/PZhiMUa9bwhQxmq8MC1g=;
 b=mvWD9RhoFeQrXFW/f4ekYOhe1O9zu0Yruzt8qV2PntFfBSjf8nwFI7vQ8BUFbarWQF
 ZeZhLWw1JOwUD1mxyj9nMM8R0mm3bYwWhmNYX6CDQ9E5v+yt9TuG4QNqIW/jKxpC3nq2
 WfCoWPJZir8aTu8Phtnu7qRrPteTlZ7MxpZkN8dfhB+8HYXAUpl6yBNW8wUDhYwynQLX
 lNmW69OpWkpZnl2DtPem9zwEbn4bO/+x/Z6nYdkRg41ed08A3LTAm6eWGHZR3VbaGhcN
 NWuop/bRQflDOOG+5bQM7JUMWktmTXKnz9rG3CZOcNlvMWIF+GUYNfWiHw3fK7tSFEYo
 uY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=yWw2QFoUgj6ZIN44TSjStv/PZhiMUa9bwhQxmq8MC1g=;
 b=Nu6MjzI/IST6q8bjsUTlkNtnyWe+21HStfYhXB1TDZI43Xyz0+zkcCr6IOiadW371k
 jeIr7K7cQ72Wl0SPBcuBNDN0vb6nhrBg3u6DgJTjtgoyi1PCwBatMWwEIvAPf7Gub5XU
 beoBn7cM3hMKppBj4koOS3CtPqhJkf0udYumiQm2qpeKwlDP3Q/LlcMIYcOO1cm3o1CM
 2DSljT3AtwUIJoqAswuTx2IkleTvKyfkiaUpKkgXHtJrILdZAQNBHIjhROPyRivZSN7G
 IXu2xjOnnCN2plqatyjrI1qYEVA/+9q2VG43UgFnLsalYd432jV5X9OFBK8H8TaqVsOJ
 e41w==
X-Gm-Message-State: ACrzQf2jSs4RDJBXAw7hPTxFD/wgI4n69rqVryvlbFm8kbjFp2d4KDzu
 Y9WPGd4nhYSWq5m7khsnlqk=
X-Google-Smtp-Source: AMsMyM52/YXOAVf2XBBSDsa2NLbuI869+4lOXEXkBgpx7byF5vfxrNDnQPdRGGQ6WThhWV3i+0ubHw==
X-Received: by 2002:a17:902:c213:b0:176:cdb9:c504 with SMTP id
 19-20020a170902c21300b00176cdb9c504mr2668604pll.44.1663843924852; 
 Thu, 22 Sep 2022 03:52:04 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a1709027fca00b0016909be39e5sm3788459plb.177.2022.09.22.03.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:52:04 -0700 (PDT)
Message-ID: <7d7540c1-a54e-e41e-83f8-ad108719f985@amsat.org>
Date: Thu, 22 Sep 2022 12:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 04/14] hw/ppc: set machine->fdt in
 ppce500_load_device_tree()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-5-danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-5-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

+David/Peter

On 8/9/22 21:40, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' QMP/HMP command for the e500
> machine.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/e500.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 32495d0123..ea5f947824 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -47,6 +47,8 @@
>   #include "hw/i2c/i2c.h"
>   #include "hw/irq.h"
>   
> +#include <libfdt.h>
> +
>   #define EPAPR_MAGIC                (0x45504150)
>   #define DTC_LOAD_PAD               0x1800000
>   #define DTC_PAD_MASK               0xFFFFF
> @@ -600,7 +602,16 @@ done:
>           cpu_physical_memory_write(addr, fdt, fdt_size);
>       }
>       ret = fdt_size;
> -    g_free(fdt);
> +
> +    /*
> +     * Update the machine->fdt pointer to enable support for the
> +     * 'dumpdtb' QMP/HMP command.
> +     *
> +     * The FDT is re-created during reset,

Why are we doing that? Is it really necessary? This seems to be only 
required at cold power-on.

> so free machine->fdt
> +     * to avoid leaking the old FDT.
> +     */
> +    g_free(machine->fdt);
> +    machine->fdt = fdt;
>   
>   out:
>       g_free(pci_map);


