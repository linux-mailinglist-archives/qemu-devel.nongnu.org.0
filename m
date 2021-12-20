Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3D47B3CE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:38:08 +0100 (CET)
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOU3-0003MJ-7l
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:38:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzN4D-0001BS-JV; Mon, 20 Dec 2021 13:07:22 -0500
Received: from [2a00:1450:4864:20::52c] (port=40790
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzN46-0001Rp-60; Mon, 20 Dec 2021 13:07:15 -0500
Received: by mail-ed1-x52c.google.com with SMTP id z29so41729035edl.7;
 Mon, 20 Dec 2021 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZgcjBuDXdNm2DppLhQp4fVGJCYjMKJ+7UYX9MIJjTwc=;
 b=itNKfKqF3IjESzjl/8HToFWSgVJ6mwwfz6jM4d3ObjecY/zUJ+oxTyRNmsy9uTK0yP
 qhxfDBOlOF5JS2isi/LfE8wGTkmba/iG17p+y6TTcYvYMP4Wo6Pw3Z91z08a7853kfjv
 DAbPSgIFL3jz/8BAbhuI1lQSRGslUWm1vOQsx2NUDwTPFEsXHhhxPmX8GbK/btH13e9v
 mUcwdL4S/R4SjoDclG3ijECvfbxFckMUNIBcxZPt9wVmg2b9eloK3FtoQ+lMGIWGxJ7v
 1Ex4+fCYJGzoHXR6U3yZJklBHYApVpqNmkje91cjCt8rzUuRbGdIEd9mIiDN2J8IHAFH
 9A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZgcjBuDXdNm2DppLhQp4fVGJCYjMKJ+7UYX9MIJjTwc=;
 b=KY9WaJ5to4sCQ8iSnKUttY7GS4on/mxzfXDCGD1wXp7nU8t7zeRVu/ga6KBefBXPV4
 0SKaGfvdxMqPPUXm076s9GnSTYxUKRYWDVA8cahTOKW6YZ90VVyroxyUa0Ni/Niivzd6
 NjHX4wxi9LZzTM7iebfx+WpoLVbGKDjIHLw2LubD4io1jwNbUsbKJ/a7bSfEkmI77o/R
 3pHu15P7Qe+j2o/2PFqn9M5QGpc7a3FOHFRgiot9H7+dEhlGp/nbe2TQy7pEtcSB+BM0
 gdQlL/Clgg9aZ7QOR4JJ5Gv98YsiYIVAYXHOmk+vAPamIsRfMCmTjjHWkLrvPv7VbEMr
 13lw==
X-Gm-Message-State: AOAM533QcolL0W+F30EZ/B6BAUpH/72iBLMdlcRZq8xcExDDUWu6v+5z
 xNP5/OUXayqSzaHSEk0TjIk=
X-Google-Smtp-Source: ABdhPJyzGgH6+GPUnufHVrHj7oE4YZHkCif6YFZhZvwS9cBnSniUaIpAxmCTEfsvDBTkBTwd8+rFYw==
X-Received: by 2002:a05:6402:2ce:: with SMTP id
 b14mr16656432edx.122.1640023630818; 
 Mon, 20 Dec 2021 10:07:10 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l8sm3195639ejo.197.2021.12.20.10.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 10:07:09 -0800 (PST)
Message-ID: <b4d0eb8f-a349-51df-3b4c-6081d55f5a04@amsat.org>
Date: Mon, 20 Dec 2021 19:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/15] ppc/ppc405: decade cleanup
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211206103712.1866296-1-clg@kaod.org>
 <880aa46a-97cb-ad79-b72e-f8276692d750@kaod.org>
 <b3345770-21e2-39f2-8fe2-e9963886e680@csgroup.eu>
 <c2eeced6-9cfa-2ea6-88be-a4dfb3d7aca2@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <c2eeced6-9cfa-2ea6-88be-a4dfb3d7aca2@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 09:33, Cédric Le Goater wrote:
>>
>> Don't know if this is the reason of our problems but I think there is
>> something to investigate around timer interrupts:
>>
>>
>> / # cat /proc/interrupts
>>              CPU0
>>    16:         68       UIC   1 Level     serial
>> LOC:          0   Local timer interrupts for timer event device
>> LOC:          0   Local timer interrupts for others
>> SPU:          0   Spurious interrupts
>> PMI:          0   Performance monitoring interrupts
>> MCE:          0   Machine check exceptions
>>
>> Any idea what the problem can be ? How does QEMU generates timer
>> interrupts ?
> 
> I did some archeology and fixed the 405 timer (PIT). Please see commits
> in :
> 
>   https://github.com/legoater/qemu/commits/ppc405
> 
> but we are still getting segfaults. At some point /init tries to load from
> fffffe04 which is obviously wrong.

Fetching an u32 value from a missing ROM?

> 
> Add -d int,mmu to have more info from QEMU internals.
> 
> I have gathered some info on this page :
> 
>   https://github.com/legoater/qemu/wiki/ref405ep
> 
> Thanks,
> 
> C.
> 


