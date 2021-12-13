Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3E472CCC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:06:55 +0100 (CET)
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwl2c-0003Dl-61
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:06:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkzp-00017V-Mc; Mon, 13 Dec 2021 08:04:04 -0500
Received: from [2a00:1450:4864:20::32b] (port=44680
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkzo-0003O6-3h; Mon, 13 Dec 2021 08:04:01 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so11545912wms.3; 
 Mon, 13 Dec 2021 05:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=udyZOmfkY52ckwFmaJ4bNi3wiYs1JewWnVaW66jodVQ=;
 b=E86ODDtCFDp9QnOVNljOKw5XNesCCpBi6BWuYzF5URd13hwm+sctzYaSnSB69FHbXz
 xr5NLmsytmC+t4fPPOfwS8rkl8T/yjqfcbIGkM3wzOaNQ5coaZLeMFKJoDj3bDwYNtDN
 oecIJr/Ta9L+a2voCLiFjoTkPwTiNnXT3LtzAXo2UbaAHSYPKBmsjeI/QO07fblAHnBY
 vBy7RXb/sL+v7mvt+jXfM77a07gEweEyCy02liudSio6AZ58XDV/mnrU0Tsae0hlz1MJ
 MOqlKA0iaxxLBDizc+QqoAs/t1ht5SFa5QvlX3yDgcjTA6umgd3Hd9F6vQF+oh5hGC6h
 ez5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=udyZOmfkY52ckwFmaJ4bNi3wiYs1JewWnVaW66jodVQ=;
 b=OqPdXJrjFlhjeUbCJSLG03H2wdb7SnL6L9+xtr6KPrwrmJLPq6ppuFcjO1Kf6rcwhj
 JwftZasHeFa5VANAJ2nBmL5H4KJbT4AzgxACglNyj/+p0PgwOFSPdYTqwBcNDvxhiNMx
 +6O9kYUAjYl6N18UUeIqspFFwdvgcODIaWMVOIqMwhx6Sk7ci/yUkfLkyPPaF9vMaKAk
 mzyBXKPwLQdswxYPTPgmylJgs+uejgRv7a4b9P8YhWGT47POiMID6l5x5KErM2t/9LiG
 bm60pLZ+M1lJj6kWtZXY6B2utbsjkRTYiCDRbsuhoClJQBj62ROsmDoXQRw7V8sfYmOa
 BQbA==
X-Gm-Message-State: AOAM533G3U7evGBm+Pn/m6BwIpihT71o5l7jW9t8K7s2p3rpJ6Yi6MJ4
 n2Z4elnoE5GrfKXAFdDTMPfDk9HOuXGHrA==
X-Google-Smtp-Source: ABdhPJys/ZzswMdACcWIfZlBVduKxLYGO4B7pExzWcArXTCnGh3bWPGHNlozQ3LmPe0laBjSWcMiKQ==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr13814517wmj.35.1639400638510; 
 Mon, 13 Dec 2021 05:03:58 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id l3sm7380562wmq.46.2021.12.13.05.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 05:03:58 -0800 (PST)
Message-ID: <26e8be2c-10da-3ea2-0624-1253d85fb1bd@amsat.org>
Date: Mon, 13 Dec 2021 14:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 20/26] hw/intc/arm_gicv3_its: Use enum for return value of
 process_* functions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-21-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 20:11, Peter Maydell wrote:
> When an ITS detects an error in a command, it has an
> implementation-defined (CONSTRAINED UNPREDICTABLE) choice of whether
> to ignore the command, proceeding to the next one in the queue, or to
> stall the ITS command queue, processing nothing further.  The
> behaviour required when the read of the command packet from memory
> fails is less clearly documented, but the same set of choices as for
> command errors seem reasonable.
> 
> The intention of the QEMU implementation, as documented in the
> comments, is that if we encounter a memory error reading the command
> packet or one of the various data tables then we should stall, but
> for command parameter errors we should ignore the queue and continue.
> However, we don't actually do this.  To get the desired behaviour,
> the various process_* functions need to return true to cause
> process_cmdq() to advance to the next command and keep processing,
> and false to stall command processing.  What they mostly do is return
> false for any kind of error.
> 
> To make the code clearer, replace the 'bool' return from the process_
> functions with an enum which may be either CMD_STALL or CMD_CONTINUE.
> In this commit no behaviour changes; in subsequent commits we will
> adjust the error-return paths for the process_ functions one by one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 59 ++++++++++++++++++++++++++---------------
>  1 file changed, 38 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index f3eba92946d..59dd564d91c 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -45,6 +45,23 @@ typedef struct {
>      uint64_t itel;
>  } IteEntry;
>  
> +/*
> + * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
> + * if a command parameter is not correct. These include both "stall
> + * processing of the command queue" and "ignore this command, and
> + * keep processing the queue". In our implementation we choose that
> + * memory transaction errors reading the command packet provoke a
> + * stall, but errors in parameters cause us to ignore the command
> + * and continue processing.
> + * The process_* functions which handle invididual ITS commands all

Typo "individual".

> + * return an ItsCmdResult which tells process_cmdq() whether it should
> + * stall or keep going.
> + */
> +typedef enum ItsCmdResult {
> +    CMD_STALL = 0,
> +    CMD_CONTINUE = 1,
> +} ItsCmdResult;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

