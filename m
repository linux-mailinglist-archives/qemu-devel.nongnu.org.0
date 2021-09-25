Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9EB418375
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:07:32 +0200 (CEST)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUB99-00046e-Fx
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUB7c-0003I6-Ne
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:05:57 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUB7b-0000I4-9P
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:05:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r23so11886094wra.6
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Jfr5yJH7OEbIRukHQJ1+y59nkWSDq3Z+nNXzFTEhD8=;
 b=Fkqf5EneuEm0ANr2uh9Ot1tew+yfmX7bCRbq/ITQwsD5c52+2OSMaB7tlMdku30OIH
 d1JlOYHLIitUHqujusITm+v6m+zQcbV0q/tHg+xE3wRRnmqKaLaZGJQ4Jl7W/isC40F5
 ReAh9S4gXo/HSUMS3ZZ/KYfEQ/ght7QUbUqhZz7LURXmJQ8IqTeZbVlu6D3E3OAXjnGU
 dbvrP3s/FIir8aXt+IO/GK1nmqTssG/pS4Bu+trZ7Rcebnwplz+lSItS3IZj0aKZLvoK
 HxG90LlGRUkM6IwdlduoTTO4QQyCbSzNfzrZeQkfhl+ijs+FW/vaGv3L6anGuLGiV0/u
 j9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Jfr5yJH7OEbIRukHQJ1+y59nkWSDq3Z+nNXzFTEhD8=;
 b=imwoUQzUioSAt6faKmLqjrYEQ4fo5RWvk21aDm5S8EtP1urkCltduE+ypxLH5caaxY
 NAKF8R30o6xf6Ku34R0/8Q6c8croo2abAg//SN4Q0il1TDTSpnc519a68rNxU+LdD3AA
 Y6rHp3milMz/Gpmusq+p+CWxPR9HHkP5gCyCwbwn2iZNAWI53f/FI/IrugVjlmdjP5Oz
 lQrRjwpJqg4sZ3vxw+ALMuWlvpiIcd4vwUQB0txYMyq56ZpxfWAf5xiOsEZSSWINVgR5
 8vmjFgzLMCapDKx1RRX8bNm9PjGrpdaRbeaITTSI6sGxRUKpagQdNzHMt5KCOaqUss1l
 lcJQ==
X-Gm-Message-State: AOAM532A0Jm8fu7lmxz+bwFxcmMQUonoUmWfmoQ300KAuGsDqGWSg/cX
 bQo7cAb2KKkg+f+V/Y49gJc=
X-Google-Smtp-Source: ABdhPJwsKbm/zLwmxhzDgMZjur/H6j1OpiAk1gxZBmey2qSPGxmvWryyyXWj0GfvwBid1teS5TPCaQ==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr17914303wrn.238.1632589553086; 
 Sat, 25 Sep 2021 10:05:53 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f9sm331082wmf.3.2021.09.25.10.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 10:05:52 -0700 (PDT)
Message-ID: <89ed8680-b5a3-ffda-f4a4-95217c2f6062@amsat.org>
Date: Sat, 25 Sep 2021 19:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-10-git@xen0n.name>
 <b1b97929-ef62-72ec-609f-bd84c49481d1@amsat.org>
 <dd22f801-6d96-3dc6-3a51-2d5adb21d80c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <dd22f801-6d96-3dc6-3a51-2d5adb21d80c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 16:04, Richard Henderson wrote:
> On 9/25/21 5:54 AM, Philippe Mathieu-Daudé wrote:
>>> +    /* High bits must be set; load with lu12i.w + optional ori.  */
>>> +    tcg_target_long hi12 = sextreg(val, 12, 20);

>>> +    tcg_out_opc_lu12i_w(s, rd, hi12);
>>> +    if (lo != 0) {
>>> +        tcg_out_opc_ori(s, rd, rd, lo & 0xfff);
>>
>> Isn't lo already 12-bit? Why the mask?
> 
> lo was extracted signed, for addi; ori wants the value unsigned.
> The value range asserts in tcg_out_opc_* will notice the difference.

I indeed missed tcg_target_long, thanks.

