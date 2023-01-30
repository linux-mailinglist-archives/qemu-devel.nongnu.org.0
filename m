Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B116809D7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQh0-0000xy-GB; Mon, 30 Jan 2023 04:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pMQgt-0000xf-CD; Mon, 30 Jan 2023 04:43:07 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pMQgr-0000HL-AB; Mon, 30 Jan 2023 04:43:07 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 n25-20020a9d7119000000b0068bd8c1e836so121344otj.3; 
 Mon, 30 Jan 2023 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QXC1SFkJhgr3DCijXh88/9Un61X0/OTTqG9jPX9S1Gc=;
 b=YBRRp+J74i3/D+tdFTXiDyKbM+RfVJtfYApMH49jh9Z2eYN0T0KuKl9gV1CE/gY9KU
 jw+3Uth2xM/AeD6iauNJzAKW1WSQJYHLGXLGx/zosLewxvNNjQw66JHaE44knGdfAtdF
 ZFYKM7NYeKpDlrcywz7OyUWLrPe75V5/Ylk095J0tdcIDFI1pAk1CXBhRMwVajW2May2
 sjYdsNCrxYC2GCyzDwldrut6C6ze86AIbPGAvZ9fXrpMjc5rNSevAN700b37KWd5p0Wh
 /zz9mGZTKYqgw4/9ZfMIMGZOgGhUDvF5+Oo2PWsjXEX+KcZq0dN13i7221l9Df2gWy02
 n/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QXC1SFkJhgr3DCijXh88/9Un61X0/OTTqG9jPX9S1Gc=;
 b=LcC+7tTrfOXVjP/1t9Pj/Bk/xw6eLoAbyi+qAYH4jAoUXdw0Ce02W+hd1MFv0AcGHj
 PNSGgy/6ojbN5t8JEf6XMB6FMkEekwRviDBRmvEzF2JXO5Itx7zAj7Yll4YAwQPReWEu
 e5kv77H0lO0ZW8uBKUnz3GAFrfVVaJTlz+JCK+3N7mAQDlyYpoxMY49Rz6AdBtCurKo2
 nV5wLe0lQOdVUZozVh0uIiqpRppo33Q3imNAMKzR8XRuhn7wWGvOgGWlB1AcEbPNyJXw
 P8hbJ3ooEA//qzeNbwYBTx1pq///VIkLmMfMEOsl+rpeY2281BX1suEYk/NH2rIecWad
 e4iQ==
X-Gm-Message-State: AO0yUKXpKVtaWTo667N0k97pC3J15ZOV4ManB6fNJidpLwjShDrFkekj
 C+xb7qoD271ygA3ms0G9nnSynO3/UEc=
X-Google-Smtp-Source: AK7set9htSN04V/zsBrFeA92Z1bJAcYLorJ5/GH1+8t6nWd1DLMPuYxOnOEeCyHf9wuR9CbHtqdbQg==
X-Received: by 2002:a9d:6546:0:b0:68b:cc93:28b with SMTP id
 q6-20020a9d6546000000b0068bcc93028bmr1906231otl.29.1675071783564; 
 Mon, 30 Jan 2023 01:43:03 -0800 (PST)
Received: from [192.168.68.107] (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a0568303a9100b0068bb7bd2668sm3318112otb.73.2023.01.30.01.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 01:43:03 -0800 (PST)
Message-ID: <e4463a9e-f8de-aec1-f2ed-fae977049019@gmail.com>
Date: Mon, 30 Jan 2023 06:43:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] Misc sm501 clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1674333199.git.balaton@eik.bme.hu>
 <78368e67-0ed7-1828-100c-d4d9d15fd27d@linaro.org>
 <46b0b8d7-dce4-18e2-970d-2fd81100bd98@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <46b0b8d7-dce4-18e2-970d-2fd81100bd98@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.092,
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



On 1/28/23 23:43, BALATON Zoltan wrote:
> On Mon, 23 Jan 2023, Philippe Mathieu-Daudé wrote:
>> On 21/1/23 21:35, BALATON Zoltan wrote:
>>> Some small trivial clean ups I've found while looking at this file.
>>>
>>> BALATON Zoltan (3):
>>>    hw/display/sm501: Remove parenthesis around consant macro definitions
>>>    hw/display/sm501: Remove unneeded casts from void pointer
>>>    hw/display/sm501: Code style fix
>>>
>>>   hw/display/sm501.c | 419 +++++++++++++++++++++++----------------------
>>>   1 file changed, 210 insertions(+), 209 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Ping? Who will merge this series? Should Daniel take it via PPC or Gerd for display? I only care that it gets in one way or another and not lost between maintainers.

I'm planning a PR at the end of this week. I can take these in.

Thanks,

Daniel

> 
> Regards,
> BALATON Zoltan

