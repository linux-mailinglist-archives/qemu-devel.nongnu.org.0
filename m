Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE7649642
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:31:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4SyM-0007s1-9N; Sun, 11 Dec 2022 15:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4SyJ-0007pR-VV
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:30:51 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4SyH-0000mx-BA
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:30:51 -0500
Received: by mail-ej1-x62e.google.com with SMTP id qk9so23311680ejc.3
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mwAa+HQQlnoC+LzHfecEh7SUJINkq7HudMB0jBJNnlA=;
 b=GWQYhWG6NqehLn8w4oPuuFhibo1djdEf8ghLqIOZmPeMV6jcCIi2rfZZ8YEXFBEdyw
 I6KJogniWodoiR72yCdHY2XlUpWHk5Bcmo07buFC1Zfkog5WWdifRoAgFwH4VY9U2fPa
 8U1W5LD/zKZFfeI7j3LFWSjG0UJ795CxmZNjV5bpfllcbLf9P+WX8LhNehFcXpO+HIMm
 gJJUsM63dnMAZsZcTPFmP5uAjee9sdaPpZZYHrzTq62N55+hO2mNpD/T3yXU61oEYc6v
 MhKHP/AZbL0svzTFzimACEMICPUwgfoDydzOteYnfyFDYTxh7eDw5vRmaeTUHmVMh7kU
 +/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mwAa+HQQlnoC+LzHfecEh7SUJINkq7HudMB0jBJNnlA=;
 b=NtVkE3l4V8qigTral4u+t/usYIkLT+Y34llVzLtYsQjFJFzki4gIHxTBK6CZnlFCo0
 8TDyf0r7fnOW5XK6xksAyEfVtiHQ1m2Rpe5P50droIbT1F6MUajOUHNS4kkrCH25Zwdm
 iBQ+90h4eD2WBWmQW3mVU3Slv67dIIuGZztWiWFwhqfb9mOZ2w8jY23dmoAZL+3hwbuJ
 IiDOxNjUCOyYIhX6OlhVcOvxDC1XEUJDtJUIH44OX+zG0pGWp3RobxXpQtCCkUiZpRfm
 SYv/X0Y6Mivz5qryuzbEhnDnxgBoSzXRw2Srb61BAemm0zvrp9oy5h0/tvGaTG1l/pAq
 nIOg==
X-Gm-Message-State: ANoB5pncMEBfqITgCqHK7IvF4ou7XfpoZ1jflexmzrnKfKxGkEJlxbqa
 ZWLRGA/EZ53cJBXHvAa6s0Df+w==
X-Google-Smtp-Source: AA0mqf7E9yWccAqGYwurgaAuqPuV48AjIxkpeyN32DMQLlLFDTcucf5M1iM299T9LQioQxZmW3RkEg==
X-Received: by 2002:a17:906:4907:b0:7c0:d4fa:3151 with SMTP id
 b7-20020a170906490700b007c0d4fa3151mr11806817ejq.17.1670790647766; 
 Sun, 11 Dec 2022 12:30:47 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a17090632cc00b007ad94422cf6sm2393527ejk.198.2022.12.11.12.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 12:30:47 -0800 (PST)
Message-ID: <068a455c-d34e-49aa-9ca8-525660ff617c@linaro.org>
Date: Sun, 11 Dec 2022 21:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 6/7] hw/mips/bootloader: Implement nanoMIPS SW
 opcode
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-7-philmd@linaro.org>
 <0F927603-2DFB-486C-B61D-3CDBB0324F8A@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0F927603-2DFB-486C-B61D-3CDBB0324F8A@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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

On 11/12/22 11:40, Jiaxun Yang wrote:
> 
> 
>> 2022年12月10日 15:55，Philippe Mathieu-Daudé <philmd@linaro.org> 写道：
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/mips/bootloader.c | 25 ++++++++++++++++++++++++-
>> 1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
>> index cc3df385df..541b59bf84 100644
>> --- a/hw/mips/bootloader.c
>> +++ b/hw/mips/bootloader.c
>> @@ -177,9 +177,32 @@ static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
>>      }
>> }
>>
>> +static void bl_gen_sw_nm(void **ptr, bl_reg rt, uint8_t rs, uint16_t offset)
>> +{
>> +    uint16_t *p = (uint16_t *)*ptr;
>> +    uint32_t insn = 0;
>> +
>> +    insn = deposit32(insn, 26, 6, 0b100001);
>> +    insn = deposit32(insn, 21, 5, rt);
>> +    insn = deposit32(insn, 16, 5, rs);
>> +    insn = deposit32(insn, 12, 4, 0b1001);
>> +    insn = deposit32(insn, 0, 12, offset);
>> +
>> +    stw_p(p, insn >> 16);
>> +    p++;
>> +    stw_p(p, insn >> 0);
>> +    p++;
> 
> Think we can have a helper function like st_nm32_p.

Good idea.


