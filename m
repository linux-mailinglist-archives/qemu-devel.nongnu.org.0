Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE0455329C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 14:56:43 +0200 (CEST)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3dQw-0005UV-5f
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 08:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3dPq-0004cm-EV; Tue, 21 Jun 2022 08:55:34 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:38533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3dPo-0004se-U6; Tue, 21 Jun 2022 08:55:34 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 c3-20020a9d6843000000b0060c2c63c337so10594927oto.5; 
 Tue, 21 Jun 2022 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AjB9M2hhf4nYgmJdngyhRD4kIx4qbc2GGJOVYlekFUs=;
 b=dS0r3B4TuhbCoVQqTfxr90ZEP7ejoJw/ZFXLREjtuyi+8thUry8iViPjHaQmsYae4O
 9Ym7PCgahzxYRWej+fa8BiXnl8ItG7BMmk9U989zy28YXVO7tTvMtFz5TxvpM1a/ihke
 d73a9oyMi9t9yjc76DSC75CbV0DjN8ZpbXFfLe8QSQ35MomakOJtGBlvkVaesQ5pLWYK
 X8UuaVDnzh6mo8mWak0LClxhO5qLVuUUP3I0Iwe2WXVuU5qKJrdY1sbDD+kE498qqEdh
 qf6W+jllknoSR1WndTiVXbtByflkkyNUOvqL+wBMW6R2R7Yu21cXYgaBSb+V+RXuN+wj
 4EVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AjB9M2hhf4nYgmJdngyhRD4kIx4qbc2GGJOVYlekFUs=;
 b=fA/UdK2SnnN64YQ+hLEBMm5sD5/+YKP7mGfZ954INJQeWQh+tT0/uXs0CwI5ednuN1
 9PiNlwWPWopTrMf1/RXGsKpU5/qQ5mt1oGZBrqBq7ZtKr4RabuQzZ1V4jMxilhiEH+09
 XeIX1qDaoZW+DoBC/irtdeZYrw1AEc/u9r18S3rvnJhBEpWh28iiWDbQEPqooMoiDK4Y
 F3L0+GCUzbMDqUDdKd/hPY1IyWu0ffFxkGgeT6YgWI3EFh+EfmLC4REEklmKL2OKyN2P
 j7a7EdHOg7ULhwIj3Manhd13SSVPVywSA0pX7N4GOhGDHse2Vj1z66ok8w26A24F3cmu
 TqIg==
X-Gm-Message-State: AJIora8Qo1FyWvKXg9TqH1ZxRrYouW7UrKAppV0LtjThTD57fn5GNcm6
 DpkHPuBxDgqk+g/EHg1YfVU=
X-Google-Smtp-Source: AGRyM1sZBWjovuEpAOPIdm0RtbZhQrCIw1UTOzk45SMDohPZKW65S+JxNqowvI4TuMATGlPoSuNJgQ==
X-Received: by 2002:a05:6830:1f54:b0:60d:fc57:8877 with SMTP id
 u20-20020a0568301f5400b0060dfc578877mr11113578oth.65.1655816131311; 
 Tue, 21 Jun 2022 05:55:31 -0700 (PDT)
Received: from [192.168.10.102] ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 ds44-20020a0568705b2c00b00103466bfa4dsm1345936oab.19.2022.06.21.05.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 05:55:30 -0700 (PDT)
Message-ID: <9d31a226-5fb6-5772-38bf-e9c899334fcb@gmail.com>
Date: Tue, 21 Jun 2022 09:55:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu v2 1/2] ppc: Define SETFIELD for the ppc target
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220617060703.951747-1-aik@ozlabs.ru>
 <20220617060703.951747-2-aik@ozlabs.ru>
 <14983389-aace-f030-65a8-2234b94952bd@gmail.com>
 <efa3a569-2533-0156-2dbb-c4ffd21c3b38@ozlabs.ru>
 <b6d8b097-118e-7f44-d546-b7326e7cb4c6@kaod.org>
 <025178e9-6d32-3551-0d2b-73f27ef7ffc3@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <025178e9-6d32-3551-0d2b-73f27ef7ffc3@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 6/20/22 05:10, Alexey Kardashevskiy wrote:
> 
> 
> On 6/20/22 16:17, Cédric Le Goater wrote:
>> On 6/20/22 05:37, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 6/18/22 02:50, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 6/17/22 03:07, Alexey Kardashevskiy wrote:
>>>>> It keeps repeating, move it to the header. This uses __builtin_ctzl() to
>>>>> allow using the macros in #define.
>>>>>
>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>> ---
>>>>
>>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>
>>>
>>>
>>> soooo I do not need to repost it, right?
>>>
>>>
>>
>> The watchdog patch depends on the availability of these macros.
>> Doesn't it ?
> 
> yes but this one could go in now and I will repost 2/2 a little later on top.

As soon as the current ppc PR is merged I can take this patch. If the 2/2 repost
happens earlier than that you can just re-submit it with 1/2 again.


Thanks,


Daniel



> 
> 

