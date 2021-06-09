Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFE43A0C3D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 08:14:32 +0200 (CEST)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqrTz-000265-5j
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 02:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lqrSo-00019f-Uz
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 02:13:18 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lqrSm-0005hE-HD
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 02:13:18 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e20so6616428pgg.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ptldAvMYAHegYvMZyVQkjMB594ichpPLvO8ZSuzAtQM=;
 b=M16HMXxahFBCrVRkMYJ9Y6AglOCxXAd8Sy9qN6AXAdUSdKoVltdjinfq6cf4FWt5ow
 NLOFTcOxPvrEj9rmumomOQ7vREBlhnALM7aFNQja7CR9P5+jcq9W9mGN6hiwFC2OpR74
 7IvXvkedaVCx/bvuT5Coc9rmThk+ptGEQ/N1UTNOFtBwBeiPkhWqq1sMoUtfPzutCsck
 xAClxK+hll12Wmh2pBBultN3ekL/Wc67/sxmPv8NStiPBLD9hGTZUfsfvVlyCuteituX
 gF2FKbQBTF/Xle9vDOjswPKtprrm+6/zrMvE4yCYdztJ1lIvcWURYVR2Mwokl1MSXYHr
 V7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ptldAvMYAHegYvMZyVQkjMB594ichpPLvO8ZSuzAtQM=;
 b=i0S2Ixqp3bRyikHrPSuXVir6TROR/00iGirsjfMWJ8fsKwV3lEkDu0Vt9tZk28sW++
 HN6fTt11YLTVS9VKX7zVSVBbMzXVvENudzEV067VdQR68pziukJV7rYz2xS28Ei+yylW
 SufsFR5pJhsSp5ce2mwMCjYgzLRsDhzbs91d4Ml/uUbIJXAP52nuM1MZwoJNsYjobJ23
 nDqonctBxb97eQyN7OwqckUI12EE84/2vrCQvhfvffmXT5j5TpyLknJmkgb4HKsqS3xj
 Euiqf9dzXbByyz3EVw28zJg1lwesYag7EsaZ7qTlGsoGbrY+PTv5XcvwfN7m1VPjbvWk
 XAqA==
X-Gm-Message-State: AOAM5322o5Uzov8Mnm7Sj9PoFJW1lkJ2EAG80qtZdWO+ag/spuupBI5g
 3eERrOzZR0j6ClvfPFrLc0ELhA==
X-Google-Smtp-Source: ABdhPJyEN3bOMTb85socrCOEgFnMlzy6WL4mURByfPBLJ/MzFn6/MlEGe1jEQZmLGI2fXLeeqvlsUg==
X-Received: by 2002:a63:1f1a:: with SMTP id f26mr2122783pgf.432.1623219193499; 
 Tue, 08 Jun 2021 23:13:13 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id k9sm13131710pgq.27.2021.06.08.23.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 23:13:13 -0700 (PDT)
Message-ID: <25bce1e4-fe55-54a6-920f-54005ffb395b@ozlabs.ru>
Date: Wed, 9 Jun 2021 16:13:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <c13d557a-5feb-33ad-33ec-22a28cddb8d@eik.bme.hu> <YLnF/9H6aFzNhu5+@yekko>
 <537a6990-4f18-746e-a1da-5dfa51f23dbd@eik.bme.hu> <YL2M+XP3Kw6w0UMr@yekko>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YL2M+XP3Kw6w0UMr@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/7/21 13:05, David Gibson wrote:
> On Fri, Jun 04, 2021 at 03:50:28PM +0200, BALATON Zoltan wrote:
>> On Fri, 4 Jun 2021, David Gibson wrote:
>>> On Sun, May 30, 2021 at 07:33:01PM +0200, BALATON Zoltan wrote:
> [snip]
>>>> MorphOS checks the name property of the root node ("/") to decide what
>>>> platform it runs on so we may need to be able to set this property on /
>>>> where it should return "bplan,Pegasos2", therefore the above maybe should do
>>>> getprop first and only generate name property if it's not set (or at least
>>>> check if we're on the root node and allow setting name property there). (On
>>>> Macs the root node is named "device-tree" and this was before found to be
>>>> needed for MorphOS.)
>>>
>>> Ah.  Hrm.  Have to think about what to do about that.
>>
>> This is easy to fix, this seems to allow setting a name property or return a
>> default:
>>
>>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>> index b47bbd509d..746842593e 100644
>> --- a/hw/ppc/vof.c
>> +++ b/hw/ppc/vof.c
>> @@ -163,14 +163,14 @@ static uint32_t vof_finddevice(const void *fdt,
>> uint32_t nodeaddr)
>>   static const void *getprop(const void *fdt, int nodeoff, const char *propname,
>>                              int *proplen, bool *write0)
>>   {
>> -    const char *unit, *prop;
>> +    const char *unit, *prop = fdt_getprop(fdt, nodeoff, propname, proplen);
>>
>>       /*
>>        * The "name" property is not actually stored as a property in the FDT,
>>        * we emulate it by returning a pointer to the node's name and adjust
>>        * proplen to include only the name but not the unit.
>>        */
>> -    if (strcmp(propname, "name") == 0) {
>> +    if (!prop && strcmp(propname, "name") == 0) {
>>           prop = fdt_get_name(fdt, nodeoff, proplen);
>>           if (!prop) {
>>               *proplen = 0;
>> @@ -196,7 +196,7 @@ static const void *getprop(const void *fdt, int nodeoff, const char *propname,
>>       if (write0) {
>>           *write0 = false;
>>       }
>> -    return fdt_getprop(fdt, nodeoff, propname, proplen);
>> +    return prop;
>>   }
> 
> Kind of a hack, but it'll do for now.
> 

oops missed this subthread but I ended up doing it anyway, just tiny bit 
different.



-- 
Alexey

