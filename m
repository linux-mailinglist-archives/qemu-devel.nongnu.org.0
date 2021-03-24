Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD5634707B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 05:33:12 +0100 (CET)
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOvCg-0002wu-HK
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 00:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lOvAj-00028f-GR
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 00:31:09 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lOvAh-0005p5-0Z
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 00:31:09 -0400
Received: by mail-pg1-x534.google.com with SMTP id 32so7666813pgm.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 21:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tpBkv6IbsmrF3D2Mc3APY1aYfvPXLllDsq3YScnNXK4=;
 b=jq+vcQHHDy7URqvnltFKSs/Gi0aZu2WFqlFqXmLldqd2blZeCu2BAcimdelvCpIioR
 2nKxTJco7/fqOK8PINbN8ozyyMf//9Cp4rIRKUik8rOYFHRj1oKWEmaMYYV2BmXLNWXQ
 4mQMM2ddopNfOHMBgpk0nA3WHqI0srayIj3LotdhJMDetrUZAGzS87vIIZI86L9cu5iu
 NZ3bikbQd9N5MW/9TCmsYiEP7cI7JFux8WhH+8TaIeZIrAdFNGgM+5C/35g5+tvXV3md
 O3nse18tA+4btX4jdcE0GW/g6LhIKT7kuKFWay4r7+MIQR3/Ki8gp0FtRnDg758T76l9
 KIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tpBkv6IbsmrF3D2Mc3APY1aYfvPXLllDsq3YScnNXK4=;
 b=WPu9fL5f7BGxyUJqFc3wpMpQQWgTTXshOqLcVtdSKr1zSJz4LvWDykTaBDAD3cbRjy
 HCprYICweR3jC7Tey82mao9SDeqFjZwf34jwEghEK793T9gFpVHeT+LDgk4pqqaT1Mup
 J2/X1yuU0BAAHvz7WWSIDIN04zftZuuydK69WS5mYAdqCAkI/YhHPb+PGMq8HbNrfOCf
 0Xuv52oOoSZTXF202rws2iYtqUl1HD5wOPd6vidk8Xm2Evaft5E8iT0cmSahr4gkwc3E
 fd9L7ZetvwQClZj4L0Vqx+SVMSmwFESM5qGoRWYFIYPhsfofsITPxhCKCr1DWExODUIO
 m2Mg==
X-Gm-Message-State: AOAM5332ANezvr4mzCG5IEZ2XP0ps4WWFkA4Y4Oy6wrNVz3tR78jYOU4
 WmiWBViCTJvxOcrRK3S0xSQHBMgyuDfzXdzm
X-Google-Smtp-Source: ABdhPJyyXHcBCFY+pl6V0hNmJrrShPSzOQqiDy14kclugnrab9YrZmWs9OUczvzYCwAfRAZvt4P67g==
X-Received: by 2002:a05:6a00:cc8:b029:217:4606:5952 with SMTP id
 b8-20020a056a000cc8b029021746065952mr1234594pfv.50.1616560262218; 
 Tue, 23 Mar 2021 21:31:02 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id z22sm711433pfa.41.2021.03.23.21.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 21:31:01 -0700 (PDT)
Message-ID: <7cb026d4-2df9-9d16-60d9-b6565a71b628@ozlabs.ru>
Date: Wed, 24 Mar 2021 15:30:57 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH qemu] spapr: Fix typo in the patb_entry comment
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210225032335.64245-1-aik@ozlabs.ru>
 <YFgu2NpQ7Wr75GOX@yekko.fritz.box>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YFgu2NpQ7Wr75GOX@yekko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x534.google.com
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



On 22/03/2021 16:44, David Gibson wrote:
> On Thu, Feb 25, 2021 at 02:23:35PM +1100, Alexey Kardashevskiy wrote:
>> There is no H_REGISTER_PROCESS_TABLE, it is H_REGISTER_PROC_TBL handler
>> for which is still called h_register_process_table() though.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Applied to ppc-for-6.0.
> 
> In future, best to CC me directly, since I only occasionally peruse
> the lists.



even the qemu-ppc@nongnu.org list? okay :)



>> ---
>>   include/hw/ppc/spapr.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index ccbeeca1de84..8dceace4b442 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -168,7 +168,7 @@ struct SpaprMachineState {
>>       SpaprResizeHpt resize_hpt;
>>       void *htab;
>>       uint32_t htab_shift;
>> -    uint64_t patb_entry; /* Process tbl registed in H_REGISTER_PROCESS_TABLE */
>> +    uint64_t patb_entry; /* Process tbl registed in H_REGISTER_PROC_TBL */
>>       SpaprPendingHpt *pending_hpt; /* in-progress resize */
>>   
>>       hwaddr rma_size;
> 

-- 
Alexey

