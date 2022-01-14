Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F02048EBC7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:39:55 +0100 (CET)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NkA-0002f2-5e
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:39:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8NNC-0001yN-8c; Fri, 14 Jan 2022 09:16:11 -0500
Received: from [2607:f8b0:4864:20::635] (port=43827
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8NN8-0004ZO-90; Fri, 14 Jan 2022 09:16:09 -0500
Received: by mail-pl1-x635.google.com with SMTP id e19so13361198plc.10;
 Fri, 14 Jan 2022 06:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M67TURjhKlfyRFL0Cg07wnGckbs0cHRJ+sF41fzdTsY=;
 b=iSOKa6PKLyTb5MQRpTylsAAW3KnmySlhdT70D9WQAz5hSvrQQnbGwoBkJdBc/zTgc2
 NJdL2uFUb1UPidGlW7V2EgtGuNfWLpVsowfrEDm7A2hOF3ZdRNwN5ZxMGV/MA4qtr2ax
 nJ8SnjZa5qGRijmY9cAwFfPn+Thamp2Cx+KNH3lIQvBmZlxVETuINzfGDJdQ0vfpKYDM
 hGZkdbN+Hrr60mqT39uR4dLvz9j3EKNG1YmSNRMR55uk2nAewiA0bpAiBfPnrHFusD+I
 Uua8HbwFU/vMeSAh7px5KnPsEtpID79WvbxPVKjPCMYiFVBbMbXSzbZurhX89h7XxvUP
 QcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M67TURjhKlfyRFL0Cg07wnGckbs0cHRJ+sF41fzdTsY=;
 b=5scm55W3wdnlq6KGc4Pv99UMfqdLi8M2MZ/qK0a9wcn49qf37r268FoSZ3nzzePkrF
 kSJMAW3zrLAi9VlVTc5l0gY3QS7gmT/0CHuHcyua+paeLdmUrDFWSskPpdKzttkbw1y9
 SWq6YHa7A8NiD+tD84XetqlC7fLO37igG5Z43Ve1MVVAzKCY5JzNiNSj5CEz/JH3/7wC
 a6IbHTPuXGsIL9cNHgyaVoq/MHKAqXji/CIzLQqz9oBwl7jxiS2BiK576tm8vFSSSBXK
 MttkSMtwLxt7yxGmLkfVJHqR8V1fhZXC3/qMhLCS5BgiyFl1DJEhmlAUfpAHos86hfUj
 6dfg==
X-Gm-Message-State: AOAM5326TkuJ4X1x4esWPHdCTdXQAS/yis9EVAWDIaVc4Z3HAejWnsuA
 poKEVOBf8aIMvo43O2dxZ0E=
X-Google-Smtp-Source: ABdhPJx7vko4pkfA+BjZP8JpkDi7/ZgcO/q5qLbpEADwRS20C48yiJ2LHlfFpoPaWO1FX5ztxoDsCg==
X-Received: by 2002:a17:902:aa8f:b0:149:7898:af96 with SMTP id
 d15-20020a170902aa8f00b001497898af96mr9592453plr.161.1642169764589; 
 Fri, 14 Jan 2022 06:16:04 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id ob12sm5314780pjb.17.2022.01.14.06.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 06:16:04 -0800 (PST)
Message-ID: <9f852ddf-810b-c008-1887-52519358049a@amsat.org>
Date: Fri, 14 Jan 2022 15:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] block/file-posix: Remove a deprecation warning on
 macOS 12
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org,
 John Arbuckle <programmingkidx@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220105235607.212848-1-f4bug@amsat.org>
 <54a82da6-3546-ddf1-692e-105174ddcaec@redhat.com>
In-Reply-To: <54a82da6-3546-ddf1-692e-105174ddcaec@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/1/22 15:09, Hanna Reitz wrote:
> On 06.01.22 00:56, Philippe Mathieu-Daudé wrote:
>> When building on macOS 12 we get:
>>
>>    ../block/file-posix.c:3335:18: warning: 'IOMasterPort' is 
>> deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
>>        kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
>>                     ^~~~~~~~~~~~
>>                     IOMainPort
>>
>> Use IOMainPort (define it to IOMasterPort on macOS < 12),
>> and replace 'master' by 'main' in a variable name.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   block/file-posix.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> I hope the [RFC] tag isn’t directed at me.
> 
> Still, I can give my comment, of course.
> 
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index b283093e5b..0dcfce1856 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -3324,17 +3324,22 @@ BlockDriver bdrv_file = {
>>   #if defined(__APPLE__) && defined(__MACH__)
>>   static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char 
>> *bsdPath,
>>                                   CFIndex maxPathSize, int flags);
>> +
>> +#if !defined(MAC_OS_VERSION_12_0)
> 
> So AFAIU from my quick rather fruit-less googling, this macro is defined 
> (to some version-defining integer) on every macOS version starting from 
> 12.0?  (Just confirming because the name could also mean it’d be defined 
> only on 12.0.)

Thanks, I posted up to v3 and macOS users helped me, I will post a v4 soon.

v3: 
https://lore.kernel.org/qemu-devel/20220110131001.614319-1-f4bug@amsat.org/

>> +#define IOMainPort IOMasterPort
>> +#endif
>> +
>>   static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>>   {
>>       kern_return_t kernResult = KERN_FAILURE;
>> -    mach_port_t     masterPort;
>> +    mach_port_t mainPort;
>>       CFMutableDictionaryRef  classesToMatch;
>>       const char *matching_array[] = {kIODVDMediaClass, kIOCDMediaClass};
>>       char *mediaType = NULL;
>> -    kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
>> +    kernResult = IOMainPort(MACH_PORT_NULL, &mainPort);
>>       if ( KERN_SUCCESS != kernResult ) {
>> -        printf( "IOMasterPort returned %d\n", kernResult );
>> +        printf("IOMainPort returned %d\n", kernResult);
>>       }
>>       int index;
>> @@ -3347,7 +3352,7 @@ static char 
>> *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>>           }
>>           CFDictionarySetValue(classesToMatch, 
>> CFSTR(kIOMediaEjectableKey),
>>                                kCFBooleanTrue);
>> -        kernResult = IOServiceGetMatchingServices(masterPort, 
>> classesToMatch,
>> +        kernResult = IOServiceGetMatchingServices(mainPort, 
>> classesToMatch,
>>                                                     mediaIterator);
>>           if (kernResult != KERN_SUCCESS) {
>>               error_report("Note: IOServiceGetMatchingServices 
>> returned %d",
> 
> “Looks good to me” ← here’s the comment you requested O:)

Thanks :)


