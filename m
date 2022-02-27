Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C424C5F51
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:09:12 +0100 (CET)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORj4-0006se-RI
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORgi-00058J-0x
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:06:46 -0500
Received: from [2607:f8b0:4864:20::1032] (port=39650
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORgg-0000c5-L8
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:06:43 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso13127007pju.4
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=b/HzGngpG8WJMfZrIuxc4FOrWX/3pw5JiYWwxn/2FzE=;
 b=Dy74j8iK4b8MzYQdNt3+TfzSVxjestcT5Gvd/PaKrX3lc7zsv5r+7rUAWDVRDgyVeB
 p/OPMaJp6jmHRcX5BPS37LkcGLD/EFY9/zgEURBZznDVwNdHs0QC+Xg2RJNlBGhH+DXa
 voxHzWEmw9GvTEoqZLiMS+OwArqMOcDsXpyww9HedYhAaOoEd2ajzz7TuvZe3Dn2vtHU
 5Q7hTSYly8cMAWse9HUlwAVgZ0L//YHhoFgEW242DzZL+i2xTPQL0BQn75L7McEDZj5a
 bjIckWfIjSp1FF3lC2DK9eyd9IyLv/I9Q/JRJnV8zqLR1AFWrpumissetwbKGBsd2+oh
 N9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b/HzGngpG8WJMfZrIuxc4FOrWX/3pw5JiYWwxn/2FzE=;
 b=S4F6fvqNAEAieaAIFPFLEmXmUt0Q0g0iu2Qq7BsB+1eTgjb0nrpLwSDHDXccmFiT7y
 Ucop61TSKQwJWS1NDoUemISNr9u5XFj8HS1NAqO3UEaLyNcU213bnouccIfDLxyNKS8r
 UqER32D1Di2iN6jqFelOIth5A+V6silUNqaLzZwgimfUtkdw95p1EjjIWWcIq8PS4ofk
 q0XiWFCB0EYK0rvmqGaeTv3ggegZfG2MY/MdRtDYdeYwiUDcXVWiSOea6Las41JuravE
 kGLFZQFsVEkGEv0+SeeRwDLupBPjJAB3n7uUefx3FroiNZM4v8JjisCb6crer9G10Weg
 pKdQ==
X-Gm-Message-State: AOAM531U0Svu/4hjcUlOPxHmuwZyIv4rlRWDk1zynQA0cDLSVpFj3cyG
 8R788mVq/9NpPNup6J0F7dM=
X-Google-Smtp-Source: ABdhPJzThl7g7bCcfaxgxb1LBPpZKoTZfZS/qyQdhzw7LolnbyrnkdHYY0jVoPbz7IrYsR9E5sdBJA==
X-Received: by 2002:a17:90b:250f:b0:1b8:f257:c39 with SMTP id
 ns15-20020a17090b250f00b001b8f2570c39mr13407443pjb.135.1645999601369; 
 Sun, 27 Feb 2022 14:06:41 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 s3-20020a17090a5d0300b001bc2b469051sm14931161pji.29.2022.02.27.14.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:06:41 -0800 (PST)
Message-ID: <6f8cb648-3689-d56d-036c-fb4d74f31108@gmail.com>
Date: Sun, 27 Feb 2022 23:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 6/7] target/nios2: Special case ipending in rdctl and wrctl
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220227182125.21809-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/2/22 19:21, Richard Henderson wrote:
> It was never correct to be able to write to ipending.
> Until the rest of the irq code is tidied, the read of ipending
> will generate an "unnecessary" mask.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/translate.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



