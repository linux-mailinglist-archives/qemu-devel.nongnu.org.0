Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2170E537E64
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:06:22 +0200 (CEST)
Received: from localhost ([::1]:59434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvg2H-0004EA-7t
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfqc-0001Wq-AH
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:54:18 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfqa-0001s6-PC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:54:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso10799018pjb.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LGem/3S3lEGDL2XWa7VFTGF8gOogoc6MjaLmOlIx2Cc=;
 b=nClSZvmhgewrkRhWTnJyCPr83kJZCuu6QKkv8FNdcfd5pMPTCPNgmXqy5TnrBX9ydE
 Y/V8A/bKLpLnAoJfbLvAxJ9MQKQg7tbNCk7BKWX8JVCHQCQKa1xd1HMOrwj21VR7fGV2
 /TfxJSa0YIJePhOuFGgeP78LRT4LIYLeOhWDU8ZrzogyFRp4RzO3epAchHFAeMTgINGA
 uV8+2PwMjPQjsuLjocwKljcqpc0HA6iGPvgFWHAHUnDMUNWjzPwZmjFILXZeFo/8nKYX
 HWR8GZBBWk95jmTN9fKxnaCry+hZ6S6odZiUdkyeArOigeA4Fpt4Zb0ZLna0DggvkNGt
 TEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LGem/3S3lEGDL2XWa7VFTGF8gOogoc6MjaLmOlIx2Cc=;
 b=TA/Gh2rUiuXNSsW694wqvoRKtmlPIFAgNVxiFfF9kvkuNUknskArNtv87t13eDZkR9
 rXmscCKrw2C6hlMbEiCPSzPQZENj/063mQZcxWv8R7gJPBI8QCHd2Vo73PU29AF+z/uM
 c66hx8oxO4kh40RJtmUgcbXE5UZWBsp5rlIIeZqPi2UoCQid47wdrmK/HeV5Ty2TVjEQ
 6iD5fsfjFyj40+fayW29BTR8wPPWjTkgd9yClKZN4tGHemQHxXfLrChR7Q/mzNkkjBt2
 ymguzur/TjzFuHpPSk/NaAjCg7VnZFwm3lxFlP1Gu6IqSmv/c3SiGs4beKJbGIATATMh
 F7Nw==
X-Gm-Message-State: AOAM531l1G0CSgKCMR5vg36HmemEyCfzBzHu3nu7Dki9utoIMfjyFFu8
 FgeAHyAumcOX42qT9+XTx8U=
X-Google-Smtp-Source: ABdhPJwsfTOmTwFmzhCxBJPTkl3f52A9XJfsXYSnc2+i2n48/xfIg4MFLeBInfzK0a26pubsMJwnCw==
X-Received: by 2002:a17:90b:3884:b0:1df:d9d5:314b with SMTP id
 mu4-20020a17090b388400b001dfd9d5314bmr23660834pjb.221.1653918855428; 
 Mon, 30 May 2022 06:54:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a186-20020a624dc3000000b0050dc7628171sm3288277pfb.75.2022.05.30.06.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:54:14 -0700 (PDT)
Message-ID: <d01e2c78-eb41-d112-6f70-8694f24887ee@amsat.org>
Date: Mon, 30 May 2022 15:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 1/4] target/mips: Fix SAT_S trans helper
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
 <e263efa0-58ea-25f2-7132-849fdbdfc2b4@linaro.org>
In-Reply-To: <e263efa0-58ea-25f2-7132-849fdbdfc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 3/5/22 17:11, Richard Henderson wrote:
> On 5/3/22 06:07, nihui wrote:
>> From: Ni Hui <shuizhuyuanluo@126.com>
>>
>> Fix the SAT_S and SAT_U trans helper confusion.
>>
>> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
>> ---
>>   target/mips/tcg/msa_translate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/mips/tcg/msa_translate.c 
>> b/target/mips/tcg/msa_translate.c
>> index 7576b3ed86..76307102f2 100644
>> --- a/target/mips/tcg/msa_translate.c
>> +++ b/target/mips/tcg/msa_translate.c
>> @@ -399,7 +399,7 @@ TRANS(BSETI,    trans_msa_bit, 
>> gen_helper_msa_bseti_df);
>>   TRANS(BNEGI,    trans_msa_bit, gen_helper_msa_bnegi_df);
>>   TRANS(BINSLI,   trans_msa_bit, gen_helper_msa_binsli_df);
>>   TRANS(BINSRI,   trans_msa_bit, gen_helper_msa_binsri_df);
>> -TRANS(SAT_S,    trans_msa_bit, gen_helper_msa_sat_u_df);
>> +TRANS(SAT_S,    trans_msa_bit, gen_helper_msa_sat_s_df);
>>   TRANS(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
>>   TRANS(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
>>   TRANS(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
> 
> Cc: phil
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Oops my bad...

Fixes: 4701d23aef ("target/mips: Convert MSA BIT instruction format to 
decodetree")

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

And queued to mips-next.

