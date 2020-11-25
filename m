Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C762C487F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 20:38:36 +0100 (CET)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki0cd-00063U-Fl
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 14:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1ki0aH-00056h-Mg
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:36:09 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1ki0aE-0007CT-1I
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:36:09 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbeb2250003>; Wed, 25 Nov 2020 11:36:05 -0800
Received: from [10.40.101.61] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 19:36:00 +0000
Subject: Re: [PATCH 1/1] Fix to show vfio migration stat in migration status
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1605731327-23533-1-git-send-email-kwankhede@nvidia.com>
 <20201125093036.GA3222@work-vm>
 <debd3545-1d63-f0e4-784f-a968119f0137@nvidia.com>
 <20201125190307.GL3222@work-vm>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <6a61ce43-055b-65bc-29e0-55edea534f28@nvidia.com>
Date: Thu, 26 Nov 2020 01:05:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201125190307.GL3222@work-vm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606332965; bh=gMi2nQxegHDDiXnZLgZ/jYahtuhfJgwEdVPIg/dAudA=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=NqyviJs6mNttVtJujqVaFrsI7pjXhxHzKb9bnjkJTk6w1LSiPld43qlRdtR8YOKR2
 sP1oBw+Qzij1tlhGa8kKaSQAGIlxNaFq6faxNV5eu+NPlcje+kVyIit+SkNOV5QCdO
 nhfHYh3neIrs4kTdOAsRCSZHsIDd3aBgKgElNarvnP7Nlz4kDLiy7O0TSfCoDlfebk
 1dJOwxESj+F6eG358lfDS60AJ3aonJeQwnN2aJ+wHorxrlkOG7oZRQDvS+6ds/UfZr
 uhq+Y9ex3KtkzH9F4OtM2ujl7IJ72p7CgcbJeiKifsL7unjGjh5rY89BQHvPoDw6fw
 Op/IkRgjhLw2Q==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: alex.williamson@redhat.com, cjia@nvidia.com, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/26/2020 12:33 AM, Dr. David Alan Gilbert wrote:
> * Kirti Wankhede (kwankhede@nvidia.com) wrote:
>>
>>
>> On 11/25/2020 3:00 PM, Dr. David Alan Gilbert wrote:
>>> * Kirti Wankhede (kwankhede@nvidia.com) wrote:
>>>> Header file where CONFIG_VFIO is defined is not included in migration.c
>>>> file. Include config devices header file in migration.c.
>>>>
>>>> Fixes: 3710586caa5d ("qapi: Add VFIO devices migration stats in Migration
>>>> stats")
>>>>
>>>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>>>
>>> Given it's got build problems; I suggest actually something cleaner
>>> would be to swing populate_vfio_info into one of the vfio specific
>>> files, add a stubs/ entry somewhere and then migration.c doesn't need
>>> to include the device or header stuff.
>>>
>>
>> Still function prototype for populate_vfio_info() and its stub has to be
>> placed in some header file.
> 
> Which header file isn't that important; 

Any recommendation which header file to use?

Thanks,
Kirti

> and the stub goes in a file in
> stubs/
> 
>> Earlier I used CONFIG_LINUX instead of CONFIG_VFIO which works here. Should
>> I change it back to CONFIG_LINUX?
> 
> No.
> 
>> I'm not very much aware of meson build system, I tested by configuring
>> specific target, but I think by default if target build is not specified
>> during configuration, it builds for multiple target that's where this build
>> is failing. Any help on how to fix it would be helpful.
> 
> With my suggestion you don't have to do anything clever to meson
> (which I don't know much about either).
> 
> Dave
> 
>> Thanks,
>> Kirti
>>
>>> Dave
>>>
>>>> ---
>>>>    meson.build           | 1 +
>>>>    migration/migration.c | 1 +
>>>>    2 files changed, 2 insertions(+)
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index 7ddf983ff7f5..24526499cfb5 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -1713,6 +1713,7 @@ common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
>>>>    common_all = common_ss.apply(config_all, strict: false)
>>>>    common_all = static_library('common',
>>>> +                            c_args:'-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target) ,
>>>>                                build_by_default: false,
>>>>                                sources: common_all.sources() + genh,
>>>>                                dependencies: common_all.dependencies(),
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index 87a9b59f83f4..650efb81daad 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -57,6 +57,7 @@
>>>>    #include "qemu/queue.h"
>>>>    #include "multifd.h"
>>>> +#include CONFIG_DEVICES
>>>>    #ifdef CONFIG_VFIO
>>>>    #include "hw/vfio/vfio-common.h"
>>>>    #endif
>>>> -- 
>>>> 2.7.0
>>>>
>>

