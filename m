Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F74E141
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 09:29:56 +0200 (CEST)
Received: from localhost ([::1]:55298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heDzd-0004gZ-6P
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 03:29:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40148)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1heDyi-00049P-9z
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:28:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1heDvO-0007JJ-P4
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:25:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33364)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1heDvO-0006eV-GQ
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:25:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60DFE3082B55;
 Fri, 21 Jun 2019 07:25:11 +0000 (UTC)
Received: from [10.72.12.130] (ovpn-12-130.pek2.redhat.com [10.72.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 099F719732;
 Fri, 21 Jun 2019 07:25:06 +0000 (UTC)
To: "Zhang, Chen" <chen.zhang@intel.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 qemu-dev <qemu-devel@nongnu.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul.durrant@citrix.com>
References: <20190609164433.5866-1-chen.zhang@intel.com>
 <e02f265c-a0f4-0b34-e3e9-48f0d9eefaf8@redhat.com>
 <9CFF81C0F6B98A43A459C9EDAD400D780615AACB@shsmsx102.ccr.corp.intel.com>
 <9CFF81C0F6B98A43A459C9EDAD400D780618AD39@shsmsx102.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8e9f8d98-6122-ebd8-7be9-1bdd177ab2c5@redhat.com>
Date: Fri, 21 Jun 2019 15:25:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9CFF81C0F6B98A43A459C9EDAD400D780618AD39@shsmsx102.ccr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 21 Jun 2019 07:25:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V2 0/5] Add Xen COLO support
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/6/21 =E4=B8=8B=E5=8D=882:43, Zhang, Chen wrote:
> Anyone have any comments about this series?
>
> Thanks
> Zhang Chen


I will probably review and give feedback sometime next week.

Thanks


>
>
>> -----Original Message-----
>> From: Qemu-devel [mailto:qemu-devel-
>> bounces+chen.zhang=3Dintel.com@nongnu.org] On Behalf Of Zhang, Chen
>> Sent: Monday, June 10, 2019 1:56 PM
>> To: Jason Wang <jasowang@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu=
.com>;
>> Dr. David Alan Gilbert <dgilbert@redhat.com>; Juan Quintela
>> <quintela@redhat.com>; zhanghailiang <zhang.zhanghailiang@huawei.com>;
>> qemu-dev <qemu-devel@nongnu.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Paul Durrant <paul.durrant@citrix.com>
>> Cc: Zhang Chen <zhangckid@gmail.com>
>> Subject: Re: [Qemu-devel] [PATCH V2 0/5] Add Xen COLO support
>>
>>
>>
>>> -----Original Message-----
>>> From: Jason Wang [mailto:jasowang@redhat.com]
>>> Sent: Monday, June 10, 2019 12:09 PM
>>> To: Zhang, Chen <chen.zhang@intel.com>; Li Zhijian
>>> <lizhijian@cn.fujitsu.com>; Dr. David Alan Gilbert
>>> <dgilbert@redhat.com>; Juan Quintela <quintela@redhat.com>;
>>> zhanghailiang <zhang.zhanghailiang@huawei.com>; qemu-dev
>>> <qemu-devel@nongnu.org>; Stefano Stabellini <sstabellini@kernel.org>;
>>> Paul Durrant <paul.durrant@citrix.com>
>>> Cc: Zhang Chen <zhangckid@gmail.com>
>>> Subject: Re: [PATCH V2 0/5] Add Xen COLO support
>>>
>>>
>>> On 2019/6/10 =E4=B8=8A=E5=8D=8812:44, Zhang Chen wrote:
>>>> From: Zhang Chen <chen.zhang@intel.com>
>>>>
>>>> Xen COLO based on KVM COLO architecture, it shared COLO proxy and
>>>> block replication with KVM COLO. The only differece is Xen COLO have
>>>> own COLO-frame to handle live migration related function, so we need
>>>> this series make Xen COLO frame can communicate with other COLO
>>>> modules in qemu. Xen side related patches have been merged.
>>>
>>> Any pointer to this?
>>>
>> Yes, please see this thread:
>>
>> https://lists.xen.org/archives/html/xen-devel/2017-03/msg00718.html
>>
>> Thanks
>> Zhang Chen
>>
>>> Thanks
>>>
>>>
>>>> V2:
>>>>    - Rebase on upstream code.
>>>>    - Optimize code by Zhijian's comments in patch 4/5.
>>>>    - Remove origin 5/6 patch.
>>>>
>>>> V1:
>>>>    - Initial patch.
>>>>
>>>> Zhang Chen (5):
>>>>     COLO-compare: Add new parameter to communicate with remote colo-
>>> frame
>>>>     COLO-compare: Add remote notification chardev handler frame
>>>>     COLO-compare: Make the compare_chr_send() can send notification
>>>>       message.
>>>>     COLO-compare: Add colo-compare remote notify support
>>>>     migration/colo.c: Add missed filter notify for Xen COLO.
>>>>
>>>>    migration/colo.c   |   2 +
>>>>    net/colo-compare.c | 155
>>>> +++++++++++++++++++++++++++++++++++++++---
>>> ---
>>>>    qemu-options.hx    |  33 +++++++++-
>>>>    3 files changed, 171 insertions(+), 19 deletions(-)
>>>>

