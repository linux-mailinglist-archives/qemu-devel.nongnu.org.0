Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E4B4ED801
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:53:11 +0200 (CEST)
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsQQ-0005jY-1w
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:53:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZsLg-00037i-DV
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:48:16 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:52882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZsLe-0006ow-4a
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:48:15 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id BA98D2077C;
 Thu, 31 Mar 2022 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648723691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbhPgBpMQmni9u8wvdKoDFQsU88OFK+IbTgDPqO16TM=;
 b=mpFNYR7B3iBWwSl3nrKqo54wJxIN87ZkTNGFyOvIEsO15Q6fqymU6NmxQOUEmPT2FBGUm9
 kAOpfbe6nFWOMkGMB0JAVJ1k31GZwZpzdWeovq8RcI2n0ofHzNrdR4yP/lOLthEAmlibEc
 sUwK8sXeaQl+7pBhEbUyAoEsgvOtolM=
Message-ID: <8200ffea-64ac-a1bc-114a-b62e3034367b@greensocs.com>
Date: Thu, 31 Mar 2022 12:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] qdev: add uc_requires_machine_allowance flag
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220330161215.235231-1-damien.hedde@greensocs.com>
 <20220330161215.235231-2-damien.hedde@greensocs.com>
 <bdaeed93-34dc-673f-426a-89845ddf4992@gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <bdaeed93-34dc-673f-426a-89845ddf4992@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/31/22 12:21, Philippe Mathieu-Daudé wrote:
> On 30/3/22 18:12, Damien Hedde wrote:
>> This flag will be used in device_add to check if
>> the device needs special allowance from the machine
>> model.
>>
>> It will replace the current check based only on the
>> device being a TYPE_SYB_BUS_DEVICE.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>   include/hw/qdev-core.h | 6 ++++++
>>   hw/core/qdev.c         | 1 +
>>   hw/core/sysbus.c       | 1 +
>>   3 files changed, 8 insertions(+)
>>
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index 92c3d65208..f5a05ced39 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -123,6 +123,12 @@ struct DeviceClass {
>>        */
>>       bool user_creatable;
>>       bool hotpluggable;
>> +    /*
>> +     * Some devices (eg: sysbus devices) are only user-creatable if
>> +     * the machine allowed it. user_creatable need still to be set to
>> +     * true, this is an additional constraint.
>> +     */
>> +    bool uc_requires_machine_allowance;
> 
> Why not name it user_creatable_requires_machine_allowance? Also I'd put
> it just after user_creatable.

I was worried about the length being too long when initially writing 
this patch.
Since we use it only doing the following:
 > if (dc->user_creatable_requires_machine_allowance)
or
 > dc->user_creatable_requires_machine_allowance = false;
The length will be ok anyway, so I'll rename it, it is less confusing.

I'll also move it ahead and respin.

Thanks,
Damien


