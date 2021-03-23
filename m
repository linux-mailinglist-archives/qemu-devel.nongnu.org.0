Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14FD34684C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:59:55 +0100 (CET)
Received: from localhost ([::1]:34078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmFv-0000UQ-0x
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lOlWE-0001zb-9g; Tue, 23 Mar 2021 14:12:42 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lOlW4-0002z6-PE; Tue, 23 Mar 2021 14:12:42 -0400
Received: by mail-qt1-x836.google.com with SMTP id m7so15602285qtq.11;
 Tue, 23 Mar 2021 11:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UTQ0jDv8b/cBIUP1TQzewuP2xZgTSkQ8VZtjBhq1zMc=;
 b=nMz8CZhI1s7KK2Bipy/OHxl1nA66jb3ZJXZsvlcpR7HUob4EM2ENuodBfdEUraOVch
 f98XB9WILStaEGuFnPWGkMT/8OWpjzsCSd6v05tvv9RUWMHr5uiTA/8H9YJiWnBzruRm
 OlbBAZMkRq2aTXZkTllhRRT+mZv9yPY0Sdd4hIkDBku37l2fBC8m5YBLqW9z6Triiltv
 EtOUdNkqOx57WhFsAut+5++/diYrqCrDwT9wVyyaveO7neQ2zuGbrp+K8rzbf31zk4Mh
 eJN/zohkOCq0hjO9s6GQEQYflvu7BhY99NWcptFpRfYvSatP9n1pSiJv1dIq3WmuADSn
 hdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UTQ0jDv8b/cBIUP1TQzewuP2xZgTSkQ8VZtjBhq1zMc=;
 b=alUbFGlIImT1PrCyBO6k6sE7XFD0XmFr7XsixSFxSkd74O4oK8K8EYM0UAxlu9tWwG
 dWghOEDnd+r5zAfq/414ukVHQOZ23DK9pK/qzwoayM+Y+fjYs1hlSyfylaw8Qa6+uJmk
 f325x/VTObZ35MFyPXLYidnYrdk1m/vOPvgtKogx7BgttwiGTOHtvih5iYoYlxT0pycp
 Z399vffhwRz8/6MFjrkk82Hxvf9ZkEcH1ChmgmTgjAhZ6T8X51eHfOdqFR2e0RnR0MGl
 xMk2C75Bfd9gzaiZIsKrCw2yYXU8QzehrwfwBjNpl59+jANIyujCJXWZiYprR2EGXZ+S
 LcmQ==
X-Gm-Message-State: AOAM5336bM1f2H2fVUCU4qR0T9tn+zcxNM9tFTZODbxGKRc1cZIi3L7E
 iAelEmM65FW2EuMEh926W1w=
X-Google-Smtp-Source: ABdhPJyN2zaNHrDUBtwins251sclewuZcc/1ll877dUDuhdlU+U5vg59XjrDpAdyDQQtt6hvhPau7g==
X-Received: by 2002:ac8:4406:: with SMTP id j6mr5561653qtn.180.1616523150540; 
 Tue, 23 Mar 2021 11:12:30 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c?
 ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id d3sm14422888qke.27.2021.03.23.11.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 11:12:30 -0700 (PDT)
Subject: Re: [PATCH 1/4] qapi/qdev.json: add DEVICE_NOT_DELETED event
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <20210312200740.815014-2-danielhb413@gmail.com>
 <02e3226b-647f-2282-d61b-5f571d796471@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <738d6f71-ec0d-8a82-a99c-df3f9e1d5f90@gmail.com>
Date: Tue, 23 Mar 2021 15:12:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <02e3226b-647f-2282-d61b-5f571d796471@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, armbru@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/23/21 3:00 PM, Eric Blake wrote:
> On 3/12/21 2:07 PM, Daniel Henrique Barboza wrote:
>> This new event informs QAPI listeners that a previously issued
>> 'device_del' command failed to delete the device from the machine.
>>
>> Note that no assertion can be made about the failure reason. The goal of
>> this event is to inform management that QEMU is not able to assess
>> whether the hotunplug is taking too long to complete or failed in the
>> guest and, as result, the device is not removed from QOM. When receiving
>> this event, users/management must check inside the guest to verify the
>> result of the hotunplug operation.
>>
>> This scenario happens with architectures where the guest does not have
>> an official way to report the hotunplug error back to the hypervisor,
>> such as PowerPC and the pseries machine type.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   qapi/qdev.json | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index b83178220b..df9a1b9e67 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -124,3 +124,31 @@
>>   ##
>>   { 'event': 'DEVICE_DELETED',
>>     'data': { '*device': 'str', 'path': 'str' } }
>> +
>> +##
>> +# @DEVICE_NOT_DELETED:
>> +#
>> +# Emitted whenever the device removal process expired and the device
>> +# still exists in QOM. This indicates that the guest took too long
>> +# to acknowlege the device removal, and we can not be sure of whether
> 
> acknowledge
> 
>> +# the process will be completed in the guest later on or a guest
>> +# side error occurred.
>> +#
>> +# It is not safe to reuse the specified device ID.
>> +#
>> +# @device: device name
>> +#
>> +# @path: device path
>> +#
>> +# Since: 6.0
> 
> This is a new event, and we've missed feature freeze; is this fixing a
> bug that was not present in 5.2 (in which case it is fine for -rc1), or
> is this a long-standing problem where one more release without the
> mechanism won't make life any worse?

I believe these events I'm trying to add can be postponed to the next release.



> 
>> +#
>> +# Example:
>> +#
>> +# <- { "event": "DEVICE_NOT_DELETED",
>> +#      "data": { "device": "core1",
>> +#                "path": "/machine/peripheral/core1" },
>> +#      "timestamp": { "seconds": 1615570254, "microseconds": 573986 } }
>> +#
>> +##
>> +{ 'event': 'DEVICE_NOT_DELETED',
>> +  'data': { '*device': 'str', 'path': 'str' } }
>> \ No newline at end of file
> 
> You'll want to fix that.


Yep, in both patches (1 and 3).


Thanks,


DHB


> 

