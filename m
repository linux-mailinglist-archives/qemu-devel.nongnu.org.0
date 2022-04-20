Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353AA5090A5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:46:16 +0200 (CEST)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGHH-0002eo-5C
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFp2-0001Yi-9T; Wed, 20 Apr 2022 15:17:04 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:40723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFp0-0003CQ-N3; Wed, 20 Apr 2022 15:17:04 -0400
Received: by mail-oi1-x22e.google.com with SMTP id r85so3164142oie.7;
 Wed, 20 Apr 2022 12:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y8XCNcasNeRQGKgBJ1+j7mrYWk941y6tRp5zKvAP/9Y=;
 b=YjljepLC69qxG1Qm9qu5IaJ/yhUihILYTLFyGRrOVETESKmL9EL8cHx2b81yDFy9Hd
 Mc4PD5g8Sefrvb8k6YctZvSJ4Ny3XnIjuP9CCLsUMLPRt+/71ZyY33ET39xuV22k67cF
 9f/cRLxCN986osCp2SY5k5TTFQki6sC9Swtc82nxFIGHWkwhu+cvEIft42Hn1JHkH6k9
 7mlPVbNrdmw9FxUVNr6rIkfyST5N9a3GULIFJ4PNZlx2GdTnx+dU9cLgRIxJkYeuOLcd
 8EpaWsXvidQHwi7ZdVNNiWdiLCTKTKahvHdwq0NEJSrNeKAfPHLHzMZpbottFAyyuPDI
 nBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y8XCNcasNeRQGKgBJ1+j7mrYWk941y6tRp5zKvAP/9Y=;
 b=SuxQ85g/uAraAMKfWTPZotKzMMp7MPPYWIYgghuvL/dvXdU8PmXgTYKxQQEc9OGUt4
 SZCgMEcK8IZmjOv3NZB7VMoVfS5h226S7bKJx2yKh0ODxuoOCuKcFFeIbqPdxadZl0r1
 6fkX17y8AhlH0u4cNfZJkyw5ChFKonIdLeUG/r4dW7v85tftP//xm9HWu1CxNMcijOvq
 4TTBk2yOgHs301Z1XmGAzVMa2FxumS/g79SW0fmouCPn+YF0V37RwEbNhr19CyKaC0ez
 wU0U28Ce0Yjhf81hfkCwk/XFwU0rRSuUp6UimCzu/6BZ3AOtdcNVP8tTAvgM9fc/bqIi
 l5Qw==
X-Gm-Message-State: AOAM533mHGbWEVYbkE4/89mEl2y9JhB5x0sJRdF4Ux3TV8IB518Tav70
 FktZ/+pNNv95Qj6D5cSp4JY=
X-Google-Smtp-Source: ABdhPJxcJ+Z8SVjMT16riMXj9e6+HOWwYAXp3oMVXk22w56bz9o+MVhI57z+uNxFSknGBURL/qICGA==
X-Received: by 2002:a05:6808:300f:b0:2fa:6fd5:9723 with SMTP id
 ay15-20020a056808300f00b002fa6fd59723mr2475683oib.202.1650482221307; 
 Wed, 20 Apr 2022 12:17:01 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 nd8-20020a056871440800b000e2b75759f1sm307191oab.38.2022.04.20.12.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:17:00 -0700 (PDT)
Message-ID: <eb9c179e-e4bd-e456-6545-68294482b33c@gmail.com>
Date: Wed, 20 Apr 2022 16:16:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH qemu] ppc/vof: Fix uninitialized string tracing
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
References: <20220406045013.3610172-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220406045013.3610172-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 4/6/22 01:50, Alexey Kardashevskiy wrote:
> There are error paths which do not initialize propname but the trace_exit
> label prints it anyway. This initializes the problem string.
> 
> Spotted by Coverity CID 1487241.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   hw/ppc/vof.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index 2b63a6287561..5ce3ca32c998 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -294,7 +294,7 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
>                               uint32_t nodeph, uint32_t pname,
>                               uint32_t valaddr, uint32_t vallen)
>   {
> -    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    char propname[OF_PROPNAME_LEN_MAX + 1] = "";
>       uint32_t ret = PROM_ERROR;
>       int offset, rc;
>       char trval[64] = "";

