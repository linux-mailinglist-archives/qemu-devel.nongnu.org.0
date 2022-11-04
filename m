Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8612619388
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:31:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqt0r-0003Wb-GP; Fri, 04 Nov 2022 05:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqt0p-0003WO-Db
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:29:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqt0n-0004Rx-CZ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:29:18 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5011316wme.5
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 02:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fpGtaJUHMU409jQZHhjec2Vb0Myr/AQ8gIeHLerUyyA=;
 b=mV0DCk4IefrkRJSTAdOtLRLcsbNQSPB+7ShRzwABj2ZNwpwfLOAgcklNWIASCY/AHX
 YQrKBzIi0PNS2/z3cMDReJVKk2YG3PIFedHzfQ7p5460M/4YhnkUUjLk5e7XCBrYi40b
 MN+qChW57LRVnb++naa8NG58OYxFw1XnUFaAFXHq9JYTBnXqojyzQfdGmsSG73T37zHo
 glElWxeJOrOoG2GaqPeFZvndLWawA80M0b/3efNKr11tExmhlXm6+JJfHUO8LbgVvG1g
 tq64UfqwMReVhuIXLh1FlKxekQ9iEC5/Qg1AsnuD2YrBed3O52jfrOAdgI8TgTvPOzKr
 4lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fpGtaJUHMU409jQZHhjec2Vb0Myr/AQ8gIeHLerUyyA=;
 b=WCnhHabBxdZspk6qhqNwiq06Zv2PQkyZBSzBCulwWBAiRoAkGlXICfUXo//wbRGRiq
 wAZmwlF60EdU/0YX3ztbqsyt37qw0UCcGsOCt+I17Pebt8bbCPWKLStY23bNwx2xwkiK
 DgeWKckIApQYldEYKdzSO41cm3fqhQQSlhEaQbpoET33k4I8ADiLKQQvEQJyQCUlA0zq
 8e94z1Hw3kfEVvJB3VjV2VV6WYst5Gk3yfFpP2lY9WguRUWY1V0C3xJYZg45vAD7FA4I
 LtHiEGDACRczkz7JE1emZYiG9t7cVEcqyJKRV+PsC6iY6w4ArAq0M3Ve7g3G9njD/jWE
 05eg==
X-Gm-Message-State: ACrzQf0PBgcBIeHvsrpbdjT8yDJt3lSX+p7vwCNZ/5qJOxcW/jOTav58
 XhDiFWYW7dr980krTSbLCCgDBg==
X-Google-Smtp-Source: AMsMyM5k0FMoTsKQBVCXKSFCkVBRn4JwEpFMrChZAypJJmiqmULDc6fDx67pM2ZvObfVUIjNp0XcUQ==
X-Received: by 2002:a1c:f202:0:b0:3c2:10de:4016 with SMTP id
 s2-20020a1cf202000000b003c210de4016mr32834628wmc.158.1667554155771; 
 Fri, 04 Nov 2022 02:29:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a5d4485000000b002365730eae8sm2922986wrq.55.2022.11.04.02.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 02:29:14 -0700 (PDT)
Message-ID: <949eb8d1-2298-de8e-6492-33a8cd4ee100@linaro.org>
Date: Fri, 4 Nov 2022 10:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] qom.json: default the prealloc-threads to smp-cpus
Content-Language: en-US
To: Zhenyu Zhang <zhenyzha@redhat.com>
Cc: qemu-devel@nongnu.org, shan.gavin@gmail.com, liuyd.fnst@fujitsu.com,
 eric.auger@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221103104716.179635-1-zhenyzha@redhat.com>
 <7eecb87f-7d37-93d0-db93-21f7c6374d91@linaro.org>
 <CAJFLiBJSYLm11xUfWPFTOi9xMPk6WYE+G+v3-mhWzV=xp-YHAQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJFLiBJSYLm11xUfWPFTOi9xMPk6WYE+G+v3-mhWzV=xp-YHAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 02:57, Zhenyu Zhang wrote:
> Hello Philippe
> 
> I checked out this modified patch:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg888815.html
> It should have been merged in 7.1

This changed the default value, not the property availability.

IIUC the '(since X)' format document when a property got added,
regardless its default value.

This property is available since 5.0.

The default value changed in 7.1. You are correct we need to update
the new value in documentation, but the 'since' tag should refer
to when the property got added: 5.0.

> On Thu, Nov 3, 2022 at 7:00 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 3/11/22 11:47, Zhenyu Zhang wrote:
>>> Since the amount of prealloc-threads to smp-cpus is
>>> defaulted in hostmem, so sync this information.
>>>
>>> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
>>> ---
>>>    qapi/qom.json | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/qapi/qom.json b/qapi/qom.json
>>> index 87fcad2423..ac4cd213a7 100644
>>> --- a/qapi/qom.json
>>> +++ b/qapi/qom.json
>>> @@ -576,7 +576,7 @@
>>>    #
>>>    # @prealloc: if true, preallocate memory (default: false)
>>>    #
>>> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
>>> +# @prealloc-threads: number of CPU threads to use for prealloc (default: smp-cpus) (since 7.1)
>>
>> The property is present since 5.0. Shouldn't this be "(default:
>> smp-cpus) (since 5.0)"?
>>
>>>    #
>>>    # @prealloc-context: thread context to use for creation of preallocation threads
>>>    #                    (default: none) (since 7.2)
>>
> 


