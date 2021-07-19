Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB43CCF5D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 10:27:25 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5OcV-00014p-JB
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 04:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m5ObH-0000Dw-Ar
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:26:07 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m5ObD-0000nA-ON
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:26:06 -0400
Received: by mail-pj1-x1029.google.com with SMTP id cu14so11032449pjb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FX2RMdTJRqRCCPQkN1ixLdBMJuyGD6MYxMttIsf7OJc=;
 b=zEM3kdrdbNSJ2VTnb6RA6NZIilL4dRCQ0wZOxQ+EmDEeFTUPgHFxZYD15Pk+UNYVHT
 sxIxLI4G9qffRb9PPNoxRfEgZ2nfbe+FkDCiZfBJ45JsFP9/GhiseIrDfpH7H7uSRUSZ
 WBos/JlBd9zI8SUEm8ncl/ibFhUi9Zvdtcx6iH1P3YuN1AO1y2p9QcKEyDQZOUN+rBum
 yr17mcxkwpGXEsIr/7zUn705dr3PvXw5I1jyceuaY822ymW5nb+mvaCTaWyHbTEx1HAq
 l9mxlrP++gaaGWSuh4bUC8HH/Nm7WZokdp35HpNEo7WSVTGpJu8MTy3t6jbICV2uA9EO
 c3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FX2RMdTJRqRCCPQkN1ixLdBMJuyGD6MYxMttIsf7OJc=;
 b=GN19OaA/uC+PAtWRuJNc7BZI7dC+sVe9JzfFXgt2RnZmX+HxxQFsnZlUceAwzUg+ja
 Mhif3K6+i1sLXsWWr5lso/ToVb28Bar8mDVxOvp8loDcJdEEg5Yky3Sw1GXDzWZ9IBt9
 suqbS9t6hL1nlHSXZdVAga51cyc4GhBPwHLK3P5WXo9h5I88Up/MohAcHsd5abhUUV65
 smF2O8TqfsvaOIxcJkUZpMmnw48kh/Jjzc3FGCatLUC8FVAs0OKe3uExGMYwbbQPWrSg
 U8PqlvrLODcYgAXn0u5CTJxxnim23TFfg//gM9zncJZFN7O7ag3oxypTxuQcCEbdqm1T
 UE0w==
X-Gm-Message-State: AOAM530YljkzRuxSucdL4CUlfJAHrVFgOz5M+Of7NsrxcqfKEBYpqMwG
 IMxHN4MKOz4VDySbr7wKWo0YGw==
X-Google-Smtp-Source: ABdhPJx9/U2WfTT5lgpYwoQdfkMLnWlXPw8qJ1avqqRxvlOxrDCaZVSBZbdsN0MbQoGnbd62ZHFIFg==
X-Received: by 2002:a17:90a:a105:: with SMTP id s5mr4487044pjp.9.1626683160488; 
 Mon, 19 Jul 2021 01:26:00 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id i8sm18175977pfo.154.2021.07.19.01.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 01:25:59 -0700 (PDT)
Message-ID: <8e0e013e-4043-7424-8b93-f3f144601b8c@ozlabs.ru>
Date: Mon, 19 Jul 2021 18:25:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu] ppc/vof: Fix Coverity issues
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210713134638.1803316-1-aik@ozlabs.ru> <YPT4DoeG1rNhrOE8@yekko>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YPT4DoeG1rNhrOE8@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.07, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/19/21 13:57, David Gibson wrote:
> On Tue, Jul 13, 2021 at 11:46:38PM +1000, Alexey Kardashevskiy wrote:
>> This fixes NEGATIVE_RETURNS, OVERRUN issues reported by the Coverity.
>>
>> This adds a comment about the return parameters number in the VOF hcall.
>> The reason for such counting is to keep the numbers look the same in
>> vof_client_handle() and the Linux (an OF client).
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>> Will this make COverity happy? What is the canonical way of fixing these
>> uint32_t vs. int? Thanks,
> 
> It might make Coverity happy, but I think it's an ugly approach.
> 
>>
>> ---
>>   hw/ppc/vof.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>> index 81f65962156c..872f671babbe 100644
>> --- a/hw/ppc/vof.c
>> +++ b/hw/ppc/vof.c
>> @@ -517,7 +517,7 @@ static uint32_t vof_instance_to_package(Vof *vof, uint32_t ihandle)
>>   static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
>>                                       uint32_t buf, uint32_t len)
>>   {
>> -    uint32_t ret = -1;
>> +    int ret = -1;
> 
> I don't think you want to try to use the same variable for the value
> from phandle_to_path() and the return value from this function -
> they're different types, with different encodings.  The inner value
> should remain int (that's the libfdt convention).
> 
> The outer one is explicltly unsigned.  You're not really looking for
> negative error values, but specifically for -1U == ~0U as the single
> error value.  So re-introduce your PROM_ERROR valued, defined as ~0U,
> so that it's clearly unsigned, and use that and unsigned logic for all
> manipulation of the outer value.


Fair enough. One question. Linux defines it as

#define PROM_ERROR (-1u)

Do you still vote for "~0U"?



-- 
Alexey

