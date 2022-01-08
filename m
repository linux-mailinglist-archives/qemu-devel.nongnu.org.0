Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF10B4883A7
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 13:59:42 +0100 (CET)
Received: from localhost ([::1]:33412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6BJt-0004kd-Kx
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 07:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6BIq-0003vl-Ik; Sat, 08 Jan 2022 07:58:36 -0500
Received: from [2607:f8b0:4864:20::a2c] (port=37520
 helo=mail-vk1-xa2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6BIp-0007Hi-4W; Sat, 08 Jan 2022 07:58:36 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id l68so5351134vkh.4;
 Sat, 08 Jan 2022 04:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RjgGO9sCdPbZ0hzU2VcTiPzPFeZmWKIYqQRoGqBPn2Q=;
 b=m96VKpOu9RrJjptahSHvOwu9nCDSZ4RZkk9aoFhQ6CvzPqcHyWUjfVsTCZv8mx8RUp
 znwaDT/S4Us4GZYkN5t9hD1aKgfmrqZXWBlzHjooYHQgC9MdETg3ISa05+Wdf4lu346e
 4sA+AdT8frFUjAMlVxkTHJ9FTJ99kr12ip6tkVbGE+SJdN7mLy2SBXqNQobSipAvB6Gt
 1VULj6qiy46f3c35LsJ8BKSaLfgBT1f1i4aFel72U1JiAIQm4TtJacm1tGlZC2RFQH7D
 l/b7B4TmRzCH3aUwf0aPmK5YwoOvtKQA96+/vUeb21hbjj8N/D553W48rjaXbvnlWLbn
 0Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RjgGO9sCdPbZ0hzU2VcTiPzPFeZmWKIYqQRoGqBPn2Q=;
 b=UetVm/vvH3Bxp1k+AAIFGSZsBdOJX195ALEB2yhhwxiRMOyNnJahbr+TYRZxROWvoW
 hx138QGpuOj4cjXmizrMosE1smRcNhiIvkG0XPRJ30aFE4lL+1XQMIv2xDprJZEHKXy+
 SMnglAL7hBiCtoMqFsuOMGOdDrecmwEd3nPLOHtH+cqDU6xM3KmNg0GPteGXLwbMGN6R
 yeEWHr9/jXX0V0WecLerqSTQV5/3wgRTYTDLJPUbnh6vVT6qs5sOwflvFvbzHADAmmbM
 pG5PPBvxTSvTToMMWotF7hpTb1N9fAggOm3FqrF2t90oienYHhME4uBzjn+RlyJOufAp
 Wd3A==
X-Gm-Message-State: AOAM530cKlHFRpYpoAIOFL+AeDl0f3/bcm5ehFMBMDP+EGQD4ec7UUe9
 lYz7x6wetjxDes5xqCm7ZRE=
X-Google-Smtp-Source: ABdhPJw37m89a7WuDNKZEzWaHa3BIi/e09A3U3kEQgXfP+yjNRf30J34peS4fQ9xj7Lu2hNtDY8MFw==
X-Received: by 2002:a1f:2849:: with SMTP id o70mr24226299vko.35.1641646713825; 
 Sat, 08 Jan 2022 04:58:33 -0800 (PST)
Received: from [192.168.10.222] ([179.110.60.42])
 by smtp.gmail.com with ESMTPSA id u137sm843049vku.42.2022.01.08.04.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 04:58:33 -0800 (PST)
Message-ID: <eb21e4d6-1767-56b1-bf38-1b28b94ce6f5@gmail.com>
Date: Sat, 8 Jan 2022 09:58:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 17/18] ppc/pnv: Introduce user creatable pnv-phb4
 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-18-danielhb413@gmail.com>
 <4c3eab1f-e435-b468-96e3-9f3d78430534@kaod.org>
 <3464eb94-7905-fe0d-7924-8cd22d1a555e@gmail.com>
 <97527835-3c83-69e9-d1c8-873c4d549b19@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <97527835-3c83-69e9-d1c8-873c4d549b19@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.199,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/8/22 08:11, Cédric Le Goater wrote:
>>>> +        object_property_set_int(OBJECT(phb), "index",
>>>> +                                phb->phb_id, &error_abort);
>>>> +
>>>> +        pnv_phb4_set_stack_phb_props(stack, phb);
>>>> +
>>>> +        /* Assign the phb to the stack */
>>>> +        stack->phb = phb;
>>>
>>> The stack object should check the validity of the stack->phb pointer always.
>>
>>
>> What do you mean by "check the validity"?
>>
> 
> I am thinking of the usage of 'stack->phb', for instance in the routine
> pnv_phb4_update_regions(). We should add an assert there.

Oh ok. I'll add an assert in this point (and in the code above that where you
also pointed it out.

And about pnv_phb4_update_regions(), v3 will need to handle it but not with
an assert but with a phb != NULL verification to become a NO-OP if phb is NULL.
It's an easier and less intrusive fix than trying to change the order of the
XSCOM initialization in stk_realize().

I will (hopefully) explain it better in the v3.


Thanks,


Daniel

> 
> Your changes seem to cleanup the stack <-> phb relation quite a lot. Which
> is good.
> 
> Thanks,
> 
> C.

