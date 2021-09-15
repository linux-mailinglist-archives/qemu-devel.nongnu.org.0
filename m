Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A4940C46A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 13:35:18 +0200 (CEST)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTC8-0001eq-Rp
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 07:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQT9c-0000Vq-4d
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:32:40 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQT9Z-0004gU-9Z
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:32:39 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d6so3320439wrc.11
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i16Jx1dOKB2+JSWDesFzw4eGD9flhCGCi9tHiJR35Zg=;
 b=BTcnC7XfWtC0BY0Po3F+ZwB4LgZQ/c+wn6aLhKpC3I4DstQxMehzNtx8ucJTWhqqm1
 Z6XAgFfjcOsyW9RzDk3kG2T5DhX60svtmrHBUSW/w6+rTKO0CgLnchPk8tR8ePXCLApy
 OgB1i+eDU0Ffo2pUTGov4XQrJPyVqVCT3GoKcfOt8s3ghB/eO7m3l5xDYHPa/c0w+dgI
 X5HYQEuGKl3s9OlJ7uDDeVh0IAi/wu4mg0LyOY3yLnqB7jQgsd7Xel26i9RJqDYslc0b
 TAQKZY+PaaSg1Aq9JuLUdfgvMeDPoJDfh5iwcI+6UrFAbLyGkzxTlsm87PCIaA8QL81y
 b16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i16Jx1dOKB2+JSWDesFzw4eGD9flhCGCi9tHiJR35Zg=;
 b=Iz4bVfi+WXZXhZSmJArKGpEeqEU8C3bm8CvwyqEmrY7eib3FnPV4GMpO+fzl53a03R
 58qx0cQBab02NhDCiQKbc7ExRuDguvi8/Tmwj/3ZR24URW9DCKA5UASi/kAkQQEVPKbx
 FpmNWNrJGBrftfz05n3QA6107+yPnGiYnkKSIScnQRGaOF7ec67SsJBWXV4i5vZGhYRn
 p3aCQh8sjDc6VQQ1kRxvPVMfn5kQzw94oS5Dkd4KAnWcXhKJgzZdbx2q0XV3k7BwzbT6
 dMhSDAH5rS3xD3rejnW/xtOqFPBdOZFp4dRdOISmMq6xJCWTOUUcpF9mUldOsEQ1lXf3
 6PgQ==
X-Gm-Message-State: AOAM533tmaB+sygTKASdeog+jEV/5zWcqBENupFzMHguZ2qzE9lRRGhZ
 LPODzJDfhCyBRI5vZKYXDOQ=
X-Google-Smtp-Source: ABdhPJyWAc8uG/ZQ1OFj8Fy9I6Geqd/e6JwmMQEeVCGW+bWU/CyE2vvocCMBgp+efPrnxaocOQeJgw==
X-Received: by 2002:adf:b319:: with SMTP id j25mr4562941wrd.256.1631705555553; 
 Wed, 15 Sep 2021 04:32:35 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id l124sm3967436wml.8.2021.09.15.04.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 04:32:35 -0700 (PDT)
Subject: Re: [PATCH v2 20/20] q800: configure nubus available slots for Quadra
 800
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
 <20210915101026.25174-21-mark.cave-ayland@ilande.co.uk>
 <34dbcdd0-c328-b6e5-c6da-dcc22cdb58f0@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <89e3482f-1e74-5ee6-fa4c-8bd046af8f0d@amsat.org>
Date: Wed, 15 Sep 2021 13:32:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <34dbcdd0-c328-b6e5-c6da-dcc22cdb58f0@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 12:50 PM, BALATON Zoltan wrote:
> On Wed, 15 Sep 2021, Mark Cave-Ayland wrote:
>> Slot 0x9 is reserved for use by the in-built framebuffer whilst only
>> slots
>> 0xc, 0xd and 0xe physically exist on the Quadra 800.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>> hw/m68k/q800.c | 9 +++++++++
>> 1 file changed, 9 insertions(+)

>> +/*
>> + * Slot 0x9 is reserved for use by the in-built framebuffer whilst only
>> + * slots 0xc, 0xd and 0xe physically exist on the Quadra 800
>> + */
>> +#define Q800_NUBUS_SLOTS_AVAILABLE    ((1UL << 0x9) | (1UL << 0xc) | \
>> +                                       (1UL << 0xd) | (1UL << 0xe))
> 
> There is a BIT(x) macro for these kind of constants that I find more
> readable as there would be less < signs and perenthesis but I don't
> insist on using it just note for consideration in case you need another
> respin for other reasons. (That macro could also be used to shorten the
> ~(1UL << nr_bits)
> values in other patches.)

Good idea.

