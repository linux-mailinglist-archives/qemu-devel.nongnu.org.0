Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587A339D757
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 10:29:22 +0200 (CEST)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqAdM-0005FF-Ur
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 04:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqAcC-0004Aq-JY; Mon, 07 Jun 2021 04:28:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqAcB-0007sL-2V; Mon, 07 Jun 2021 04:28:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id y7so11915391wrh.7;
 Mon, 07 Jun 2021 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZBJGCFU0GEjR2FrLYDCxkgn4dbe1u6049BAtCKii+4k=;
 b=c5pUZ1knLcr9+n4uxNh3Wj14Gdcpa+KarGgZ4grily57N3k9wJNtLMQ0ypY3o6nM3O
 TkqVJtG/3sT3VRfHZfvCzbbOwURHKzQlcrjrLNh/ErXloABia521/aER3ExdY/V6+i+6
 GtAfcR+9xoKRLSyqN9DN9NtJ5xjd4x/zTy9M2BSctiQtjN4qX68bXhPnk4LHPCYmZcrA
 Ac4lM4gW1ald0Sh0ESPekr3ziRrPCxVvZhmIOGvUZWtBT+uZIKooxFwdmgquaaLmEyDe
 bxnJfE5ka3U2t2Yzr8EFMtQgbPbk+gVXj/FNdoc64SAdEW6TOT1/ymObGRu9/ATYpGQC
 59yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZBJGCFU0GEjR2FrLYDCxkgn4dbe1u6049BAtCKii+4k=;
 b=QuItUVUyejyKHFOyLWJaNOswtBaEJwkRHp7juPk97lsB96MfNa0Hslp5g6oFEy4j++
 mGysNICZ5Kv48SkYTJmB5G38S5Pp1f1Kx3IHrzqJAHvMGHWUv6Yj/t98uVTFufhkhv7R
 p2Kejj6+ABEVLsDqEbHZerfTXcrGTTYSb2szvcczXkNhJ4ZB4xFMGVr+cR5c8wZJJSf1
 nSmxANdZ/dq2wqNKbbu+9tVb588oJlG8H/4OimqzEabLf0AcOwA+S20KDPTLo/y/b3wV
 YcRbLjPOAV1ho9yZ9fMQ2FwlCeWVZC0E/fESxjOyGBn2cN+8Q7voPracyEPu9bYD1dNI
 348A==
X-Gm-Message-State: AOAM530nOfvir2glKuLcZU1MQ4F404E6CDjC8irJslxlo7qRn/6auq5P
 uId6zrYVNFy1aCsHzN6o0dU=
X-Google-Smtp-Source: ABdhPJxPllPRvav0pjVoIOa8apk4Klu63XKt0DsZBLiX954cYd0Wz83tLEcZVGjtifM3V2WET8zNXA==
X-Received: by 2002:adf:eeca:: with SMTP id a10mr15521110wrp.184.1623054484757; 
 Mon, 07 Jun 2021 01:28:04 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id h9sm9158990wmm.33.2021.06.07.01.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 01:28:04 -0700 (PDT)
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
 <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
 <2def176e-8707-78cc-b524-3fd47456261f@amsat.org>
 <c4b050f9-8d36-28a5-b5fe-343bbbe0efdb@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dadd0b69-e613-a0f6-5f81-a62159b41493@amsat.org>
Date: Mon, 7 Jun 2021 10:28:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c4b050f9-8d36-28a5-b5fe-343bbbe0efdb@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:33 AM, Laurent Vivier wrote:
> Le 02/06/2021 à 12:49, Philippe Mathieu-Daudé a écrit :
>> Cc'ing qemu-trivial@
>>
>> On 3/18/21 4:39 PM, Philippe Mathieu-Daudé wrote:
>>> ping?
>>>
>>> On 3/7/21 8:48 AM, Philippe Mathieu-Daudé wrote:
>>>> MemoryRegion names is cached on first call to memory_region_name(),
> 
> It is cached on first call but now that it is used in the trace function, does it mean it will be
> always allocated in memory?

Yes, this is how memory_region_name() works:

const char *memory_region_name(const MemoryRegion *mr)
{
    if (!mr->name) {
        ((MemoryRegion *)mr)->name =
            g_strdup(object_get_canonical_path_component(OBJECT(mr)));
    }
    return mr->name;
}


> 
> Thanks,
> Laurent

