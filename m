Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D464A372B65
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:53:45 +0200 (CEST)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvUe-0000xs-Fn
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldvTc-0000Wp-0x
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldvTV-0004uh-Ij
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620136352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rn6Domj+U2RfG2ERDASTmZ5phxOZ0dFLtFNxgSO7Q0I=;
 b=VcvmzPDqpV6WPypzjWnSXp8pe6ViXAW3Vfayp4Mtva1GQoLp9amkVtDKMQ0+sscC+rTW7+
 BCHWvgZuSxypXI8RyrF1XOVrPw7fhpoZpNNmuKDA8jrfYi5+M6eEncutHxG7TcDzCQ4bQ6
 3+HLnmNXwKXqx1MRaODkf4lPgoXDcNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-Ks30AnjZPreKDh9M6i1XSQ-1; Tue, 04 May 2021 09:52:30 -0400
X-MC-Unique: Ks30AnjZPreKDh9M6i1XSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE854879537;
 Tue,  4 May 2021 13:52:27 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADC8D59451;
 Tue,  4 May 2021 13:51:46 +0000 (UTC)
Date: Tue, 4 May 2021 14:51:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20210414114122.236193-1-thanos.makatos@nutanix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5zIxa2+XkhTGDTrp"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 konrad.wilk@oracle.com, yuvalkashtan@gmail.com, dgilbert@redhat.com,
 ismael@linux.com, changpeng.liu@intel.com, tomassetti.andrea@gmail.com,
 mpiszczek@ddn.com, Cornelia Huck <cohuck@redhat.com>,
 alex.williamson@redhat.com, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 xiuchun.lu@intel.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5zIxa2+XkhTGDTrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:
> This patch introduces the vfio-user protocol specification (formerly
> known as VFIO-over-socket), which is designed to allow devices to be
> emulated outside QEMU, in a separate process. vfio-user reuses the
> existing VFIO defines, structs and concepts.
>=20
> It has been earlier discussed as an RFC in:
> "RFC: use VFIO over a UNIX domain socket to implement device offloading"
>=20
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Thanos Makatos <thanos.makatos@nutanix.com>
> Signed-off-by: John Levon <john.levon@nutanix.com>
>=20
> ---
>=20
> Changed since v1:
>   * fix coding style issues
>   * update MAINTAINERS for VFIO-over-socket
>   * add vfio-over-socket to ToC
>=20
> Changed since v2:
>   * fix whitespace
>=20
> Changed since v3:
>   * rename protocol to vfio-user
>   * add table of contents
>   * fix Unicode problems
>   * fix typos and various reStructuredText issues
>   * various stylistic improvements
>   * add backend program conventions
>   * rewrite part of intro, drop QEMU-specific stuff
>   * drop QEMU-specific paragraph about implementation
>   * explain that passing of FDs isn't necessary
>   * minor improvements in the VFIO section
>   * various text substitutions for the sake of consistency
>   * drop paragraph about client and server, already explained in
>   * intro
>   * drop device ID
>   * drop type from version
>   * elaborate on request concurrency
>   * convert some inessential paragraphs into notes
>   * explain why some existing VFIO defines cannot be reused
>   * explain how to make changes to the protocol
>   * improve text of DMA map
>   * reword comment about existing VFIO commands
>   * add reference to Version section
>   * reset device on disconnection
>   * reword live migration section
>   * replace sys/vfio.h with linux/vfio.h
>   * drop reference to iovec
>   * use argz the same way it is used in VFIO
>   * add type field in header for clarity
>=20
> Changed since v4:
>   * introduce support for live migration as defined in
>   * include/uapi/linux/vfio.h
>   * introduce 'max_fds' and 'migration' capabilities:
>   * remove 'index' from VFIO_USER_DEVICE_GET_IRQ_INFO
>   * fix minor typos and reworded some text for clarity
>=20
> Changed since v5:
>   * fix minor typos
>   * separate VFIO_USER_DMA_MAP and VFIO_USER_DMA_UNMAP
>   * clarify meaning of VFIO bitmap size field
>   * move version major/minor outside JSON
>   * client proposes version first
>   * make Errno optional in message header
>   * clarification about message ID uniqueness
>   * clarify that server->client request can appear in between
>     client->server request/reply
>=20
> Changed since v6:
>   * put JSON strings in double quotes
>   * clarify reply behavior on error
>   * introduce max message size capability
>   * clarify semantics when failing to map multiple DMA regions in a
>     single command
>=20
> Changed since v7:
>   * client proposes version instead of server
>   * support ioeventfd and ioregionfd for unmapped regions
>   * reword struct vfio_bitmap for clarity
>   * clarify use of argsz in VFIO device info
>   * allow individual IRQs to be disabled
> ---
>  MAINTAINERS              |    7 +
>  docs/devel/index.rst     |    1 +
>  docs/devel/vfio-user.rst | 1854 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 1862 insertions(+)
>  create mode 100644 docs/devel/vfio-user.rst
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c5..bd1194002b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1849,6 +1849,13 @@ F: hw/vfio/ap.c
>  F: docs/system/s390x/vfio-ap.rst
>  L: qemu-s390x@nongnu.org
> =20
> +vfio-user
> +M: John G Johnson <john.g.johnson@oracle.com>
> +M: Thanos Makatos <thanos.makatos@nutanix.com>
> +M: John Levon <john.levon@nutanix.com>
> +S: Supported
> +F: docs/devel/vfio-user.rst
> +
>  vhost
>  M: Michael S. Tsirkin <mst@redhat.com>
>  S: Supported
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 6cf7e2d233..7d1ea63e02 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -42,3 +42,4 @@ Contents:
>     qom
>     block-coroutine-wrapper
>     multi-process
> +   vfio-user
> diff --git a/docs/devel/vfio-user.rst b/docs/devel/vfio-user.rst
> new file mode 100644
> index 0000000000..b3498eec02
> --- /dev/null
> +++ b/docs/devel/vfio-user.rst
> @@ -0,0 +1,1854 @@
> +.. include:: <isonum.txt>
> +
> +********************************
> +vfio-user Protocol Specification
> +********************************
> +
> +------------
> +Version_ 0.1
> +------------
> +
> +.. contents:: Table of Contents
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +vfio-user is a protocol that allows a device to be emulated in a separat=
e
> +process outside of a Virtual Machine Monitor (VMM). vfio-user devices co=
nsist
> +of a generic VFIO device type, living inside the VMM, which we call the =
client,
> +and the core device implementation, living outside the VMM, which we cal=
l the
> +server.
> +
> +The `Linux VFIO ioctl interface <https://www.kernel.org/doc/html/latest/=
driver-api/vfio.html>`_
> +been chosen as the base for this protocol for the following reasons:
> +
> +1) It is a mature and stable API, backed by an extensively used framewor=
k.
> +2) The existing VFIO client implementation in QEMU (qemu/hw/vfio/) can b=
e
> +   largely reused.
> +
> +.. Note::
> +   In a proof of concept implementation it has been demonstrated that us=
ing VFIO
> +   over a UNIX domain socket is a viable option. vfio-user is designed w=
ith
> +   QEMU in mind, however it could be used by other client applications. =
The
> +   vfio-user protocol does not require that QEMU's VFIO client  implemen=
tation
> +   is used in QEMU.
> +
> +None of the VFIO kernel modules are required for supporting the protocol=
,
> +neither in the client nor the server, only the source header files are u=
sed.
> +
> +The main idea is to allow a virtual device to function in a separate pro=
cess in
> +the same host over a UNIX domain socket. A UNIX domain socket (AF_UNIX) =
is
> +chosen because file descriptors can be trivially sent over it, which in =
turn
> +allows:
> +
> +* Sharing of client memory for DMA with the server.
> +* Sharing of server memory with the client for fast MMIO.
> +* Efficient sharing of eventfd's for triggering interrupts.
> +
> +Other socket types could be used which allow the server to run in a sepa=
rate
> +guest in the same host (AF_VSOCK) or remotely (AF_INET). Theoretically t=
he
> +underlying transport does not necessarily have to be a socket, however w=
e do
> +not examine such alternatives. In this protocol version we focus on usin=
g a
> +UNIX domain socket and introduce basic support for the other two types o=
f
> +sockets without considering performance implications.
> +
> +While passing of file descriptors is desirable for performance reasons, =
it is
> +not necessary neither for the client nor for the server to support it in=
 order

Double negative. "not" can be removed.

> +to implement the protocol. There is always an in-band, message-passing f=
all
> +back mechanism.
> +
> +VFIO
> +=3D=3D=3D=3D
> +VFIO is a framework that allows a physical device to be securely passed =
through
> +to a user space process; the device-specific kernel driver does not driv=
e the
> +device at all.  Typically, the user space process is a VMM and the devic=
e is
> +passed through to it in order to achieve high performance. VFIO provides=
 an API
> +and the required functionality in the kernel. QEMU has adopted VFIO to a=
llow a
> +guest to directly access physical devices, instead of emulating them in
> +software.
> +
> +vfio-user reuses the core VFIO concepts defined in its API, but implemen=
ts them
> +as messages to be sent over a socket. It does not change the kernel-base=
d VFIO
> +in any way, in fact none of the VFIO kernel modules need to be loaded to=
 use
> +vfio-user. It is also possible for the client to concurrently use the cu=
rrent
> +kernel-based VFIO for one device, and vfio-user for another device.
> +
> +VFIO Device Model
> +-----------------
> +A device under VFIO presents a standard interface to the user process. M=
any of
> +the VFIO operations in the existing interface use the ioctl() system cal=
l, and
> +references to the existing interface are called the ioctl() implementati=
on in
> +this document.
> +
> +The following sections describe the set of messages that implement the V=
FIO
> +interface over a socket. In many cases, the messages are direct translat=
ions of
> +data structures used in the ioctl() implementation. Messages derived fro=
m
> +ioctl()s will have a name derived from the ioctl() command name.  E.g., =
the
> +VFIO_GET_INFO ioctl() command becomes a VFIO_USER_GET_INFO message.  The
> +purpose of this reuse is to share as much code as feasible with the ioct=
l()
> +implementation.
> +
> +Connection Initiation
> +^^^^^^^^^^^^^^^^^^^^^
> +After the client connects to the server, the initial client message is
> +VFIO_USER_VERSION to propose a protocol version and set of capabilities =
to
> +apply to the session. The server replies with a compatible version and s=
et of
> +capabilities it supports, or closes the connection if it cannot support =
the
> +advertised version.
> +
> +DMA Memory Configuration
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +The client uses VFIO_USER_DMA_MAP and VFIO_USER_DMA_UNMAP messages to in=
form
> +the server of the valid DMA ranges that the server can access on behalf
> +of a device. DMA memory may be accessed by the server via VFIO_USER_DMA_=
READ
> +and VFIO_USER_DMA_WRITE messages over the socket.
> +
> +An optimization for server access to client memory is for the client to =
provide
> +file descriptors the server can mmap() to directly access client memory.=
 Note
> +that mmap() privileges cannot be revoked by the client, therefore file
> +descriptors should only be exported in environments where the client tru=
sts the
> +server not to corrupt guest memory.
> +
> +Device Information
> +^^^^^^^^^^^^^^^^^^
> +The client uses a VFIO_USER_DEVICE_GET_INFO message to query the server =
for
> +information about the device. This information includes:
> +
> +* The device type and whether it supports reset (``VFIO_DEVICE_FLAGS_``)=
,
> +* the number of device regions, and
> +* the device presents to the client the number of interrupt types the de=
vice
> +  supports.
> +
> +Region Information
> +^^^^^^^^^^^^^^^^^^
> +The client uses VFIO_USER_DEVICE_GET_REGION_INFO messages to query the s=
erver
> +for information about the device's memory regions. This information desc=
ribes:
> +
> +* Read and write permissions, whether it can be memory mapped, and wheth=
er it
> +  supports additional capabilities (``VFIO_REGION_INFO_CAP_``).
> +* Region index, size, and offset.
> +
> +When a region can be mapped by the client, the server provides a file
> +descriptor which the client can mmap(). The server is responsible for po=
lling
> +for client updates to memory mapped regions.
> +
> +Region Capabilities
> +"""""""""""""""""""
> +Some regions have additional capabilities that cannot be described adequ=
ately
> +by the region info data structure. These capabilities are returned in th=
e
> +region info reply in a list similar to PCI capabilities in a PCI device'=
s
> +configuration space.
> +
> +Sparse Regions
> +""""""""""""""
> +A region can be memory-mappable in whole or in part. When only a subset =
of a
> +region can be mapped by the client, a VFIO_REGION_INFO_CAP_SPARSE_MMAP
> +capability is included in the region info reply. This capability describ=
es
> +which portions can be mapped by the client.
> +
> +.. Note::
> +   For example, in a virtual NVMe controller, sparse regions can be used=
 so
> +   that accesses to the NVMe registers (found in the beginning of BAR0) =
are
> +   trapped (an infrequent event), while allowing direct access to the do=
orbells
> +   (an extremely frequent event as every I/O submission requires a write=
 to
> +   BAR0), found right after the NVMe registers in BAR0.
> +
> +Device-Specific Regions
> +"""""""""""""""""""""""
> +
> +A device can define regions additional to the standard ones (e.g. PCI in=
dexes
> +0-8). This is achieved by including a VFIO_REGION_INFO_CAP_TYPE capabili=
ty
> +in the region info reply of a device-specific region. Such regions are r=
eflected
> +in ``struct vfio_device_info.num_regions``. Thus, for PCI devices this v=
alue can
> +be equal to, or higher than, VFIO_PCI_NUM_REGIONS.
> +
> +Region I/O via file descriptors
> +-------------------------------
> +
> +For unmapped regions, region I/O from the client is done via
> +VFIO_USER_REGION_READ/WRITE.  As an optimization, ioeventfds or ioregion=
fds may
> +be configured for sub-regions of some regions. A client may request info=
rmation
> +on these sub-regions via VFIO_USER_DEVICE_GET_REGION_IO_FDS; by configur=
ing the
> +returned file descriptors as ioeventfds or ioregionfds, the server can b=
e
> +directly notified of I/O (for example, by KVM) without taking a trip thr=
ough the
> +client.
> +
> +Interrupts
> +^^^^^^^^^^
> +The client uses VFIO_USER_DEVICE_GET_IRQ_INFO messages to query the serv=
er for
> +the device's interrupt types. The interrupt types are specific to the bu=
s the
> +device is attached to, and the client is expected to know the capabiliti=
es of
> +each interrupt type. The server can signal an interrupt either with
> +VFIO_USER_VM_INTERRUPT messages over the socket, or can directly inject
> +interrupts into the guest via an event file descriptor. The client confi=
gures
> +how the server signals an interrupt with VFIO_USER_SET_IRQS messages.
> +
> +Device Read and Write
> +^^^^^^^^^^^^^^^^^^^^^
> +When the guest executes load or store operations to device memory, the c=
lient

<linux/vfio.h> calls it "device regions", not "device memory".
s/device memory/unmapped device regions/?

> +forwards these operations to the server with VFIO_USER_REGION_READ or
> +VFIO_USER_REGION_WRITE messages. The server will reply with data from th=
e
> +device on read operations or an acknowledgement on write operations.
> +
> +DMA
> +^^^
> +When a device performs DMA accesses to guest memory, the server will for=
ward
> +them to the client with VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE messa=
ges.
> +These messages can only be used to access guest memory the client has
> +configured into the server.
> +
> +Protocol Specification
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +To distinguish from the base VFIO symbols, all vfio-user symbols are pre=
fixed
> +with vfio_user or VFIO_USER. In revision 0.1, all data is in the little-=
endian
> +format, although this may be relaxed in future revision in cases where t=
he
> +client and server are both big-endian. The messages are formatted for se=
amless
> +reuse of the native VFIO structs.
> +
> +Socket
> +------
> +
> +A server can serve:
> +
> +1) one or more clients, and/or
> +2) one or more virtual devices, belonging to one or more clients.
> +
> +The current protocol specification requires a dedicated socket per
> +client/server connection. It is a server-side implementation detail whet=
her a
> +single server handles multiple virtual devices from the same or multiple
> +clients. The location of the socket is implementation-specific. Multiple=
xing
> +clients, devices, and servers over the same socket is not supported in t=
his
> +version of the protocol.
> +
> +Authentication
> +--------------
> +For AF_UNIX, we rely on OS mandatory access controls on the socket files=
,
> +therefore it is up to the management layer to set up the socket as requi=
red.
> +Socket types than span guests or hosts will require a proper authenticat=
ion
> +mechanism. Defining that mechanism is deferred to a future version of th=
e
> +protocol.
> +
> +Command Concurrency
> +-------------------
> +A client may pipeline multiple commands without waiting for previous com=
mand
> +replies.  The server will process commands in the order they are receive=
d.  A
> +consequence of this is if a client issues a command with the *No_reply* =
bit,
> +then subseqently issues a command without *No_reply*, the older command =
will
> +have been processed before the reply to the younger command is sent by t=
he
> +server.  The client must be aware of the device's capability to process
> +concurrent commands if pipelining is used.  For example, pipelining allo=
ws
> +multiple client threads to concurently access device memory; the client =
must
> +ensure these acceses obey device semantics.

s/acceses/accesses/

> +
> +An example is a frame buffer device, where the device may allow concurre=
nt
> +access to different areas of video memory, but may have indeterminate be=
havior
> +if concurrent acceses are performed to command or status registers.
> +
> +Note that unrelated messages sent from the sevrer to the client can appe=
ar in

s/sevrer/server/

> +between a client to server request/reply and vice versa.
> +
> +Socket Disconnection Behavior
> +-----------------------------
> +The server and the client can disconnect from each other, either intenti=
onally
> +or unexpectedly. Both the client and the server need to know how to hand=
le such
> +events.
> +
> +Server Disconnection
> +^^^^^^^^^^^^^^^^^^^^
> +A server disconnecting from the client may indicate that:
> +
> +1) A virtual device has been restarted, either intentionally (e.g. becau=
se of a
> +   device update) or unintentionally (e.g. because of a crash).
> +2) A virtual device has been shut down with no intention to be restarted=
.
> +
> +It is impossible for the client to know whether or not a failure is
> +intermittent or innocuous and should be retried, therefore the client sh=
ould
> +reset the VFIO device when it detects the socket has been disconnected.
> +Error recovery will be driven by the guest's device error handling
> +behavior.
> +
> +Client Disconnection
> +^^^^^^^^^^^^^^^^^^^^
> +The client disconnecting from the server primarily means that the client
> +has exited. Currently, this means that the guest is shut down so the dev=
ice is
> +no longer needed therefore the server can automatically exit. However, t=
here
> +can be cases where a client disconnection should not result in a server =
exit:
> +
> +1) A single server serving multiple clients.
> +2) A multi-process QEMU upgrading itself step by step, which is not yet
> +   implemented.
> +
> +Therefore in order for the protocol to be forward compatible the server =
should
> +take no action when the client disconnects. If anything happens to the c=
lient
> +the control stack will know about it and can clean up resources
> +accordingly.

Also, hot unplug?

Does anything need to be said about mmaps and file descriptors on
disconnected? I guess they need to be cleaned up and are not retained
for future reconnection?

> +
> +Request Retry and Response Timeout
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +A failed command is a command that has been successfully sent and has be=
en
> +responded to with an error code. Failure to send the command in the firs=
t place
> +(e.g. because the socket is disconnected) is a different type of error e=
xamined
> +earlier in the disconnect section.
> +
> +.. Note::
> +   QEMU's VFIO retries certain operations if they fail. While this makes=
 sense
> +   for real HW, we don't know for sure whether it makes sense for virtua=
l
> +   devices.
> +
> +Defining a retry and timeout scheme is deferred to a future version of t=
he
> +protocol.
> +
> +.. _Commands:
> +
> +Commands
> +--------
> +The following table lists the VFIO message command IDs, and whether the
> +message command is sent from the client or the server.
> +
> ++------------------------------------+---------+-------------------+
> +| Name                               | Command | Request Direction |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| VFIO_USER_VERSION                  | 1       | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DMA_MAP                  | 2       | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DMA_UNMAP                | 3       | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_GET_INFO          | 4       | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_GET_REGION_INFO   | 5       | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_GET_REGION_IO_FDS | 6       | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_GET_IRQ_INFO      | 7       | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_SET_IRQS          | 8       | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_REGION_READ              | 9       | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_REGION_WRITE             | 10      | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DMA_READ                 | 11      | server -> client  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DMA_WRITE                | 12      | server -> client  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_VM_INTERRUPT             | 13      | server -> client  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_RESET             | 14      | client -> server  |
> ++------------------------------------+---------+-------------------+
> +| VFIO_USER_DIRTY_PAGES              | 15      | client -> server  |
> ++------------------------------------+---------+-------------------+
> +
> +
> +.. Note:: Some VFIO defines cannot be reused since their values are
> +   architecture-specific (e.g. VFIO_IOMMU_MAP_DMA).

Are there rules for avoiding deadlock between client->server and
server->client messages? For example, the client sends
VFIO_USER_REGION_WRITE and the server sends VFIO_USER_VM_INTERRUPT
before replying to the write message.

Multi-threaded clients and servers could end up deadlocking if messages
are processed while polling threads handle other device activity (e.g.
I/O requests that cause DMA messages).

Pipelining has the nice effect that the oldest message must complete
before the next pipelined message starts. It imposes a maximum issue
depth of 1. Still, it seems like it would be relatively easy to hit
re-entrancy or deadlock issues since both the client and the server can
initiate messages and may need to wait for a response.

> +
> +Header
> +------
> +All messages, both command messages and reply messages, are preceded by =
a
> +header that contains basic information about the message. The header is
> +followed by message-specific data described in the sections below.
> +
> ++----------------+--------+-------------+
> +| Name           | Offset | Size        |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID     | 0      | 2           |
> ++----------------+--------+-------------+
> +| Command        | 2      | 2           |
> ++----------------+--------+-------------+
> +| Message size   | 4      | 4           |
> ++----------------+--------+-------------+
> +| Flags          | 8      | 4           |
> ++----------------+--------+-------------+
> +|                | +-----+------------+ |
> +|                | | Bit | Definition | |
> +|                | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
+ |
> +|                | | 0-3 | Type       | |
> +|                | +-----+------------+ |
> +|                | | 4   | No_reply   | |
> +|                | +-----+------------+ |
> +|                | | 5   | Error      | |
> +|                | +-----+------------+ |
> ++----------------+--------+-------------+
> +| Error          | 12     | 4           |
> ++----------------+--------+-------------+
> +| <message data> | 16     | variable    |
> ++----------------+--------+-------------+
> +
> +* *Message ID* identifies the message, and is echoed in the command's re=
ply
> +  message. Message IDs belong entirely to the sender, can be re-used (ev=
en
> +  concurrently) and the receiver must not make any assumptions about the=
ir
> +  uniqueness.
> +* *Command* specifies the command to be executed, listed in Commands_.
> +* *Message size* contains the size of the entire message, including the =
header.
> +* *Flags* contains attributes of the message:
> +
> +  * The *Type* bits indicate the message type.
> +
> +    *  *Command* (value 0x0) indicates a command message.
> +    *  *Reply* (value 0x1) indicates a reply message acknowledging a pre=
vious
> +       command with the same message ID.
> +  * *No_reply* in a command message indicates that no reply is needed fo=
r this command.
> +    This is commonly used when multiple commands are sent, and only the =
last needs
> +    acknowledgement.
> +  * *Error* in a reply message indicates the command being acknowledged =
had
> +    an error. In this case, the *Error* field will be valid.
> +
> +* *Error* in a reply message is an optional UNIX errno value. It may be =
zero
> +  even if the Error bit is set in Flags. It is reserved in a command mes=
sage.
> +
> +Each command message in Commands_ must be replied to with a reply messag=
e, unless the
> +message sets the *No_Reply* bit.  The reply consists of the header with =
the *Reply*
> +bit set, plus any additional data.
> +
> +If an error occurs, the reply message must only include the reply header=
.
> +
> +VFIO_USER_VERSION
> +-----------------
> +
> +This is the initial message sent by the client after the socket connecti=
on is
> +established:
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+-------------------------------------------+
> +| Name         | Value                                     |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                                      |
> ++--------------+-------------------------------------------+
> +| Command      | 1                                         |
> ++--------------+-------------------------------------------+
> +| Message size | 16 + version header + version data length |
> ++--------------+-------------------------------------------+
> +| Flags        | Reply bit set in reply                    |
> ++--------------+-------------------------------------------+
> +| Error        | 0/errno                                   |
> ++--------------+-------------------------------------------+
> +| Version      | version header                            |
> ++--------------+-------------------------------------------+
> +
> +Version Header Format
> +^^^^^^^^^^^^^^^^^^^^^
> +
> ++---------------+--------+----------------------------------------------=
--+
> +| Name          | Offset | Size                                         =
  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| version major | 16     | 2                                            =
  |
> ++---------------+--------+----------------------------------------------=
--+
> +| version minor | 18     | 2                                            =
  |
> ++---------------+--------+----------------------------------------------=
--+
> +| version data  | 22     | variable (including terminating NUL          =
  |
> +|               |        | character). Optional.                        =
  |
> ++---------------+--------+----------------------------------------------=
--+
> +
> +Version Data Format
> +^^^^^^^^^^^^^^^^^^^
> +
> +The version data is an optional JSON byte array with the following forma=
t:

RFC 7159 The JavaScript Object Notation section 8.1. Character Encoding
says:

  JSON text SHALL be encoded in UTF-8, UTF-16, or UTF-32.

Please indicate the character encoding. I guess it is always UTF-8?

> +
> ++--------------------+------------------+-------------------------------=
----+
> +| Name               | Type             | Description                   =
    |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+
> +| ``"capabilities"`` | collection of    | Contains common capabilities t=
hat |
> +|                    | name/value pairs | the sender supports. Optional.=
    |
> ++--------------------+------------------+-------------------------------=
----+
> +
> +Capabilities:
> +
> ++--------------------+------------------+-------------------------------=
------+
> +| Name               | Type             | Description                   =
      |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+
> +| ``"max_fds"``      | number           | Maximum number of file descrip=
tors  |
> +|                    |                  | the can be received by the sen=
der.  |
> +|                    |                  | Optional. If not specified the=
n the |
> +|                    |                  | receiver must assume          =
      |
> +|                    |                  | ``"max_fds"=3D1``.            =
        |

Maximum per message? Please clarify and consider renaming it to
max_msg_fds (it's also more consistent with max_msg_size).

> ++--------------------+------------------+-------------------------------=
------+
> +| ``"max_msg_size"`` | number           | Maximum message size in bytes =
that  |
> +|                    |                  | the receiver can handle, inclu=
ding  |
> +|                    |                  | the header. Optional. If not  =
      |
> +|                    |                  | specified then the receiver mu=
st    |
> +|                    |                  | assume ``"max_msg_size"=3D4096=
``.     |
> ++--------------------+------------------+-------------------------------=
------+
> +| ``"migration"``    | collection of    | Migration capability parameter=
s. If |
> +|                    | name/value pairs | missing then migration is not =
      |
> +|                    |                  | supported by the sender.      =
      |
> ++--------------------+------------------+-------------------------------=
------+
> +
> +The migration capability contains the following name/value pairs:
> +
> ++--------------+--------+-----------------------------------------------=
+
> +| Name         | Type   | Description                                   =
|
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| ``"pgsize"`` | number | Page size of dirty pages bitmap. The smallest =
|
> +|              |        | between the client and the server is used.    =
|
> ++--------------+--------+-----------------------------------------------=
+

"in bytes"?

> +
> +
> +.. _Version:
> +
> +Versioning and Feature Support
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +Upon establishing a connection, the client must send a VFIO_USER_VERSION=
 message
> +proposing a protocol version and a set of capabilities. The server compa=
res
> +these with the versions and capabilities it supports and sends a
> +VFIO_USER_VERSION reply according to the following rules.
> +
> +* The major version in the reply must be the same as proposed. If the cl=
ient
> +  does not support the proposed major, it closes the connection.
> +* The minor version in the reply must be equal to or less than the minor
> +  version proposed.
> +* The capability list must be a subset of those proposed. If the server
> +  requires a capability the client did not include, it closes the connec=
tion.

Does the server echo back all capabilities it has accepted so the client
can still close the connection if it sees the server didn't accept a
capability?

> +
> +The protocol major version will only change when incompatible protocol c=
hanges
> +are made, such as changing the message format. The minor version may cha=
nge
> +when compatible changes are made, such as adding new messages or capabil=
ities,
> +Both the client and server must support all minor versions less than the
> +maximum minor version it supports. E.g., an implementation that supports
> +version 1.3 must also support 1.0 through 1.2.
> +
> +When making a change to this specification, the protocol version number =
must
> +be included in the form "added in version X.Y"
> +
> +
> +VFIO_USER_DMA_MAP
> +-----------------
> +
> +Message Format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
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
> +This command message is sent by the client to the server to inform it of=
 the
> +memory regions the server can access. It must be sent before the server =
can
> +perform any DMA to the client. It is normally sent directly after the ve=
rsion
> +handshake is completed, but may also occur when memory is added to the c=
lient,
> +or if the client uses a vIOMMU. If the client does not expect the server=
 to
> +perform DMA then it does not need to send to the server VFIO_USER_DMA_MA=
P
> +commands. If the server does not need to perform DMA then it can ignore =
such
> +commands but it must still reply to them. The table is an array of the
> +following structure:
> +
> +Table entry format
> +^^^^^^^^^^^^^^^^^^
> +
> ++-------------+--------+-------------+
> +| Name        | Offset | Size        |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
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
> +|             | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |
> +|             | | 0   | Mappable   | |
> +|             | +-----+------------+ |
> ++-------------+--------+-------------+
> +
> +* *Address* is the base DMA address of the region.
> +* *Size* is the size of the region.

"in bytes"?

> +* *Offset* is the file offset of the region with respect to the associat=
ed file
> +  descriptor.
> +* *Protections* are the region's protection attributes as encoded in
> +  ``<sys/mman.h>``.

Please be more specific. Does it only include PROT_READ and PROT_WRITE?
What about PROT_EXEC?

> +* *Flags* contains the following region attributes:
> +
> +  * *Mappable* indicates that the region can be mapped via the mmap() sy=
stem
> +    call using the file descriptor provided in the message meta-data.
> +
> +This structure is 32 bytes in size, so the message size is:
> +16 + (# of table entries * 32).
> +
> +If a DMA region being added can be directly mapped by the server, an arr=
ay of
> +file descriptors must be sent as part of the message meta-data. Each map=
pable
> +region entry must have a corresponding file descriptor. On AF_UNIX socke=
ts, the
> +file descriptors must be passed as SCM_RIGHTS type ancillary data. Other=
wise,
> +if a DMA region cannot be directly mapped by the server, it can be acces=
sed by
> +the server using VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE messages, ex=
plained
> +in `Read and Write Operations`_. A command to map over an existing regio=
n must
> +be failed by the server with ``EEXIST`` set in error field in the reply.

Does this mean a vIOMMU update, like a protections bits change requires
an unmap command followed by a map command? That is not an atomic
operation but hopefully guests don't try to update a vIOMMU mapping
while accessing it.

By the way, this DMA mapping design is the eager mapping approach.
Another approach is the lazy mapping approach where the server requests
translations as necessary. The advantage is that the client does not
have to send each mapping to the server. In the case of
VFIO_USER_DMA_READ/WRITE no mappings need to be sent at all. Only mmaps
need mapping messages.

> +Adding multiple DMA regions can partially fail. The response does not in=
dicate
> +which regions were added and which were not, therefore it is a client
> +implementation detail how to recover from the failure.
> +
> +.. Note::
> +   The server can optionally remove succesfully added DMA regions making=
 this

s/succesfully/successfully/

> +   operation atomic.
> +   The client can recover by attempting to unmap one by one all the DMA =
regions
> +   in the VFIO_USER_DMA_MAP command, ignoring failures for regions that =
do not
> +   exist.
> +
> +VFIO_USER_DMA_UNMAP
> +-------------------
> +
> +Message Format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
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
> +This command message is sent by the client to the server to inform it th=
at a
> +DMA region, previously made available via a VFIO_USER_DMA_MAP command me=
ssage,
> +is no longer available for DMA. It typically occurs when memory is subtr=
acted
> +from the client or if the client uses a vIOMMU. If the client does not e=
xpect
> +the server to perform DMA then it does not need to send to the server
> +VFIO_USER_DMA_UNMAP commands. If the server does not need to perform DMA=
 then
> +it can ignore such commands but it must still reply to them. The table i=
s an

I'm a little confused by the last two sentences about not sending or
ignoring VFIO_USER_DMA_UNMAP. Does it mean that VFIO_USER_DMA_MAP does
not need to be sent either when the device is known never to need DMA?

> +array of the following structure:
> +
> +Table entry format
> +^^^^^^^^^^^^^^^^^^
> +
> ++--------------+--------+---------------------------------------+
> +| Name         | Offset | Size                                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
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
> +|              | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+ |
> +|              | | 0   | VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP | |
> +|              | +-----+--------------------------------------+ |
> ++--------------+--------+---------------------------------------+
> +| VFIO Bitmaps | 32     | variable                              |
> ++--------------+--------+---------------------------------------+
> +
> +* *Address* is the base DMA address of the region.
> +* *Size* is the size of the region.
> +* *Offset* is the file offset of the region with respect to the associat=
ed file
> +  descriptor.
> +* *Protections* are the region's protection attributes as encoded in
> +  ``<sys/mman.h>``.

Why are offset and protections required for the unmap command?

> +* *Flags* contains the following region attributes:
> +
> +  * *VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP* indicates that a dirty page b=
itmap
> +    must be populated before unmapping the DMA region. The client must p=
rovide
> +    a ``struct vfio_bitmap`` in the VFIO bitmaps field for each region, =
with
> +    the ``vfio_bitmap.pgsize`` and ``vfio_bitmap.size`` fields initializ=
ed.
> +
> +* *VFIO Bitmaps* contains one ``struct vfio_bitmap`` per region (explain=
ed
> +  below) if ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags.

I'm confused, it's 1 "VFIO Bitmaps" per "Table entry". Why does it
contain one struct vfio_bitmap per region? What is a "region" in this
context?

> +
> +.. _VFIO bitmap format:
> +
> +VFIO bitmap format
> +^^^^^^^^^^^^^^^^^^
> +
> +If the VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP bit is set in the request, t=
he
> +server must append to the header the ``struct vfio_bitmap`` received in =
the
> +command followed by the bitmap, for each region. ``struct vfio_bitmap`` =
has the
> +following format:
> +
> ++--------+--------+------+
> +| Name   | Offset | Size |
> ++=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D+
> +| pgsize | 0      | 8    |
> ++--------+--------+------+
> +| size   | 8      | 8    |
> ++--------+--------+------+
> +| data   | 16     | 8    |
> ++--------+--------+------+
> +
> +* *pgsize* is the page size for the bitmap, in bytes.
> +* *size* is the size for the bitmap, in bytes, excluding the VFIO bitmap=
 header.
> +* *data* This field is unused in vfio-user.
> +
> +The VFIO bitmap structure is defined in ``<linux/vfio.h>``
> +(``struct vfio_bitmap``).
> +
> +Each ``struct vfio_bitmap`` entry is followed by the region's bitmap. Ea=
ch bit
> +in the bitmap represents one page of size ``struct vfio_bitmap.pgsize``.
> +
> +If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is not set in Flags then the=
 size
> +of the message is: 16 + (# of table entries * 32).
> +If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags then the siz=
e of
> +the message is: 16 + (# of table entries * 56) + size of all bitmaps.


> +
> +Upon receiving a VFIO_USER_DMA_UNMAP command, if the file descriptor is =
mapped
> +then the server must release all references to that DMA region before re=
plying,
> +which includes potentially in flight DMA transactions. Removing a portio=
n of a
> +DMA region is possible.

"Removing a portion of a DMA region is possible"
-> doing so splits a larger DMA region into one or two smaller remaining re=
gions?

How do potentially large messages work around max_msg_size? It is hard
for the client/server to anticipate the maximum message size that will
be required ahead of time, so they can't really know if they will hit a
situation where max_msg_size is too low.

> +
> +VFIO_USER_DEVICE_GET_INFO
> +-------------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+----------------------------+
> +| Name         | Value                      |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                       |
> ++--------------+----------------------------+
> +| Command      | 4                          |
> ++--------------+----------------------------+
> +| Message size | 32                         |
> ++--------------+----------------------------+
> +| Flags        | Reply bit set in reply     |
> ++--------------+----------------------------+
> +| Error        | 0/errno                    |
> ++--------------+----------------------------+
> +| Device info  | VFIO device info           |
> ++--------------+----------------------------+
> +
> +This command message is sent by the client to the server to query for ba=
sic
> +information about the device. The VFIO device info structure is defined =
in
> +``<linux/vfio.h>`` (``struct vfio_device_info``).

Wait, "VFIO device info format" below is missing the cap_offset field,
so it's exactly not the same as <linux/vfio.h>?

> +
> +VFIO device info format
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-------------+--------+--------------------------+
> +| Name        | Offset | Size                     |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| argsz       | 16     | 4                        |
> ++-------------+--------+--------------------------+
> +| flags       | 20     | 4                        |
> ++-------------+--------+--------------------------+
> +|             | +-----+-------------------------+ |
> +|             | | Bit | Definition              | |
> +|             | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |
> +|             | | 0   | VFIO_DEVICE_FLAGS_RESET | |
> +|             | +-----+-------------------------+ |
> +|             | | 1   | VFIO_DEVICE_FLAGS_PCI   | |
> +|             | +-----+-------------------------+ |
> ++-------------+--------+--------------------------+
> +| num_regions | 24     | 4                        |
> ++-------------+--------+--------------------------+
> +| num_irqs    | 28     | 4                        |
> ++-------------+--------+--------------------------+
> +
> +* *argsz* is the size of the VFIO device info structure. This is the onl=
y field
> +that should be set to non-zero in the request, identifying the client's =
expected
> +size. Currently this is a fixed value.
> +* *flags* contains the following device attributes.
> +
> +  * VFIO_DEVICE_FLAGS_RESET indicates that the device supports the
> +    VFIO_USER_DEVICE_RESET message.
> +  * VFIO_DEVICE_FLAGS_PCI indicates that the device is a PCI device.
> +
> +* *num_regions* is the number of memory regions that the device exposes.
> +* *num_irqs* is the number of distinct interrupt types that the device s=
upports.
> +
> +This version of the protocol only supports PCI devices. Additional devic=
es may
> +be supported in future versions.

I've reviewed up to here so far.

Stefan

--5zIxa2+XkhTGDTrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRUXEACgkQnKSrs4Gr
c8gUaAf+LLBDC68gQKLCLKuKj88BNIRnnrm+ofJo0zPNMvNVP7VdJ2S6kLLk2QKa
ZIjpy9MoKZoUSJcqcCK8H66bePI9IxGWekDEMopSfc8KTp7mk0/KAywTQAx9txU0
V3VcN7o+G0BIyPrZ1KXeERhjq7/JncS8TSqBHiWdSTEmvtvQXsUDJZQP4F5KKtQy
mgyA+vH2FixWpQRIEai5zGXExn1zWYnUSXFeLmWtT8TuF3eksNMwWSS6Bjks9SO2
vljm0WnnHIPyMlndv8WbZykSxZcpFuy7bfDv0WLdfXWxWwAiR4+rr8VTxFiQPDpe
ObX5ZDp2TVxU5Moarsw2SfgYUHEnJw==
=ZX0l
-----END PGP SIGNATURE-----

--5zIxa2+XkhTGDTrp--


