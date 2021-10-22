Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5280C4375A4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:44:32 +0200 (CEST)
Received: from localhost ([::1]:58282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mds2J-00085m-Er
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mds1K-00070c-0J; Fri, 22 Oct 2021 06:43:30 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mds1F-0001ul-0C; Fri, 22 Oct 2021 06:43:29 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u18so4080696wrg.5;
 Fri, 22 Oct 2021 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IjPvxZSAHu3LkQCIStyBpLW27YiocT+OAFPA0jSiVCU=;
 b=l5lAMt8463PxCvsDJsXxUv8QaCUHp2WjEWC7qexkIjrSubuOuV5IRwpxavT3mypAGa
 VCJuyFTUbzEqu+3gnFyujDJ8Lrn0Czsgg26OuvS50+iuTPlVRJDeHHgx/ctnA9Wu3+kW
 4bypuViPl8kn/wBA6V1H/ye0DyiVUzY9ifvo1WXE8GvJFWIs9M9opKhz6bmJJy3i1shY
 7s2xCWjv1L49hD7Y1BUu/WdVKhqCkU4xpVSCMKtkOzyBbDb9atDecnY+W0gXMC/qONk+
 ObDmtHIM5ZepP9t3vJSkAaC2xLn3gFGwqmcGk2YjOT8tZdzV9UM8azagpyte6dJqfCjY
 wcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IjPvxZSAHu3LkQCIStyBpLW27YiocT+OAFPA0jSiVCU=;
 b=M19CRfbnNwEXKfqPexy6XfHc7bxcCu3dX0+NctikwSyTeQQ2+aE4uAZ47PbVZJId/9
 D0XGW6Go3Sw+G1bamIMhgQNICnl0MM2/vDEcQJcasShEGiqS3PdDS5ZGArW8/WS8f3OI
 7z+imI9/Bt9sayOXLIYn0i1rBQl50QZ/scPTU4THdRW5po1v2bguCA575XdXTqBfX8JC
 CrKjavJxABq7xExSRHb6DV7ouienL5Ea3RaglIaiPKb+6uJnwLuL9s6W6/UlT02OZmSI
 mCtyCwYh1t7Kkmab/gbsNi4yngBDtKv79YuxMlTfHl+JDuZ8GFAXc2adtdydloJ3Ck8J
 cVlg==
X-Gm-Message-State: AOAM532tfux5qXqlz+6zaJgvIN4FU5rDLNUW6WAEaOaDYKcxqHSgAg8h
 IxlXJ3Hbv+ZH3GyCOvOFFa6hHV8KcuE=
X-Google-Smtp-Source: ABdhPJy8hfOksU8KWe6xTtNZY1d6bdvcLp3doZdmmM/cFyZGUa29VKf67TQLggL14GnC7H85WLB7XA==
X-Received: by 2002:a5d:64c9:: with SMTP id f9mr14396486wri.284.1634899403165; 
 Fri, 22 Oct 2021 03:43:23 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p188sm3640779wmp.30.2021.10.22.03.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 03:43:22 -0700 (PDT)
Message-ID: <98f894cf-9d97-980c-eef3-279b499c1476@amsat.org>
Date: Fri, 22 Oct 2021 12:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] isa-applesmc: provide OSK forwarding on Apple hosts
Content-Language: en-US
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20211022103801.19620-1-yaroshchuk2000@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211022103801.19620-1-yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-2.867,
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
Cc: qemu-trivial@nongnu.org, suse@csgraf.de, r.bolshakov@yadro.com,
 agraf@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 12:38, Vladislav Yaroshchuk wrote:
> On Apple hosts we can read AppleSMC OSK key directly from host's
> SMC and forward this value to QEMU Guest.
> 
> Usage:
> `-device isa-applesmc,hostosk=on`
> 
> Apple licence allows use and run up to two additional copies
> or instances of macOS operating within virtual operating system
> environments on each Apple-branded computer that is already running
> the Apple Software, for purposes of:
> - software development
> - testing during software development
> - using macOS Server
> - personal, non-commercial use
> 
> Guest macOS requires AppleSMC with correct OSK. The most legal
> way to pass it to the Guest is to forward the key from host SMC
> without any value exposion.
> 
> Based on http://osxbook.com/book/bonus/chapter7/tpmdrmmyth/
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>  hw/misc/applesmc.c | 144 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 143 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 1b9acaf1d3..6986ab0028 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -38,6 +38,10 @@
>  #include "qemu/timer.h"
>  #include "qom/object.h"
>  
> +#if defined(__APPLE__)
> +#include <IOKit/IOKitLib.h>
> +#endif
> +
>  /* #define DEBUG_SMC */
>  
>  #define APPLESMC_DEFAULT_IOBASE        0x300
> @@ -108,6 +112,7 @@ struct AppleSMCState {
>      uint8_t data_len;
>      uint8_t data_pos;
>      uint8_t data[255];
> +    char *hostosk_flag;
>      char *osk;
>      QLIST_HEAD(, AppleSMCData) data_def;
>  };
> @@ -312,9 +317,133 @@ static const MemoryRegionOps applesmc_err_io_ops = {
>      },
>  };
>  
> +#if defined(__APPLE__)
> +/* Based on http://osxbook.com/book/bonus/chapter7/tpmdrmmyth/ */

404. Instead use
https://web.archive.org/web/20200103161737/http://osxbook.com/book/bonus/chapter7/tpmdrmmyth/
?

