Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C9743FC74
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 14:43:33 +0200 (CEST)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgREJ-0002dW-O1
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 08:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgRCo-0001x5-Vk
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:41:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgRCm-0001Vg-V8
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:41:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id p14so15923430wrd.10
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GZ0eIZXcD9XMHu0nsxUT+IyJXM8BOQVIkHpQj2rZnhw=;
 b=iteDpbaalzhFRp6T0xtRkWZBHACPWoRBbBSRLws312IaSr1W7CpPOAHnW11f+RobND
 vnR8wF+VCBVAFb3H+EsyMsz7Kpsd861ZJ7imEVlVns+NkjevXqCV8KTCzJVIdTZHODS3
 IVWEV1H8UXMDleKRFnp2eobNM4XSFenJXWz4EjXiv501FyJEOEXpoBp7zeFiuXQ5OU8o
 8c2gyYFugazvtpN4J91tjFsxf76422koWXQBYNXqaY957xdqOid3zXUg77hi9XiEijbM
 9rH56J1/UYVOXhZxXE7xa9O0lJCUogYXR/aK9aZLT6rXWnlKlUqs1iH9IPh8mZlf8E9m
 30Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GZ0eIZXcD9XMHu0nsxUT+IyJXM8BOQVIkHpQj2rZnhw=;
 b=qziO+QQd2JyHaLZpmHUqx9UEY59YsJJTQIsk9Ahk2ZZpBvcVpmbFIwo0YFhZFMjyf3
 btu0JVWynXm4zemcdEjzU+Nfthk63qcxMrHJG4x2r88MPpIaFIn0gj5gyWDbd2Z4+YRT
 ToRDHlAcI0SApSxnpJio7XQopJ/+/o+sA2y+v6zz4nhTUU94ser3MWLHNDzeEyiWJ3zE
 iSdIeBqWf34imEvq5IyIEVeTaphZVPCNi1BWvb/g6Cb5xjRuLWWT7WZbioWBdqqhIKF+
 4UFFRD73U9tsvk0KqZJcdy1boYcwz28OQoT5cnb5YrSkTtQ83QUeEPDKXy6V4vMPR3+h
 V6Ig==
X-Gm-Message-State: AOAM531lqR5uY2uDeawpgbyPrwY7rtGWlX7pVemYReJz0+p4PupikvHc
 M9z856zXuaxWxetjRxKitHY=
X-Google-Smtp-Source: ABdhPJw28kw/fBXHtiJRaoJ/clrRJGpGXXQZi/njsaSpc9nesV5tuZU38jOZeWRuhxJm9preef8Blg==
X-Received: by 2002:adf:f001:: with SMTP id j1mr9147436wro.351.1635511314983; 
 Fri, 29 Oct 2021 05:41:54 -0700 (PDT)
Received: from [192.168.20.130] (192.red-83-57-30.dynamicip.rima-tde.net.
 [83.57.30.192])
 by smtp.gmail.com with ESMTPSA id r27sm5837045wrr.70.2021.10.29.05.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 05:41:54 -0700 (PDT)
Message-ID: <0038aec3-969b-047b-72f6-35278595cde2@amsat.org>
Date: Fri, 29 Oct 2021 14:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 18/23] hw/intc/sh_intc: Simplify allocating sources
 array
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <7257db154178303a7913986e230ec0ce1af387cd.1635449225.git.balaton@eik.bme.hu>
 <4d81b027-1ef1-ae56-1c77-262f9ac52e8d@amsat.org>
 <758e4b7-30c0-8ad3-bc9-4b43dae3e71@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <758e4b7-30c0-8ad3-bc9-4b43dae3e71@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 13:59, BALATON Zoltan wrote:
> On Fri, 29 Oct 2021, Philippe Mathieu-Daudé wrote:
>> On 10/28/21 21:27, BALATON Zoltan wrote:
>>> Use g_new0 instead of g_malloc0 and avoid some unneeded temporary
>>> variable assignments.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/intc/sh_intc.c | 13 +++----------
>>>  1 file changed, 3 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
>>> index eb58707e83..ed0a5f87cc 100644
>>> --- a/hw/intc/sh_intc.c
>>> +++ b/hw/intc/sh_intc.c
>>> @@ -400,21 +400,14 @@ int sh_intc_init(MemoryRegion *sysmem,
>>>      /* Allocate 4 MemoryRegions per register (2 actions * 2 aliases) */
>>>      desc->iomem_aliases = g_new0(MemoryRegion,
>>>                                   (nr_mask_regs + nr_prio_regs) * 4);
>>> -
>>> -    j = 0;
>>> -    i = sizeof(struct intc_source) * nr_sources;
>>> -    desc->sources = g_malloc0(i);
>>> -
>>> +    desc->sources = g_new0(struct intc_source, nr_sources);
>>
>> g_new() is enough, since all get initialized in the next line.
> 
> Only their parent fields get init not the whole struct so I think g_new0
> is still needed.

Oh you are right, I missed that.

> 
>>>      for (i = 0; i < desc->nr_sources; i++) {
>>
>> Even clearer as:
>>
>>       for (i = 0; i < nr_sources; i++) {
> 
> This may be a small improvement but not too much, desc->sources is
> assigned a few lines before. I consider this change but not sure about
> the g_new0.
> 
> Regards,
> BALATON Zoltan

