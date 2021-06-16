Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5543AA1AD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:42:52 +0200 (CEST)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYct-0003jd-Sy
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltYbz-0002p8-EU; Wed, 16 Jun 2021 12:41:55 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:36559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltYbx-0006CV-IA; Wed, 16 Jun 2021 12:41:55 -0400
Received: by mail-qk1-x72f.google.com with SMTP id i68so32563qke.3;
 Wed, 16 Jun 2021 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yukji0y58RDZLTfesn5hrcPgpoZfyjztbh4+m+k0i40=;
 b=Ww0Dpx2j05hwAZ7p+LQtPONCyzuYzAuySWh6Rz1yTEhow834CDUwKGqHpMUtb8nnkB
 miAxxF71hKmk1SZ316mukmht2W78B076nzxunELIFLvMWxbmhywB9yVTt52j5imkDQhB
 FAB5l3SzGFj4sNUiacxBj+fJjRZVlC6jh76+bOcFTs2/wxoIepdP5T2zLKzgBg3U2aXP
 no19CGm7o+C0sFm6OhLiA96O9jbSEvXHHhsVZBVFgUDvEMlR1GLNj/PbkY/JCEZLLup3
 IoBtdOoDcOtsLRHpnxTo7YMZ6UJOs7faYWKJxxjbhmtRuvrxT/wkPumdVBfvjj5yRpb9
 japA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yukji0y58RDZLTfesn5hrcPgpoZfyjztbh4+m+k0i40=;
 b=Lu6IecmOTxwjkdjBevMqry/Nqa5a4zvvCGEX5sCdEIhld1sVzPs83yEt2rakL51Hxx
 RUC2cukmGEtdriQU2WfO126NcdP0jvr03UINgy3ELBBceIMwvqXCK6cFC5pRsGTVGa+4
 lfEZnrwel/CNXvSfJ2l78AY+lUTf0HJSS99vHvTaKG5SKFNsFIf9/y/Dnw131v49TA4B
 debzfud2zwOjt9dwEZZ4tF7byvea3xAO+IoH9DJWCQ6LebohbTtGZgs/rcReDfHrPuWX
 BuIASj4M8g1a6u1SZgLWS8BVpPQPQQ3/A5hzyIb36gNcZZLhDSWqdIIu9Ij9cVgo6LmE
 /fiQ==
X-Gm-Message-State: AOAM532iYYlZeYBvejbs6eWEWgH0CO5vbHEqdjsRPS/eK8g79+7HPjbP
 ccqBsttL9KeEP21m7nwtLpQ=
X-Google-Smtp-Source: ABdhPJxgOikP1XTAQQjRKkcNHY4xeA4d+L2GpKatUibaZ4iEBzn6Exw3TgGIJatiYty2mR4/PPMjSw==
X-Received: by 2002:a37:7d83:: with SMTP id y125mr988790qkc.7.1623861711159;
 Wed, 16 Jun 2021 09:41:51 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:59e4:b479:6e4f:abba:619e?
 ([2804:431:c7c6:59e4:b479:6e4f:abba:619e])
 by smtp.gmail.com with ESMTPSA id c8sm1505494qtn.67.2021.06.16.09.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:41:50 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI
 event
To: Markus Armbruster <armbru@redhat.com>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
 <20210604200353.1206897-2-danielhb413@gmail.com>
 <875yykr45c.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ef085ae4-be21-46aa-728b-9377fe48deee@gmail.com>
Date: Wed, 16 Jun 2021 13:41:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <875yykr45c.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.17,
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/11/21 9:12 AM, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> At this moment we only provide one event to report a hotunplug error,
>> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
>> machine is now able to report unplug errors for other device types, such
>> as CPUs.
>>
>> Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
>> create a generic DEVICE_UNPLUG_ERROR event that can be used by all
>> unplug errors in the future.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   qapi/machine.json | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 58a9c86b36..f0c7e56be0 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1274,3 +1274,26 @@
>>   ##
>>   { 'event': 'MEM_UNPLUG_ERROR',
>>     'data': { 'device': 'str', 'msg': 'str' } }
>> +
>> +##
>> +# @DEVICE_UNPLUG_ERROR:
>> +#
>> +# Emitted when a device hot unplug error occurs.
>> +#
>> +# @device: device name
>> +#
>> +# @msg: Informative message
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# <- { "event": "DEVICE_UNPLUG_ERROR"
>> +#      "data": { "device": "dimm1",
>> +#                "msg": "Memory hotunplug rejected by the guest for device dimm1"
>> +#      },
>> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
>> +#
>> +##
>> +{ 'event': 'DEVICE_UNPLUG_ERROR',
>> +  'data': { 'device': 'str', 'msg': 'str' } }
> 
> Missing: update of device_add's doc comment in qdev.json:
> 
>      # Notes: When this command completes, the device may not be removed from the
>      #        guest.  Hot removal is an operation that requires guest cooperation.
>      #        This command merely requests that the guest begin the hot removal
>      #        process.  Completion of the device removal process is signaled with a
>      #        DEVICE_DELETED event. Guest reset will automatically complete removal
>      #        for all devices.

Ok

> 
> This sure could use some polish.
> 
> If I understand things correctly, we're aiming for the following device
> unplug protocol:

One thing to note is that DEVICE_UNPLUG_ERROR isn't guaranteed to be send for
every hotunplug error. The event depends on machine/architecture support to
detect a guest side error.

> 
>     Unplug the device with device_del (or possibly equivalent)
> 
>     If we know we can't unplug the device, fail immediately.  Also emit
>     DEVICE_UNPLUG_ERROR.


I haven't predicted to use this event in those cases as well, although it
seems reasonable to do so now that you mentioned it.

> 
>     If possible, unplug the device synchronously and succeed.  Also emit
>     DEVICE_DELETED.
> 
>     Else, initiate unplug and succeed.
> 
>     When unplug finishes, emit either DEVICE_DELETED or
>     DEVICE_UNPLUG_ERROR.

Since there's no 100% guarantee that DEVICE_UNPLUG_ERROR will be emitted for
guest side errors, the wording here would be

"When unplug finishes, emit DEVICE_DELETED. A DEVICE_UNPLUG_ERROR can be
emitted if a guest side error was detected"


> 
>     For some machines and devices, unplug may never finish.
> 
> Correct?
> 
> Any particular reason for not putting event DEVICE_UNPLUG_ERROR next to
> DEVICE_DELETED in qdev.json?


Not really. I looked where MEM_UNPLUG_ERROR was declared and put it right
after it. I can change it to qdev.json near DEVICE_DELETED.



Thanks,


Daniel

> 
> 

