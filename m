Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46161E51B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 18:52:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orjnI-0003sP-Ki; Sun, 06 Nov 2022 12:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjnG-0003sB-D9
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:50:50 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjnE-0002Aw-TS
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:50:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id o4so13296244wrq.6
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AnHVnCEmQ8ccc5SU7T4SVfCtozHbeSEw5yWlvG96lLo=;
 b=n5yuCKOl1MaK+nuXkOi1r7zQ3K6Nww6j5GSQ5bmoHZdsj6Pzlszb1b1u7iyMscuULn
 8R0f2SOz4B7K0pGT+a3YaegDf5fukSRRz9TJqc6Z/b6pAqubvFjBzAi08bguuEVQT7RX
 wOlOK+IQJhokGS5R87lLywhSCeADi75fUc3Bd1qij8cDWe0HdD81qKNRxbJyCBAQCZ9Z
 8SjOXT6VxSt/QIc+sMrYfUh87cObvwb0opKBOTe1SWXCTB7HtcX9cjKzsMPJvYkL3RlX
 JwOn1qxzK16SpRnyDGQbzkb11seZ2vUqsYopHS/Uc5ssAX+sFseAvYGAvt+l7iWmahuq
 2sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AnHVnCEmQ8ccc5SU7T4SVfCtozHbeSEw5yWlvG96lLo=;
 b=yYtGBmEIb94ZlPWSlQ4hLkkdxR+AmUcp6URPjghu+g98xc8ntn7GXl9SvbUEnnxKQn
 dYFwvLwA8GdBmLRkpTh5yQsFKzlnWu49TKk56UUW8oWFARqUXSqJzxEEsN3qu/fd9Eun
 oxPb+ZBpTRJz0CDv9dQpcdTBrO1QfVxOKri6qlyGWDL/isSTJ4q/uwzEKaBewQwy/lZD
 BhSwNCeKbBHl/F/VpJ7rzL/Z4adoUOPduH7lKhX5UKZ9NeyE67GzoLEuLTXK0YBOfMh1
 hY9tQ42XDbWf3Pm1/BWglx4Lg+c8ycgaPAvTz1wguQ1J1EbUnOE3/Cox6wL8y/bmkJQw
 grtQ==
X-Gm-Message-State: ACrzQf1H5g3u69sI2v6Z3ySLid2DwyUtetWVSUgq/xAjHrD/lBkmzeiG
 k6bn8bYiI1MjlL5Bg4L5msdZ4w==
X-Google-Smtp-Source: AMsMyM6o0efUnVN95tzGkq5wgw19vOtVR2rVE5exUaeRjWA7cROYOeae06X0jGzW+be16EednE6CjA==
X-Received: by 2002:adf:e38d:0:b0:236:7217:827e with SMTP id
 e13-20020adfe38d000000b002367217827emr29995361wrm.652.1667757046586; 
 Sun, 06 Nov 2022 09:50:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q188-20020a1c43c5000000b003cf894c05e4sm9086372wma.22.2022.11.06.09.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 09:50:46 -0800 (PST)
Message-ID: <e48fd3ca-69b3-9d59-6610-7cb314ffeaec@linaro.org>
Date: Sun, 6 Nov 2022 18:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RESEND PATCH 2/6] disas/nanomips: Merge insn{1,2,3} into words[3]
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de
References: <20221106023735.5277-1-richard.henderson@linaro.org>
 <20221106023735.5277-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221106023735.5277-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 6/11/22 03:37, Richard Henderson wrote:
> Since Disassemble wants the data in this format, collect
> it that way.  This allows using a loop to print the bytes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/nanomips.c | 44 +++++++++++++++++++++-----------------------
>   1 file changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/disas/nanomips.c b/disas/nanomips.c
> index 9a69e6880a..5438def9af 100644
> --- a/disas/nanomips.c
> +++ b/disas/nanomips.c
> @@ -21905,12 +21905,8 @@ static const Pool MAJOR[2] = {
>          0x0                 },        /* P16 */
>   };
>   
> -static bool nanomips_dis(char **buf, Dis_info *info,
> -                         unsigned short one,
> -                         unsigned short two,
> -                         unsigned short three)
> +static bool nanomips_dis(char **buf, Dis_info *info, uint16_t words[3])

words[] can be const.

> +    for (int i = 0; i < 6; i += 2) {

I'd rather convert this magic 6 and iterate over ARRAY_SIZE(words).

Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        if (i < length) {
> +            (*info->fprintf_func)(info->stream, "%04x ", words[i / 2]);
> +        } else {
> +            (*info->fprintf_func)(info->stream, "     ");
> +        }
>       }



