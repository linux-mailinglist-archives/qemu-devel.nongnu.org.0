Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7773AF9B2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:43:49 +0200 (CEST)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTa0-0007yZ-5R
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTPc-0000FA-MF
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:33:04 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTPa-0005yE-VX
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:33:04 -0400
Received: by mail-pf1-x430.google.com with SMTP id p13so14939151pfw.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Oyxsog59mQzcob3ThA45aZX5FEIGm5wl+am07ke/Bac=;
 b=QMdVLOhrHFecqiSIAPW0KmH81Ibr8z3Kg8vUVT4HfAsz4aupXfro9PnBEe51ArbFXa
 A6NJHUDFbZzOtD9LnlFxMHZfwPcFIcQNHpTRkzz7RBEsS9/sIM7IAAtXin3eduR5mpR3
 gCytk5Q26TYo3HE9Il/rKV8+MzXt/KFdEx866PPD5aXjYOAZivW2Xg+TbQbJ0xOgHCA2
 WW7u5BuGwPU9VRj5tKonGUhcXg06TAWShU9TQl+widvyccookGrqoDbnn4Db91BQEu8Q
 0aRL2cnmpoe7n/5vW2KoTxcPWT5MmtlCZhST+yhhQlccLHtYw/K0AaX6Ocx4KL4WnD/1
 Tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oyxsog59mQzcob3ThA45aZX5FEIGm5wl+am07ke/Bac=;
 b=a9K/pbrN35B3zBdjBqVJ55VZVeEdVelNmMNXsJUvy8+y37DXs3gp+a0OFUb6eq/nP9
 fdWRbFPCqDUWt+NPTo8Sbe7vdNlz+0gLn7dKoehoe6DT7VU525rZBaHGrcJUS0UVy097
 4c2cefT9rPivZE/iWIeXf+9THosXPiekEnA0AStVS3MzZfq/xr21gXcQPBzwvaLPFlXb
 ETE4ZTbRHBQNCO6x/NsB0NM9CHFqfp3UavnRnEPe6TSsH6wVYm+VjDYXxM8m5HTpj8NH
 QHz+cJzERsTA7GvY8muK29W3hy1kjED3ecaNSCg+tP2+oSQIaQn5yBDmEh3Jku3zdCYz
 nK5g==
X-Gm-Message-State: AOAM533u3vSEshSDpalIynEVspMzkgXwxYau0DvX1AC/v55gUWSxeinC
 BhciI2s41stgqIEKI1co5ToajiizdW8acQ==
X-Google-Smtp-Source: ABdhPJzGOCaSGnaJQErF+ASl38qNUfmpNTQRSWqme+xqIP/UwGANtgFfzWl6CaFpwa1ZtigCj8MqcA==
X-Received: by 2002:a63:d84b:: with SMTP id k11mr891604pgj.372.1624318381453; 
 Mon, 21 Jun 2021 16:33:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l7sm17662465pgb.19.2021.06.21.16.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 16:33:01 -0700 (PDT)
Subject: Re: [PATCH v2 02/11] target/cris: Replace DISAS_TB_JUMP with
 DISAS_NORETURN
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
 <20210620213249.1494274-3-richard.henderson@linaro.org>
 <42a219d5-8ca3-b15b-7b79-2d57fd23cdf5@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73860f87-17ac-fd76-b051-bc544fe55a07@linaro.org>
Date: Mon, 21 Jun 2021 16:32:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <42a219d5-8ca3-b15b-7b79-2d57fd23cdf5@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 1:01 PM, Philippe Mathieu-Daudé wrote:
> On 6/20/21 11:32 PM, Richard Henderson wrote:
>> The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
>> which is the same as DISAS_NORETURN -- we've exited the tb.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/cris/translate.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/cris/translate.c b/target/cris/translate.c
>> index bed7a7ed10..2ff4319dd1 100644
>> --- a/target/cris/translate.c
>> +++ b/target/cris/translate.c
>> @@ -55,7 +55,6 @@
>>   /* is_jmp field values */
>>   #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
>>   #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
>> -#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
>>   #define DISAS_SWI     DISAS_TARGET_3
> 
> Can we #define DISAS_SWI DISAS_TARGET_2 in the same commit?

No point.  It goes away in patch 4.


r~


