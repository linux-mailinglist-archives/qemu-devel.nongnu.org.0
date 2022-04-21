Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C304150A719
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:28:40 +0200 (CEST)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhabf-0007ec-S3
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nhZwd-0006J5-3u
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:46:15 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nhZwa-0003st-Qv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:46:14 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 421EE20779;
 Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1650559567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XH6xcwaUqTqBUNMQje6WrCG2VuhBeavmmkH5XLdivwE=;
 b=4cXpfQE1PBQymBTwX3rAa99HHDvoigX2zRbSV0LYFTxttUA8v9ctH3NyiTtSUNl6r0FLr6
 j71XkgvawrIQJtL9N++hfHBZTkba5eM63hACgWedAn0vrFnWMDkgci8VkThcCDo0Dn5ntN
 TBiybl2i2pmRv95ahu9aX4IpISMBXqk=
Message-ID: <f7591151-7e67-0c23-0f69-3cbf71e0f2fc@greensocs.com>
Date: Thu, 21 Apr 2022 18:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/5] qdev: add
 user_creatable_requires_machine_allowance class flag
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
 <20220331115312.30018-2-damien.hedde@greensocs.com>
 <CAFEAcA9HsoVnKb1iRXMtYphxUt3Zg9G8p4=zrjv-Z=ekpseH_g@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA9HsoVnKb1iRXMtYphxUt3Zg9G8p4=zrjv-Z=ekpseH_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/21/22 17:59, Peter Maydell wrote:
> On Thu, 31 Mar 2022 at 13:19, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> This flag will be used in device_add to check if
>> the device needs special allowance from the machine
>> model.
>>
>> It will replace the current check based only on the
>> device being a TYPE_SYB_BUS_DEVICE.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>
>> v2:
>>   + change the flag name and put it just below user_creatable
>> ---
>>   include/hw/qdev-core.h | 9 +++++++++
>>   hw/core/qdev.c         | 1 +
>>   hw/core/sysbus.c       | 1 +
>>   3 files changed, 11 insertions(+)
>>
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index 92c3d65208..6a040fcd3b 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -122,6 +122,15 @@ struct DeviceClass {
>>        * TODO remove once we're there
>>        */
>>       bool user_creatable;
>> +    /*
>> +     * Some devices can be user created under certain conditions (eg:
>> +     * specific machine support for sysbus devices), but it is
>> +     * preferable to prevent global allowance for the reasons
>> +     * described above.
>> +     * This flag is an additional constraint over user_creatable:
>> +     * user_creatable still needs to be set to true.
>> +     */
>> +    bool user_creatable_requires_machine_allowance;
> 
> "allowance" doesn't have the meaning you seem to be trying to give it here.
> (It means "the amount of something you're allowed to have", like
> a baggage allowance, or "an amount of money you're given for something",
> like a travel allowance.)

> 
> Do you mean "user creatable only if the machine permits it" ?
Yes.

> 
> More generally, the pluggable-sysbus stuff is an awful hack
> that I wish we didn't have to have. I'm not sure I want to see
> us expanding the use of it to other device types...

I not really trying to trigger code when adding devices. I'm just trying 
to use the related per-machine allow-list as a way to prevent the user 
to add such devices (specifically cpu group/cluster) on any random 
machine which would most probably not "work".

Thanks,
Damien

