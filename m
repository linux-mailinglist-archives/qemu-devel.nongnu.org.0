Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F53E2288E0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 21:09:07 +0200 (CEST)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxxdS-0001Mv-32
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 15:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@siemens.com>)
 id 1jxxcf-0000w2-4r
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 15:08:17 -0400
Received: from goliath.siemens.de ([192.35.17.28]:40089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@siemens.com>)
 id 1jxxca-0004ik-E0
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 15:08:16 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 06LJ82uk011474
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 21:08:02 +0200
Received: from [167.87.32.116] ([167.87.32.116])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06LJ80EA030782;
 Tue, 21 Jul 2020 21:08:00 +0200
Subject: Re: Inter-VM device emulation (call on Mon 20th July 2020)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <86d42090-f042-06a1-efba-d46d449df280@arrikto.com>
 <20200715112342.GD18817@stefanha-x1.localdomain>
 <CAJSP0QU78mAK-DiOYXvTOEa3=CAEy1rQtyTBe5rrKDs=yfptAg@mail.gmail.com>
 <874kq1w3bz.fsf@linaro.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7f070c10-650f-2904-7064-373214a041ee@siemens.com>
Date: Tue, 21 Jul 2020 21:08:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <874kq1w3bz.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.35.17.28; envelope-from=jan.kiszka@siemens.com;
 helo=goliath.siemens.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 15:08:10
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "John G. Johnson" <john.g.johnson@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Andra-Irina Paraschiv <andraprs@amazon.com>,
 kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, Alexander Graf <graf@amazon.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Nikos Dragazis <ndragazis@arrikto.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.07.20 12:49, Alex Bennée wrote:
> 
> Stefan Hajnoczi <stefanha@gmail.com> writes:
> 
>> Thank you everyone who joined!
>>
>> I didn't take notes but two things stood out:
>>
>> 1. The ivshmem v2 and virtio-vhost-user use cases are quite different
>> so combining them does not seem realistic. ivshmem v2 needs to be as
>> simple for the hypervisor to implement as possible even if this
>> involves some sacrifices (e.g. not transparent to the Driver VM that
>> is accessing the device, performance). virtio-vhost-user is more aimed
>> at general-purpose device emulation although support for arbitrary
>> devices (e.g. PCI) would be important to serve all use cases.
> 
> I believe my phone gave up on the last few minutes of the call so I'll
> just say we are interested in being able to implement arbitrary devices
> in the inter-VM silos. Devices we are looking at:
> 
>    virtio-audio
>    virtio-video
> 
> these are performance sensitive devices which provide a HAL abstraction
> to a common software core.
> 
>    virtio-rpmb
> 
> this is a secure device where the backend may need to reside in a secure
> virtualised world.
> 
>    virtio-scmi
> 
> this is a more complex device which allows the guest to make power and
> clock demands from the firmware. Needless to say this starts to become
> complex with multiple moving parts.
> 
> The flexibility of vhost-user seems to match up quite well with wanting
> to have a reasonably portable backend that just needs to be fed signals
> and a memory mapping. However we don't want daemons to automatically
> have a full view of the whole of the guests system memory.
> 
>> 2. Alexander Graf's idea for a new Linux driver that provides an
>> enforcing software IOMMU. This would be a character device driver that
>> is mmapped by the device emulation process (either vhost-user-style on
>> the host or another VMM for inter-VM device emulation). The Driver VMM
>> can program mappings into the device and the page tables in the device
>> emulation process will be updated. This way the Driver VMM can share
>> memory specific regions of guest RAM with the device emulation process
>> and revoke those mappings later.
> 
> I'm wondering if there is enough plumbing on the guest side so a guest
> can use the virtio-iommu to mark out exactly which bits of memory the
> virtual device can have access to? At a minimum the virtqueues need to
> be accessible and for larger transfers maybe a bounce buffer. However
> for speed you want as wide as possible mapping but no more. It would be
> nice for example if a block device could load data directly into the
> guests block cache (zero-copy) but without getting a view of the kernels
> internal data structures.

Welcome to a classic optimization triangle:

  - speed -> direct mappings
  - security -> restricted mapping
  - simplicity -> static mapping

Pick two, you can't have them all. Well, you could try a little bit more 
of one, at the price of losing on another. But that's it.

We chose the last two, ending up with probably the simplest but not 
fastest solution for type-1 hypervisors like Jailhouse. Specifically for 
non-Linux use cases, legacy RTOSes, often with limited driver stacks, 
having not only virtio but also even simpler channels over 
application-defined shared memory layouts is a requirement.

> 
> Another thing that came across in the call was quite a lot of
> assumptions about QEMU and Linux w.r.t virtio. While our project will
> likely have Linux as a guest OS we are looking specifically at enabling
> virtio for Type-1 hypervisors like Xen and the various safety certified
> proprietary ones. It is unlikely that QEMU would be used as the VMM for
> these deployments. We want to work out what sort of common facilities
> hypervisors need to support to enable virtio so the daemons can be
> re-usable and maybe setup with a minimal shim for the particular
> hypervisor in question.
> 

I'm with you regarding stacks that are mappable not only on QEMU/Linux. 
And also one that does not let the certification costs sky-rocket 
because of its mandated implementation complexity.

I'm not sure anymore if there will be only one device model. Maybe we 
should eventually think about a backend layer that can sit on something 
like virtio-vhost-user as well as on ivshmem-virtio, allowing the same 
device backend code to be plumbed into both transports. Why shouldn't 
work what already works well under Linux with the frontend device 
drivers vs. virtio transports?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

