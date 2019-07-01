Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E973356B85
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 16:08:27 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg8b4-0006Fl-NM
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 10:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50324)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hg8Zg-0005Pm-Et
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 10:07:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hg8Zf-000398-Ct
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 10:07:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42306)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hg8Zd-00031c-2I; Wed, 26 Jun 2019 10:06:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6FE942F8BD3;
 Wed, 26 Jun 2019 14:06:34 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F13A60852;
 Wed, 26 Jun 2019 14:06:27 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <3c24d706-4ee5-336d-8f74-adae672c450d@redhat.com>
 <20190626132846.lj62nu4orn3nhnug@kamzik.brq.redhat.com>
 <4c96ac11-1195-81d5-79d9-ee3d5e92210e@redhat.com>
 <20190626135806.l6mna6swbdncbb2a@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <02271858-b1c3-26aa-c62d-14518d46616a@redhat.com>
Date: Wed, 26 Jun 2019 16:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190626135806.l6mna6swbdncbb2a@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 26 Jun 2019 14:06:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 05/14] target/arm/helper: zcr: Add build
 bug next to value range assumption
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/26/19 3:58 PM, Andrew Jones wrote:
> On Wed, Jun 26, 2019 at 03:40:11PM +0200, Auger Eric wrote:
>> Hi,
>>
>> On 6/26/19 3:28 PM, Andrew Jones wrote:
>>> On Wed, Jun 26, 2019 at 12:01:10PM +0200, Auger Eric wrote:
>>>> Hi Drew,
>>>>
>>>> On 6/21/19 6:34 PM, Andrew Jones wrote:
>>>>> Suggested-by: Dave Martin <Dave.Martin@arm.com>
>>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>>> ---
>>>>>  target/arm/helper.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>>>> index df4276f5f6ca..edba94004e0b 100644
>>>>> --- a/target/arm/helper.c
>>>>> +++ b/target/arm/helper.c
>>>>> @@ -5319,6 +5319,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>>>>      int new_len;
>>>>>  
>>>>>      /* Bits other than [3:0] are RAZ/WI.  */
>>>>> +    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
>>>> Can you document in the commit message why this check is critical?
>>>
>>> Sure. I can copy+paste the email subject into the commit message :-)
>> Well that's not what I asked for. Are you enforcing an architectural
>> maximum of 2048 bits or is the limitation due to some data structs in
>> the existing code, ... For a non expert reviewer as I am it is not
>> totally obvious.
> 
> How's this for the commit message
> 
>     The current implementation of ZCR_ELx matches the architecture, only
>     implementing the lower four bits, with the rest RAZ/WI. This puts
>     a strict limit on ARM_MAX_VQ of 16. Make sure we don't let ARM_MAX_VQ
>     grow without a corresponding update here.
Yep perfect. Thanks

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> 
> Thanks,
> drew
> 
>>
>> Thanks
>>
>> Eric
>>>
>>> drew
>>>
>>>>
>>>> Thanks
>>>>
>>>> Eric
>>>>>      raw_write(env, ri, value & 0xf);
>>>>>  
>>>>>      /*
>>>>>
>>>>
> 

