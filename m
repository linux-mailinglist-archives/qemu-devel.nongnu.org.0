Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8502A48EB1B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:53:45 +0100 (CET)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8N1T-0002XR-I5
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8MoW-00048A-7P; Fri, 14 Jan 2022 08:40:20 -0500
Received: from [2607:f8b0:4864:20::233] (port=33305
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8MoT-0005pv-Us; Fri, 14 Jan 2022 08:40:19 -0500
Received: by mail-oi1-x233.google.com with SMTP id x193so12248834oix.0;
 Fri, 14 Jan 2022 05:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c3hu+Ore89j7luf9bsCagk1fNoYJAxQEFVJ6B+tCeRI=;
 b=ifdO8XtssrVwL3VqBrMohJWfyayD1aO1R4LpsTfk7zdfNcCZkMVMTbG52VDn8w7XT2
 EqEozdmVDwtG40zsVywK5mrivPvvhV/0RxMM43DqSulOaRGpvtiZXBbXB+5dGiqDPPiJ
 gLt3H0ipWiIZoW+LFkUU0a4udeuDwkaEt3nG79gBaya1Cd0rdguwo1zrfB/OtDYxbpTA
 S6LUzG5y/2giexiv5NZvGgPtx/Fz6Wd58a0ozQ5e88/zwS8kBwG6kPHsqiqvuyvQvM83
 /6eV8zO3781+tK7zdZJ3mDFmqDjkTRqClyPk0Gei73y7VosTWompB+OxjTKtLTP98juT
 IwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c3hu+Ore89j7luf9bsCagk1fNoYJAxQEFVJ6B+tCeRI=;
 b=Wlp1JEACAB0keFN0K1JKSGTZ8HZihQd/rCL14eioPQH08DvnF4gc52FWxX8pxBn92Y
 2nkyL4JNgHjJB45cWh6yAf1uTFK2aDJJcRICVoRu3ngNyFBR6F9loDJIApVNpuB2mjsE
 1bz4Gau2WKJCivshFqajJBKRs81Mzpw24dQlwl6KsXBaA9WdpoBKqr9e4/sak2Oj8ty1
 86i5zAtFiZ1Zu5EtvrQ6sz6BULKx/x07J1zIIjKAOs5SCY5utAgqy1BPH5aQ9YVZ18pC
 AwVFa3CbVZB0pkL9ctx5NdWqIHqu7RA4ezimiLvE9416yvwbxCDfIZcxYiulyjEXTVZn
 3rjA==
X-Gm-Message-State: AOAM53194I6aUPoA1DQLstDdtqei0+1qP3eicYtdEtp2wTquXUrWYLyw
 YGRRW9sTzXGqfKUL4lVFmGQ=
X-Google-Smtp-Source: ABdhPJye+0sZ2bQusb6aK8SJWnGaRTxz8TIJa+7vC6bk2XqL88KSg32/q7AZGOZTlxT/bN8iMESNRA==
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr12386504oig.5.1642167615741; 
 Fri, 14 Jan 2022 05:40:15 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id bf15sm2096875oib.38.2022.01.14.05.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 05:40:15 -0800 (PST)
Message-ID: <351b15b5-cbb2-28e8-7889-c3c031edaa1b@gmail.com>
Date: Fri, 14 Jan 2022 10:40:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 15/17] ppc/pnv: convert pec->stacks[] into pec->phbs[]
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-16-danielhb413@gmail.com>
 <4c9fbc81-ae33-8b0f-18bb-10bb0b0c0cf0@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <4c9fbc81-ae33-8b0f-18bb-10bb0b0c0cf0@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 1/14/22 10:33, Cédric Le Goater wrote:
>> @@ -1520,14 +1520,19 @@ static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
>>       for (i = 0; i < chip->num_pecs; i++) {
>>           /*
>> -         * For each PEC, check the amount of stacks it supports
>> -         * and see if the given phb4 index matches a stack.
>> +         * For each PEC, check the amount of phbs it supports
>> +         * and see if the given phb4 index matches an index.
>>            */
>>           PnvPhb4PecState *pec = &chip9->pecs[i];
>> -        for (j = 0; j < pec->num_stacks; j++) {
>> +        for (j = 0; j < pec->num_phbs; j++) {
>>               if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
>> -                return &pec->stacks[j];
>> +                pec->phbs[j] = phb;
> 
> Why do we need this array ?


Actually we don't. While making  these patches I forgot to assign this pointer back
to the array and everything worked. We don't search the PHB back from the PEC at
any point.

This is being kept because I refrain from doing too much design changes at once. We
can drop it though - either in this patch or in a follow up.

> 
>> +
>> +                /* Set phb-number now since we already have it */
>> +                object_property_set_int(OBJECT(phb), "phb-number",
>> +                                               j, &error_abort);
> 
> that's ugly :/

Not my proudest line of code indeed.

Perhaps we're better of trying to get rid of stack->stack_no altogether before even
converting it to phb->stack_no. I'll see how that goes.



Daniel


> 
> C.
> 
>> +                return pec;
>>               }
>>           }
>>       }

