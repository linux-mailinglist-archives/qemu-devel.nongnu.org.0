Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C06829EF51
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 16:11:34 +0100 (CET)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY9aP-0005pW-Fj
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 11:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kY9ZC-0005Jy-NY
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 11:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kY9ZA-0003Le-Lv
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 11:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603984215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=leMfdUHyqD90ogGbIaQWjgaZC2he87It8gFacaCHLqQ=;
 b=X99z5h8lJ+QLR+8rGfv4G/7LXDy3wDANuPJE/27WF83e5mWTRdIOLz9IO1kjYrTNDb/PUK
 ugQK0fKtwPqt1ijLTupQlEKUB5L0U3SHCpxFyWSE283J2QCEDLRYFN9Xyl+KgxPcLycbUk
 Z5KtpWqEtfkZZerOYITH+j1Q6VSIYLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-uhatkSmtMa2gy85njPy8PA-1; Thu, 29 Oct 2020 11:10:12 -0400
X-MC-Unique: uhatkSmtMa2gy85njPy8PA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 002A98030CC;
 Thu, 29 Oct 2020 15:10:08 +0000 (UTC)
Received: from [10.72.12.72] (ovpn-12-72.pek2.redhat.com [10.72.12.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C85941001281;
 Thu, 29 Oct 2020 15:09:34 +0000 (UTC)
Subject: Re: Out-of-Process Device Emulation session at KVM Forum 2020
To: Alex Williamson <alex.williamson@redhat.com>
References: <20201027151400.GA138065@stefanha-x1.localdomain>
 <CAJSP0QWrmNN1Ci-M-4WDFZBOGHyeZvF71utg0w2ajCbOLtynJw@mail.gmail.com>
 <c4e5b631-1607-a0ec-ee88-6c5a9493e3de@redhat.com>
 <20201029083130.0617a28f@w520.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b85405de-d525-bf59-826c-737fa7bbdfef@redhat.com>
Date: Thu, 29 Oct 2020 23:09:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029083130.0617a28f@w520.home>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.261, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Janosch Frank <frankja@linux.vnet.ibm.com>,
 "mst@redhat.com" <mtsirkin@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>, Jag Raman <jag.raman@oracle.com>,
 Anup Patel <anup@brainfault.org>,
 Claudio Imbrenda <imbrenda@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Roman Kagan <rkagan@virtuozzo.com>, Felipe Franciosi <felipe@nutanix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Liran Alon <liran.alon@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Halil Pasic <pasic@linux.vnet.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, fam <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/10/29 下午10:31, Alex Williamson wrote:
> On Thu, 29 Oct 2020 21:02:05 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> On 2020/10/29 下午8:08, Stefan Hajnoczi wrote:
>>> Here are notes from the session:
>>>
>>> protocol stability:
>>>       * vhost-user already exists for existing third-party applications
>>>       * vfio-user is more general but will take more time to develop
>>>       * libvfio-user can be provided to allow device implementations
>>>
>>> management:
>>>       * Should QEMU launch device emulation processes?
>>>           * Nicer user experience
>>>           * Technical blockers: forking, hotplug, security is hard once
>>> QEMU has started running
>>>           * Probably requires a new process model with a long-running
>>> QEMU management process proxying QMP requests to the emulator process
>>>
>>> migration:
>>>       * dbus-vmstate
>>>       * VFIO live migration ioctls
>>>           * Source device can continue if migration fails
>>>           * Opaque blobs are transferred to destination, destination can
>>> fail migration if it decides the blobs are incompatible
>>
>> I'm not sure this can work:
>>
>> 1) Reading something that is opaque to userspace is probably a hint of
>> bad uAPI design
>> 2) Did qemu even try to migrate opaque blobs before? It's probably a bad
>> design of migration protocol as well.
>>
>> It looks to me have a migration driver in qemu that can clearly define
>> each byte in the migration stream is a better approach.
> Any time during the previous two years of development might have been a
> more appropriate time to express your doubts.


Somehow I did that in this series[1]. But the main issue is still there. 
Is this legal to have a uAPI that turns out to be opaque to userspace? 
(VFIO seems to be the first). If it's not,  the only choice is to do 
that in Qemu.


>
> Note that we're not talking about vDPA devices here, we're talking
> about arbitrary devices with arbitrary state.  Some degree of migration
> support for assigned devices can be implemented in QEMU, Alex Graf
> proved this several years ago with i40evf.  Years later, we don't have
> any vendors proposing device specific migration code for QEMU.


Yes but it's not necessarily VFIO as well.


>
> Clearly we're also trying to account for proprietary devices where even
> for suspend/resume support, proprietary drivers may be required for
> manipulating that internal state.  When we move device emulation
> outside of QEMU, whether in kernel or to other userspace processes,
> does it still make sense to require code in QEMU to support
> interpretation of that device for migration purposes?


Well, we could extend Qemu to support property module (or have we 
supported that now?). And then it can talk to property drivers via 
either VFIO or vendor specific uAPI.


>   That seems
> counter to the actual goal of out-of-process devices and clearly hasn't
> work for us so far.  Thanks,
>
> Alex


Thanks

[1] 
https://lore.kernel.org/kvm/20200914084449.0182e8a9@x1.home/T/#m23b08f92a7269fa9676b91dacb6699a78d4b3949



