Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C364BC87E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 14:13:04 +0100 (CET)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLPXr-0005Qz-4q
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 08:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLPRU-0002zA-NG; Sat, 19 Feb 2022 08:06:28 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:46616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLPQJ-0002u2-LF; Sat, 19 Feb 2022 08:06:25 -0500
Received: by mail-wr1-f41.google.com with SMTP id x5so14148995wrg.13;
 Sat, 19 Feb 2022 05:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H82VVOcBI3DYXbqcs/TEUZQxrLeOyKk/Pw6tMjA45xs=;
 b=UfnFEB+lgrW/LqYdPfaJ5H5UQs0VwBh9gHwtEJvGwFA93aB/tPSVyP/Ro3/R27aSFX
 tiYm0LqptbZD5xCmBIfFOHRjzG7jWEz6vCHBhhY4VVC5xzm/R0723lMlqPnalCEyubhj
 Dx1sWZb34bxMpvGD+WnFunFZ/os/77R5Vtr8VphGo5D3i9z8sUGYRhEGDBRavgnhs2+Q
 At0aMDtO2Q8ILPu8CG5e+YwZqnvdFJ8KQ7dlaAI94Xfx24TntpWrv6MOKOi6lCqcbNXX
 gjzGUEw8+qqvhYWLIQq8vxanF7k++H96S7TeX5citCAqFAc0Jw3xc2w15YvDCVkTCf5G
 v4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H82VVOcBI3DYXbqcs/TEUZQxrLeOyKk/Pw6tMjA45xs=;
 b=W5tGd/TNSR+TJazimiup3+pTngTwxA9v2IiBE9ANNwOSICnZEdrAMw4cc182DnAZlz
 tQDl1mh8CJ3XM5ISACWc9oQaG0P+C4Y2j4kUm5NWpWIaw7RummXhv/PP0Lx0rg50tEj5
 f/vqqUa9YXo2qTJu4nSeqXOdJV6hY3gFwNSArGebPgDK+BUz/paHEqIYSAxBgcAgHTIq
 RoROqll0c0Dw8AhMBx9YgwAZRRqLbk0/mRzQRWbpo9eL+csSgiBkl6D1Y5EmVdMqYOgc
 csyDsAN1hvEU/vT/YArDr87lVxDUDLQ4i/0/kXY2PW6h3Cx4HbXb4vbT93wbXVmeniiO
 kq4A==
X-Gm-Message-State: AOAM530QR9L93cuMHUyHTy76jx0a8zrPhUpQEjFep3/dQpNwDKhp9xG2
 crCUm/4VXfzLGTnZpC22QME=
X-Google-Smtp-Source: ABdhPJyC0Ys+5D5ubIyH6YqUxJ6mZ4i8VqEeUa/RsIqNJcgSQc4ghpzgUymnXFwGBSSLNw5X2ictmQ==
X-Received: by 2002:a05:6000:1181:b0:1e5:a6af:7b8a with SMTP id
 g1-20020a056000118100b001e5a6af7b8amr9285534wrx.416.1645275912629; 
 Sat, 19 Feb 2022 05:05:12 -0800 (PST)
Received: from ?IPV6:2a10:800a:bb8:1:6510:42ac:bb55:9590?
 ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id a1sm45938652wrf.42.2022.02.19.05.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 05:05:12 -0800 (PST)
Message-ID: <ba8fb8ae-9af0-a740-6451-1e12dba14691@gmail.com>
Date: Sat, 19 Feb 2022 15:05:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/1] hw/ide: share bmdma read and write functions between
 piix.c and via.c
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20220219080818.327683-1-liavalb@gmail.com>
 <20220219080818.327683-2-liavalb@gmail.com>
 <5b443413-5f5c-48f9-161-6573b79aa8e3@eik.bme.hu>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <5b443413-5f5c-48f9-161-6573b79aa8e3@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.221.41; envelope-from=liavalb@gmail.com;
 helo=mail-wr1-f41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/19/22 13:19, BALATON Zoltan wrote:
> On Sat, 19 Feb 2022, Liav Albani wrote:
>> Instead of letting each implementation to duplicate this code, we can
>> share these functions between IDE PIIX3/4 and VIA implementations.
>
> OK but there's a way to take this even further as cmd646 also uses 
> similar functions just with more cases so you could remove the cases 
> handled by these functions and only leave the difference and call the 
> default function from the default case. E.g. (untested, just to show 
> the idea):
>
> hw/ide/cmd646.c:
> static uint64_t bmdma_read(void *opaque, hwaddr addr,
>                            unsigned size)
> {
>     BMDMAState *bm = opaque;
>     PCIDevice *pci_dev = PCI_DEVICE(bm->pci_dev);
>     uint32_t val;
>
>     if (size != 1) {
>         return ((uint64_t)1 << (size * 8)) - 1;
>     }
>
>     switch(addr & 3) {
>     case 1:
>         val = pci_dev->config[MRDMODE];
>         break;
>     case 3:
>         if (bm == &bm->pci_dev->bmdma[0]) {
>             val = pci_dev->config[UDIDETCR0];
>         } else {
>             val = pci_dev->config[UDIDETCR1];
>         }
>         break;
>     default:
>         val = bmdma_default_read(opaque, addr, size);
>         break;
>     }
>
>     trace_bmdma_read_cmd646(addr, val);
>     return val;
> }
>
Yeah, I see how I can do that for both bmdma write and read of cmd646. 
I'll send a v2 right away with a fix.
>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>> ---
>> hw/ide/pci.c         | 47 ++++++++++++++++++++++++++++++++++++++++
>> hw/ide/piix.c        | 50 ++-----------------------------------------
>> hw/ide/via.c         | 51 ++------------------------------------------
>> include/hw/ide/pci.h |  4 ++++
>> 4 files changed, 55 insertions(+), 97 deletions(-)
>>
>> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
>> index 84ba733548..c8b867659a 100644
>> --- a/hw/ide/pci.c
>> +++ b/hw/ide/pci.c
>> @@ -502,6 +502,53 @@ static const struct IDEDMAOps bmdma_ops = {
>>     .reset = bmdma_reset,
>> };
>>
>> +uint64_t bmdma_default_read(void *opaque, hwaddr addr,
>> +                           unsigned size)
>
> Indentation off? Also everywhere else, usually we indent not with the 
> parenthesis but with the list within. (Auto indent in most editors 
> does that probably.)
>
I guess you mean that it should be:

+uint64_t bmdma_default_read(void *opaque, hwaddr addr,
+                                                unsigned size)

Like this?

I'm using Visual Studio Code, so I might not have the correct settings 
for this editor with QEMU.
The checkpatch script doesn't complain on style issues, so what can I do 
to make this correct?

Best regards,
Liav

> Regards,
> BALATON Zoltan

