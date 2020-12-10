Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706C62D574E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:36:36 +0100 (CET)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knINH-0001PT-Ec
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1knI0Q-00050N-TU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1knI0O-0004Sa-DI
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607591575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwZyk42Z1jA26ZNB0Ygx5Hz5zCov15S0EUsriUF2TEA=;
 b=dAFWocrr7d2G2l1vsMLpf36J2XOkeByL4GRm7V66ziWPbo2kgojnuXD2TxUPVQuz2h5XUm
 iRljeEurbREorD5Ff7Q8fjjH3icQjXJ07cRTuPHPvULlyYeNYGrK96XymNVlrqnCa73clq
 1rgVDWYvy5N4pTwt91/klCX3RHIFri4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-vGcsDXMlMQaNRaTayzAUXA-1; Thu, 10 Dec 2020 04:12:51 -0500
X-MC-Unique: vGcsDXMlMQaNRaTayzAUXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FA9B107ACE6;
 Thu, 10 Dec 2020 09:12:48 +0000 (UTC)
Received: from [10.72.12.50] (ovpn-12-50.pek2.redhat.com [10.72.12.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A2DD19746;
 Thu, 10 Dec 2020 09:12:30 +0000 (UTC)
Subject: Re: [RFC PATCH 00/27] vDPA software assisted live migration
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201208093715.GX203660@stefanha-x1.localdomain>
 <1410217602.34486578.1607506010536.JavaMail.zimbra@redhat.com>
 <20201209155729.GB396498@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <750d098a-20e1-983b-9085-5197776cde35@redhat.com>
Date: Thu, 10 Dec 2020 17:12:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209155729.GB396498@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>,
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Lars Ganrot <lars.ganrot@gmail.com>, Rob Miller <rob.miller@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Howard Cai <howard.cai@gmail.com>,
 Parav Pandit <parav@mellanox.com>, vm <vmireyno@marvell.com>,
 Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/12/9 下午11:57, Stefan Hajnoczi wrote:
> On Wed, Dec 09, 2020 at 04:26:50AM -0500, Jason Wang wrote:
>> ----- Original Message -----
>>> On Fri, Nov 20, 2020 at 07:50:38PM +0100, Eugenio Pérez wrote:
>>>> This series enable vDPA software assisted live migration for vhost-net
>>>> devices. This is a new method of vhost devices migration: Instead of
>>>> relay on vDPA device's dirty logging capability, SW assisted LM
>>>> intercepts dataplane, forwarding the descriptors between VM and device.
>>> Pros:
>>> + vhost/vDPA devices don't need to implement dirty memory logging
>>> + Obsoletes ioctl(VHOST_SET_LOG_BASE) and friends
>>>
>>> Cons:
>>> - Not generic, relies on vhost-net-specific ioctls
>>> - Doesn't support VIRTIO Shared Memory Regions
>>>    https://github.com/oasis-tcs/virtio-spec/blob/master/shared-mem.tex
>> I may miss something but my understanding is that it's the
>> responsiblity of device to migrate this part?
> Good point. You're right.
>
>>> - Performance (see below)
>>>
>>> I think performance will be significantly lower when the shadow vq is
>>> enabled. Imagine a vDPA device with hardware vq doorbell registers
>>> mapped into the guest so the guest driver can directly kick the device.
>>> When the shadow vq is enabled a vmexit is needed to write to the shadow
>>> vq ioeventfd, then the host kernel scheduler switches to a QEMU thread
>>> to read the ioeventfd, the descriptors are translated, QEMU writes to
>>> the vhost hdev kick fd, the host kernel scheduler switches to the vhost
>>> worker thread, vhost/vDPA notifies the virtqueue, and finally the
>>> vDPA driver writes to the hardware vq doorbell register. That is a lot
>>> of overhead compared to writing to an exitless MMIO register!
>> I think it's a balance. E.g we can poll the virtqueue to have an
>> exitless doorbell.
>>
>>> If the shadow vq was implemented in drivers/vhost/ and QEMU used the
>>> existing ioctl(VHOST_SET_LOG_BASE) approach, then the overhead would be
>>> reduced to just one set of ioeventfd/irqfd. In other words, the QEMU
>>> dirty memory logging happens asynchronously and isn't in the dataplane.
>>>
>>> In addition, hardware that supports dirty memory logging as well as
>>> software vDPA devices could completely eliminate the shadow vq for even
>>> better performance.
>> Yes. That's our plan. But the interface might require more thought.
>>
>> E.g is the bitmap a good approach? To me reporting dirty pages via
>> virqueue is better since it get less footprint and is self throttled.
>>
>> And we need an address space other than the one used by guest for
>> either bitmap for virtqueue.
>>
>>> But performance is a question of "is it good enough?". Maybe this
>>> approach is okay and users don't expect good performance while dirty
>>> memory logging is enabled.
>> Yes, and actually such slow down may help for the converge of the
>> migration.
>>
>> Note that the whole idea is try to have a generic solution for all
>> types of devices. It's good to consider the performance but for the
>> first stage, it should be sufficient to make it work and consider to
>> optimize on top.
> Moving the shadow vq to the kernel later would be quite a big change
> requiring rewriting much of the code. That's why I mentioned this now
> before a lot of effort is invested in a QEMU implementation.


Right.


>
>>> I just wanted to share the idea of moving the
>>> shadow vq into the kernel in case you like that approach better.
>> My understanding is to keep kernel as simple as possible and leave the
>> polices to userspace as much as possible. E.g it requires us to
>> disable doorbell mapping and irq offloading, all of which were under
>> the control of userspace.
> If the performance is acceptable with the QEMU approach then I think
> that's the best place to implement it. It looks high-overhead though so
> maybe one of the first things to do is to run benchmarks to collect data
> on how it performs?


Yes, I agree.

Thanks


>
> Stefan


