Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1236AA3AB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:03:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYDTg-0006pF-PD; Fri, 03 Mar 2023 17:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pYDTd-0006oF-P9
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:02:09 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pYDTb-0003eh-PW
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:02:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 13DDC205B6;
 Fri,  3 Mar 2023 22:02:03 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 3 Mar
 2023 23:02:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0068e030cea-4701-4c23-96bd-77c4014edf82,
 D247C90D5DACFD620130D6A3F59DE8A1FE9C6D23) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.250.25.177
Message-ID: <ddbd8846-f3f4-f4a6-f3a6-a56a3f7c74e9@kaod.org>
Date: Fri, 3 Mar 2023 23:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] vfio: Fix vfio_get_dev_region() trace event
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230303074330.2609377-1-clg@kaod.org>
 <93a2b734-d3b1-27e8-32f4-d46342dc6b00@linaro.org>
 <20230303084255.2fe5f26c.alex.williamson@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230303084255.2fe5f26c.alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5be60174-716d-4f1d-9b48-b8809d6a70e8
X-Ovh-Tracer-Id: 7951949568783322080
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudelledgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeugfdtteetfefgiefhfefgueduveefieehgfevvdetiedugeeghfehtdehvdffnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlvgigrdifihhllhhirghmshhonhesrhgvughhrghtrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgtlhhgsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/3/23 16:42, Alex Williamson wrote:
> On Fri, 3 Mar 2023 10:34:47 +0100
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>> On 3/3/23 08:43, Cédric Le Goater wrote:
>>> From: Cédric Le Goater <clg@redhat.com>
>>>
>>> Simply revert 'x8' to fix the typo and remove the ending '8'
> 
> s/revert/reverse/?  ie. transpose?  Nothing is being reverted afaict.

Transpose. Like Ctrl+T under Emacs.

>>> Fixes: e61a424f05 ("vfio: Create device specific region info helper")
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1526
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>    hw/vfio/trace-events | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>>> index 669d9fe07c..28e82541a2 100644
>>> --- a/hw/vfio/trace-events
>>> +++ b/hw/vfio/trace-events
>>> @@ -117,7 +117,7 @@ vfio_region_mmaps_set_enabled(const char *name, bool enabled) "Region %s mmaps e
>>>    vfio_region_unmap(const char *name, unsigned long offset, unsigned long end) "Region %s unmap [0x%lx - 0x%lx]"
>>>    vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Device %s region %d: %d sparse mmap entries"
>>>    vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
>>> -vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
>>> +vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%08x"
>>
>> 8 digits might be over-engineered, but at least is future-proof :)
>>
>> $ git grep -E 'VFIO_REGION_(SUB)?TYPE_' linux-headers/
>> linux-headers/linux/vfio.h:322:#define VFIO_REGION_TYPE_PCI_VENDOR_TYPE
>> (1 << 31)
> 
> This alone justifies printing the full zero-prefixed hex value.  I tend
> to prefer fixed width fields in trace logs, though it's less important
> here than when we're streaming register accesses.  Thanks,
> 
> Alex
> 


