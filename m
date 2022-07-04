Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C09F565202
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:18:57 +0200 (CEST)
Received: from localhost ([::1]:48558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JAN-0003mW-PM
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8J8T-000369-RK
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8J8Q-0003Ct-B8
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656929813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5yELtTdELIv7VIGZgeMH4CiGHZUar6RzmTrSw9j30Y=;
 b=eXVa29/rct1yx/hjf7dGJZeV48oJkvjNXxrBPl4ChgtGtM8ME5D0XbdR3WkWEzF0KwANO4
 INMQjjBbLHEhihk+uVU8WkJLo4h8pIptKCfxfL/ell0U/iZBS5XmcjQhmqn2jPCNAXWZFc
 dZ19/VzZMT060D7QEq0jQn4wcBXR/2Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-nGPbp_KoMpi_kLQ6hW1OqQ-1; Mon, 04 Jul 2022 06:16:51 -0400
X-MC-Unique: nGPbp_KoMpi_kLQ6hW1OqQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 c22-20020ac81116000000b0031d25923ea8so5580538qtj.17
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y5yELtTdELIv7VIGZgeMH4CiGHZUar6RzmTrSw9j30Y=;
 b=zd0f8/zcAgLgszPoHbRwaVczOc20+QY8ABXMyr9uy8YHlxk8NrGEAunGO/c6LZp2VM
 /h7hmyPObM9AouMT/XSHKITHj5bwtx2z/i83VNPF+YRQc0KsCUXwrHMmnNVPuosgwKKG
 w3KzdykShudHV98mTfTB8LOKtRn7OmATLKUE5wop90JukuzbQGJH5UtpNUrgalrbmRXI
 Ie7yBc3xlEGIzM8iQk8CY/7WY7EOF8et1oCaUezZGTJCSLdVjBrW0O9voaNbFapreZil
 GaRXpRqAFVuIAFLw4WFlJ46Rd0ClfmG7stkns7pFrsrR9aZY7q/63i4+30k9xGRqBab6
 08Yw==
X-Gm-Message-State: AJIora+VpbeYSfTUUiQUuxr+hQaMgwW83q7runIjiUC2XlSHsv81vTG5
 j44+LXG/d9uuQiqpgigVEPryBiLBoQi4h0cZaDnYzWA/VQRqVrT2YB88Jz9lKKBlp2qB6PVmf7V
 tgrB0/fpU8WYrLXQ=
X-Received: by 2002:ad4:5aed:0:b0:472:7778:ff87 with SMTP id
 c13-20020ad45aed000000b004727778ff87mr26430720qvh.28.1656929811124; 
 Mon, 04 Jul 2022 03:16:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vjlUq1XlEkFFJxbANJNMJkD14jL7MU+k/cunLgR262M2/UAJwOwaKcp4jQ6IoO80vX//GXBA==
X-Received: by 2002:ad4:5aed:0:b0:472:7778:ff87 with SMTP id
 c13-20020ad45aed000000b004727778ff87mr26430705qvh.28.1656929810811; 
 Mon, 04 Jul 2022 03:16:50 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05620a44cb00b006a37eb728cfsm19463960qkp.1.2022.07.04.03.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:16:50 -0700 (PDT)
Message-ID: <b8d2595b-c86a-b1b8-8912-13fc9ba782d3@redhat.com>
Date: Mon, 4 Jul 2022 12:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/11] goldfish_rtc: Add endianness property
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Anup Patel
 <anup.patel@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-4-shorne@gmail.com>
 <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04/07/2022 11:59, Richard Henderson wrote:
> On 7/4/22 02:58, Stafford Horne wrote:
>> -static const MemoryRegionOps goldfish_rtc_ops = {
>> -    .read = goldfish_rtc_read,
>> -    .write = goldfish_rtc_write,
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> -    .valid = {
>> -        .min_access_size = 4,
>> -        .max_access_size = 4
>> -    }
>> +static const MemoryRegionOps goldfish_rtc_ops[3] = {
>> +    [DEVICE_NATIVE_ENDIAN] = {
>> +        .read = goldfish_rtc_read,
>> +        .write = goldfish_rtc_write,
>> +        .endianness = DEVICE_NATIVE_ENDIAN,
>> +        .valid = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4
>> +        }
>> +    },
>> +    [DEVICE_LITTLE_ENDIAN] = {
>> +        .read = goldfish_rtc_read,
>> +        .write = goldfish_rtc_write,
>> +        .endianness = DEVICE_LITTLE_ENDIAN,
>> +        .valid = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4
>> +        }
>> +    },
>> +    [DEVICE_BIG_ENDIAN] = {
>> +        .read = goldfish_rtc_read,
>> +        .write = goldfish_rtc_write,
>> +        .endianness = DEVICE_BIG_ENDIAN,
>> +        .valid = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4
>> +        }
>> +    },
>>   };
> 
> You don't need 3 copies, only big and little.
> 
>> +static Property goldfish_rtc_properties[] = {
>> +    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness,
>> +                      DEVICE_NATIVE_ENDIAN),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
> 
> ... and I think the clear desire for default is little-endian.  I would make the property 
> be bool, and add a comment that this is only for m68k compatibility, so don't use it in 
> new code.

m68k doesn't really need this.

kernel with the m68k virt machine and goldfish device supports "native" mode so I think 
it's not needed to add another layer of complexity for it.

Thanks,
Laurent


