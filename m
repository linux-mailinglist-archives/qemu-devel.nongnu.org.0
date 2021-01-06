Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C562EBF4B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 15:07:40 +0100 (CET)
Received: from localhost ([::1]:54412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx9TO-0001Tu-Ux
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 09:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx9Rx-00010k-9i
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:06:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx9Rt-0006yZ-E8
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609941963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0H0BJ/p2uBQNFSOOHBY7RpkTHxxZFORxhcM9E4I3DKw=;
 b=brDPf7RTIea4jLgwu651JhiZNenpPJPAUwofF1WJEiVik8a+JWr+xdya3BJvOQFOVqGT4x
 qznRO39fHrqroVYDtgyd0Qzhfc3zguBPQbKs7BhWef7HkaTjrIxExOyJn4c8QkBabQyoZq
 TqrgoHfcIO08ZBpHB+FpbjdnVt+BFDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-KfxT8dIvP1u_uSlD8B9ixw-1; Wed, 06 Jan 2021 09:04:32 -0500
X-MC-Unique: KfxT8dIvP1u_uSlD8B9ixw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A3ED107ACE3
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 14:04:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-219.ams2.redhat.com [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3F775D9DC;
 Wed,  6 Jan 2021 14:04:22 +0000 (UTC)
Subject: Re: [qemu-web PATCH v2] Add virtio-blk and virtio-scsi configuration
 post
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210105104907.33587-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1284dc6b-0ce0-3d6e-ba54-067e91ca5dc8@redhat.com>
Date: Wed, 6 Jan 2021 15:04:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210105104907.33587-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2021 11.49, Stefan Hajnoczi wrote:
> The second post in the storage series covers virtio-blk and virtio-scsi.
> It compares the two and offers recommendations that users and tools
> using QEMU can use as a starting point. Graphs are included comparing
> the performance of various options.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>   * Mention default storage controllers for non-x86 [danpb]
>   * Remove statement about read-only ISO virtio-blk devices, both Rich
>     Jones and Daniel Berrange commented about this at different times so
>     I decided to drop it completely [danpb]
>   * Clarify PCI slot limits and multi-function discussion for virtio-blk
>     [danpb]
>   * Mention multiple virtio-scsi devices for NUMA tuning and that
>     emulated LUNs can be HDDs or CD-ROMs [danpb]
> ---
>   ...020-12-17-virtio-blk-scsi-configuration.md | 115 ++++++++++++++++++
>   screenshots/2020-09-15-scsi-devices.svg       |   1 +
>   screenshots/2020-09-15-virtio-blk-vs-scsi.svg |   1 +
>   3 files changed, 117 insertions(+)
>   create mode 100644 _posts/2020-12-17-virtio-blk-scsi-configuration.md
>   create mode 100644 screenshots/2020-09-15-scsi-devices.svg
>   create mode 100644 screenshots/2020-09-15-virtio-blk-vs-scsi.svg
> 
> diff --git a/_posts/2020-12-17-virtio-blk-scsi-configuration.md b/_posts/2020-12-17-virtio-blk-scsi-configuration.md
> new file mode 100644
> index 0000000..b4361f5
> --- /dev/null
> +++ b/_posts/2020-12-17-virtio-blk-scsi-configuration.md
> @@ -0,0 +1,115 @@
> +---
> +layout: post
> +title:  "Configuring virtio-blk and virtio-scsi Devices"
> +date:   2021-01-05 07:00:00 +0000
> +author: Stefan Hajnoczi and Sergio Lopez
> +categories: [storage]
> +---
> +The [previous article](https://www.qemu.org/2020/09/14/qemu-storage-overview/)
> +in this series introduced QEMU storage concepts. Now we move on to look at the
> +two most popular emulated storage controllers for virtualization: virtio-blk
> +and virtio-scsi.
> +
> +This post provides recommendations for configuring virtio-blk and virtio-scsi
> +and how to choose between the two devices. The recommendations provide good
> +performance in a wide range of use cases and are suitable as default settings
> +in tools that use QEMU.
> +
> +## Virtio storage devices
> +### Key points
> +* Prefer virtio storage devices over other emulated storage controllers.
> +* Use the latest virtio drivers.
> +
> +Virtio devices are recommended over other emulated storage controllers as they
> +are generally the most performant and fully-featured storage controllers in
> +QEMU.
> +
> +Unlike emulations of hardware storage controllers, virtio-blk and virtio-scsi
> +are specifically designed and optimized for virtualization. The details of how
> +they work are published for driver and device implementors in the [VIRTIO
> +specification](https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html).
> +
> +Virtio drivers are available for both Linux and Windows virtual machines.

Maybe mention "and other operating systems" as well? I assume virtio drivers 
are also available for the various BSDs etc.

> +Installing the latest version is recommended for the latest bug fixes and
> +performance enhancements.
> +
> +If virtio drivers are not available, the AHCI (SATA) device is widely supported
> +by modern x86 operating systems and can be used as a fallback. On non-x86
> +guests the default storage controller can be used as a fallback.
> +
> +## Comparing virtio-blk and virtio-scsi
> +### Key points
> +* Prefer virtio-scsi for attaching more than 28 disks or for full SCSI support.

I'd rather say "lots of devices" here instead of "28", since 28 needs an 
explanation (which you give below).

> +* Prefer virtio-blk in performance-critical use cases.

Maybe move the virtio-blk bullet above the virtio-scsi bullet, so that the 
two virtio-scsi bullets are listed next to each other? And it's also the 
order that you use below.

> +* With virtio-scsi, use scsi-block for SCSI passthrough and otherwise use scsi-hd.
> +
> +Two virtio storage controllers are available: virtio-blk and virtio-scsi.
> +
> +### virtio-blk
> +The virtio-blk device presents a block device to the virtual machine. Each
> +virtio-blk device appears as a disk inside the guest. virtio-blk was available
> +before virtio-scsi and is the most widely deployed virtio storage controller.
> +
> +The virtio-blk device offers high performance thanks to a thin software stack
> +and is therefore a good choice when performance is a priority.

I'd maybe add some more words here, saying that virtio-blk is really simple, 
just read and write, and that other features might not be supported (like 
ejecting CD devices). Maybe also add a comment that it took a long time to 
add an additional command like TRIM to the device?

> +Applications that send SCSI commands are better served by the virtio-scsi
> +device, which has full SCSI support. SCSI passthrough was removed from the
> +Linux virtio-blk driver in v5.6 in favor of using virtio-scsi.

Since "passthrough" sounds like a passthrough of real hardware devices, I'd 
maybe rather say something like: The original virtio-blk devices also 
included the possibility to handle SCSI commands, but this features was 
removed from the Linux driver in v5.6 in favor of using virtio-scsi (and is 
also not available for modern virtio-1.0 devices anymore).

> +Virtual machines that require access to many disks can hit limits based on
> +availability of PCI slots, which are under contention with other devices
> +exposed to the guest, such as NICs. For example a typical i440fx machine type
> +default configuration allows for about 28 disks. It is possible to use
> +multi-function devices to pack multiple virtio-blk devies into a single PCI
> +slot at the cost of losing hotplug support, or additional PCI busses can be
> +defined. Generally though it is simpler to use a single virtio-scsi PCI adapter
> +instead.
> +
> +### virtio-scsi
> +The virtio-scsi device presents a SCSI Host Bus Adapter to the virtual machine.
> +SCSI offers a richer command set than virtio-blk and supports more use cases.
> +
> +Each device supports up to 16,383 LUNs (disks) per target and up to 255
> +targets. This allows a single virtio-scsi device to handle all disks in a
> +virtual machine, although defining more virtio-scsi devices makes it possible
> +to tune for NUMA topology as we will see in a later blog post.
> +
> +Emulated LUNs can be exposed as hard disk drives or CD-ROMs. Physical SCSI
> +devices can be passed through into the virtual machine, including CD-ROM
> +drives, tapes, and other devices besides hard disk drives.
> +
> +Clustering software that uses SCSI Persistent Reservations is supported by virtio-scsi, but not by virtio-blk.
> +
> +Performance of virtio-scsi may be lower than virtio-blk due to a thicker software stack, but in many use cases, this is not a significant factor. The following graph compares 4KB random read performance at various queue depths:
> +
> +![Comparing virtio-blk and virtio-scsi performance](/screenshots/2020-09-15-virtio-blk-vs-scsi.svg)
> +
> +### virtio-scsi configuration
> +The following SCSI devices are available with virtio-scsi:
> +
> +|Device|SCSI Passthrough|Performance|
> +|------|----------------|-----------|
> +|scsi-hd|No|Highest|
> +|scsi-block|Yes|Lower|
> +|scsi-generic|Yes|Lowest|
> +
> +The scsi-hd device is suitable for disk image files and host block devices
> +when SCSI passthrough is not required.
> +
> +The scsi-block device offers SCSI passthrough and is preferred over
> +scsi-generic due to higher performance.
> +
> +The following graph compares the sequential I/O performance of these devices
> +using virtio-scsi with an iothread:
> +
> +![Comparing scsi-hd, scsi-block, and scsi-generic performance](/screenshots/2020-09-15-scsi-devices.svg)
> +
> +## Conclusion
> +The virtio-blk and virtio-scsi offer a choice between a single block device and
> +a full-fledged SCSI Host Bus Adapter. Virtualized guests typically use one or
> +both of them depending on functional and performance requirements. This post
> +compared the two and offered recommendations on how to choose between them.
> +
> +The next post in this series will discuss the iothreads feature that both
> +virtio-blk and virtio-scsi support for increased performance.

Do you maybe also want to give examples for the QEMU command line showing 
how virtio-blk and virtio-scsi can be used there?

  Thomas


