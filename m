Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06B3794D0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 19:00:35 +0200 (CEST)
Received: from localhost ([::1]:47390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg9Gk-0006Pk-02
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 13:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg9EL-0005Cm-IX
 for qemu-devel@nongnu.org; Mon, 10 May 2021 12:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg9EF-0002wc-W7
 for qemu-devel@nongnu.org; Mon, 10 May 2021 12:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620665878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ysd02G8uGkR8/5WJ3ql8cGm2JEutWNI+ThfD5/3qcp4=;
 b=eh0NqRfxsLLEvapqSHakaUPFADqexbol/zZmJAijvQNqciYQ7cU14w15cvKNAHZYjvm7Mp
 I/yChG0Bm7PLk5fkQcBtP8WULUAs4vXP3Ln98ptZslBOs5bU7mvqnV4dW/rXcSqGeo1qeM
 tL4gr5hzJFO8IRwz9Swe5fZnYOSzR44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-OEbmGYNePhGJyBWQERa5zQ-1; Mon, 10 May 2021 12:57:56 -0400
X-MC-Unique: OEbmGYNePhGJyBWQERa5zQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A9381883527;
 Mon, 10 May 2021 16:57:53 +0000 (UTC)
Received: from localhost (ovpn-113-44.ams2.redhat.com [10.36.113.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 130F660C54;
 Mon, 10 May 2021 16:57:38 +0000 (UTC)
Date: Mon, 10 May 2021 17:57:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <YJlmARxX5ZADZD5w@stefanha-x1.localdomain>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20210414114122.236193-1-thanos.makatos@nutanix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QEdBbeXf4763V2AI"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 eafanasova@gmail.com, ismael@linux.com, changpeng.liu@intel.com,
 tomassetti.andrea@gmail.com, mpiszczek@ddn.com,
 Cornelia Huck <cohuck@redhat.com>, alex.williamson@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, xiuchun.lu@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QEdBbeXf4763V2AI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:

Elena A: I CCed you in case you want to review the
VFIO_USER_DEVICE_GET_REGION_IO_FDS section that describes how ioregionfd
can be used by the vfio-user protocol. If you're busy, don't worry but
it's just nice to know that your Outreachy work fits in to stuff that's
currently being developed :).

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
> +
> +An example is a frame buffer device, where the device may allow concurre=
nt
> +access to different areas of video memory, but may have indeterminate be=
havior
> +if concurrent acceses are performed to command or status registers.
> +
> +Note that unrelated messages sent from the sevrer to the client can appe=
ar in
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
> +* *Offset* is the file offset of the region with respect to the associat=
ed file
> +  descriptor.
> +* *Protections* are the region's protection attributes as encoded in
> +  ``<sys/mman.h>``.
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
> +
> +Adding multiple DMA regions can partially fail. The response does not in=
dicate
> +which regions were added and which were not, therefore it is a client
> +implementation detail how to recover from the failure.
> +
> +.. Note::
> +   The server can optionally remove succesfully added DMA regions making=
 this
> +   operation atomic.
> +   The client can recover by attempting to unmap one by one all the DMA =
regions
> +   in the VFIO_USER_DMA_MAP command, ignoring failures for regions that =
do not
> +   exist.
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
> +
> +VFIO_USER_DEVICE_GET_REGION_INFO
> +--------------------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 5                      |
> ++--------------+------------------------+
> +| Message size | 48 + any caps          |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| Region info  | VFIO region info       |
> ++--------------+------------------------+
> +
> +This command message is sent by the client to the server to query for
> +information about device memory regions. The VFIO region info structure =
is
> +defined in ``<linux/vfio.h>`` (``struct vfio_region_info``).
> +
> +VFIO region info format
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++------------+--------+------------------------------+
> +| Name       | Offset | Size                         |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+
> +| argsz      | 16     | 4                            |
> ++------------+--------+------------------------------+
> +| flags      | 20     | 4                            |
> ++------------+--------+------------------------------+
> +|            | +-----+-----------------------------+ |
> +|            | | Bit | Definition                  | |
> +|            | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |
> +|            | | 0   | VFIO_REGION_INFO_FLAG_READ  | |
> +|            | +-----+-----------------------------+ |
> +|            | | 1   | VFIO_REGION_INFO_FLAG_WRITE | |
> +|            | +-----+-----------------------------+ |
> +|            | | 2   | VFIO_REGION_INFO_FLAG_MMAP  | |
> +|            | +-----+-----------------------------+ |
> +|            | | 3   | VFIO_REGION_INFO_FLAG_CAPS  | |
> +|            | +-----+-----------------------------+ |
> ++------------+--------+------------------------------+
> +| index      | 24     | 4                            |
> ++------------+--------+------------------------------+
> +| cap_offset | 28     | 4                            |
> ++------------+--------+------------------------------+
> +| size       | 32     | 8                            |
> ++------------+--------+------------------------------+
> +| offset     | 40     | 8                            |
> ++------------+--------+------------------------------+
> +
> +* *argsz* is the size of the VFIO region info structure plus the
> +  size of any region capabilities returned.
> +* *flags* are attributes of the region:
> +
> +  * *VFIO_REGION_INFO_FLAG_READ* allows client read access to the region=
.
> +  * *VFIO_REGION_INFO_FLAG_WRITE* allows client write access to the regi=
on.
> +  * *VFIO_REGION_INFO_FLAG_MMAP* specifies the client can mmap() the reg=
ion.
> +    When this flag is set, the reply will include a file descriptor in i=
ts
> +    meta-data. On AF_UNIX sockets, the file descriptors will be passed a=
s
> +    SCM_RIGHTS type ancillary data.
> +  * *VFIO_REGION_INFO_FLAG_CAPS* indicates additional capabilities found=
 in the
> +    reply.
> +
> +* *index* is the index of memory region being queried, it is the only fi=
eld
> +  that is required to be set in the command message.
> +* *cap_offset* describes where additional region capabilities can be fou=
nd.
> +  cap_offset is relative to the beginning of the VFIO region info struct=
ure.
> +  The data structure it points is a VFIO cap header defined in
> +  ``<linux/vfio.h>``.
> +* *size* is the size of the region.
> +* *offset* is the offset given to the mmap() system call for regions wit=
h the
> +  MMAP attribute. It is also used as the base offset when mapping a VFIO
> +  sparse mmap area, described below.
> +
> +The client sets the ``argsz`` field to indicate the maximum size of the
> +response that the server can send, which must be at least the size of th=
e
> +response header plus the size of VFIO region info. If the region contain=
s
> +capabilities whose size exceeds ``argsz``, then the server must respond =
only with
> +the response header and VFIO region info, omitting the region capabiliti=
es, and
> +setting in ``argsz`` the buffer size required to store the initial respo=
nse
> +*plus* the region capabilities. The client then retries the operation wi=
th a
> +larger receive buffer.
> +
> +VFIO Region capabilities
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +The VFIO region information can also include a capabilities list. This l=
ist is
> +similar to a PCI capability list - each entry has a common header that
> +identifies a capability and where the next capability in the list can be=
 found.
> +The VFIO capability header format is defined in ``<linux/vfio.h>`` (``st=
ruct
> +vfio_info_cap_header``).
> +
> +VFIO cap header format
> +^^^^^^^^^^^^^^^^^^^^^^
> +
> ++---------+--------+------+
> +| Name    | Offset | Size |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
+
> +| id      | 0      | 2    |
> ++---------+--------+------+
> +| version | 2      | 2    |
> ++---------+--------+------+
> +| next    | 4      | 4    |
> ++---------+--------+------+
> +
> +* *id* is the capability identity.
> +* *version* is a capability-specific version number.
> +* *next* specifies the offset of the next capability in the capability l=
ist. It
> +  is relative to the beginning of the VFIO region info structure.
> +
> +VFIO sparse mmap
> +^^^^^^^^^^^^^^^^
> +
> ++------------------+----------------------------------+
> +| Name             | Value                            |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| id               | VFIO_REGION_INFO_CAP_SPARSE_MMAP |
> ++------------------+----------------------------------+
> +| version          | 0x1                              |
> ++------------------+----------------------------------+
> +| next             | <next>                           |
> ++------------------+----------------------------------+
> +| sparse mmap info | VFIO region info sparse mmap     |
> ++------------------+----------------------------------+
> +
> +This capability is defined when only a subrange of the region supports
> +direct access by the client via mmap(). The VFIO sparse mmap area is def=
ined in
> +``<linux/vfio.h>`` (``struct vfio_region_sparse_mmap_area``).

It's a little early to reference struct vfio_region_sparse_mmap_area
here because the parent struct vfio_region_info_cap_sparse_mmap is only
referenced below. I suggest combining the two:

  The VFIO sparse mmap area is defined in ``<linux/vfio.h>`` (``struct
  vfio_region_info_cap_sparse_mmap`` and ``struct
  vfio_region_sparse_mmap_area``).

> +
> +VFIO region info cap sparse mmap
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ++----------+--------+------+
> +| Name     | Offset | Size |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D+
> +| nr_areas | 0      | 4    |
> ++----------+--------+------+
> +| reserved | 4      | 4    |
> ++----------+--------+------+
> +| offset   | 8      | 8    |
> ++----------+--------+------+
> +| size     | 16     | 9    |
> ++----------+--------+------+
> +| ...      |        |      |
> ++----------+--------+------+
> +
> +* *nr_areas* is the number of sparse mmap areas in the region.
> +* *offset* and size describe a single area that can be mapped by the cli=
ent.
> +  There will be nr_areas pairs of offset and size. The offset will be ad=
ded to
> +  the base offset given in the VFIO_USER_DEVICE_GET_REGION_INFO to form =
the
> +  offset argument of the subsequent mmap() call.
> +
> +The VFIO sparse mmap area is defined in ``<linux/vfio.h>`` (``struct
> +vfio_region_info_cap_sparse_mmap``).
> +
> +VFIO Region Type
> +^^^^^^^^^^^^^^^^
> +
> ++------------------+---------------------------+
> +| Name             | Value                     |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| id               | VFIO_REGION_INFO_CAP_TYPE |
> ++------------------+---------------------------+
> +| version          | 0x1                       |
> ++------------------+---------------------------+
> +| next             | <next>                    |
> ++------------------+---------------------------+
> +| region info type | VFIO region info type     |
> ++------------------+---------------------------+
> +
> +This capability is defined when a region is specific to the device.
> +
> +VFIO region info type
> +^^^^^^^^^^^^^^^^^^^^^
> +
> +The VFIO region info type is defined in ``<linux/vfio.h>``
> +(``struct vfio_region_info_cap_type``).
> +
> ++---------+--------+------+
> +| Name    | Offset | Size |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
+
> +| type    | 0      | 4    |
> ++---------+--------+------+
> +| subtype | 4      | 4    |
> ++---------+--------+------+
> +
> +The only device-specific region type and subtype supported by vfio-user =
is
> +VFIO_REGION_TYPE_MIGRATION (3) and VFIO_REGION_SUBTYPE_MIGRATION (1).
> +
> +VFIO Device Migration Info
> +^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The beginning of the subregion must contain
> +``struct vfio_device_migration_info``, defined in ``<linux/vfio.h>``. Th=
is
> +subregion is accessed like any other part of a standard vfio-user PCI re=
gion
> +using VFIO_USER_REGION_READ/VFIO_USER_REGION_WRITE.
> +
> ++---------------+--------+-----------------------------+
> +| Name          | Offset | Size                        |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| device_state  | 0      | 4                           |
> ++---------------+--------+-----------------------------+
> +|               | +-----+----------------------------+ |
> +|               | | Bit | Definition                 | |
> +|               | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |
> +|               | | 0   | VFIO_DEVICE_STATE_RUNNING  | |
> +|               | +-----+----------------------------+ |
> +|               | | 1   | VFIO_DEVICE_STATE_SAVING   | |
> +|               | +-----+----------------------------+ |
> +|               | | 2   | VFIO_DEVICE_STATE_RESUMING | |
> +|               | +-----+----------------------------+ |
> ++---------------+--------+-----------------------------+
> +| reserved      | 4      | 4                           |
> ++---------------+--------+-----------------------------+
> +| pending_bytes | 8      | 8                           |
> ++---------------+--------+-----------------------------+
> +| data_offset   | 16     | 8                           |
> ++---------------+--------+-----------------------------+
> +| data_size     | 24     | 8                           |
> ++---------------+--------+-----------------------------+
> +
> +* *device_state* defines the state of the device:
> +
> +  The client initiates device state transition by writing the intended s=
tate.
> +  The server must respond only after it has succesfully transitioned to =
the new
> +  state. If an error occurs then the server must respond to the
> +  VFIO_USER_REGION_WRITE operation with the Error field set accordingly =
and
> +  must remain at the previous state, or in case of internal error it mus=
t
> +  transtition to the error state, defined as
> +  VFIO_DEVICE_STATE_RESUMING | VFIO_DEVICE_STATE_SAVING. The client must
> +  re-read the device state in order to determine it afresh.
> +
> +  The following device states are defined:
> +
> +  +-----------+---------+----------+-----------------------------------+
> +  | _RESUMING | _SAVING | _RUNNING | Description                       |
> +  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +  | 0         | 0       | 0        | Device is stopped.                |
> +  +-----------+---------+----------+-----------------------------------+
> +  | 0         | 0       | 1        | Device is running, default state. |
> +  +-----------+---------+----------+-----------------------------------+
> +  | 0         | 1       | 0        | Stop-and-copy state               |
> +  +-----------+---------+----------+-----------------------------------+
> +  | 0         | 1       | 1        | Pre-copy state                    |
> +  +-----------+---------+----------+-----------------------------------+
> +  | 1         | 0       | 0        | Resuming                          |
> +  +-----------+---------+----------+-----------------------------------+
> +  | 1         | 0       | 1        | Invalid state                     |
> +  +-----------+---------+----------+-----------------------------------+
> +  | 1         | 1       | 0        | Error state                       |
> +  +-----------+---------+----------+-----------------------------------+
> +  | 1         | 1       | 1        | Invalid state                     |
> +  +-----------+---------+----------+-----------------------------------+
> +
> +  Valid state transitions are shown in the following table:
> +
> +  +-------------------------+---------+---------+---------------+-------=
---+----------+
> +  | |darr| From / To |rarr| | Stopped | Running | Stop-and-copy | Pre-co=
py | Resuming |
> +  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+
> +  | Stopped                 |    \-   |    0    |       0       |    0  =
   |     0    |
> +  +-------------------------+---------+---------+---------------+-------=
---+----------+
> +  | Running                 |    1    |    \-   |       1       |    1  =
   |     1    |
> +  +-------------------------+---------+---------+---------------+-------=
---+----------+
> +  | Stop-and-copy           |    1    |    0    |       \-      |    0  =
   |     0    |
> +  +-------------------------+---------+---------+---------------+-------=
---+----------+
> +  | Pre-copy                |    0    |    0    |       1       |    \- =
   |     0    |
> +  +-------------------------+---------+---------+---------------+-------=
---+----------+
> +  | Resuming                |    0    |    1    |       0       |    0  =
   |     \-   |
> +  +-------------------------+---------+---------+---------------+-------=
---+----------+
> +
> +  A device is migrated to the destination as follows:
> +
> +  * The source client transitions the device state from the running stat=
e to
> +    the pre-copy state. This transition is optional for the client but m=
ust be
> +    supported by the server. The souce server starts sending device stat=
e data
> +    to the source client through the migration region while the device i=
s
> +    running.
> +
> +  * The source client transitions the device state from the running stat=
e or the
> +    pre-copy state to the stop-and-copy state. The source server stops t=
he
> +    device, saves device state and sends it to the source client through=
 the
> +    migration region.
> +
> +  The source client is responsible for sending the migration data to the
> +  destination client.
> +
> +  A device is resumed on the destination as follows:
> +
> +  * The destination client transitions the device state from the running=
 state
> +    to the resuming state. The destination server uses the device state =
data
> +    received through the migration region to resume the device.
> +
> +  * The destination client provides saved device state to the destinatio=
n
> +    server and then transitions the device to back to the running state.
> +
> +* *reserved* This field is reserved and any access to it must be ignored=
 by the
> +  server.
> +
> +* *pending_bytes* Remaining bytes to be migrated by the server. This fie=
ld is
> +  read only.
> +
> +* *data_offset* Offset in the migration region where the client must:
> +
> +  * read from, during the pre-copy or stop-and-copy state, or
> +
> +  * write to, during the resuming state.
> +
> +  This field is read only.
> +
> +* *data_size* Contains the size, in bytes, of the amount of data copied =
to:
> +
> +  * the source migration region by the source server during the pre-copy=
 or
> +    stop-and copy state, or
> +
> +  * the destination migration region by the destination client during th=
e
> +    resuming state.
> +
> +Device-specific data must be stored at any position after
> +`struct vfio_device_migration_info`. Note that the migration region can =
be
> +memory mappable, even partially. In practise, only the migration data po=
rtion
> +can be memory mapped.
> +
> +The client processes device state data during the pre-copy and the
> +stop-and-copy state in the following iterative manner:
> +
> +  1. The client reads `pending_bytes` to mark a new iteration. Repeated =
reads
> +     of this field is an idempotent operation. If there are no migration=
 data
> +     to be consumed then the next step depends on the current device sta=
te:
> +
> +     * pre-copy: the client must try again.
> +
> +     * stop-and-copy: this procedure can end and the device can now star=
t
> +       resuming on the destination.
> +
> +  2. The client reads `data_offset`; at thich point the server must make
> +     available a portion of migration data at this offset to be read by =
the
> +     client, which must happen *before* completing the read operation. T=
he
> +     amount of data to be read must be stored in the `data_size` field, =
which
> +     the client reads next.
> +
> +  3. The client reads `data_size` to determine the amount of migration d=
ata
> +     available.
> +
> +  4. The client reads and processes the migration data.
> +
> +  5. Go to step 1.
> +
> +Note that the client can transition the device from the pre-copy state t=
o the
> +stop-and-copy state at any time; `pending_bytes` does not need to become=
 zero.
> +
> +The client initializes the device state on the destination by setting th=
e
> +device state in the resuming state and writing the migration data to the
> +destination migration region at `data_offset` offset. The client can wri=
te the
> +source migration data in an iterative manner and the server must consume=
 this
> +data before completing each write operation, updating the `data_offset` =
field.
> +The server must apply the source migration data on the device resume sta=
te. The
> +client must write data on the same order and transction size as read.
> +
> +If an error occurs then the server must fail the read or write operation=
. It is
> +an implementation detail of the client how to handle errors.
> +
> +VFIO_USER_DEVICE_GET_REGION_IO_FDS
> +----------------------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 6                      |
> ++--------------+------------------------+
> +| Message size | 32 + subregion info    |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| Region info  | Region IO FD info      |
> ++--------------+------------------------+
> +
> +Clients can access regions via VFIO_USER_REGION_READ/WRITE or, if provid=
ed, by
> +mmap()ing a file descriptor provided by the server.
> +
> +VFIO_USER_DEVICE_GET_REGION_IO_FDS provides an alternative access mechan=
ism via
> +file descriptors. This is an optional feature intended for performance
> +improvements where an underlying sub-system (such as KVM) supports commu=
nication
> +across such file descriptors to the vfio-user server, without needing to
> +round-trip through the client.
> +
> +The server returns an array of sub-regions for the requested region. Eac=
h
> +sub-region describes a span (offset and size) of a region, along with th=
e
> +requested file descriptor notification mechanism to use.  Each sub-regio=
n in the
> +response message may choose to use a different method, as defined below.=
  The
> +two mechanisms supported in this specification are ioeventfds and ioregi=
onfds.
> +
> +The server in addition returns a file descriptor in the ancillary data; =
clients
> +are expected to configure each sub-region's file descriptor with the req=
uested
> +notification method. For example, a client could configure KVM with the
> +requested ioeventfd via a KVM_IOEVENTFD ioctl().
> +
> +Region IO FD info format
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-------------+--------+------+
> +| Name        | Offset | Size |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D+
> +| argsz       | 16     | 4    |
> ++-------------+--------+------+
> +| flags       | 20     | 4    |
> ++-------------+--------+------+
> +| index       | 24     | 4    |
> ++-------------+--------+------+
> +| count       | 28     | 4    |
> ++-------------+--------+------+
> +| sub-regions | 32     | ...  |
> ++-------------+--------+------+
> +
> +* *argsz* is the size of the region IO FD info structure plus the
> +  total size of the sub-region array. Thus, each array entry "i" is at o=
ffset
> +  i * ((argsz - 32) / count). Note that currently this is 40 bytes for b=
oth IO
> +  FD types, but this is not to be relied on.
> +* *flags* must be zero
> +* *index* is the index of memory region being queried
> +* *count* is the number of sub-regions in the array
> +* *sub-regions* is the array of Sub-Region IO FD info structures
> +
> +The client must set ``flags`` to zero and specify the region being queri=
ed in
> +the ``index``.
> +
> +The client sets the ``argsz`` field to indicate the maximum size of the =
response
> +that the server can send, which must be at least the size of the respons=
e header
> +plus space for the sub-region array. If the full response size exceeds `=
`argsz``,
> +then the server must respond only with the response header and the Regio=
n IO FD
> +info structure, setting in ``argsz`` the buffer size required to store t=
he full
> +response. In this case, no file descriptors are passed back.  The client=
 then
> +retries the operation with a larger receive buffer.
> +
> +The reply message will additionally include at least one file descriptor=
 in the
> +ancillary data. Note that more than one sub-region may share the same fi=
le
> +descriptor.

How does this interact with the maximum number of file descriptors,
max_fds? It is possible that there are more sub-regions than max_fds
allows...

> +
> +Each sub-region given in the response has one of two possible structures=
,
> +depending whether *type* is `VFIO_USER_IO_FD_TYPE_IOEVENTFD` or
> +`VFIO_USER_IO_FD_TYPE_IOREGIONFD`:
> +
> +Sub-Region IO FD info format (ioeventfd)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-----------+--------+------+
> +| Name      | Offset | Size |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D+
> +| offset    | 0      | 8    |
> ++-----------+--------+------+
> +| size      | 8      | 8    |
> ++-----------+--------+------+
> +| fd_index  | 16     | 4    |
> ++-----------+--------+------+
> +| type      | 20     | 4    |
> ++-----------+--------+------+
> +| flags     | 24     | 4    |
> ++-----------+--------+------+
> +| padding   | 28     | 4    |
> ++-----------+--------+------+
> +| datamatch | 32     | 8    |
> ++-----------+--------+------+
> +
> +* *offset* is the offset of the start of the sub-region within the regio=
n
> +  requested ("physical address offset" for the region)
> +* *size* is the length of the sub-region. This may be zero if the access=
 size is
> +  not relevant, which may allow for optimizations
> +* *fd_index* is the index in the ancillary data of the FD to use for ioe=
ventfd
> +  notification; it may be shared.
> +* *type* is `VFIO_USER_IO_FD_TYPE_IOEVENTFD`
> +* *flags* is any of:
> +  * `KVM_IOEVENTFD_FLAG_DATAMATCH`
> +  * `KVM_IOEVENTFD_FLAG_PIO`

The client must not trust the server, so care must be taken to validate
flags and offsets. Failure to do so would allow the server to hijack I/O
dispatch to addresses outside its regions (e.g. MMIO vs PIO or an offset
beyond the end of the region).

It would help to mention this explicitly in the spec so that client
implementors take care.

> +  * `KVM_IOEVENTFD_FLAG_VIRTIO_CCW_NOTIFY` (FIXME: makes sense?)

Not sure about CCW, maybe Cornelia can share her thoughts.

> +* *datamatch* is the datamatch value if needed
> +
> +See https://www.kernel.org/doc/Documentation/virtual/kvm/api.txt 4.59
> +KVM_IOEVENTFD for further context on the ioeventfd-specific fields.
> +
> +Sub-Region IO FD info format (ioregionfd)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-----------+--------+------+
> +| Name      | Offset | Size |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D+
> +| offset    | 0      | 8    |
> ++-----------+--------+------+
> +| size      | 8      | 8    |
> ++-----------+--------+------+
> +| fd_index  | 16     | 4    |
> ++-----------+--------+------+
> +| type      | 20     | 4    |
> ++-----------+--------+------+
> +| flags     | 24     | 4    |
> ++-----------+--------+------+
> +| padding   | 28     | 4    |
> ++-----------+--------+------+
> +| user_data | 32     | 8    |
> ++-----------+--------+------+
> +
> +* *offset* is the offset of the start of the sub-region within the regio=
n
> +  requested ("physical address offset" for the region)
> +* *size* is the length of the sub-region. This may be zero if the access=
 size is
> +  not relevant, which may allow for optimizations; `KVM_IOREGION_POSTED_=
WRITES`
> +  must be set in *flags* in this case
> +* *fd_index* is the index in the ancillary data of the FD to use for ior=
egionfd
> +  messages; it may be shared
> +* *type* is `VFIO_USER_IO_FD_TYPE_IOREGIONFD`
> +* *flags* is any of:
> +  * `KVM_IOREGION_PIO`
> +  * `KVM_IOREGION_POSTED_WRITES`
> +* *user_data* is an opaque value passed back to the server via a message=
 on the
> +  file descriptor
> +
> +For further information on the ioregionfd-specific fields, see:
> +https://lore.kernel.org/kvm/cover.1613828726.git.eafanasova@gmail.com/
> +
> +(FIXME: update with final API docs.)

I suggest postponing the ioregionfd part of the spec until the KVM code
lands. In general the approach makes sense to me though, so I think it
will be possible to merge it later with minimal changes.

> +
> +VFIO_USER_DEVICE_GET_IRQ_INFO
> +-----------------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 7                      |
> ++--------------+------------------------+
> +| Message size | 32                     |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| IRQ info     | VFIO IRQ info          |
> ++--------------+------------------------+
> +
> +This command message is sent by the client to the server to query for
> +information about device interrupt types. The VFIO IRQ info structure is
> +defined in ``<linux/vfio.h>`` (``struct vfio_irq_info``).
> +
> +VFIO IRQ info format
> +^^^^^^^^^^^^^^^^^^^^
> +
> ++-------+--------+---------------------------+
> +| Name  | Offset | Size                      |
> ++=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| argsz | 16     | 4                         |
> ++-------+--------+---------------------------+
> +| flags | 20     | 4                         |
> ++-------+--------+---------------------------+
> +|       | +-----+--------------------------+ |
> +|       | | Bit | Definition               | |
> +|       | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |
> +|       | | 0   | VFIO_IRQ_INFO_EVENTFD    | |
> +|       | +-----+--------------------------+ |
> +|       | | 1   | VFIO_IRQ_INFO_MASKABLE   | |
> +|       | +-----+--------------------------+ |
> +|       | | 2   | VFIO_IRQ_INFO_AUTOMASKED | |
> +|       | +-----+--------------------------+ |
> +|       | | 3   | VFIO_IRQ_INFO_NORESIZE   | |
> +|       | +-----+--------------------------+ |
> ++-------+--------+---------------------------+
> +| index | 24     | 4                         |
> ++-------+--------+---------------------------+
> +| count | 28     | 4                         |
> ++-------+--------+---------------------------+
> +
> +* *argsz* is the size of the VFIO IRQ info structure.
> +* *flags* defines IRQ attributes:
> +
> +  * *VFIO_IRQ_INFO_EVENTFD* indicates the IRQ type can support server ev=
entfd
> +    signalling.
> +  * *VFIO_IRQ_INFO_MASKABLE* indicates that the IRQ type supports the MA=
SK and
> +    UNMASK actions in a VFIO_USER_DEVICE_SET_IRQS message.
> +  * *VFIO_IRQ_INFO_AUTOMASKED* indicates the IRQ type masks itself after=
 being
> +    triggered, and the client must send an UNMASK action to receive new
> +    interrupts.
> +  * *VFIO_IRQ_INFO_NORESIZE* indicates VFIO_USER_SET_IRQS operations set=
up
> +    interrupts as a set, and new sub-indexes cannot be enabled without d=
isabling
> +    the entire type.
> +
> +* index is the index of IRQ type being queried, it is the only field tha=
t is
> +  required to be set in the command message.
> +* count describes the number of interrupts of the queried type.

Is count an output-only field since the previous sentence says index is
the only field required in the command message?

I find it confusing that the spec shows the input/output structs without
explicitly documenting that fields are input, output, or input & output.

> +
> +VFIO_USER_DEVICE_SET_IRQS
> +-------------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 8                      |
> ++--------------+------------------------+
> +| Message size | 36 + any data          |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| IRQ set      | VFIO IRQ set           |
> ++--------------+------------------------+
> +
> +This command message is sent by the client to the server to set actions =
for
> +device interrupt types. The VFIO IRQ set structure is defined in
> +``<linux/vfio.h>`` (``struct vfio_irq_set``).
> +
> +VFIO IRQ set format
> +^^^^^^^^^^^^^^^^^^^
> +
> ++-------+--------+------------------------------+
> +| Name  | Offset | Size                         |
> ++=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| argsz | 16     | 4                            |
> ++-------+--------+------------------------------+
> +| flags | 20     | 4                            |
> ++-------+--------+------------------------------+
> +|       | +-----+-----------------------------+ |
> +|       | | Bit | Definition                  | |
> +|       | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |
> +|       | | 0   | VFIO_IRQ_SET_DATA_NONE      | |
> +|       | +-----+-----------------------------+ |
> +|       | | 1   | VFIO_IRQ_SET_DATA_BOOL      | |
> +|       | +-----+-----------------------------+ |
> +|       | | 2   | VFIO_IRQ_SET_DATA_EVENTFD   | |
> +|       | +-----+-----------------------------+ |
> +|       | | 3   | VFIO_IRQ_SET_ACTION_MASK    | |
> +|       | +-----+-----------------------------+ |
> +|       | | 4   | VFIO_IRQ_SET_ACTION_UNMASK  | |
> +|       | +-----+-----------------------------+ |
> +|       | | 5   | VFIO_IRQ_SET_ACTION_TRIGGER | |
> +|       | +-----+-----------------------------+ |
> ++-------+--------+------------------------------+
> +| index | 24     | 4                            |
> ++-------+--------+------------------------------+
> +| start | 28     | 4                            |
> ++-------+--------+------------------------------+
> +| count | 32     | 4                            |
> ++-------+--------+------------------------------+
> +| data  | 36     | variable                     |
> ++-------+--------+------------------------------+
> +
> +* *argsz* is the size of the VFIO IRQ set structure, including any *data=
* field.
> +* *flags* defines the action performed on the interrupt range. The DATA =
flags
> +  describe the data field sent in the message; the ACTION flags describe=
 the
> +  action to be performed. The flags are mutually exclusive for both sets=
.
> +
> +  * *VFIO_IRQ_SET_DATA_NONE* indicates there is no data field in the com=
mand.
> +    The action is performed unconditionally.
> +  * *VFIO_IRQ_SET_DATA_BOOL* indicates the data field is an array of boo=
lean
> +    bytes. The action is performed if the corresponding boolean is true.
> +  * *VFIO_IRQ_SET_DATA_EVENTFD* indicates an array of event file descrip=
tors
> +    was sent in the message meta-data. These descriptors will be signall=
ed when

signalled...by the client or by the server?

For example, does VFIO_IRQ_SET_ACTION_TRIGGER +
VFIO_IRQ_SET_DATA_EVENTFD provide an eventfd that the server will signal
when the device raises the interrupt?

On the other hand, VFIO_IRQ_SET_ACTION_MASK + VFIO_IRQ_SET_DATA_EVENTFD
seems to be the other way around. The server reads from the eventfd to
respond when the irq is masked.

Maybe the text can be restructured to make this clear.

> +    the action defined by the action flags occurs. In AF_UNIX sockets, t=
he
> +    descriptors are sent as SCM_RIGHTS type ancillary data.
> +    If no file descriptors are provided, this de-assigns the specified
> +    previously configured interrupts.
> +  * *VFIO_IRQ_SET_ACTION_MASK* indicates a masking event. It can be used=
 with
> +    VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to mask an interrup=
t, or
> +    with VFIO_IRQ_SET_DATA_EVENTFD to generate an event when the guest m=
asks
> +    the interrupt.
> +  * *VFIO_IRQ_SET_ACTION_UNMASK* indicates an unmasking event. It can be=
 used
> +    with VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to unmask an
> +    interrupt, or with VFIO_IRQ_SET_DATA_EVENTFD to generate an event wh=
en the
> +    guest unmasks the interrupt.
> +  * *VFIO_IRQ_SET_ACTION_TRIGGER* indicates a triggering event. It can b=
e used
> +    with VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to trigger an
> +    interrupt, or with VFIO_IRQ_SET_DATA_EVENTFD to generate an event wh=
en the
> +    server triggers the interrupt.
> +
> +* *index* is the index of IRQ type being setup.
> +* *start* is the start of the sub-index being set.
> +* *count* describes the number of sub-indexes being set. As a special ca=
se, a
> +  count (and start) of 0, with data flags of VFIO_IRQ_SET_DATA_NONE disa=
bles
> +  all interrupts of the index.
> +* *data* is an optional field included when the
> +  VFIO_IRQ_SET_DATA_BOOL flag is present. It contains an array of boolea=
ns
> +  that specify whether the action is to be performed on the correspondin=
g
> +  index. It's used when the action is only performed on a subset of the =
range
> +  specified.
> +
> +Not all interrupt types support every combination of data and action fla=
gs.
> +The client must know the capabilities of the device and IRQ index before=
 it
> +sends a VFIO_USER_DEVICE_SET_IRQ message.
> +
> +.. _Read and Write Operations:
> +
> +Read and Write Operations
> +-------------------------
> +
> +Not all I/O operations between the client and server can be done via dir=
ect
> +access of memory mapped with an mmap() call. In these cases, the client =
and
> +server use messages sent over the socket. It is expected that these oper=
ations
> +will have lower performance than direct access.
> +
> +The client can access server memory with VFIO_USER_REGION_READ and
> +VFIO_USER_REGION_WRITE commands. These share a common data structure tha=
t
> +appears after the message header.
> +
> +REGION Read/Write Data
> +^^^^^^^^^^^^^^^^^^^^^^
> +
> ++--------+--------+----------+
> +| Name   | Offset | Size     |
> ++=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+
> +| Offset | 16     | 8        |
> ++--------+--------+----------+
> +| Region | 24     | 4        |
> ++--------+--------+----------+
> +| Count  | 28     | 4        |
> ++--------+--------+----------+
> +| Data   | 32     | variable |
> ++--------+--------+----------+
> +
> +* *Offset* into the region being accessed.
> +* *Region* is the index of the region being accessed.
> +* *Count* is the size of the data to be transferred.
> +* *Data* is the data to be read or written.
> +
> +The server can access client memory with VFIO_USER_DMA_READ and
> +VFIO_USER_DMA_WRITE messages. These also share a common data structure t=
hat
> +appears after the message header.
> +
> +DMA Read/Write Data
> +^^^^^^^^^^^^^^^^^^^
> +
> ++---------+--------+----------+
> +| Name    | Offset | Size     |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| Address | 16     | 8        |
> ++---------+--------+----------+
> +| Count   | 24     | 4        |
> ++---------+--------+----------+
> +| Data    | 28     | variable |
> ++---------+--------+----------+
> +
> +* *Address* is the area of client memory being accessed. This address mu=
st have
> +  been previously exported to the server with a VFIO_USER_DMA_MAP messag=
e.
> +* *Count* is the size of the data to be transferred.
> +* *Data* is the data to be read or written.
> +
> +VFIO_USER_REGION_READ
> +---------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 9                      |
> ++--------------+------------------------+
> +| Message size | 32 + data size         |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| Read info    | REGION read/write data |
> ++--------------+------------------------+
> +
> +This command message is sent from the client to the server to read from =
server
> +memory.  In the command messages, there is no data, and the count is the=
 amount
> +of data to be read. The reply message must include the data read, and it=
s count
> +field is the amount of data read.

There is no data in command messages, but Message size is still 32 +
data size? This would make protocol serialization code more complex
since it means that certain messages have a Message size field that does
not correspond to the actual number of command message bytes transferred
over the wire.

> +
> +VFIO_USER_REGION_WRITE
> +----------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 10                     |
> ++--------------+------------------------+
> +| Message size | 32 + data size         |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| Write info   | REGION read/write data |
> ++--------------+------------------------+
> +
> +This command message is sent from the client to the server to write to s=
erver
> +memory.  The command message must contain the data to be written, and it=
s count
> +field must contain the amount of write data. The count field in the repl=
y
> +message must be zero.
> +
> +VFIO_USER_DMA_READ
> +------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 11                     |
> ++--------------+------------------------+
> +| Message size | 28 + data size         |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| DMA info     | DMA read/write data    |
> ++--------------+------------------------+
> +
> +This command message is sent from the server to the client to read from =
client
> +memory.  In the command message, there is no data, and the count must wi=
ll be
> +the amount of data to be read. The reply message must include the data r=
ead,
> +and its count field must be the amount of data read.
> +
> +VFIO_USER_DMA_WRITE
> +-------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 12                     |
> ++--------------+------------------------+
> +| Message size | 28 + data size         |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +| DMA info     | DMA read/write data    |
> ++--------------+------------------------+
> +
> +This command message is sent from the server to the client to write to c=
lient
> +memory.  The command message must contain the data to be written, and it=
s count
> +field must contain the amount of write data. The count field in the repl=
y
> +message must be zero.
> +
> +VFIO_USER_VM_INTERRUPT
> +----------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++----------------+------------------------+
> +| Name           | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
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
> +This command message is sent from the server to the client to signal the=
 device
> +has raised an interrupt.

Except if the client set up irq eventfds?

> +
> +Interrupt info format
> +^^^^^^^^^^^^^^^^^^^^^
> +
> ++-----------+--------+------+
> +| Name      | Offset | Size |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D+
> +| Sub-index | 16     | 4    |
> ++-----------+--------+------+
> +
> +* *Sub-index* is relative to the IRQ index, e.g., the vector number used=
 in PCI
> +  MSI/X type interrupts.

Hmm...this is weird. The server tells the client to raise an MSI-X
interrupt but does not include the MSI message that resides in the MSI-X
table BAR device region? Or should MSI-X interrupts be delivered to the
client via VFIO_USER_DMA_WRITE instead?

(Basically it's not clear to me how MSI-X interrupts would work with
vfio-user. Reading how they work in kernel VFIO might let me infer it,
but it's probably worth explaining this clearly in the spec.)

> +
> +VFIO_USER_DEVICE_RESET
> +----------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------+------------------------+
> +| Name         | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID   | <ID>                   |
> ++--------------+------------------------+
> +| Command      | 14                     |
> ++--------------+------------------------+
> +| Message size | 16                     |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +
> +This command message is sent from the client to the server to reset the =
device.

Any requirements for how long VFIO_USER_DEVICE_RESET takes to complete?
In some cases a reset involves the server communicating with other
systems or components and this can take an unbounded amount of time.
Therefore this message could hang. For example, if a vfio-user NVMe
device was accessing data on a hung NFS export and there were I/O
requests in flight that need to be aborted.

> +
> +VFIO_USER_DIRTY_PAGES
> +---------------------
> +
> +Message format
> +^^^^^^^^^^^^^^
> +
> ++--------------------+------------------------+
> +| Name               | Value                  |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| Message ID         | <ID>                   |
> ++--------------------+------------------------+
> +| Command            | 15                     |
> ++--------------------+------------------------+
> +| Message size       | 16                     |
> ++--------------------+------------------------+
> +| Flags              | Reply bit set in reply |
> ++--------------------+------------------------+
> +| Error              | 0/errno                |
> ++--------------------+------------------------+
> +| VFIO Dirty bitmap  | <dirty bitmap>         |
> ++--------------------+------------------------+
> +
> +This command is analogous to VFIO_IOMMU_DIRTY_PAGES. It is sent by the c=
lient
> +to the server in order to control logging of dirty pages, usually during=
 a live
> +migration. The VFIO dirty bitmap structure is defined in ``<linux/vfio.h=
>``
> +(``struct vfio_iommu_type1_dirty_bitmap``).

Do all vfio-user servers need to implement VFIO_USER_DIRTY_PAGES? It's
common for some device implementations to omit migration support because
it increases implementation complexity and is not needed in certain use
cases.

> +
> +VFIO Dirty Bitmap Format
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-------+--------+-----------------------------------------+
> +| Name  | Offset | Size                                    |
> ++=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+
> +| argsz | 0      | 4                                       |
> ++-------+--------+-----------------------------------------+
> +| flags | 4      | 4                                       |
> ++-------+--------+-----------------------------------------+
> +|       | +-----+----------------------------------------+ |
> +|       | | Bit | Definition                             | |
> +|       | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
+ |
> +|       | | 0   | VFIO_IOMMU_DIRTY_PAGES_FLAG_START      | |
> +|       | +-----+----------------------------------------+ |
> +|       | | 1   | VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP       | |
> +|       | +-----+----------------------------------------+ |
> +|       | | 2   | VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP | |
> +|       | +-----+----------------------------------------+ |
> ++-------+--------+-----------------------------------------+
> +| data  | 8      | 4                                       |
> ++-------+--------+-----------------------------------------+
> +
> +* *argsz* is the size of the VFIO dirty bitmap info structure.
> +
> +* *flags* defines the action to be performed by the server:
> +
> +  * *VFIO_IOMMU_DIRTY_PAGES_FLAG_START* instructs the server to start lo=
gging
> +    pages it dirties. Logging continues until explicitly disabled by
> +    VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP.
> +
> +  * *VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP* instructs the server to stop logg=
ing
> +    dirty pages.
> +
> +  * *VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP* requests from the server to=
 return
> +    the dirty bitmap for a specific IOVA range. The IOVA range is specif=
ied by
> +    "VFIO dirty bitmap get" structure, which must immediatelly follow th=
e
> +    "VFIO dirty bitmap" structure, explained next. This operation is onl=
y valid
> +    if logging of dirty pages has been previously started. The server mu=
st
> +    respond the same way it does for ``VFIO_USER_DMA_UNMAP`` if
> +    ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in the flags field o=
f the
> +    table entry (``struct vfio_bitmap`` plus the bitmap must follow the
> +    response header).
> +
> +  These flags are mutually exclusive with each other.
> +
> +* *data* This field is unused in vfio-user.
> +
> +VFIO Dirty Bitmap Get Format
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++--------+--------+------+
> +| Name   | Offset | Size |
> ++=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D+
> +| iova   | 0      | 8    |
> ++--------+--------+------+
> +| size   | 8      | 8    |
> ++--------+--------+------+
> +| bitmap | 16     | 24   |
> ++--------+--------+------+
> +
> +* *iova* is the IOVA offset
> +
> +* *size* is the size of the IOVA region
> +
> +* *bitmap* is the VFIO bitmap (``struct vfio_bitmap``). This field is ex=
plained
> +  in `VFIO bitmap format`_.
> +
> +Appendices
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Unused VFIO ioctl() commands
> +----------------------------
> +
> +The following VFIO commands do not have an equivalent vfio-user command:
> +
> +* VFIO_GET_API_VERSION
> +* VFIO_CHECK_EXTENSION
> +* VFIO_SET_IOMMU
> +* VFIO_GROUP_GET_STATUS
> +* VFIO_GROUP_SET_CONTAINER
> +* VFIO_GROUP_UNSET_CONTAINER
> +* VFIO_GROUP_GET_DEVICE_FD
> +* VFIO_IOMMU_GET_INFO
> +
> +However, once support for live migration for VFIO devices is finalized s=
ome
> +of the above commands may have to be handled by the client in their
> +corresponding vfio-user form. This will be addressed in a future protoco=
l
> +version.
> +
> +VFIO groups and containers
> +^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The current VFIO implementation includes group and container idioms that
> +describe how a device relates to the host IOMMU. In the vfio-user
> +implementation, the IOMMU is implemented in SW by the client, and is not
> +visible to the server. The simplest idea would be that the client put ea=
ch
> +device into its own group and container.
> +
> +Backend Program Conventions
> +---------------------------
> +
> +vfio-user backend program conventions are based on the vhost-user ones.
> +
> +* The backend program must not daemonize itself.
> +* No assumptions must be made as to what access the backend program has =
on the
> +  system.
> +* File descriptors 0, 1 and 2 must exist, must have regular
> +  stdin/stdout/stderr semantics, and can be redirected.
> +* The backend program must honor the SIGTERM signal.
> +* The backend program must accept the following commands line options:
> +
> +  * ``--socket-path=3DPATH``: path to UNIX domain socket,
> +  * ``--fd=3DFDNUM``: file descriptor for UNIX domain socket, incompatib=
le with
> +    ``--socket-path``
> +* The backend program must be accompanied with a JSON file stored under
> +  ``/usr/share/vfio-user``.
> +
> +TODO add schema similar to docs/interop/vhost-user.json.
> --=20
> 2.12.2
>=20

--QEdBbeXf4763V2AI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCZZgEACgkQnKSrs4Gr
c8ibEQf8DUZlQXV6QTP48O89oA6W3du6N6L++A3SzgNVJWK3Bk503MV4UWCXq4Yh
jPzJDu5eqGc05FuBynQsoG0qY4/5GBIBzA4ZmbxYDpgsr6CnUzkJpY0Wi5QJv0+J
0m9/KwGdM7YXUc955UZfug5ngZYkODhVAXkoq+O3US5jeNIyl7vNnatesWRgveVu
KIN5i4LF8bQDzKceIZYQY/VW6B0qGw5nCrOCJStx5Gvtjk0XDwcAkCg6TMmL282l
kvZqt9/s98qNjA9R9KXrk8UCXcqbNf5jFRMOXRaP7UTJHLvxuVQLoYVjZQXIgM+3
ZocPM+B+KTATQAAVG2/F59tUFBjq9Q==
=TPuO
-----END PGP SIGNATURE-----

--QEdBbeXf4763V2AI--


