Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D4C2FA7C3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:44:15 +0100 (CET)
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YZa-0007HC-UL
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l1Y7F-0001Fb-94
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:14:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l1Y7C-0001jr-7e
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610990090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=augqod9hKrMNdfqPCtGw2cJmhN5TBhPxfuHU8wdkShQ=;
 b=TZOmJIRkMhpWFHEajiE/6vaGuMNlK7yPWIqspbKRBx2OQYpi3BeGP8hkTWHaE0l8YzQ5Eu
 yZBHZLKRzDKjSqUBFpyh/xc7qDKo0vSflA6azO9qjAindokqwSdcTawApPzGelL9R+hogQ
 8+3MowkRGdRlD1AkeW8dLjnbck8FQOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-T_zVVj2yOrOEWMcZaRST7A-1; Mon, 18 Jan 2021 12:14:48 -0500
X-MC-Unique: T_zVVj2yOrOEWMcZaRST7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03E65BBEE1
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 17:14:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-48.ams2.redhat.com
 [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C28B01002391;
 Mon, 18 Jan 2021 17:14:38 +0000 (UTC)
Subject: Re: [qemu-web PATCH v2] Add virtio-blk and virtio-scsi configuration
 post
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210105104907.33587-1-stefanha@redhat.com>
 <a6cc92c5-3c6c-7c29-2f37-56ef25d6c585@redhat.com>
 <20210118170325.GE255498@stefanha-x1.localdomain>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <33baabb9-30b9-6dad-994c-7e28f15be8ce@redhat.com>
Date: Mon, 18 Jan 2021 18:14:38 +0100
MIME-Version: 1.0
In-Reply-To: <20210118170325.GE255498@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/18/21 18:03, Stefan Hajnoczi wrote:
> On Thu, Jan 14, 2021 at 09:17:55PM +0100, Laszlo Ersek wrote:
>> On 01/05/21 11:49, Stefan Hajnoczi wrote:
>>> The second post in the storage series covers virtio-blk and virtio-scsi.
>>> It compares the two and offers recommendations that users and tools
>>> using QEMU can use as a starting point. Graphs are included comparing
>>> the performance of various options.
>>>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>> v2:
>>>  * Mention default storage controllers for non-x86 [danpb]
>>>  * Remove statement about read-only ISO virtio-blk devices, both Rich
>>>    Jones and Daniel Berrange commented about this at different times so
>>>    I decided to drop it completely [danpb]
>>>  * Clarify PCI slot limits and multi-function discussion for virtio-blk
>>>    [danpb]
>>>  * Mention multiple virtio-scsi devices for NUMA tuning and that
>>>    emulated LUNs can be HDDs or CD-ROMs [danpb]
>>> ---
>>>  ...020-12-17-virtio-blk-scsi-configuration.md | 115 ++++++++++++++++++
>>>  screenshots/2020-09-15-scsi-devices.svg       |   1 +
>>>  screenshots/2020-09-15-virtio-blk-vs-scsi.svg |   1 +
>>>  3 files changed, 117 insertions(+)
>>>  create mode 100644 _posts/2020-12-17-virtio-blk-scsi-configuration.md
>>>  create mode 100644 screenshots/2020-09-15-scsi-devices.svg
>>>  create mode 100644 screenshots/2020-09-15-virtio-blk-vs-scsi.svg
>>>
>>> diff --git a/_posts/2020-12-17-virtio-blk-scsi-configuration.md b/_posts/2020-12-17-virtio-blk-scsi-configuration.md
>>> new file mode 100644
>>> index 0000000..b4361f5
>>> --- /dev/null
>>> +++ b/_posts/2020-12-17-virtio-blk-scsi-configuration.md
>>> @@ -0,0 +1,115 @@
>>> +---
>>> +layout: post
>>> +title:  "Configuring virtio-blk and virtio-scsi Devices"
>>> +date:   2021-01-05 07:00:00 +0000
>>> +author: Stefan Hajnoczi and Sergio Lopez
>>> +categories: [storage]
>>> +---
>>> +The [previous article](https://www.qemu.org/2020/09/14/qemu-storage-overview/)
>>> +in this series introduced QEMU storage concepts. Now we move on to look at the
>>> +two most popular emulated storage controllers for virtualization: virtio-blk
>>> +and virtio-scsi.
>>> +
>>> +This post provides recommendations for configuring virtio-blk and virtio-scsi
>>> +and how to choose between the two devices. The recommendations provide good
>>> +performance in a wide range of use cases and are suitable as default settings
>>> +in tools that use QEMU.
>>> +
>>> +## Virtio storage devices
>>> +### Key points
>>> +* Prefer virtio storage devices over other emulated storage controllers.
>>> +* Use the latest virtio drivers.
>>> +
>>> +Virtio devices are recommended over other emulated storage controllers as they
>>> +are generally the most performant and fully-featured storage controllers in
>>> +QEMU.
>>> +
>>> +Unlike emulations of hardware storage controllers, virtio-blk and virtio-scsi
>>> +are specifically designed and optimized for virtualization. The details of how
>>> +they work are published for driver and device implementors in the [VIRTIO
>>> +specification](https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html).
>>> +
>>> +Virtio drivers are available for both Linux and Windows virtual machines.
>>> +Installing the latest version is recommended for the latest bug fixes and
>>> +performance enhancements.
>>> +
>>> +If virtio drivers are not available, the AHCI (SATA) device is widely supported
>>> +by modern x86 operating systems and can be used as a fallback. On non-x86
>>> +guests the default storage controller can be used as a fallback.
>>> +
>>> +## Comparing virtio-blk and virtio-scsi
>>> +### Key points
>>> +* Prefer virtio-scsi for attaching more than 28 disks or for full SCSI support.
>>> +* Prefer virtio-blk in performance-critical use cases.
>>> +* With virtio-scsi, use scsi-block for SCSI passthrough and otherwise use scsi-hd.
>>> +
>>> +Two virtio storage controllers are available: virtio-blk and virtio-scsi.
>>> +
>>> +### virtio-blk
>>> +The virtio-blk device presents a block device to the virtual machine. Each
>>> +virtio-blk device appears as a disk inside the guest. virtio-blk was available
>>> +before virtio-scsi and is the most widely deployed virtio storage controller.
>>> +
>>> +The virtio-blk device offers high performance thanks to a thin software stack
>>> +and is therefore a good choice when performance is a priority.
>>> +
>>> +Applications that send SCSI commands are better served by the virtio-scsi
>>> +device, which has full SCSI support. SCSI passthrough was removed from the
>>> +Linux virtio-blk driver in v5.6 in favor of using virtio-scsi.
>>
>> Is "discard=unmap" worth mentioning specifically? For me, that was the
>> reason for switching practically all my domains to virtio-scsi from
>> virtio-blk. ("Delete files in the guest, recover space on the host.")
> 
> virtio-blk supports discard since Linux commit
> 1f23816b8eb8fdc39990abe166c10a18c16f6b21 ("virtio_blk: add discard and
> write zeroes support"). The feature was added in 2018 so you now have
> the choice between virtio-blk or virtio-scsi again :).

Ah, thanks!

(I wonder now if my understanding has been muddled by Windows guest
support... But even the Windows guest driver has commit 335d13682a56
("[viostor] add preliminary support for discard (unmap) command",
2019-06-04), apparently!)

Thanks!
Laszlo


