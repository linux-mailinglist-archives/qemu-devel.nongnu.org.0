Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6267C1BA0AA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 12:01:01 +0200 (CEST)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT0ZQ-0000z3-C9
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 06:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT0XO-0007ql-DS
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:58:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT0XN-0006SI-RG
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:58:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42127
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jT0XN-0006Dh-Bu
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587981531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcWBuPaHBGxHMOrZqvqL266FxHOcDDC/OPS2Jo9wjKw=;
 b=f4jwC1wKOfLwzk2WD3IFEQWTDHXmEW5hmhDDfY77nXb+YgeVv9UAB5xZH9Vh41JtpQHBoe
 9GM1yl43trLfuOvGBvg2y6RKxgqTQhfID1sWEj+wL2kVn+fbasox3pKSUbhMF6jxCb7hL2
 U+WcDBy9CvF2mYu0WB++6nNPnnc6w/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-CQajEjsKN6GYOEPPYp85LA-1; Mon, 27 Apr 2020 05:58:46 -0400
X-MC-Unique: CQajEjsKN6GYOEPPYp85LA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9D4787134E;
 Mon, 27 Apr 2020 09:58:43 +0000 (UTC)
Received: from [10.36.115.95] (ovpn-115-95.ams2.redhat.com [10.36.115.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 050FE5C7CF;
 Mon, 27 Apr 2020 09:58:31 +0000 (UTC)
Subject: Re: [PATCH] hw: add compat machines for 5.1
To: Cornelia Huck <cohuck@redhat.com>
References: <20200424090314.544-1-cohuck@redhat.com>
 <548cd0de-17d3-204d-7df1-4c8fdccad83c@redhat.com>
 <20200427110609.36ecaac6.cohuck@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4166d3fc-58e9-405d-71a1-2270ced75e7d@redhat.com>
Date: Mon, 27 Apr 2020 11:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200427110609.36ecaac6.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 23:32:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Connie,

On 4/27/20 11:06 AM, Cornelia Huck wrote:
> On Mon, 27 Apr 2020 09:43:33 +0200
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Connie,
>>
>> On 4/24/20 11:03 AM, Cornelia Huck wrote:
>>> Add 5.1 machine types for arm/i440fx/q35/s390x/spapr.
>>>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
>>>
>>> Still keeping the default cpu model version on x86 at v1.
>>>
>>> I'll queue this to my s390-next branch, as I'm planning to send a pull
>>> req as soon as 5.0 is out; if someone else wants to queue this, we'll
>>> figure it out :)
>>>
>>> ---
>>>  hw/arm/virt.c              |  9 ++++++++-
>>>  hw/core/machine.c          |  3 +++
>>>  hw/i386/pc.c               |  3 +++
>>>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>>>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>>>  hw/ppc/spapr.c             | 15 +++++++++++++--
>>>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>>>  include/hw/boards.h        |  3 +++
>>>  include/hw/i386/pc.h       |  3 +++
>>>  9 files changed, 71 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 7dc96abf72cf..5e84c09402dd 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -2309,15 +2309,22 @@ static void machvirt_machine_init(void)
>>>  }
>>>  type_init(machvirt_machine_init);
>>>  
>>> +static void virt_machine_5_1_options(MachineClass *mc)
>>> +{
>>> +}
>>> +DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
>>> +
>>>  static void virt_machine_5_0_options(MachineClass *mc)
>>>  {
>>>      static GlobalProperty compat[] = {
>>>          { TYPE_TPM_TIS_SYSBUS, "ppi", "false" },
>>>      };
>>>  
>>> +    virt_machine_5_1_options(mc);
>>> +    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
>>>      compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));  
>> As spotted by patchew we need { TYPE_TPM_TIS_SYSBUS, "ppi", "false" } to
>> be applied for all machine types 5_0 onwards as our tpm-tis-device does
>> not support PPI. So I guess we need to move compat[] declaration outside
>> of virt_machine_5_0_options and call
>> "compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));"
>> for each  virt_machine_5_*_options? Or is a misuse of compats?
> 
> Ah, that was the error (I could not really make sense of it).
> 
> So, if I understand it correctly, ppi needs to be disabled for all virt
> machines.
ppi property of tpm-tis-sysbus device needs to be disabled for all virt
machines whose version >= 5.0. tpm-tis-sysbus device is supported from
5.0 onwards.

Looking again at the code, I should rather set the default value of the
ppi property to false in tpm_tis_sysbus_properties. Before we shared the
same device with x86, hence the compat but now we have a separate one. I
guess that should work directly without the pain of that compat :-( Let
me check ...

Thanks

Eric
 I think the correct way to do this would be to add the
> "compat" prop in virt_machine_class_init() (even if it is not strictly
> compat, as it always needs to be disabled). It can be removed there and
> added to a compat machine should support be added in the future.
> 
> Or does anyone have a better idea?
> 
> 


