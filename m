Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984C3379A0A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 00:26:59 +0200 (CEST)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgEMc-0004md-Ob
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 18:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1lgELh-00047c-UW
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:26:01 -0400
Received: from ssh.movementarian.org ([2a01:7e00::f03c:92ff:fefb:3ad2]:58402
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1lgELb-0007fg-IO
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:26:01 -0400
Received: from movement by movementarian.org with local (Exim 4.93)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1lgELN-0083al-Dq; Mon, 10 May 2021 22:25:41 +0000
Date: Mon, 10 May 2021 22:25:41 +0000
From: John Levon <levon@movementarian.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <20210510222541.GA1916565@li1368-133.members.linode.com>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YJlmARxX5ZADZD5w@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJlmARxX5ZADZD5w@stefanha-x1.localdomain>
X-Url: http://www.movementarian.org/
Received-SPF: none client-ip=2a01:7e00::f03c:92ff:fefb:3ad2;
 envelope-from=movement@li1368-133.members.linode.com; helo=movementarian.org
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, KHOP_HELO_FCRDNS=0.398,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: benjamin.walker@intel.com, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Christophe de Dinechin <cdupontd@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, jag.raman@oracle.com,
 james.r.harris@intel.com, John Levon <john.levon@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Kanth.Ghatraju@oracle.com,
 Felipe Franciosi <felipe@nutanix.com>, marcandre.lureau@redhat.com,
 Yan Zhao <yan.y.zhao@intel.com>, konrad.wilk@oracle.com,
 yuvalkashtan@gmail.com, dgilbert@redhat.com, eafanasova@gmail.com,
 ismael@linux.com, Paolo Bonzini <pbonzini@redhat.com>, changpeng.liu@intel.com,
 tomassetti.andrea@gmail.com, mpiszczek@ddn.com,
 Cornelia Huck <cohuck@redhat.com>, alex.williamson@redhat.com,
 tina.zhang@intel.com, xiuchun.lu@intel.com,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 05:57:37PM +0100, Stefan Hajnoczi wrote:

> On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:
> 
> Elena A: I CCed you in case you want to review the

Sorry, we should have included Elena already.

> > +VFIO sparse mmap
> > +^^^^^^^^^^^^^^^^
> > +
> > ++------------------+----------------------------------+
> > +| Name             | Value                            |
> > ++==================+==================================+
> > +| id               | VFIO_REGION_INFO_CAP_SPARSE_MMAP |
> > ++------------------+----------------------------------+
> > +| version          | 0x1                              |
> > ++------------------+----------------------------------+
> > +| next             | <next>                           |
> > ++------------------+----------------------------------+
> > +| sparse mmap info | VFIO region info sparse mmap     |
> > ++------------------+----------------------------------+
> > +
> > +This capability is defined when only a subrange of the region supports
> > +direct access by the client via mmap(). The VFIO sparse mmap area is defined in
> > +``<linux/vfio.h>`` (``struct vfio_region_sparse_mmap_area``).
> 
> It's a little early to reference struct vfio_region_sparse_mmap_area
> here because the parent struct vfio_region_info_cap_sparse_mmap is only
> referenced below. I suggest combining the two:
> 
>   The VFIO sparse mmap area is defined in ``<linux/vfio.h>`` (``struct
>   vfio_region_info_cap_sparse_mmap`` and ``struct
>   vfio_region_sparse_mmap_area``).

Good idea.

> > +Region IO FD info format
> > +^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > ++-------------+--------+------+
> > +| Name        | Offset | Size |
> > ++=============+========+======+
> > +| argsz       | 16     | 4    |
> > ++-------------+--------+------+
> > +| flags       | 20     | 4    |
> > ++-------------+--------+------+
> > +| index       | 24     | 4    |
> > ++-------------+--------+------+
> > +| count       | 28     | 4    |
> > ++-------------+--------+------+
> > +| sub-regions | 32     | ...  |
> > ++-------------+--------+------+
> > +
> > +* *argsz* is the size of the region IO FD info structure plus the
> > +  total size of the sub-region array. Thus, each array entry "i" is at offset
> > +  i * ((argsz - 32) / count). Note that currently this is 40 bytes for both IO
> > +  FD types, but this is not to be relied on.
> > +* *flags* must be zero
> > +* *index* is the index of memory region being queried
> > +* *count* is the number of sub-regions in the array
> > +* *sub-regions* is the array of Sub-Region IO FD info structures
> > +
> > +The client must set ``flags`` to zero and specify the region being queried in
> > +the ``index``.
> > +
> > +The client sets the ``argsz`` field to indicate the maximum size of the response
> > +that the server can send, which must be at least the size of the response header
> > +plus space for the sub-region array. If the full response size exceeds ``argsz``,
> > +then the server must respond only with the response header and the Region IO FD
> > +info structure, setting in ``argsz`` the buffer size required to store the full
> > +response. In this case, no file descriptors are passed back.  The client then
> > +retries the operation with a larger receive buffer.
> > +
> > +The reply message will additionally include at least one file descriptor in the
> > +ancillary data. Note that more than one sub-region may share the same file
> > +descriptor.
> 
> How does this interact with the maximum number of file descriptors,
> max_fds? It is possible that there are more sub-regions than max_fds
> allows...

I think this would just be a matter of the client advertising a reasonably large
enough size for max_msg_fds. Do we need to worry about this?

> > +Each sub-region given in the response has one of two possible structures,
> > +depending whether *type* is `VFIO_USER_IO_FD_TYPE_IOEVENTFD` or
> > +`VFIO_USER_IO_FD_TYPE_IOREGIONFD`:
> > +
> > +Sub-Region IO FD info format (ioeventfd)
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > ++-----------+--------+------+
> > +| Name      | Offset | Size |
> > ++===========+========+======+
> > +| offset    | 0      | 8    |
> > ++-----------+--------+------+
> > +| size      | 8      | 8    |
> > ++-----------+--------+------+
> > +| fd_index  | 16     | 4    |
> > ++-----------+--------+------+
> > +| type      | 20     | 4    |
> > ++-----------+--------+------+
> > +| flags     | 24     | 4    |
> > ++-----------+--------+------+
> > +| padding   | 28     | 4    |
> > ++-----------+--------+------+
> > +| datamatch | 32     | 8    |
> > ++-----------+--------+------+
> > +
> > +* *offset* is the offset of the start of the sub-region within the region
> > +  requested ("physical address offset" for the region)
> > +* *size* is the length of the sub-region. This may be zero if the access size is
> > +  not relevant, which may allow for optimizations
> > +* *fd_index* is the index in the ancillary data of the FD to use for ioeventfd
> > +  notification; it may be shared.
> > +* *type* is `VFIO_USER_IO_FD_TYPE_IOEVENTFD`
> > +* *flags* is any of:
> > +  * `KVM_IOEVENTFD_FLAG_DATAMATCH`
> > +  * `KVM_IOEVENTFD_FLAG_PIO`
> 
> The client must not trust the server, so care must be taken to validate
> flags and offsets. Failure to do so would allow the server to hijack I/O
> dispatch to addresses outside its regions (e.g. MMIO vs PIO or an offset
> beyond the end of the region).
> 
> It would help to mention this explicitly in the spec so that client
> implementors take care.

I'll add a note.

> > +  * `KVM_IOREGION_PIO`
> > +  * `KVM_IOREGION_POSTED_WRITES`
> > +* *user_data* is an opaque value passed back to the server via a message on the
> > +  file descriptor
> > +
> > +For further information on the ioregionfd-specific fields, see:
> > +https://lore.kernel.org/kvm/cover.1613828726.git.eafanasova@gmail.com/
> > +
> > +(FIXME: update with final API docs.)
> 
> I suggest postponing the ioregionfd part of the spec until the KVM code
> lands. In general the approach makes sense to me though, so I think it
> will be possible to merge it later with minimal changes.

I think it's useful to have it now, still, at least until we hit 1.0 and can't
make incompatible changes. We've already had several useful review comments from
yourself and others.
 
I agree it shouldn't be in place in any final version, though. (Ideally, we'd
have an implementation as well.)

> > +VFIO IRQ info format
> > +^^^^^^^^^^^^^^^^^^^^
> > +
> > ++-------+--------+---------------------------+
> > +| Name  | Offset | Size                      |
> > ++=======+========+===========================+
> > +| argsz | 16     | 4                         |
> > ++-------+--------+---------------------------+
> > +| flags | 20     | 4                         |
> > ++-------+--------+---------------------------+
> > +|       | +-----+--------------------------+ |
> > +|       | | Bit | Definition               | |
> > +|       | +=====+==========================+ |
> > +|       | | 0   | VFIO_IRQ_INFO_EVENTFD    | |
> > +|       | +-----+--------------------------+ |
> > +|       | | 1   | VFIO_IRQ_INFO_MASKABLE   | |
> > +|       | +-----+--------------------------+ |
> > +|       | | 2   | VFIO_IRQ_INFO_AUTOMASKED | |
> > +|       | +-----+--------------------------+ |
> > +|       | | 3   | VFIO_IRQ_INFO_NORESIZE   | |
> > +|       | +-----+--------------------------+ |
> > ++-------+--------+---------------------------+
> > +| index | 24     | 4                         |
> > ++-------+--------+---------------------------+
> > +| count | 28     | 4                         |
> > ++-------+--------+---------------------------+
> > +
> > +* *argsz* is the size of the VFIO IRQ info structure.
> > +* *flags* defines IRQ attributes:
> > +
> > +  * *VFIO_IRQ_INFO_EVENTFD* indicates the IRQ type can support server eventfd
> > +    signalling.
> > +  * *VFIO_IRQ_INFO_MASKABLE* indicates that the IRQ type supports the MASK and
> > +    UNMASK actions in a VFIO_USER_DEVICE_SET_IRQS message.
> > +  * *VFIO_IRQ_INFO_AUTOMASKED* indicates the IRQ type masks itself after being
> > +    triggered, and the client must send an UNMASK action to receive new
> > +    interrupts.
> > +  * *VFIO_IRQ_INFO_NORESIZE* indicates VFIO_USER_SET_IRQS operations setup
> > +    interrupts as a set, and new sub-indexes cannot be enabled without disabling
> > +    the entire type.
> > +
> > +* index is the index of IRQ type being queried, it is the only field that is
> > +  required to be set in the command message.
> > +* count describes the number of interrupts of the queried type.
> 
> Is count an output-only field since the previous sentence says index is
> the only field required in the command message?
> 
> I find it confusing that the spec shows the input/output structs without
> explicitly documenting that fields are input, output, or input & output.

I agree. I'll take care of this.

https://github.com/nutanix/libvfio-user/issues/486

> > +VFIO IRQ set format
> > +^^^^^^^^^^^^^^^^^^^
> > +
> > ++-------+--------+------------------------------+
> > +| Name  | Offset | Size                         |
> > ++=======+========+==============================+
> > +| argsz | 16     | 4                            |
> > ++-------+--------+------------------------------+
> > +| flags | 20     | 4                            |
> > ++-------+--------+------------------------------+
> > +|       | +-----+-----------------------------+ |
> > +|       | | Bit | Definition                  | |
> > +|       | +=====+=============================+ |
> > +|       | | 0   | VFIO_IRQ_SET_DATA_NONE      | |
> > +|       | +-----+-----------------------------+ |
> > +|       | | 1   | VFIO_IRQ_SET_DATA_BOOL      | |
> > +|       | +-----+-----------------------------+ |
> > +|       | | 2   | VFIO_IRQ_SET_DATA_EVENTFD   | |
> > +|       | +-----+-----------------------------+ |
> > +|       | | 3   | VFIO_IRQ_SET_ACTION_MASK    | |
> > +|       | +-----+-----------------------------+ |
> > +|       | | 4   | VFIO_IRQ_SET_ACTION_UNMASK  | |
> > +|       | +-----+-----------------------------+ |
> > +|       | | 5   | VFIO_IRQ_SET_ACTION_TRIGGER | |
> > +|       | +-----+-----------------------------+ |
> > ++-------+--------+------------------------------+
> > +| index | 24     | 4                            |
> > ++-------+--------+------------------------------+
> > +| start | 28     | 4                            |
> > ++-------+--------+------------------------------+
> > +| count | 32     | 4                            |
> > ++-------+--------+------------------------------+
> > +| data  | 36     | variable                     |
> > ++-------+--------+------------------------------+
> > +
> > +* *argsz* is the size of the VFIO IRQ set structure, including any *data* field.
> > +* *flags* defines the action performed on the interrupt range. The DATA flags
> > +  describe the data field sent in the message; the ACTION flags describe the
> > +  action to be performed. The flags are mutually exclusive for both sets.
> > +
> > +  * *VFIO_IRQ_SET_DATA_NONE* indicates there is no data field in the command.
> > +    The action is performed unconditionally.
> > +  * *VFIO_IRQ_SET_DATA_BOOL* indicates the data field is an array of boolean
> > +    bytes. The action is performed if the corresponding boolean is true.
> > +  * *VFIO_IRQ_SET_DATA_EVENTFD* indicates an array of event file descriptors
> > +    was sent in the message meta-data. These descriptors will be signalled when
> 
> signalled...by the client or by the server?

Either.

> For example, does VFIO_IRQ_SET_ACTION_TRIGGER +
> VFIO_IRQ_SET_DATA_EVENTFD provide an eventfd that the server will signal
> when the device raises the interrupt?

The server can trigger it, but so can the client (for whatever reason) via a
combination of VFIO_IRQ_SET_ACTION_TRIGGER+VFIO_IRQ_SET_DATA_BOOL/NONE.
> 
> On the other hand, VFIO_IRQ_SET_ACTION_MASK + VFIO_IRQ_SET_DATA_EVENTFD
> seems to be the other way around. The server reads from the eventfd to
> respond when the irq is masked.
> 
> > +    the action defined by the action flags occurs. In AF_UNIX sockets, the
> > +    descriptors are sent as SCM_RIGHTS type ancillary data.
> > +    If no file descriptors are provided, this de-assigns the specified
> > +    previously configured interrupts.
> > +  * *VFIO_IRQ_SET_ACTION_MASK* indicates a masking event. It can be used with
> > +    VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to mask an interrupt, or
> > +    with VFIO_IRQ_SET_DATA_EVENTFD to generate an event when the guest masks
> > +    the interrupt.
> > +  * *VFIO_IRQ_SET_ACTION_UNMASK* indicates an unmasking event. It can be used
> > +    with VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to unmask an
> > +    interrupt, or with VFIO_IRQ_SET_DATA_EVENTFD to generate an event when the
> > +    guest unmasks the interrupt.
> > +  * *VFIO_IRQ_SET_ACTION_TRIGGER* indicates a triggering event. It can be used
> > +    with VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to trigger an
> > +    interrupt, or with VFIO_IRQ_SET_DATA_EVENTFD to generate an event when the
> > +    server triggers the interrupt.

I believe (could be wrong) we inherited these semantics (and IMO rather
unfortunate naming) from vfio.

> Maybe the text can be restructured to make this clear.

Yes, I think it probably can, let me take a pass.

> > +VFIO_USER_REGION_READ
> > +---------------------
> > +
> > +Message format
> > +^^^^^^^^^^^^^^
> > +
> > ++--------------+------------------------+
> > +| Name         | Value                  |
> > ++==============+========================+
> > +| Message ID   | <ID>                   |
> > ++--------------+------------------------+
> > +| Command      | 9                      |
> > ++--------------+------------------------+
> > +| Message size | 32 + data size         |
> > ++--------------+------------------------+
> > +| Flags        | Reply bit set in reply |
> > ++--------------+------------------------+
> > +| Error        | 0/errno                |
> > ++--------------+------------------------+
> > +| Read info    | REGION read/write data |
> > ++--------------+------------------------+
> > +
> > +This command message is sent from the client to the server to read from server
> > +memory.  In the command messages, there is no data, and the count is the amount
> > +of data to be read. The reply message must include the data read, and its count
> > +field is the amount of data read.
> 
> There is no data in command messages, but Message size is still 32 +
> data size?

It is not. Spec was unclear here, I've added some text to this and
VFIO_DMA_READ.

> > +VFIO_USER_VM_INTERRUPT
> > +----------------------
> > +
> > +Message format
> > +^^^^^^^^^^^^^^
> > +
> > ++----------------+------------------------+
> > +| Name           | Value                  |
> > ++================+========================+
> > +| Message ID     | <ID>                   |
> > ++----------------+------------------------+
> > +| Command        | 13                     |
> > ++----------------+------------------------+
> > +| Message size   | 20                     |
> > ++----------------+------------------------+
> > +| Flags          | Reply bit set in reply |
> > ++----------------+------------------------+
> > +| Error          | 0/errno                |
> > ++----------------+------------------------+
> > +| Interrupt info | <interrupt>            |
> > ++----------------+------------------------+
> > +
> > +This command message is sent from the server to the client to signal the device
> > +has raised an interrupt.
> 
> Except if the client set up irq eventfds?

Clarified.

> > +Interrupt info format
> > +^^^^^^^^^^^^^^^^^^^^^
> > +
> > ++-----------+--------+------+
> > +| Name      | Offset | Size |
> > ++===========+========+======+
> > +| Sub-index | 16     | 4    |
> > ++-----------+--------+------+
> > +
> > +* *Sub-index* is relative to the IRQ index, e.g., the vector number used in PCI
> > +  MSI/X type interrupts.
> 
> Hmm...this is weird. The server tells the client to raise an MSI-X
> interrupt but does not include the MSI message that resides in the MSI-X
> table BAR device region? Or should MSI-X interrupts be delivered to the
> client via VFIO_USER_DMA_WRITE instead?
> 
> (Basically it's not clear to me how MSI-X interrupts would work with
> vfio-user. Reading how they work in kernel VFIO might let me infer it,
> but it's probably worth explaining this clearly in the spec.)

It doesn't. We don't have an implementation, and the qemu patches don't get this
right either - it treats the sub-index as the IRQ index AKA IRQ type.

I'd be inclined to just remove this for now, until we have an implementation.
Thoughts?

> > +VFIO_USER_DEVICE_RESET
> > +----------------------
> > +
> > +Message format
> > +^^^^^^^^^^^^^^
> > +
> > ++--------------+------------------------+
> > +| Name         | Value                  |
> > ++==============+========================+
> > +| Message ID   | <ID>                   |
> > ++--------------+------------------------+
> > +| Command      | 14                     |
> > ++--------------+------------------------+
> > +| Message size | 16                     |
> > ++--------------+------------------------+
> > +| Flags        | Reply bit set in reply |
> > ++--------------+------------------------+
> > +| Error        | 0/errno                |
> > ++--------------+------------------------+
> > +
> > +This command message is sent from the client to the server to reset the device.
> 
> Any requirements for how long VFIO_USER_DEVICE_RESET takes to complete?
> In some cases a reset involves the server communicating with other
> systems or components and this can take an unbounded amount of time.
> Therefore this message could hang. For example, if a vfio-user NVMe
> device was accessing data on a hung NFS export and there were I/O
> requests in flight that need to be aborted.

I'm not sure this is something we could put in the generic spec. Perhaps a
caveat?

> > +VFIO_USER_DIRTY_PAGES
> > +---------------------
> > +
> > +Message format
> > +^^^^^^^^^^^^^^
> > +
> > ++--------------------+------------------------+
> > +| Name               | Value                  |
> > ++====================+========================+
> > +| Message ID         | <ID>                   |
> > ++--------------------+------------------------+
> > +| Command            | 15                     |
> > ++--------------------+------------------------+
> > +| Message size       | 16                     |
> > ++--------------------+------------------------+
> > +| Flags              | Reply bit set in reply |
> > ++--------------------+------------------------+
> > +| Error              | 0/errno                |
> > ++--------------------+------------------------+
> > +| VFIO Dirty bitmap  | <dirty bitmap>         |
> > ++--------------------+------------------------+
> > +
> > +This command is analogous to VFIO_IOMMU_DIRTY_PAGES. It is sent by the client
> > +to the server in order to control logging of dirty pages, usually during a live
> > +migration. The VFIO dirty bitmap structure is defined in ``<linux/vfio.h>``
> > +(``struct vfio_iommu_type1_dirty_bitmap``).
> 
> Do all vfio-user servers need to implement VFIO_USER_DIRTY_PAGES? It's
> common for some device implementations to omit migration support because
> it increases implementation complexity and is not needed in certain use
> cases.

Added a note that this is optional.

thanks
john

