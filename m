Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F0665665
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:45:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWim-0007b9-Ry; Wed, 11 Jan 2023 03:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWij-0007aA-AH
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:44:29 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWig-0006T2-4D
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:44:27 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bs20so14289049wrb.3
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0dlyOnkT+S6TEHGI3pvKMC2BE6iB7ZgGN+GTpfgdFS4=;
 b=xRXElXMz2DMhKd5iUdSZX/KtlS4vty0R9jFenz3K1OfwwO5AWF4O1fMk6pYMgl1IEc
 0+oqdgglQIqboA/E6uwTjPZ8k2LeyAJzHD/59E14dSjrZ+dsaHHKXbgT9Fauz3tJuzfo
 053Hu5uNdHfec2lwfD6SN0EVFF8fHm1O5hr+lPmDFAqSI555nM27aSA1ZAoJtalIjGNG
 +/YRC3Hu4pLlQ1/b2VDYGEWefjvcdrhEaDrrWOMTfb4WUIakybf2hEJIa9K13LHnYEe9
 jpZ8G8eJywF8wnMdgqQtzHIyokDt5AID4CKq59DnP+FQv+uuQO1J8hZ22GO7IuQcHbNy
 yr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0dlyOnkT+S6TEHGI3pvKMC2BE6iB7ZgGN+GTpfgdFS4=;
 b=38TgbjoAsgFXAG+X7iOT+EN1sTbAQ2P9FPjGW2r5TMt64sM/SMubxWraPerTbc7lwK
 6+iDX9Zi+BAbie82UNQK0gUCw2ct6/0Qfx2Dr+UGVOcnfRiMqGCqWkKZeRQT4rC823ag
 NTofYzs111oLDPBVSecu0+gBIM0BktdNhltzX7beFVaLC2hw/2k8tp0SbObupoMny+ir
 +os3MqGJ3Wdn2VfgnNaCVpO+vooeKb4xmmX2FsmPrxiXR+qbNpwlYf26DJjfm1zHe7i/
 NW5rCmxqGSL2SkGg7ZtAF53jIfJrE3lMtSnq2bCoCB1GLVnzfSK09/3q9GtXW8zrxjbM
 nExw==
X-Gm-Message-State: AFqh2kozc17BIcYe85ifeluw5rdXSpiJkT7zcZFGZ923VQtiwEdV0XIR
 KrsM0TyX1HYMjUrIdDgr7FuJjg==
X-Google-Smtp-Source: AMrXdXtAoZK3rz/SnywG2Fyms9BlUPtbKyaj/J39BXEo+p1XRgq20nJO/Qlwas7cww97vda+EKAXEA==
X-Received: by 2002:a5d:550d:0:b0:2bb:e993:6c85 with SMTP id
 b13-20020a5d550d000000b002bbe9936c85mr9217568wrv.35.1673426664413; 
 Wed, 11 Jan 2023 00:44:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x2-20020adff642000000b002a01e64f7a1sm13498863wrp.88.2023.01.11.00.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 00:44:23 -0800 (PST)
Message-ID: <c3291eb6-bd1c-e5d5-eac7-7edab48dfd17@linaro.org>
Date: Wed, 11 Jan 2023 09:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/net/lan9118: log [read|write]b when mode_16bit is
 enabled rather than abort
Content-Language: en-US
To: Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>
References: <20230111070518.994646-1-cyruscyliu@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111070518.994646-1-cyruscyliu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Hi Qiang,

On 11/1/23 08:05, Qiang Liu wrote:
> This patch replaces hw_error to guest error log for [read|write]b
> accesses when mode_16bit is enabled. This avoids aborting qemu.
> 
> Fixes: 1248f8d4cbc3 ("hw/lan9118: Add basic 16-bit mode support.")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1433
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>   hw/net/lan9118.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index f1cba55967..7f35715f27 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -1209,7 +1209,8 @@ static void lan9118_16bit_mode_write(void *opaque, hwaddr offset,
>           return;
>       }
>   
> -    hw_error("lan9118_write: Bad size 0x%x\n", size);
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "lan9118_16bit_mode_write: Bad size 0x%x\n", size);
>   }

There are two other uses via BADF(), then we can remove the BADF() macro
and the "hw/hw.h" inclusion.

Regards,

Phil.

