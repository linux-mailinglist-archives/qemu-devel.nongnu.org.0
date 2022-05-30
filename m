Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4E253870A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:08:38 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjoj-0001uN-Js
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvj9H-0001uG-VT; Mon, 30 May 2022 13:25:47 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvj9F-0002dx-HL; Mon, 30 May 2022 13:25:47 -0400
Received: by mail-pl1-x632.google.com with SMTP id w3so10795478plp.13;
 Mon, 30 May 2022 10:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vIU/tcRIvWpa510J8v1aoI/lE+Q4+6HS0eP9iypyi5w=;
 b=YGABNdhsqs0lWb3N91u/onJ3zdXXULzH05/OrbgwSTfQT8eZs1ZINBR61pbezfS8Vi
 u7LcV7aazk7SgVo4m9FSq5ugJBUCKfstJqGFxkfaxjtiE+uVagnobhPEO+EEC68yFY1H
 GJn3HoY6Mcc1BwYVYrOHXAgVn6JAyJk6kvr6GWeiqp9S/kRgZKfQpn0oQ6m0PF+7ozhq
 f/2SrR8Cf/AYKEDGDgJuCFev3ATeRklaCukudM3kkTy7lywRFWcjqQy3OAOOvUYVku0A
 vePy10tmzXf+i+NEBh/6lg5/DINgW2D1/ZQntXL4GKEAVTBXOrbNzjgRUgeUrgrlkqTA
 Ewug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vIU/tcRIvWpa510J8v1aoI/lE+Q4+6HS0eP9iypyi5w=;
 b=P3XYoDVchan8a+ooc8mjxkLDmsecIZ9YMCng/Tv86R0Qvr79FRnCOPWNw2MKOZeCcZ
 VYIsJVTozcANj/Jqvcj7oDYJWW04eDSvJsOhwFGYbqQbHrshXHoZwlN+jECMHEvnsryh
 +y9J/EVZGYSgz64PHXHzdkWYUJoadau0i2jUEhkFfTvpcnoh3FG/Tx29BkFB8EBH/snj
 HPPg8KOv6jUM2KEwmdMmW08nvAGK7kehFU4O/kUE9zKkWK/xWKpK1Ihz5HbhJ8FH57ye
 EDoUekptAuD3yB43ymh5xwuR2CaDyUqtWaWs5f+h97RNbWV+i4x1isltQaeCzZ8EHMO5
 8Pwg==
X-Gm-Message-State: AOAM530I+Mb7nNIJw6WiPVQOq9MF180DLsUZqlFSi7LxHw4JZo1f5vhY
 dVH52es0fFRr/O/berdRwi27AGsv2n8=
X-Google-Smtp-Source: ABdhPJw23g3QH5ixaSvMPRJ+6KnhvILK5U10x+bO3jWKnLi46jBb3539KE8PUpUrBsoE8ntdWVskMQ==
X-Received: by 2002:a17:90b:4d90:b0:1e3:3025:66fe with SMTP id
 oj16-20020a17090b4d9000b001e3302566femr467936pjb.145.1653931543939; 
 Mon, 30 May 2022 10:25:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a67-20020a624d46000000b0050dc7628168sm9156232pfb.66.2022.05.30.10.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 10:25:43 -0700 (PDT)
Message-ID: <e7359f27-edf1-602b-7225-a14f03d10271@amsat.org>
Date: Mon, 30 May 2022 19:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 07/17] hw/sd: Add sd_cmd_SEND_OP_CMD() handler
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-8-clg@kaod.org>
 <c3a65543-e50c-c927-842a-9634f4d562fa@amsat.org>
 <283c1d01-f986-b20a-5ee7-984e18f9101d@kaod.org>
In-Reply-To: <283c1d01-f986-b20a-5ee7-984e18f9101d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
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

On 10/5/22 08:57, Cédric Le Goater wrote:
> On 5/9/22 23:12, Philippe Mathieu-Daudé wrote:
>> On 18/3/22 14:28, Cédric Le Goater wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Message-Id: <20210624142209.1193073-9-f4bug@amsat.org>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/sd/sd.c | 18 +++++++++---------
>>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>>> @@ -2111,6 +2109,7 @@ static const SDProto sd_proto_spi = {
>>>       .name = "SPI",
>>>       .cmd = {
>>>           [0]         = sd_cmd_GO_IDLE_STATE,
>>> +        [1]         = sd_cmd_SEND_OP_CMD,
>>>           [2 ... 4]   = sd_cmd_illegal,
>>>           [5]         = sd_cmd_illegal,
>>>           [7]         = sd_cmd_illegal,
>>> @@ -2120,6 +2119,7 @@ static const SDProto sd_proto_spi = {
>>>       },
>>>       .cmd = {
>>>           [6]         = sd_cmd_unimplemented,
>>> +        [41]        = sd_cmd_SEND_OP_CMD,
>>>       },
>>>   };
>>
>> I missed adding the cmd_abbrev[1] entry.
> 
> Will you resend ?

Yes.

