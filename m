Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3138986D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 23:09:57 +0200 (CEST)
Received: from localhost ([::1]:33136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljTS0-0001W7-1y
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 17:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ljTQo-0000pM-M5
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ljTQl-00066X-91
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621458517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0srEJPogk1eNi6HYQVbcVfD/T9hmM9s25IQX3SMlap4=;
 b=AA4IEj6lON4p1RCDmXKWwYR6u0BqWvLx44pdNWt/mxfTuKx+mfnY6SthHkg729G/ZeUg7x
 2/bX35BXs2GYI7F1i7opTbNjZj2ezWhdoW0U2XxpLLjObbyrGSetGzyP+mSn9ZxgG2QDOz
 3BiChIBwslzFjBSwdANcW8gvX8H2Zz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-wDIMoiQTPCiwkQP5fPNphw-1; Wed, 19 May 2021 17:08:35 -0400
X-MC-Unique: wDIMoiQTPCiwkQP5fPNphw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE43D803622;
 Wed, 19 May 2021 21:08:32 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D35E5D9CC;
 Wed, 19 May 2021 21:08:18 +0000 (UTC)
Date: Wed, 19 May 2021 15:08:17 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <20210519150817.6a90985b.alex.williamson@redhat.com>
In-Reply-To: <20210414114122.236193-1-thanos.makatos@nutanix.com>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: benjamin.walker@intel.com, John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, John Levon <levon@movementarian.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 tina.zhang@intel.com, jag.raman@oracle.com, james.r.harris@intel.com,
 John Levon <john.levon@nutanix.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Kanth.Ghatraju@oracle.com,
 Felipe Franciosi <felipe@nutanix.com>, marcandre.lureau@redhat.com,
 Yan Zhao <yan.y.zhao@intel.com>, konrad.wilk@oracle.com,
 yuvalkashtan@gmail.com, dgilbert@redhat.com, ismael@linux.com,
 Stefan Hajnoczi <stefanha@redhat.com>, changpeng.liu@intel.com,
 tomassetti.andrea@gmail.com, mpiszczek@ddn.com,
 Cornelia Huck <cohuck@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, xiuchun.lu@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 04:41:22 -0700
Thanos Makatos <thanos.makatos@nutanix.com> wrote:
> +
> +VFIO_USER_DMA_MAP
> +-----------------
> +
> +Message Format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++==============+========================+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 2                      |
> ++--------------+------------------------+
> +| Message size | 16 + table size        |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| Table        | array of table entries |
> ++--------------+------------------------+
> +
> +This command message is sent by the client to the server to inform it of the
> +memory regions the server can access. It must be sent before the server can
> +perform any DMA to the client. It is normally sent directly after the version
> +handshake is completed, but may also occur when memory is added to the client,
> +or if the client uses a vIOMMU. If the client does not expect the server to
> +perform DMA then it does not need to send to the server VFIO_USER_DMA_MAP
> +commands. If the server does not need to perform DMA then it can ignore such
> +commands but it must still reply to them. The table is an array of the
> +following structure:
> +
> +Table entry format
> +^^^^^^^^^^^^^^^^^^
> +
> ++-------------+--------+-------------+
> +| Name        | Offset | Size        |
> ++=============+========+=============+
> +| Address     | 0      | 8           |
> ++-------------+--------+-------------+
> +| Size        | 8      | 8           |
> ++-------------+--------+-------------+
> +| Offset      | 16     | 8           |
> ++-------------+--------+-------------+
> +| Protections | 24     | 4           |
> ++-------------+--------+-------------+
> +| Flags       | 28     | 4           |
> ++-------------+--------+-------------+
> +|             | +-----+------------+ |
> +|             | | Bit | Definition | |
> +|             | +=====+============+ |
> +|             | | 0   | Mappable   | |
> +|             | +-----+------------+ |
> ++-------------+--------+-------------+
> +
> +* *Address* is the base DMA address of the region.
> +* *Size* is the size of the region.
> +* *Offset* is the file offset of the region with respect to the associated file
> +  descriptor.

It might help to explicitly state this value is ignored by the server
for non-mappable DMA, otherwise a server might assume a specific value
is required (ex. zero) for such cases.

> +* *Protections* are the region's protection attributes as encoded in
> +  ``<sys/mman.h>``.
> +* *Flags* contains the following region attributes:
> +
> +  * *Mappable* indicates that the region can be mapped via the mmap() system
> +    call using the file descriptor provided in the message meta-data.
> +
> +This structure is 32 bytes in size, so the message size is:
> +16 + (# of table entries * 32).
> +
> +If a DMA region being added can be directly mapped by the server, an array of
> +file descriptors must be sent as part of the message meta-data. Each mappable
> +region entry must have a corresponding file descriptor. On AF_UNIX sockets, the

Is this saying that if the client provides table entries where indexes
1, 3, and 5 are indicated as mappable, then there must be an ancillary
file descriptor array with 3 entries, where fd[0] maps to entry[1],
fd[1]:entry[3], and fd[2]:entry[5], even if fd[0-2] are all the
same file descriptor?

> +file descriptors must be passed as SCM_RIGHTS type ancillary data. Otherwise,
> +if a DMA region cannot be directly mapped by the server, it can be accessed by
> +the server using VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE messages, explained
> +in `Read and Write Operations`_. A command to map over an existing region must
> +be failed by the server with ``EEXIST`` set in error field in the reply.
> +
> +Adding multiple DMA regions can partially fail. The response does not indicate
> +which regions were added and which were not, therefore it is a client
> +implementation detail how to recover from the failure.
> +
> +.. Note::
> +   The server can optionally remove succesfully added DMA regions making this
> +   operation atomic.
> +   The client can recover by attempting to unmap one by one all the DMA regions
> +   in the VFIO_USER_DMA_MAP command, ignoring failures for regions that do not
> +   exist.

What's the benefit of specifying this server behavior as optional?  I'm
afraid this unspecified error recovery behavior might actually deter
clients from performing batch mappings.  Servers also have little
incentive to do their own cleanup if the client has no way to detect
that behavior.

> +
> +
> +VFIO_USER_DMA_UNMAP
> +-------------------
> +
> +Message Format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++==============+========================+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 3                      |
> ++--------------+------------------------+
> +| Message size | 16 + table size        |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| Table        | array of table entries |
> ++--------------+------------------------+
> +
> +This command message is sent by the client to the server to inform it that a
> +DMA region, previously made available via a VFIO_USER_DMA_MAP command message,
> +is no longer available for DMA. It typically occurs when memory is subtracted
> +from the client or if the client uses a vIOMMU. If the client does not expect
> +the server to perform DMA then it does not need to send to the server
> +VFIO_USER_DMA_UNMAP commands. If the server does not need to perform DMA then
> +it can ignore such commands but it must still reply to them. The table is an

I'm confused why expectation of DMA plays a factor here.  For example,
if QEMU unplugs a DIMM and the server has an mmap of the file descriptor
related to that DIMM, does it get to retain the mmap if it doesn't
currently have any DMA queued targeting that address range?  Can QEMU
skip sending an unmap if the PCI bus master bit is disabled on the
device preventing further DMA?  How can the associated file descriptor
get released?  This doesn't feel strongly specified.


> +array of the following structure:
> +
> +Table entry format
> +^^^^^^^^^^^^^^^^^^
> +
> ++--------------+--------+---------------------------------------+
> +| Name         | Offset | Size                                  |
> ++==============+========+=======================================+
> +| Address      | 0      | 8                                     |
> ++--------------+--------+---------------------------------------+
> +| Size         | 8      | 8                                     |
> ++--------------+--------+---------------------------------------+
> +| Offset       | 16     | 8                                     |
> ++--------------+--------+---------------------------------------+
> +| Protections  | 24     | 4                                     |
> ++--------------+--------+---------------------------------------+
> +| Flags        | 28     | 4                                     |
> ++--------------+--------+---------------------------------------+
> +|              | +-----+--------------------------------------+ |
> +|              | | Bit | Definition                           | |
> +|              | +=====+======================================+ |
> +|              | | 0   | VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP | |
> +|              | +-----+--------------------------------------+ |
> ++--------------+--------+---------------------------------------+
> +| VFIO Bitmaps | 32     | variable                              |
> ++--------------+--------+---------------------------------------+
> +
> +* *Address* is the base DMA address of the region.
> +* *Size* is the size of the region.

Are there any assumptions about address and size of the unmap command
relative to the original map command or is the client freely allowed to
bisect, overlap, or overextend previous mappings?


> +* *Offset* is the file offset of the region with respect to the associated file
> +  descriptor.
> +* *Protections* are the region's protection attributes as encoded in
> +  ``<sys/mman.h>``.
> +* *Flags* contains the following region attributes:
> +
> +  * *VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP* indicates that a dirty page bitmap
> +    must be populated before unmapping the DMA region. The client must provide
> +    a ``struct vfio_bitmap`` in the VFIO bitmaps field for each region, with
> +    the ``vfio_bitmap.pgsize`` and ``vfio_bitmap.size`` fields initialized.
> +
> +* *VFIO Bitmaps* contains one ``struct vfio_bitmap`` per region (explained
> +  below) if ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags.

How will this be extended when new flags are added to get new data or
new data formats?  Note for instance that the kernel struct
vfio_iommu_type1_dma_unmap specifies the data[] as opaque in general and
only specifies it as struct vfio_bitmap for the case where
GET_DIRTY_BITMAP is specified.


> +
> +.. _VFIO bitmap format:
> +
> +VFIO bitmap format
> +^^^^^^^^^^^^^^^^^^
> +
> +If the VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP bit is set in the request, the
> +server must append to the header the ``struct vfio_bitmap`` received in the
> +command followed by the bitmap, for each region. ``struct vfio_bitmap`` has the
> +following format:
> +
> ++--------+--------+------+
> +| Name   | Offset | Size |
> ++========+========+======+
> +| pgsize | 0      | 8    |
> ++--------+--------+------+
> +| size   | 8      | 8    |
> ++--------+--------+------+
> +| data   | 16     | 8    |
> ++--------+--------+------+
> +
> +* *pgsize* is the page size for the bitmap, in bytes.
> +* *size* is the size for the bitmap, in bytes, excluding the VFIO bitmap header.
> +* *data* This field is unused in vfio-user.
> +
> +The VFIO bitmap structure is defined in ``<linux/vfio.h>``
> +(``struct vfio_bitmap``).
> +
> +Each ``struct vfio_bitmap`` entry is followed by the region's bitmap. Each bit
> +in the bitmap represents one page of size ``struct vfio_bitmap.pgsize``.
> +
> +If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is not set in Flags then the size
> +of the message is: 16 + (# of table entries * 32).
> +If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags then the size of
> +the message is: 16 + (# of table entries * 56) + size of all bitmaps.
> +
> +Upon receiving a VFIO_USER_DMA_UNMAP command, if the file descriptor is mapped
> +then the server must release all references to that DMA region before replying,
> +which includes potentially in flight DMA transactions. Removing a portion of a
> +DMA region is possible.

Ah, maybe this answers my question about unmap vs map, but it also seems
to contradict the description allowing the server to ignore unmap
requests if no DMA is expected when we state here that the server MUST
release references.  How might we indicate unmap granularity must match
mapping granularity restrictions to the user in the future should some
acceleration technology require it?  This is akin to the TYPE1 vs
TYPE1v2 distinction in the kernel.

Is this also a good place to point out that the max messages size of
4096 is extremely limiting for returning a dirty bitmap for most use
cases?  Some discussion of the error codes for such a case might be
relevant here too.

...
> +VFIO_USER_VM_INTERRUPT
> +----------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++----------------+------------------------+
> +| Name           | Value                  |
> ++================+========================+
> +| Message ID     | <ID>                   |
> ++----------------+------------------------+
> +| Command        | 13                     |
> ++----------------+------------------------+
> +| Message size   | 20                     |
> ++----------------+------------------------+
> +| Flags          | Reply bit set in reply |
> ++----------------+------------------------+
> +| Error          | 0/errno                |
> ++----------------+------------------------+
> +| Interrupt info | <interrupt>            |
> ++----------------+------------------------+
> +
> +This command message is sent from the server to the client to signal the device
> +has raised an interrupt.
> +
> +Interrupt info format
> +^^^^^^^^^^^^^^^^^^^^^
> +
> ++-----------+--------+------+
> +| Name      | Offset | Size |
> ++===========+========+======+
> +| Sub-index | 16     | 4    |
> ++-----------+--------+------+
> +
> +* *Sub-index* is relative to the IRQ index, e.g., the vector number used in PCI
> +  MSI/X type interrupts.

Sorry if I'm blind, but where is the index itself provided?

Thanks,
Alex


