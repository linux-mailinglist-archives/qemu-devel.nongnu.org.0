Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA41655C2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 04:37:46 +0100 (CET)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4ceo-0002FX-0n
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 22:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1j4cdY-0001Gb-8k
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:36:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1j4cdU-0006bG-OT
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:36:27 -0500
Received: from mga06.intel.com ([134.134.136.31]:54541)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1j4cdQ-0006Yr-2W
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:36:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 19:36:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,462,1574150400"; d="scan'208";a="224718178"
Received: from chenzh5-mobl2.ccr.corp.intel.com (HELO [10.255.31.29])
 ([10.255.31.29])
 by orsmga007.jf.intel.com with ESMTP; 19 Feb 2020 19:36:13 -0800
Subject: Re: [PATCH V4 0/5] Introduce Advanced Watch Dog module
To: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 libvir-list@redhat.com
References: <20191217124554.30818-1-chen.zhang@intel.com>
 <fa1ed6cb-63d7-ee83-a5a0-b099b662fef2@intel.com>
 <0502a0db0a17484c9220b3a63c40b397@intel.com>
 <08a1a225-52c1-4e6c-85f7-fcf6612b5383@redhat.com>
 <3049425105b94f6cb9cd846c84c95a84@intel.com>
 <783bac16-0e4d-f027-3e4a-b6fff500c244@redhat.com>
From: "Zhang, Chen" <chen.zhang@intel.com>
Message-ID: <c6564993-ec06-7fe1-137d-956f3d554e74@intel.com>
Date: Thu, 20 Feb 2020 11:36:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <783bac16-0e4d-f027-3e4a-b6fff500c244@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
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


On 2/12/2020 10:56 AM, Jason Wang wrote:
> On 2020/2/11 下午4:58, Zhang, Chen wrote:
>>> -----Original Message-----
>>> From: Jason Wang<jasowang@redhat.com>
>>> Sent: Monday, January 20, 2020 10:57 AM
>>> To: Zhang, Chen<chen.zhang@intel.com>; Paolo Bonzini
>>> <pbonzini@redhat.com>; Philippe Mathieu-Daudé<philmd@redhat.com>;
>>> qemu-dev<qemu-devel@nongnu.org>
>>> Cc: Zhang Chen<zhangckid@gmail.com>
>>> Subject: Re: [PATCH V4 0/5] Introduce Advanced Watch Dog module
>>>
>>>
>>> On 2020/1/19 下午5:10, Zhang, Chen wrote:
>>>> Hi~
>>>>
>>>> Anyone have comments about this module?
>>> Hi Chen:
>>>
>>> I will take a look at this series.
>> Sorry for slow reply due to CNY and extend leave.
>> OK, waiting your comments~ Thanks~
>>
>>> Two general questions:
>>>
>>> - if it can detect more than network stall, it should not belong to /net
>> This module use network connection status to detect all the issue(Host to Guest/Host to Host/Host to Admin...).
>> The target is more than network but all use network way. So it is looks a tricky problem.
>
> Ok.
>
>
>>> - need to convince libvirt guys for this proposal, since usually it's the duty of
>>> upper layer instead of qemu itself
>>>
>> Yes, It looks a upper layer responsibility, but In the cover latter I have explained the reason why we need this in Qemu.
>>    try to make this module as simple as possible. This module give upper layer software a new way to connect/monitoring Qemu.
>> And due to all the COLO code implement in Qemu side, Many customer want to use this FT solution without other dependencies,
>> it is very easy to integrated to real product.
>>
>> Thanks
>> Zhang Chen
>
> I would like to hear from libvirt about such design.


Hi Jason,

OK. I add the libvirt mailing list in this thread.

The full mail discussion and patches:

https://lists.nongnu.org/archive/html/qemu-devel/2020-02/msg02611.html


By the way, I noticed Eric is libvirt maintianer.

Hi Eric and Paolo, Can you give some comments about this series?


Thanks

Zhang Chen


>
> Thanks
>

