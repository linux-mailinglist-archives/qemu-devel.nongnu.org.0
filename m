Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4152C9996
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:35:43 +0100 (CET)
Received: from localhost ([::1]:35918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk18Q-0005bO-Bd
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kk15Q-0004aO-Dt
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:32:36 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:45796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kk15H-0002cU-4R
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:32:35 -0500
Received: by mail-ej1-x642.google.com with SMTP id qw4so2334657ejb.12
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 00:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hd9ttdZRXtjZ3qDgxu42HBc8QTE+u7wz6oUSas7lUxk=;
 b=WJgn8ZKb98J/DP4v+lUJjnyGxLTztyjI5cdS4zKl2n301YHySXGCmb+MqtBOaz0U5/
 E9IHp7ngc77w3q+6dbnDDNEnvCDSeMK731HQUy3XYQ/y51qvArZpXwcEPfgOdHAk+I3x
 vTlp8KyhBSUUH+Z1kDRLVywzACdFyy8lr19pW1uTyJmL9rfIXA73/ErnfdmvR/594vvf
 j/P9XhDpc6HCk/losFGciJn2K5SL/maDh/oPhZ6NQy4hR8nfrTIutTDBiBtrJky8ZPTk
 wNqdVPQT4hnqDfNKwIbFYzhDGvV93DrJTVUcCZrp08pxUvt3jy3SPs4V3wSVz3iqK3lO
 oOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hd9ttdZRXtjZ3qDgxu42HBc8QTE+u7wz6oUSas7lUxk=;
 b=XRKM139W1a9AOITzMmjBGlifO23E55iGi9xKHkDcavOWf+BUYcyz149CWjg9U7wp5M
 cLUIDMtwuYzezRSU2GcdiluaBZ5ni2/Ez3IuTJGKERXNBZ1HNPKegRSvvgnizYcM/WFu
 MJnVO7G602tsHYqIG9w3ZDCvhOV1sdQvdSAvDLKhHT524kV2G1APQA7S74sggrKqRD1v
 SmbaKyX0yOVBYDh7BpsPWwgGquAKpP5dtvhk3oUpKfl16hXaD1Hk2xrtpAuFT3/Gi3Ex
 sCxYYNgiz04U4qN5+kDrYUVPoyXkRGBXeZcMHrGkJ4PSTiOxJILdBzuI8rCQ3lXD5BzB
 rZbw==
X-Gm-Message-State: AOAM530f/g+u48VXxZtMFSh4k94BFki1rxj9PEOSca1WEheuHtvI1Hlm
 OMc8yA547FNgNXUEwakGL8fZwOfgEeMpMwfHRMo=
X-Google-Smtp-Source: ABdhPJxPA65WSluDmehrKBPGRbZt55ZrEItOGasIsBYxbuUPFaOyxZXA+tKOahkWUJQgP9SXZln8llu4aR8DoY7i910=
X-Received: by 2002:a17:906:e25a:: with SMTP id
 gq26mr1930084ejb.109.1606811544169; 
 Tue, 01 Dec 2020 00:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20201130161229.23164-1-thanos.makatos@nutanix.com>
In-Reply-To: <20201130161229.23164-1-thanos.makatos@nutanix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 1 Dec 2020 12:32:11 +0400
Message-ID: <CAJ+F1CLLdLt7fwNauVJ_D=5OygjYaXvb3GtvQGZEwSmmDPOc-g@mail.gmail.com>
Subject: Re: [PATCH v7] introduce vfio-user protocol specification
To: Thanos Makatos <thanos.makatos@nutanix.com>
Content-Type: multipart/alternative; boundary="0000000000004fb1eb05b562f7e0"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: "Walker, Benjamin" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, John Levon <levon@movementarian.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Harris,
 James R" <james.r.harris@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Kanth Ghatraju <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, yuvalkashtan@gmail.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, ismael@linux.com,
 Stefan Hajnoczi <stefanha@redhat.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, tomassetti.andrea@gmail.com,
 Cornelia Huck <cohuck@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>,
 Tina Zhang <tina.zhang@intel.com>, xiuchun.lu@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004fb1eb05b562f7e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Nov 30, 2020 at 8:14 PM Thanos Makatos <thanos.makatos@nutanix.com>
wrote:

> This patch introduces the vfio-user protocol specification (formerly
> known as VFIO-over-socket), which is designed to allow devices to be
> emulated outside QEMU, in a separate process. vfio-user reuses the
> existing VFIO defines, structs and concepts.
>
> It has been earlier discussed as an RFC in:
> "RFC: use VFIO over a UNIX domain socket to implement device offloading"
>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Thanos Makatos <thanos.makatos@nutanix.com>
>
>
I am taking a superficial look, as I don't have much experience from
implementing it (recently).

---
>
> Changed since v1:
>   * fix coding style issues
>   * update MAINTAINERS for VFIO-over-socket
>   * add vfio-over-socket to ToC
>
> Changed since v2:
>   * fix whitespace
>
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
>
> Changed since v4:
>   * introduce support for live migration as defined in
>   * include/uapi/linux/vfio.h
>   * introduce 'max_fds' and 'migration' capabilities:
>   * remove 'index' from VFIO_USER_DEVICE_GET_IRQ_INFO
>   * fix minor typos and reworded some text for clarity
>
> Changed since v5:
>   * fix minor typos
>   * separate VFIO_USER_DMA_MAP and VFIO_USER_DMA_UNMAP
>   * clarify meaning of VFIO bitmap size field
>   * move version major/minor outside JSON
>   * client proposes version first
>

What was the rationale? (See below)

  * make Errno optional in message header
>   * clarification about message ID uniqueness
>   * clarify that server->client request can appear in between
>     client->server request/reply
>
> Changed since v6:
>   * put JSON strings in double quotes
>   * clarify reply behavior on error
>   * introduce max message size capability
>   * clarify semantics when failing to map multiple DMA regions in a
>     single command
>
> You can focus on v6 to v7 changes by cloning my fork
> (https://github.com/tmakatos/qemu) and doing:
>
>         git diff refs/tags/vfio-user/v6 refs/heads/vfio-user/v7
> ---
>  MAINTAINERS              |    6 +
>  docs/devel/index.rst     |    1 +
>  docs/devel/vfio-user.rst | 1662
> ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1669 insertions(+)
>  create mode 100644 docs/devel/vfio-user.rst
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68bc160f41..6a4c662976 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1766,6 +1766,12 @@ F: hw/vfio/ap.c
>  F: docs/system/s390x/vfio-ap.rst
>  L: qemu-s390x@nongnu.org
>
> +vfio-user
> +M: John G Johnson <john.g.johnson@oracle.com>
> +M: Thanos Makatos <thanos.makatos@nutanix.com>
> +S: Supported
> +F: docs/devel/vfio-user.rst
> +
>  vhost
>  M: Michael S. Tsirkin <mst@redhat.com>
>  S: Supported
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index f10ed77e4c..2e2cba28c6 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -35,3 +35,4 @@ Contents:
>     clocks
>     qom
>     block-coroutine-wrapper
> +   vfio-user
> diff --git a/docs/devel/vfio-user.rst b/docs/devel/vfio-user.rst
> new file mode 100644
> index 0000000000..d15a228a1a
> --- /dev/null
> +++ b/docs/devel/vfio-user.rst
> @@ -0,0 +1,1662 @@
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
> +process outside of a Virtual Machine Monitor (VMM). vfio-user devices
> consist
> +of a generic VFIO device type, living inside the VMM, which we call the
> client,
> +and the core device implementation, living outside the VMM, which we cal=
l
> the
> +server.
> +
> +The `Linux VFIO ioctl interface <
> https://www.kernel.org/doc/html/latest/driver-api/vfio.html>`_
> +been chosen as the base for this protocol for the following reasons:
> +
> +1) It is a mature and stable API, backed by an extensively used framewor=
k.
> +2) The existing VFIO client implementation in QEMU (qemu/hw/vfio/) can b=
e
> +   largely reused.
> +
> +.. Note::
> +   In a proof of concept implementation it has been demonstrated that
> using VFIO
> +   over a UNIX domain socket is a viable option. vfio-user is designed
> with
> +   QEMU in mind, however it could be used by other client applications.
> The
> +   vfio-user protocol does not require that QEMU's VFIO client
> implementation
> +   is used in QEMU.
> +
> +None of the VFIO kernel modules are required for supporting the protocol=
,
> +neither in the client nor the server, only the source header files are
> used.
> +
> +The main idea is to allow a virtual device to function in a separate
> process in
> +the same host over a UNIX domain socket. A UNIX domain socket (AF_UNIX) =
is
> +chosen because file descriptors can be trivially sent over it, which in
> turn
> +allows:
> +
> +* Sharing of client memory for DMA with the server.
> +* Sharing of server memory with the client for fast MMIO.
> +* Efficient sharing of eventfd's for triggering interrupts.
> +
> +Other socket types could be used which allow the server to run in a
> separate
> +guest in the same host (AF_VSOCK) or remotely (AF_INET). Theoretically t=
he
> +underlying transport does not necessarily have to be a socket, however w=
e
> do
> +not examine such alternatives. In this protocol version we focus on usin=
g
> a
> +UNIX domain socket and introduce basic support for the other two types o=
f
> +sockets without considering performance implications.
> +
> +While passing of file descriptors is desirable for performance reasons,
> it is
> +not necessary neither for the client nor for the server to support it in
> order
> +to implement the protocol. There is always an in-band, message-passing
> fall
> +back mechanism.
> +
> +VFIO
> +=3D=3D=3D=3D
> +VFIO is a framework that allows a physical device to be securely passed
> through
> +to a user space process; the device-specific kernel driver does not driv=
e
> the
> +device at all.  Typically, the user space process is a VMM and the devic=
e
> is
> +passed through to it in order to achieve high performance. VFIO provides
> an API
> +and the required functionality in the kernel. QEMU has adopted VFIO to
> allow a
> +guest to directly access physical devices, instead of emulating them in
> +software.
> +
> +vfio-user reuses the core VFIO concepts defined in its API, but
> implements them
> +as messages to be sent over a socket. It does not change the kernel-base=
d
> VFIO
> +in any way, in fact none of the VFIO kernel modules need to be loaded to
> use
> +vfio-user. It is also possible for the client to concurrently use the
> current
> +kernel-based VFIO for one device, and vfio-user for another device.
> +
> +VFIO Device Model
> +-----------------
> +A device under VFIO presents a standard interface to the user process.
> Many of
> +the VFIO operations in the existing interface use the ioctl() system
> call, and
> +references to the existing interface are called the ioctl()
> implementation in
> +this document.
> +
> +The following sections describe the set of messages that implement the
> VFIO
> +interface over a socket. In many cases, the messages are direct
> translations of
> +data structures used in the ioctl() implementation. Messages derived fro=
m
> +ioctl()s will have a name derived from the ioctl() command name.  E.g.,
> the
> +VFIO_GET_INFO ioctl() command becomes a VFIO_USER_GET_INFO message.  The
> +purpose of this reuse is to share as much code as feasible with the
> ioctl()
> +implementation.
> +
> +Connection Initiation
> +^^^^^^^^^^^^^^^^^^^^^
> +After the client connects to the server, the initial server message is
> +VFIO_USER_VERSION to propose a protocol version and set of capabilities =
to
> +apply to the session. The client replies with a compatible version and
> set of
> +capabilities it supports, or closes the connection if it cannot support
> the
> +advertised version.
>

Ok, so the server announces first. (it makes sense to me, as the client is
more adjustable than the server - and it allows to discover server caps)

+
> +DMA Memory Configuration
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +The client uses VFIO_USER_DMA_MAP and VFIO_USER_DMA_UNMAP messages to
> inform
> +the server of the valid DMA ranges that the server can access on behalf
> +of a device. DMA memory may be accessed by the server via
> VFIO_USER_DMA_READ
> +and VFIO_USER_DMA_WRITE messages over the socket.
> +
> +An optimization for server access to client memory is for the client to
> provide
> +file descriptors the server can mmap() to directly access client memory.
> Note
> +that mmap() privileges cannot be revoked by the client, therefore file
> +descriptors should only be exported in environments where the client
> trusts the
> +server not to corrupt guest memory.
> +
> +Device Information
> +^^^^^^^^^^^^^^^^^^
> +The client uses a VFIO_USER_DEVICE_GET_INFO message to query the server
> for
> +information about the device. This information includes:
> +
> +* The device type and whether it supports reset (``VFIO_DEVICE_FLAGS_``)=
,
> +* the number of device regions, and
> +* the device presents to the client the number of interrupt types the
> device
> +  supports.
> +
> +Region Information
> +^^^^^^^^^^^^^^^^^^
> +The client uses VFIO_USER_DEVICE_GET_REGION_INFO messages to query the
> server
> +for information about the device's memory regions. This information
> describes:
> +
> +* Read and write permissions, whether it can be memory mapped, and
> whether it
> +  supports additional capabilities (``VFIO_REGION_INFO_CAP_``).
> +* Region index, size, and offset.
> +
> +When a region can be mapped by the client, the server provides a file
> +descriptor which the client can mmap(). The server is responsible for
> polling
> +for client updates to memory mapped regions.
> +
> +Region Capabilities
> +"""""""""""""""""""
> +Some regions have additional capabilities that cannot be described
> adequately
> +by the region info data structure. These capabilities are returned in th=
e
> +region info reply in a list similar to PCI capabilities in a PCI device'=
s
> +configuration space.
> +
> +Sparse Regions
> +""""""""""""""
> +A region can be memory-mappable in whole or in part. When only a subset
> of a
> +region can be mapped by the client, a VFIO_REGION_INFO_CAP_SPARSE_MMAP
> +capability is included in the region info reply. This capability describ=
es
> +which portions can be mapped by the client.
> +
> +.. Note::
> +   For example, in a virtual NVMe controller, sparse regions can be used
> so
> +   that accesses to the NVMe registers (found in the beginning of BAR0)
> are
> +   trapped (an infrequent event), while allowing direct access to the
> doorbells
> +   (an extremely frequent event as every I/O submission requires a write
> to
> +   BAR0), found right after the NVMe registers in BAR0.
> +
> +Device-Specific Regions
> +"""""""""""""""""""""""
> +
> +A device can define regions additional to the standard ones (e.g. PCI
> indexes
> +0-8). This is achieved by including a VFIO_REGION_INFO_CAP_TYPE capabili=
ty
> +in the region info reply of a device-specific region. Such regions are
> reflected
> +in ``struct vfio_device_info.num_regions``. Thus, for PCI devices this
> value can
> +be equal to, or higher than, VFIO_PCI_NUM_REGIONS.
> +
> +Interrupts
> +^^^^^^^^^^
> +The client uses VFIO_USER_DEVICE_GET_IRQ_INFO messages to query the
> server for
> +the device's interrupt types. The interrupt types are specific to the bu=
s
> the
> +device is attached to, and the client is expected to know the
> capabilities of
> +each interrupt type. The server can signal an interrupt either with
> +VFIO_USER_VM_INTERRUPT messages over the socket, or can directly inject
> +interrupts into the guest via an event file descriptor. The client
> configures
> +how the server signals an interrupt with VFIO_USER_SET_IRQS messages.
> +
> +Device Read and Write
> +^^^^^^^^^^^^^^^^^^^^^
> +When the guest executes load or store operations to device memory, the
> client
> +forwards these operations to the server with VFIO_USER_REGION_READ or
> +VFIO_USER_REGION_WRITE messages. The server will reply with data from th=
e
> +device on read operations or an acknowledgement on write operations.
> +
> +DMA
> +^^^
> +When a device performs DMA accesses to guest memory, the server will
> forward
> +them to the client with VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE
> messages.
> +These messages can only be used to access guest memory the client has
> +configured into the server.
> +
> +Protocol Specification
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +To distinguish from the base VFIO symbols, all vfio-user symbols are
> prefixed
> +with vfio_user or VFIO_USER. In revision 0.1, all data is in the
> little-endian
> +format, although this may be relaxed in future revision in cases where t=
he
> +client and server are both big-endian. The messages are formatted for
> seamless
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
> +client/server connection. It is a server-side implementation detail
> whether a
> +single server handles multiple virtual devices from the same or multiple
> +clients. The location of the socket is implementation-specific.
> Multiplexing
> +clients, devices, and servers over the same socket is not supported in
> this
> +version of the protocol.
> +
> +Authentication
> +--------------
> +For AF_UNIX, we rely on OS mandatory access controls on the socket files=
,
> +therefore it is up to the management layer to set up the socket as
> required.
> +Socket types than span guests or hosts will require a proper
> authentication
> +mechanism. Defining that mechanism is deferred to a future version of th=
e
> +protocol.
> +
> +Command Concurrency
> +-------------------
> +A client may pipeline multiple commands without waiting for previous
> command
> +replies.  The server will process commands in the order they are
> received.  A
> +consequence of this is if a client issues a command with the *No_reply*
> bit,
> +then subseqently issues a command without *No_reply*, the older command
> will
> +have been processed before the reply to the younger command is sent by t=
he
> +server.  The client must be aware of the device's capability to process
> +concurrent commands if pipelining is used.  For example, pipelining allo=
ws
> +multiple client threads to concurently access device memory; the client
> must
> +ensure these acceses obey device semantics.
> +
> +An example is a frame buffer device, where the device may allow concurre=
nt
> +access to different areas of video memory, but may have indeterminate
> behavior
> +if concurrent acceses are performed to command or status registers.
> +
> +Note that unrelated messages sent from the sevrer to the client can
> appear in
> +between a client to server request/reply and vice versa.
> +
> +Socket Disconnection Behavior
> +-----------------------------
> +The server and the client can disconnect from each other, either
> intentionally
> +or unexpectedly. Both the client and the server need to know how to
> handle such
> +events.
> +
> +Server Disconnection
> +^^^^^^^^^^^^^^^^^^^^
> +A server disconnecting from the client may indicate that:
> +
> +1) A virtual device has been restarted, either intentionally (e.g.
> because of a
> +   device update) or unintentionally (e.g. because of a crash).
> +2) A virtual device has been shut down with no intention to be restarted=
.
> +
> +It is impossible for the client to know whether or not a failure is
> +intermittent or innocuous and should be retried, therefore the client
> should
> +reset the VFIO device when it detects the socket has been disconnected.
> +Error recovery will be driven by the guest's device error handling
> +behavior.
> +
> +Client Disconnection
> +^^^^^^^^^^^^^^^^^^^^
> +The client disconnecting from the server primarily means that the client
> +has exited. Currently, this means that the guest is shut down so the
> device is
> +no longer needed therefore the server can automatically exit. However,
> there
> +can be cases where a client disconnection should not result in a server
> exit:
> +
> +1) A single server serving multiple clients.
> +2) A multi-process QEMU upgrading itself step by step, which is not yet
> +   implemented.
> +
> +Therefore in order for the protocol to be forward compatible the server
> should
> +take no action when the client disconnects. If anything happens to the
> client
> +the control stack will know about it and can clean up resources
> +accordingly.
> +
> +Request Retry and Response Timeout
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +A failed command is a command that has been successfully sent and has be=
en
> +responded to with an error code. Failure to send the command in the firs=
t
> place
> +(e.g. because the socket is disconnected) is a different type of error
> examined
> +earlier in the disconnect section.
> +
> +.. Note::
> +   QEMU's VFIO retries certain operations if they fail. While this makes
> sense
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
> ++----------------------------------+---------+-------------------+
> +| Name                             | Command | Request Direction |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| VFIO_USER_VERSION                | 1       | server -> client  |
>

ok

++----------------------------------+---------+-------------------+
> +| VFIO_USER_DMA_MAP                | 2       | client -> server  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_DMA_UNMAP              | 3       | client -> server  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_GET_INFO        | 4       | client -> server  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_GET_REGION_INFO | 5       | client -> server  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_GET_IRQ_INFO    | 6       | client -> server  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_SET_IRQS        | 7       | client -> server  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_REGION_READ            | 8       | client -> server  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_REGION_WRITE           | 9       | client -> server  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_DMA_READ               | 10      | server -> client  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_DMA_WRITE              | 11      | server -> client  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_VM_INTERRUPT           | 12      | server -> client  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_DEVICE_RESET           | 13      | client -> server  |
> ++----------------------------------+---------+-------------------+
> +| VFIO_USER_DIRTY_PAGES            | 14      | client -> server  |
> ++----------------------------------+---------+-------------------+
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
> +* *Message ID* identifies the message, and is echoed in the command's
> reply
> +  message. Message IDs belong entirely to the sender, can be re-used (ev=
en
> +  concurrently) and the receiver must not make any assumptions about the=
ir
> +  uniqueness.
> +* *Command* specifies the command to be executed, listed in Commands_.
> +* *Message size* contains the size of the entire message, including the
> header.
> +* *Flags* contains attributes of the message:
> +
> +  * The *Type* bits indicate the message type.
> +
> +    *  *Command* (value 0x0) indicates a command message.
> +    *  *Reply* (value 0x1) indicates a reply message acknowledging a
> previous
> +       command with the same message ID.
> +  * *No_reply* in a command message indicates that no reply is needed fo=
r
> this command.
> +    This is commonly used when multiple commands are sent, and only the
> last needs
> +    acknowledgement.
> +  * *Error* in a reply message indicates the command being acknowledged
> had
> +    an error. In this case, the *Error* field will be valid.
> +
> +* *Error* in a reply message is an optional UNIX errno value. It may be
> zero
> +  even if the Error bit is set in Flags. It is reserved in a command
> message.
> +
> +Each command message in Commands_ must be replied to with a reply
> message, unless the
> +message sets the *No_Reply* bit.  The reply consists of the header with
> the *Reply*
> +bit set, plus any additional data.
> +
> +If an error occurs, the reply message must only include the reply header=
.
> +
> +VFIO_USER_VERSION
> +-----------------
> +
> +This is the initial message sent by the client after the socket
> connection is
> +established:
>


Contradictory with the above.

+
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
>
> ++---------------+--------+----------------------------------------------=
--+
> +| Name          | Offset | Size
>  |
>
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +| version major | 16     | 2
> |
>
> ++---------------+--------+----------------------------------------------=
--+
> +| version minor | 18     | 2
> |
>
> ++---------------+--------+----------------------------------------------=
--+
> +| version data  | 22     | variable (including terminating NUL
> |
> +|               |        | character). Optional.
> |
>
> ++---------------+--------+----------------------------------------------=
--+
>


Annoying that this version won't be easily human-readable. (you can't
simply netcat to a vfio server and get the version)
iirc, earlier versions of the proposal just sent a json message straight
without a header.

This initial text-phase is imho more interesting, as the binary protocol
requirements are mostly for machine-convenience and performance reasons
when the device is actually running.

+
> +Version Data Format
> +^^^^^^^^^^^^^^^^^^^
> +
> +The version data is an optional JSON byte array with the following forma=
t:
> +
>
> ++--------------------+------------------+-------------------------------=
----+
> +| Name               | Type             | Description
>    |
>
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+
> +| ``"capabilities"`` | collection of    | Contains common capabilities
> that |
> +|                    | name/value pairs | the sender supports. Optional.
>   |
>
> ++--------------------+------------------+-------------------------------=
----+
> +
> +Capabilities:
> +
>
> ++--------------------+------------------+-------------------------------=
------+
> +| Name               | Type             | Description
>      |
>
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+
> +| ``"max_fds"``      | number           | Maximum number of file
> descriptors  |
> +|                    |                  | the can be received by the
> sender.  |
> +|                    |                  | Optional. If not specified the=
n
> the |
> +|                    |                  | receiver must assume
>     |
> +|                    |                  | ``"max_fds"=3D1``.
>     |
>
> ++--------------------+------------------+-------------------------------=
------+
> +| ``"max_msg_size"`` | number           | Maximum message size in bytes
> that  |
> +|                    |                  | the receiver can handle,
> including  |
> +|                    |                  | the header. Optional. If not
>     |
> +|                    |                  | specified then the receiver
> must    |
> +|                    |                  | assume
> ``"max_msg_size"=3D4096``.     |
>
> ++--------------------+------------------+-------------------------------=
------+
> +| ``"migration"``    | collection of    | Migration capability
> parameters. If |
> +|                    | name/value pairs | missing then migration is not
>      |
> +|                    |                  | supported by the sender.
>     |
>
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
> +Upon accepting a connection, the client must send a VFIO_USER_VERSION
> message
> +proposing a protocol version and a set of capabilities. The server
> compares
> +these with the versions and capabilities it supports and sends a
> +VFIO_USER_VERSION reply according to the following rules.
>

I don't think the server will be as adaptable as the client. Again, it
feels backward to me.

+
> +* The major version in the reply must be the same as proposed. If the
> client
> +  does not support the proposed major, it closes the connection.
> +* The minor version in the reply must be equal to or less than the minor
> +  version proposed.
> +* The capability list must be a subset of those proposed. If the server
> +  requires a capability the client did not include, it closes the
> connection.
> +
> +The protocol major version will only change when incompatible protocol
> changes
> +are made, such as changing the message format. The minor version may
> change
> +when compatible changes are made, such as adding new messages or
> capabilities,
> +Both the client and server must support all minor versions less than the
> +maximum minor version it supports. E.g., an implementation that supports
> +version 1.3 must also support 1.0 through 1.2.
> +
> +When making a change to this specification, the protocol version number
> must
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
> +This command message is sent by the client to the server to inform it of
> the
> +memory regions the server can access. It must be sent before the server
> can
> +perform any DMA to the client. It is normally sent directly after the
> version
> +handshake is completed, but may also occur when memory is added to the
> client,
> +or if the client uses a vIOMMU. If the client does not expect the server
> to
> +perform DMA then it does not need to send to the server VFIO_USER_DMA_MA=
P
> +commands. If the server does not need to perform DMA then it can ignore
> such
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
> +* *Offset* is the file offset of the region with respect to the
> associated file
> +  descriptor.
> +* *Protections* are the region's protection attributes as encoded in
> +  ``<sys/mman.h>``.
> +* *Flags* contains the following region attributes:
> +
> +  * *Mappable* indicates that the region can be mapped via the mmap()
> system
> +    call using the file descriptor provided in the message meta-data.
> +
> +This structure is 32 bytes in size, so the message size is:
> +16 + (# of table entries * 32).
> +
> +If a DMA region being added can be directly mapped by the server, an
> array of
> +file descriptors must be sent as part of the message meta-data. Each
> mappable
> +region entry must have a corresponding file descriptor. On AF_UNIX
> sockets, the
> +file descriptors must be passed as SCM_RIGHTS type ancillary data.
> Otherwise,
> +if a DMA region cannot be directly mapped by the server, it can be
> accessed by
> +the server using VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE messages,
> explained
> +in `Read and Write Operations`_. A command to map over an existing regio=
n
> must
> +be failed by the server with ``EEXIST`` set in error field in the reply.
> +
> +Adding multiple DMA regions can partially fail. The response does not
> indicate
> +which regions were added and which were not, therefore it is a client
> +implementation detail how to recover from the failure.
> +
> +.. Note::
> +   The server can optionally remove succesfully added DMA regions making
> this
> +   operation atomic.
> +   The client can recover by attempting to unmap one by one all the DMA
> regions
> +   in the VFIO_USER_DMA_MAP command, ignoring failures for regions that
> do not
> +   exist.
> +
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
> +This command message is sent by the client to the server to inform it
> that a
> +DMA region, previously made available via a VFIO_USER_DMA_MAP command
> message,
> +is no longer available for DMA. It typically occurs when memory is
> subtracted
> +from the client or if the client uses a vIOMMU. If the client does not
> expect
> +the server to perform DMA then it does not need to send to the server
> +VFIO_USER_DMA_UNMAP commands. If the server does not need to perform DMA
> then
> +it can ignore such commands but it must still reply to them. The table i=
s
> an
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
> +* *Offset* is the file offset of the region with respect to the
> associated file
> +  descriptor.
> +* *Protections* are the region's protection attributes as encoded in
> +  ``<sys/mman.h>``.
> +* *Flags* contains the following region attributes:
> +
> +  * *VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP* indicates that a dirty page
> bitmap
> +    must be populated before unmapping the DMA region. The client must
> provide
> +    a ``struct vfio_bitmap`` in the VFIO bitmaps field for each region,
> with
> +    the ``vfio_bitmap.pgsize`` and ``vfio_bitmap.size`` fields
> initialized.
> +
> +* *VFIO Bitmaps* contains one ``struct vfio_bitmap`` per region if
> +  ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags.
> +
> +VFIO bitmap format
> +^^^^^^^^^^^^^^^^^^
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
> +* *size* is the size for the bitmap, in bytes, excluding the VFIO bitmap
> header.
> +* *data* This field is unused in vfio-user.
> +
> +The VFIO bitmap structure is defined in ``<linux/vfio.h>``
> +(``struct vfio_bitmap``).
> +
> +If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is not set in Flags then the
> size
> +of the message is: 16 + (# of table entries * 32).
> +If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags then the siz=
e
> of
> +the message is: 16 + (# of table entries * 56).
> +
> +Upon receiving a VFIO_USER_DMA_UNMAP command, if the file descriptor is
> mapped
> +then the server must release all references to that DMA region before
> replying,
> +which includes potentially in flight DMA transactions. Removing a portio=
n
> of a
> +DMA region is possible. If the VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP bit
> is set
> +in the request, the server must append to the header the ``struct
> vfio_bitmap``
> +received in the command followed by the bitmap, for each region. Thus, t=
he
> +message size the client should expect is the size of the header plus the
> size
> +of ``struct vfio_bitmap`` plus ``vfio_bitmap.size`` bytes for each
> region. Each
> +bit in the bitmap represents one page of size ``vfio_bitmap.pgsize``.
> +
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
> +| Message size | 16 in command, 32 in reply |
> ++--------------+----------------------------+
> +| Flags        | Reply bit set in reply     |
> ++--------------+----------------------------+
> +| Error        | 0/errno                    |
> ++--------------+----------------------------+
> +| Device info  | VFIO device info           |
> ++--------------+----------------------------+
> +
> +This command message is sent by the client to the server to query for
> basic
> +information about the device. Only the message header is needed in the
> command
> +message.  The VFIO device info structure is defined in ``<linux/vfio.h>`=
`
> +(``struct vfio_device_info``).
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
> +* *argsz* is the size of the VFIO device info structure.
> +* *flags* contains the following device attributes.
> +
> +  * VFIO_DEVICE_FLAGS_RESET indicates that the device supports the
> +    VFIO_USER_DEVICE_RESET message.
> +  * VFIO_DEVICE_FLAGS_PCI indicates that the device is a PCI device.
> +
> +* *num_regions* is the number of memory regions that the device exposes.
> +* *num_irqs* is the number of distinct interrupt types that the device
> supports.
> +
> +This version of the protocol only supports PCI devices. Additional
> devices may
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
> +defined in ``<linux/vfio.h>`` (``struct vfio_region_info``). Since the
> client
> +does not know the size of the capabilities, the size of the reply it
> should
> +expect is 48 plus any capabilities whose size is indicated in the size
> field of
> +the reply header.
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
> +  * *VFIO_REGION_INFO_FLAG_WRITE* allows client write access to the
> region.
> +  * *VFIO_REGION_INFO_FLAG_MMAP* specifies the client can mmap() the
> region.
> +    When this flag is set, the reply will include a file descriptor in i=
ts
> +    meta-data. On AF_UNIX sockets, the file descriptors will be passed a=
s
> +    SCM_RIGHTS type ancillary data.
> +  * *VFIO_REGION_INFO_FLAG_CAPS* indicates additional capabilities found
> in the
> +    reply.
> +
> +* *index* is the index of memory region being queried, it is the only
> field
> +  that is required to be set in the command message.
> +* *cap_offset* describes where additional region capabilities can be
> found.
> +  cap_offset is relative to the beginning of the VFIO region info
> structure.
> +  The data structure it points is a VFIO cap header defined in
> +  ``<linux/vfio.h>``.
> +* *size* is the size of the region.
> +* *offset* is the offset given to the mmap() system call for regions wit=
h
> the
> +  MMAP attribute. It is also used as the base offset when mapping a VFIO
> +  sparse mmap area, described below.
> +
> +VFIO Region capabilities
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +The VFIO region information can also include a capabilities list. This
> list is
> +similar to a PCI capability list - each entry has a common header that
> +identifies a capability and where the next capability in the list can be
> found.
> +The VFIO capability header format is defined in ``<linux/vfio.h>``
> (``struct
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
> +* *next* specifies the offset of the next capability in the capability
> list. It
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
> +direct access by the client via mmap(). The VFIO sparse mmap area is
> defined in
> +``<linux/vfio.h>`` (``struct vfio_region_sparse_mmap_area``).
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
> +* *offset* and size describe a single area that can be mapped by the
> client.
> +  There will be nr_areas pairs of offset and size. The offset will be
> added to
> +  the base offset given in the VFIO_USER_DEVICE_GET_REGION_INFO to form
> the
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
> +subregion is accessed like any other part of a standard vfio-user PCI
> region
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
> +  The client initiates device state transition by writing the intended
> state.
> +  The server must respond only after it has succesfully transitioned to
> the new
> +  state. If an error occurs then the server must respond to the
> +  VFIO_USER_REGION_WRITE operation with the Error field set accordingly
> and
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
> +
> +-------------------------+---------+---------+---------------+----------=
+----------+
> +  | |darr| From / To |rarr| | Stopped | Running | Stop-and-copy |
> Pre-copy | Resuming |
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+
> +  | Stopped                 |    \-   |    0    |       0       |    0
>  |     0    |
> +
> +-------------------------+---------+---------+---------------+----------=
+----------+
> +  | Running                 |    1    |    \-   |       1       |    1
>  |     1    |
> +
> +-------------------------+---------+---------+---------------+----------=
+----------+
> +  | Stop-and-copy           |    1    |    0    |       \-      |    0
>  |     0    |
> +
> +-------------------------+---------+---------+---------------+----------=
+----------+
> +  | Pre-copy                |    0    |    0    |       1       |    \-
>   |     0    |
> +
> +-------------------------+---------+---------+---------------+----------=
+----------+
> +  | Resuming                |    0    |    1    |       0       |    0
>  |     \-   |
> +
> +-------------------------+---------+---------+---------------+----------=
+----------+
> +
> +  A device is migrated to the destination as follows:
> +
> +  * The source client transitions the device state from the running stat=
e
> to
> +    the pre-copy state. This transition is optional for the client but
> must be
> +    supported by the server. The souce server starts sending device stat=
e
> data
> +    to the source client through the migration region while the device i=
s
> +    running.
> +
> +  * The source client transitions the device state from the running stat=
e
> or the
> +    pre-copy state to the stop-and-copy state. The source server stops t=
he
> +    device, saves device state and sends it to the source client through
> the
> +    migration region.
> +
> +  The source client is responsible for sending the migration data to the
> +  destination client.
> +
> +  A device is resumed on the destination as follows:
> +
> +  * The destination client transitions the device state from the running
> state
> +    to the resuming state. The destination server uses the device state
> data
> +    received through the migration region to resume the device.
> +
> +  * The destination client provides saved device state to the destinatio=
n
> +    server and then transitions the device to back to the running state.
> +
> +* *reserved* This field is reserved and any access to it must be ignored
> by the
> +  server.
> +
> +* *pending_bytes* Remaining bytes to be migrated by the server. This
> field is
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
> +* *data_size* Contains the size, in bytes, of the amount of data copied
> to:
> +
> +  * the source migration region by the source server during the pre-copy
> or
> +    stop-and copy state, or
> +
> +  * the destination migration region by the destination client during th=
e
> +    resuming state.
> +
> +Device-specific data must be stored at any position after
> +`struct vfio_device_migration_info`. Note that the migration region can =
be
> +memory mappable, even partially. In practise, only the migration data
> portion
> +can be memory mapped.
> +
> +The client processes device state data during the pre-copy and the
> +stop-and-copy state in the following iterative manner:
> +
> +  1. The client reads `pending_bytes` to mark a new iteration. Repeated
> reads
> +     of this field is an idempotent operation. If there are no migration
> data
> +     to be consumed then the next step depends on the current device
> state:
> +
> +     * pre-copy: the client must try again.
> +
> +     * stop-and-copy: this procedure can end and the device can now star=
t
> +       resuming on the destination.
> +
> +  2. The client reads `data_offset`; at thich point the server must make
> +     available a portion of migration data at this offset to be read by
> the
> +     client, which must happen *before* completing the read operation. T=
he
> +     amount of data to be read must be stored in the `data_size` field,
> which
> +     the client reads next.
> +
> +  3. The client reads `data_size` to determine the amount of migration
> data
> +     available.
> +
> +  4. The client reads and processes the migration data.
> +
> +  5. Go to step 1.
> +
> +Note that the client can transition the device from the pre-copy state t=
o
> the
> +stop-and-copy state at any time; `pending_bytes` does not need to become
> zero.
> +
> +The client initializes the device state on the destination by setting th=
e
> +device state in the resuming state and writing the migration data to the
> +destination migration region at `data_offset` offset. The client can
> write the
> +source migration data in an iterative manner and the server must consume
> this
> +data before completing each write operation, updating the `data_offset`
> field.
> +The server must apply the source migration data on the device resume
> state. The
> +client must write data on the same order and transction size as read.
> +
> +If an error occurs then the server must fail the read or write operation=
.
> It is
> +an implementation detail of the client how to handle errors.
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
> +| Command      | 6                      |
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
> +  * *VFIO_IRQ_INFO_EVENTFD* indicates the IRQ type can support server
> eventfd
> +    signalling.
> +  * *VFIO_IRQ_INFO_MASKABLE* indicates that the IRQ type supports the
> MASK and
> +    UNMASK actions in a VFIO_USER_DEVICE_SET_IRQS message.
> +  * *VFIO_IRQ_INFO_AUTOMASKED* indicates the IRQ type masks itself after
> being
> +    triggered, and the client must send an UNMASK action to receive new
> +    interrupts.
> +  * *VFIO_IRQ_INFO_NORESIZE* indicates VFIO_USER_SET_IRQS operations set=
up
> +    interrupts as a set, and new sub-indexes cannot be enabled without
> disabling
> +    the entire type.
> +
> +* index is the index of IRQ type being queried, it is the only field tha=
t
> is
> +  required to be set in the command message.
> +* count describes the number of interrupts of the queried type.
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
> +| Command      | 7                      |
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
> +This command message is sent by the client to the server to set actions
> for
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
*
> field.
> +* *flags* defines the action performed on the interrupt range. The DATA
> flags
> +  describe the data field sent in the message; the ACTION flags describe
> the
> +  action to be performed. The flags are mutually exclusive for both sets=
.
> +
> +  * *VFIO_IRQ_SET_DATA_NONE* indicates there is no data field in the
> command.
> +    The action is performed unconditionally.
> +  * *VFIO_IRQ_SET_DATA_BOOL* indicates the data field is an array of
> boolean
> +    bytes. The action is performed if the corresponding boolean is true.
> +  * *VFIO_IRQ_SET_DATA_EVENTFD* indicates an array of event file
> descriptors
> +    was sent in the message meta-data. These descriptors will be
> signalled when
> +    the action defined by the action flags occurs. In AF_UNIX sockets, t=
he
> +    descriptors are sent as SCM_RIGHTS type ancillary data.
> +  * *VFIO_IRQ_SET_ACTION_MASK* indicates a masking event. It can be used
> with
> +    VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to mask an
> interrupt, or
> +    with VFIO_IRQ_SET_DATA_EVENTFD to generate an event when the guest
> masks
> +    the interrupt.
> +  * *VFIO_IRQ_SET_ACTION_UNMASK* indicates an unmasking event. It can be
> used
> +    with VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to unmask an
> +    interrupt, or with VFIO_IRQ_SET_DATA_EVENTFD to generate an event
> when the
> +    guest unmasks the interrupt.
> +  * *VFIO_IRQ_SET_ACTION_TRIGGER* indicates a triggering event. It can b=
e
> used
> +    with VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to trigger an
> +    interrupt, or with VFIO_IRQ_SET_DATA_EVENTFD to generate an event
> when the
> +    server triggers the interrupt.
> +
> +* *index* is the index of IRQ type being setup.
> +* *start* is the start of the sub-index being set.
> +* *count* describes the number of sub-indexes being set. As a special
> case, a
> +  count of 0 with data flags of VFIO_IRQ_SET_DATA_NONE disables all
> interrupts
> +  of the index.
> +* *data* is an optional field included when the
> +  VFIO_IRQ_SET_DATA_BOOL flag is present. It contains an array of boolea=
ns
> +  that specify whether the action is to be performed on the correspondin=
g
> +  index. It's used when the action is only performed on a subset of the
> range
> +  specified.
> +
> +Not all interrupt types support every combination of data and action
> flags.
> +The client must know the capabilities of the device and IRQ index before
> it
> +sends a VFIO_USER_DEVICE_SET_IRQ message.
> +
> +.. _Read and Write Operations:
> +
> +Read and Write Operations
> +-------------------------
> +
> +Not all I/O operations between the client and server can be done via
> direct
> +access of memory mapped with an mmap() call. In these cases, the client
> and
> +server use messages sent over the socket. It is expected that these
> operations
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
> +VFIO_USER_DMA_WRITE messages. These also share a common data structure
> that
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
> +* *Address* is the area of client memory being accessed. This address
> must have
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
> +| Command      | 8                      |
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
> +This command message is sent from the client to the server to read from
> server
> +memory.  In the command messages, there is no data, and the count is the
> amount
> +of data to be read. The reply message must include the data read, and it=
s
> count
> +field is the amount of data read.
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
> +| Command      | 9                      |
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
> +This command message is sent from the client to the server to write to
> server
> +memory.  The command message must contain the data to be written, and it=
s
> count
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
> +| Command      | 10                     |
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
> +This command message is sent from the server to the client to read from
> client
> +memory.  In the command message, there is no data, and the count must
> will be
> +the amount of data to be read. The reply message must include the data
> read,
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
> +This command message is sent from the server to the client to write to
> client
> +memory.  The command message must contain the data to be written, and it=
s
> count
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
> +| Command        | 12                     |
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
> +This command message is sent from the server to the client to signal the
> device
> +has raised an interrupt.
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
> +* *Sub-index* is relative to the IRQ index, e.g., the vector number used
> in PCI
> +  MSI/X type interrupts.
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
> +| Command      | 13                     |
> ++--------------+------------------------+
> +| Message size | 16                     |
> ++--------------+------------------------+
> +| Flags        | Reply bit set in reply |
> ++--------------+------------------------+
> +| Error        | 0/errno                |
> ++--------------+------------------------+
> +
> +This command message is sent from the client to the server to reset the
> device.
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
> +| Command            | 14                     |
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
> +This command is analogous to VFIO_IOMMU_DIRTY_PAGES. It is sent by the
> client
> +to the server in order to control logging of dirty pages, usually during
> a live
> +migration. The VFIO dirty bitmap structure is defined in
> ``<linux/vfio.h>``
> +(``struct vfio_iommu_type1_dirty_bitmap``).
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
> +  * *VFIO_IOMMU_DIRTY_PAGES_FLAG_START* instructs the server to start
> logging
> +    pages it dirties. Logging continues until explicitly disabled by
> +    VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP.
> +
> +  * *VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP* instructs the server to stop
> logging
> +    dirty pages.
> +
> +  * *VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP* requests from the server to
> return
> +    the dirty bitmap for a specific IOVA range. The IOVA range is
> specified by
> +    "VFIO dirty bitmap get" structure, which must immediatelly follow th=
e
> +    "VFIO dirty bitmap" structure, explained next. This operation is onl=
y
> valid
> +    if logging of dirty pages has been previously started. The server mu=
st
> +    respond the same way it does for VFIO_USER_DMA_UNMAP (the dirty page=
s
> +    bitmap must follow the response header).
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
> +* *bitmap* is the VFIO bitmap (``struct vfio_bitmap``), with the same
> semantics
> +  as VFIO_USER_DMA_UNMAP.
> +
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
> +However, once support for live migration for VFIO devices is finalized
> some
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
> +* No assumptions must be made as to what access the backend program has
> on the
> +  system.
> +* File descriptors 0, 1 and 2 must exist, must have regular
> +  stdin/stdout/stderr semantics, and can be redirected.
> +* The backend program must honor the SIGTERM signal.
> +* The backend program must accept the following commands line options:
> +
> +  * ``--socket-path=3DPATH``: path to UNIX domain socket,
> +  * ``--fd=3DFDNUM``: file descriptor for UNIX domain socket, incompatib=
le
> with
> +    ``--socket-path``
> +* The backend program must be accompanied with a JSON file stored under
> +  ``/usr/share/vfio-user``.
> --
> 2.12.2
>

Is there a schema for it? (similar to docs/interop/vhost-user.json). If
it's left for later, then a TODO note should be left.


--=20
Marc-Andr=C3=A9 Lureau

--0000000000004fb1eb05b562f7e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 30, 2020 at 8:14 PM Thanos Makato=
s &lt;<a href=3D"mailto:thanos.makatos@nutanix.com">thanos.makatos@nutanix.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">This patch introduces the vfio-user protocol specification (formerly<br>
known as VFIO-over-socket), which is designed to allow devices to be<br>
emulated outside QEMU, in a separate process. vfio-user reuses the<br>
existing VFIO defines, structs and concepts.<br>
<br>
It has been earlier discussed as an RFC in:<br>
&quot;RFC: use VFIO over a UNIX domain socket to implement device offloadin=
g&quot;<br>
<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Thanos Makatos &lt;<a href=3D"mailto:thanos.makatos@nutanix.=
com" target=3D"_blank">thanos.makatos@nutanix.com</a>&gt;<br>
<br></blockquote><div><br></div><div>I am taking a superficial look, as I d=
on&#39;t have much  experience from implementing it (recently).<br></div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changed since v1:<br>
=C2=A0 * fix coding style issues<br>
=C2=A0 * update MAINTAINERS for VFIO-over-socket<br>
=C2=A0 * add vfio-over-socket to ToC<br>
<br>
Changed since v2:<br>
=C2=A0 * fix whitespace<br>
<br>
Changed since v3:<br>
=C2=A0 * rename protocol to vfio-user<br>
=C2=A0 * add table of contents<br>
=C2=A0 * fix Unicode problems<br>
=C2=A0 * fix typos and various reStructuredText issues<br>
=C2=A0 * various stylistic improvements<br>
=C2=A0 * add backend program conventions<br>
=C2=A0 * rewrite part of intro, drop QEMU-specific stuff<br>
=C2=A0 * drop QEMU-specific paragraph about implementation<br>
=C2=A0 * explain that passing of FDs isn&#39;t necessary<br>
=C2=A0 * minor improvements in the VFIO section<br>
=C2=A0 * various text substitutions for the sake of consistency<br>
=C2=A0 * drop paragraph about client and server, already explained in<br>
=C2=A0 * intro<br>
=C2=A0 * drop device ID<br>
=C2=A0 * drop type from version<br>
=C2=A0 * elaborate on request concurrency<br>
=C2=A0 * convert some inessential paragraphs into notes<br>
=C2=A0 * explain why some existing VFIO defines cannot be reused<br>
=C2=A0 * explain how to make changes to the protocol<br>
=C2=A0 * improve text of DMA map<br>
=C2=A0 * reword comment about existing VFIO commands<br>
=C2=A0 * add reference to Version section<br>
=C2=A0 * reset device on disconnection<br>
=C2=A0 * reword live migration section<br>
=C2=A0 * replace sys/vfio.h with linux/vfio.h<br>
=C2=A0 * drop reference to iovec<br>
=C2=A0 * use argz the same way it is used in VFIO<br>
=C2=A0 * add type field in header for clarity<br>
<br>
Changed since v4:<br>
=C2=A0 * introduce support for live migration as defined in<br>
=C2=A0 * include/uapi/linux/vfio.h<br>
=C2=A0 * introduce &#39;max_fds&#39; and &#39;migration&#39; capabilities:<=
br>
=C2=A0 * remove &#39;index&#39; from VFIO_USER_DEVICE_GET_IRQ_INFO<br>
=C2=A0 * fix minor typos and reworded some text for clarity<br>
<br>
Changed since v5:<br>
=C2=A0 * fix minor typos<br>
=C2=A0 * separate VFIO_USER_DMA_MAP and VFIO_USER_DMA_UNMAP<br>
=C2=A0 * clarify meaning of VFIO bitmap size field<br>
=C2=A0 * move version major/minor outside JSON<br>
=C2=A0 * client proposes version first<br></blockquote><div><br></div><div>=
What was the rationale? (See below)<br></div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
=C2=A0 * make Errno optional in message header<br>
=C2=A0 * clarification about message ID uniqueness<br>
=C2=A0 * clarify that server-&gt;client request can appear in between<br>
=C2=A0 =C2=A0 client-&gt;server request/reply<br>
<br>
Changed since v6:<br>
=C2=A0 * put JSON strings in double quotes<br>
=C2=A0 * clarify reply behavior on error<br>
=C2=A0 * introduce max message size capability<br>
=C2=A0 * clarify semantics when failing to map multiple DMA regions in a<br=
>
=C2=A0 =C2=A0 single command<br>
<br>
You can focus on v6 to v7 changes by cloning my fork<br>
(<a href=3D"https://github.com/tmakatos/qemu" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/tmakatos/qemu</a>) and doing:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git diff refs/tags/vfio-user/v6 refs/heads/vfio=
-user/v7<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 6 +<br>
=C2=A0docs/devel/index.rst=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0docs/devel/vfio-user.rst | 1662 +++++++++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A03 files changed, 1669 insertions(+)<br>
=C2=A0create mode 100644 docs/devel/vfio-user.rst<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 68bc160f41..6a4c662976 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -1766,6 +1766,12 @@ F: hw/vfio/ap.c<br>
=C2=A0F: docs/system/s390x/vfio-ap.rst<br>
=C2=A0L: <a href=3D"mailto:qemu-s390x@nongnu.org" target=3D"_blank">qemu-s3=
90x@nongnu.org</a><br>
<br>
+vfio-user<br>
+M: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.com" target=
=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
+M: Thanos Makatos &lt;<a href=3D"mailto:thanos.makatos@nutanix.com" target=
=3D"_blank">thanos.makatos@nutanix.com</a>&gt;<br>
+S: Supported<br>
+F: docs/devel/vfio-user.rst<br>
+<br>
=C2=A0vhost<br>
=C2=A0M: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D=
"_blank">mst@redhat.com</a>&gt;<br>
=C2=A0S: Supported<br>
diff --git a/docs/devel/index.rst b/docs/devel/index.rst<br>
index f10ed77e4c..2e2cba28c6 100644<br>
--- a/docs/devel/index.rst<br>
+++ b/docs/devel/index.rst<br>
@@ -35,3 +35,4 @@ Contents:<br>
=C2=A0 =C2=A0 clocks<br>
=C2=A0 =C2=A0 qom<br>
=C2=A0 =C2=A0 block-coroutine-wrapper<br>
+=C2=A0 =C2=A0vfio-user<br>
diff --git a/docs/devel/vfio-user.rst b/docs/devel/vfio-user.rst<br>
new file mode 100644<br>
index 0000000000..d15a228a1a<br>
--- /dev/null<br>
+++ b/docs/devel/vfio-user.rst<br>
@@ -0,0 +1,1662 @@<br>
+.. include:: &lt;isonum.txt&gt;<br>
+<br>
+********************************<br>
+vfio-user Protocol Specification<br>
+********************************<br>
+<br>
+------------<br>
+Version_ 0.1<br>
+------------<br>
+<br>
+.. contents:: Table of Contents<br>
+<br>
+Introduction<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+vfio-user is a protocol that allows a device to be emulated in a separate<=
br>
+process outside of a Virtual Machine Monitor (VMM). vfio-user devices cons=
ist<br>
+of a generic VFIO device type, living inside the VMM, which we call the cl=
ient,<br>
+and the core device implementation, living outside the VMM, which we call =
the<br>
+server.<br>
+<br>
+The `Linux VFIO ioctl interface &lt;<a href=3D"https://www.kernel.org/doc/=
html/latest/driver-api/vfio.html" rel=3D"noreferrer" target=3D"_blank">http=
s://www.kernel.org/doc/html/latest/driver-api/vfio.html</a>&gt;`_<br>
+been chosen as the base for this protocol for the following reasons:<br>
+<br>
+1) It is a mature and stable API, backed by an extensively used framework.=
<br>
+2) The existing VFIO client implementation in QEMU (qemu/hw/vfio/) can be<=
br>
+=C2=A0 =C2=A0largely reused.<br>
+<br>
+.. Note::<br>
+=C2=A0 =C2=A0In a proof of concept implementation it has been demonstrated=
 that using VFIO<br>
+=C2=A0 =C2=A0over a UNIX domain socket is a viable option. vfio-user is de=
signed with<br>
+=C2=A0 =C2=A0QEMU in mind, however it could be used by other client applic=
ations. The<br>
+=C2=A0 =C2=A0vfio-user protocol does not require that QEMU&#39;s VFIO clie=
nt=C2=A0 implementation<br>
+=C2=A0 =C2=A0is used in QEMU.<br>
+<br>
+None of the VFIO kernel modules are required for supporting the protocol,<=
br>
+neither in the client nor the server, only the source header files are use=
d.<br>
+<br>
+The main idea is to allow a virtual device to function in a separate proce=
ss in<br>
+the same host over a UNIX domain socket. A UNIX domain socket (AF_UNIX) is=
<br>
+chosen because file descriptors can be trivially sent over it, which in tu=
rn<br>
+allows:<br>
+<br>
+* Sharing of client memory for DMA with the server.<br>
+* Sharing of server memory with the client for fast MMIO.<br>
+* Efficient sharing of eventfd&#39;s for triggering interrupts.<br>
+<br>
+Other socket types could be used which allow the server to run in a separa=
te<br>
+guest in the same host (AF_VSOCK) or remotely (AF_INET). Theoretically the=
<br>
+underlying transport does not necessarily have to be a socket, however we =
do<br>
+not examine such alternatives. In this protocol version we focus on using =
a<br>
+UNIX domain socket and introduce basic support for the other two types of<=
br>
+sockets without considering performance implications.<br>
+<br>
+While passing of file descriptors is desirable for performance reasons, it=
 is<br>
+not necessary neither for the client nor for the server to support it in o=
rder<br>
+to implement the protocol. There is always an in-band, message-passing fal=
l<br>
+back mechanism.<br>
+<br>
+VFIO<br>
+=3D=3D=3D=3D<br>
+VFIO is a framework that allows a physical device to be securely passed th=
rough<br>
+to a user space process; the device-specific kernel driver does not drive =
the<br>
+device at all.=C2=A0 Typically, the user space process is a VMM and the de=
vice is<br>
+passed through to it in order to achieve high performance. VFIO provides a=
n API<br>
+and the required functionality in the kernel. QEMU has adopted VFIO to all=
ow a<br>
+guest to directly access physical devices, instead of emulating them in<br=
>
+software.<br>
+<br>
+vfio-user reuses the core VFIO concepts defined in its API, but implements=
 them<br>
+as messages to be sent over a socket. It does not change the kernel-based =
VFIO<br>
+in any way, in fact none of the VFIO kernel modules need to be loaded to u=
se<br>
+vfio-user. It is also possible for the client to concurrently use the curr=
ent<br>
+kernel-based VFIO for one device, and vfio-user for another device.<br>
+<br>
+VFIO Device Model<br>
+-----------------<br>
+A device under VFIO presents a standard interface to the user process. Man=
y of<br>
+the VFIO operations in the existing interface use the ioctl() system call,=
 and<br>
+references to the existing interface are called the ioctl() implementation=
 in<br>
+this document.<br>
+<br>
+The following sections describe the set of messages that implement the VFI=
O<br>
+interface over a socket. In many cases, the messages are direct translatio=
ns of<br>
+data structures used in the ioctl() implementation. Messages derived from<=
br>
+ioctl()s will have a name derived from the ioctl() command name.=C2=A0 E.g=
., the<br>
+VFIO_GET_INFO ioctl() command becomes a VFIO_USER_GET_INFO message.=C2=A0 =
The<br>
+purpose of this reuse is to share as much code as feasible with the ioctl(=
)<br>
+implementation.<br>
+<br>
+Connection Initiation<br>
+^^^^^^^^^^^^^^^^^^^^^<br>
+After the client connects to the server, the initial server message is<br>
+VFIO_USER_VERSION to propose a protocol version and set of capabilities to=
<br>
+apply to the session. The client replies with a compatible version and set=
 of<br>
+capabilities it supports, or closes the connection if it cannot support th=
e<br>
+advertised version.<br></blockquote><div><br></div><div>Ok, so the server =
announces first. (it makes sense to me, as the client is more adjustable th=
an the server - and it allows to discover server caps)<br></div><div> <br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+DMA Memory Configuration<br>
+^^^^^^^^^^^^^^^^^^^^^^^^<br>
+The client uses VFIO_USER_DMA_MAP and VFIO_USER_DMA_UNMAP messages to info=
rm<br>
+the server of the valid DMA ranges that the server can access on behalf<br=
>
+of a device. DMA memory may be accessed by the server via VFIO_USER_DMA_RE=
AD<br>
+and VFIO_USER_DMA_WRITE messages over the socket.<br>
+<br>
+An optimization for server access to client memory is for the client to pr=
ovide<br>
+file descriptors the server can mmap() to directly access client memory. N=
ote<br>
+that mmap() privileges cannot be revoked by the client, therefore file<br>
+descriptors should only be exported in environments where the client trust=
s the<br>
+server not to corrupt guest memory.<br>
+<br>
+Device Information<br>
+^^^^^^^^^^^^^^^^^^<br>
+The client uses a VFIO_USER_DEVICE_GET_INFO message to query the server fo=
r<br>
+information about the device. This information includes:<br>
+<br>
+* The device type and whether it supports reset (``VFIO_DEVICE_FLAGS_``),<=
br>
+* the number of device regions, and<br>
+* the device presents to the client the number of interrupt types the devi=
ce<br>
+=C2=A0 supports.<br>
+<br>
+Region Information<br>
+^^^^^^^^^^^^^^^^^^<br>
+The client uses VFIO_USER_DEVICE_GET_REGION_INFO messages to query the ser=
ver<br>
+for information about the device&#39;s memory regions. This information de=
scribes:<br>
+<br>
+* Read and write permissions, whether it can be memory mapped, and whether=
 it<br>
+=C2=A0 supports additional capabilities (``VFIO_REGION_INFO_CAP_``).<br>
+* Region index, size, and offset.<br>
+<br>
+When a region can be mapped by the client, the server provides a file<br>
+descriptor which the client can mmap(). The server is responsible for poll=
ing<br>
+for client updates to memory mapped regions.<br>
+<br>
+Region Capabilities<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&q=
uot;&quot;&quot;&quot;&quot;&quot;&quot;<br>
+Some regions have additional capabilities that cannot be described adequat=
ely<br>
+by the region info data structure. These capabilities are returned in the<=
br>
+region info reply in a list similar to PCI capabilities in a PCI device&#3=
9;s<br>
+configuration space.<br>
+<br>
+Sparse Regions<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&q=
uot;&quot;<br>
+A region can be memory-mappable in whole or in part. When only a subset of=
 a<br>
+region can be mapped by the client, a VFIO_REGION_INFO_CAP_SPARSE_MMAP<br>
+capability is included in the region info reply. This capability describes=
<br>
+which portions can be mapped by the client.<br>
+<br>
+.. Note::<br>
+=C2=A0 =C2=A0For example, in a virtual NVMe controller, sparse regions can=
 be used so<br>
+=C2=A0 =C2=A0that accesses to the NVMe registers (found in the beginning o=
f BAR0) are<br>
+=C2=A0 =C2=A0trapped (an infrequent event), while allowing direct access t=
o the doorbells<br>
+=C2=A0 =C2=A0(an extremely frequent event as every I/O submission requires=
 a write to<br>
+=C2=A0 =C2=A0BAR0), found right after the NVMe registers in BAR0.<br>
+<br>
+Device-Specific Regions<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&q=
uot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;<br>
+<br>
+A device can define regions additional to the standard ones (e.g. PCI inde=
xes<br>
+0-8). This is achieved by including a VFIO_REGION_INFO_CAP_TYPE capability=
<br>
+in the region info reply of a device-specific region. Such regions are ref=
lected<br>
+in ``struct vfio_device_info.num_regions``. Thus, for PCI devices this val=
ue can<br>
+be equal to, or higher than, VFIO_PCI_NUM_REGIONS.<br>
+<br>
+Interrupts<br>
+^^^^^^^^^^<br>
+The client uses VFIO_USER_DEVICE_GET_IRQ_INFO messages to query the server=
 for<br>
+the device&#39;s interrupt types. The interrupt types are specific to the =
bus the<br>
+device is attached to, and the client is expected to know the capabilities=
 of<br>
+each interrupt type. The server can signal an interrupt either with<br>
+VFIO_USER_VM_INTERRUPT messages over the socket, or can directly inject<br=
>
+interrupts into the guest via an event file descriptor. The client configu=
res<br>
+how the server signals an interrupt with VFIO_USER_SET_IRQS messages.<br>
+<br>
+Device Read and Write<br>
+^^^^^^^^^^^^^^^^^^^^^<br>
+When the guest executes load or store operations to device memory, the cli=
ent<br>
+forwards these operations to the server with VFIO_USER_REGION_READ or<br>
+VFIO_USER_REGION_WRITE messages. The server will reply with data from the<=
br>
+device on read operations or an acknowledgement on write operations.<br>
+<br>
+DMA<br>
+^^^<br>
+When a device performs DMA accesses to guest memory, the server will forwa=
rd<br>
+them to the client with VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE message=
s.<br>
+These messages can only be used to access guest memory the client has<br>
+configured into the server.<br>
+<br>
+Protocol Specification<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+To distinguish from the base VFIO symbols, all vfio-user symbols are prefi=
xed<br>
+with vfio_user or VFIO_USER. In revision 0.1, all data is in the little-en=
dian<br>
+format, although this may be relaxed in future revision in cases where the=
<br>
+client and server are both big-endian. The messages are formatted for seam=
less<br>
+reuse of the native VFIO structs.<br>
+<br>
+Socket<br>
+------<br>
+<br>
+A server can serve:<br>
+<br>
+1) one or more clients, and/or<br>
+2) one or more virtual devices, belonging to one or more clients.<br>
+<br>
+The current protocol specification requires a dedicated socket per<br>
+client/server connection. It is a server-side implementation detail whethe=
r a<br>
+single server handles multiple virtual devices from the same or multiple<b=
r>
+clients. The location of the socket is implementation-specific. Multiplexi=
ng<br>
+clients, devices, and servers over the same socket is not supported in thi=
s<br>
+version of the protocol.<br>
+<br>
+Authentication<br>
+--------------<br>
+For AF_UNIX, we rely on OS mandatory access controls on the socket files,<=
br>
+therefore it is up to the management layer to set up the socket as require=
d.<br>
+Socket types than span guests or hosts will require a proper authenticatio=
n<br>
+mechanism. Defining that mechanism is deferred to a future version of the<=
br>
+protocol.<br>
+<br>
+Command Concurrency<br>
+-------------------<br>
+A client may pipeline multiple commands without waiting for previous comma=
nd<br>
+replies.=C2=A0 The server will process commands in the order they are rece=
ived.=C2=A0 A<br>
+consequence of this is if a client issues a command with the *No_reply* bi=
t,<br>
+then subseqently issues a command without *No_reply*, the older command wi=
ll<br>
+have been processed before the reply to the younger command is sent by the=
<br>
+server.=C2=A0 The client must be aware of the device&#39;s capability to p=
rocess<br>
+concurrent commands if pipelining is used.=C2=A0 For example, pipelining a=
llows<br>
+multiple client threads to concurently access device memory; the client mu=
st<br>
+ensure these acceses obey device semantics.<br>
+<br>
+An example is a frame buffer device, where the device may allow concurrent=
<br>
+access to different areas of video memory, but may have indeterminate beha=
vior<br>
+if concurrent acceses are performed to command or status registers.<br>
+<br>
+Note that unrelated messages sent from the sevrer to the client can appear=
 in<br>
+between a client to server request/reply and vice versa.<br>
+<br>
+Socket Disconnection Behavior<br>
+-----------------------------<br>
+The server and the client can disconnect from each other, either intention=
ally<br>
+or unexpectedly. Both the client and the server need to know how to handle=
 such<br>
+events.<br>
+<br>
+Server Disconnection<br>
+^^^^^^^^^^^^^^^^^^^^<br>
+A server disconnecting from the client may indicate that:<br>
+<br>
+1) A virtual device has been restarted, either intentionally (e.g. because=
 of a<br>
+=C2=A0 =C2=A0device update) or unintentionally (e.g. because of a crash).<=
br>
+2) A virtual device has been shut down with no intention to be restarted.<=
br>
+<br>
+It is impossible for the client to know whether or not a failure is<br>
+intermittent or innocuous and should be retried, therefore the client shou=
ld<br>
+reset the VFIO device when it detects the socket has been disconnected.<br=
>
+Error recovery will be driven by the guest&#39;s device error handling<br>
+behavior.<br>
+<br>
+Client Disconnection<br>
+^^^^^^^^^^^^^^^^^^^^<br>
+The client disconnecting from the server primarily means that the client<b=
r>
+has exited. Currently, this means that the guest is shut down so the devic=
e is<br>
+no longer needed therefore the server can automatically exit. However, the=
re<br>
+can be cases where a client disconnection should not result in a server ex=
it:<br>
+<br>
+1) A single server serving multiple clients.<br>
+2) A multi-process QEMU upgrading itself step by step, which is not yet<br=
>
+=C2=A0 =C2=A0implemented.<br>
+<br>
+Therefore in order for the protocol to be forward compatible the server sh=
ould<br>
+take no action when the client disconnects. If anything happens to the cli=
ent<br>
+the control stack will know about it and can clean up resources<br>
+accordingly.<br>
+<br>
+Request Retry and Response Timeout<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+A failed command is a command that has been successfully sent and has been=
<br>
+responded to with an error code. Failure to send the command in the first =
place<br>
+(e.g. because the socket is disconnected) is a different type of error exa=
mined<br>
+earlier in the disconnect section.<br>
+<br>
+.. Note::<br>
+=C2=A0 =C2=A0QEMU&#39;s VFIO retries certain operations if they fail. Whil=
e this makes sense<br>
+=C2=A0 =C2=A0for real HW, we don&#39;t know for sure whether it makes sens=
e for virtual<br>
+=C2=A0 =C2=A0devices.<br>
+<br>
+Defining a retry and timeout scheme is deferred to a future version of the=
<br>
+protocol.<br>
+<br>
+.. _Commands:<br>
+<br>
+Commands<br>
+--------<br>
+The following table lists the VFIO message command IDs, and whether the<br=
>
+message command is sent from the client or the server.<br>
+<br>
++----------------------------------+---------+-------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Command | Request Direction |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| VFIO_USER_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 1=C2=A0 =C2=A0 =C2=A0 =C2=A0| server -&gt; client=C2=A0 |<br></blockquot=
e><div><br></div><div>ok</div><div> <br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DMA_MAP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 2=C2=A0 =C2=A0 =C2=A0 =C2=A0| client -&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DMA_UNMAP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| client -&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DEVICE_GET_INFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| client -&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DEVICE_GET_REGION_INFO | 5=C2=A0 =C2=A0 =C2=A0 =C2=A0| client =
-&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DEVICE_GET_IRQ_INFO=C2=A0 =C2=A0 | 6=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| client -&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DEVICE_SET_IRQS=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| client -&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_REGION_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8=C2=A0=
 =C2=A0 =C2=A0 =C2=A0| client -&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_REGION_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 9=C2=A0=
 =C2=A0 =C2=A0 =C2=A0| client -&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DMA_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 10=C2=A0 =C2=A0 =C2=A0 | server -&gt; client=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DMA_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11=
=C2=A0 =C2=A0 =C2=A0 | server -&gt; client=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_VM_INTERRUPT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12=C2=
=A0 =C2=A0 =C2=A0 | server -&gt; client=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DEVICE_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13=C2=
=A0 =C2=A0 =C2=A0 | client -&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+| VFIO_USER_DIRTY_PAGES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14=C2=
=A0 =C2=A0 =C2=A0 | client -&gt; server=C2=A0 |<br>
++----------------------------------+---------+-------------------+<br>
+<br>
+<br>
+.. Note:: Some VFIO defines cannot be reused since their values are<br>
+=C2=A0 =C2=A0architecture-specific (e.g. VFIO_IOMMU_MAP_DMA).<br>
+<br>
+Header<br>
+------<br>
+All messages, both command messages and reply messages, are preceded by a<=
br>
+header that contains basic information about the message. The header is<br=
>
+followed by message-specific data described in the sections below.<br>
+<br>
++----------------+--------+-------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Offset | Size=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0 =C2=A0| 0=C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++----------------+--------+-------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++----------------+--------+-------------+<br>
+| Message size=C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|<br>
++----------------+--------+-------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 =C2=A0 | 4=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++----------------+--------+-------------+<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+--------=
----+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | Bit | Definit=
ion | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | 0-3 | Type=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+--------=
----+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | 4=C2=A0 =C2=
=A0| No_reply=C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+--------=
----+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | 5=C2=A0 =C2=
=A0| Error=C2=A0 =C2=A0 =C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+--------=
----+ |<br>
++----------------+--------+-------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12=C2=A0 =C2=A0 =C2=A0| 4=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++----------------+--------+-------------+<br>
+| &lt;message data&gt; | 16=C2=A0 =C2=A0 =C2=A0| variable=C2=A0 =C2=A0 |<b=
r>
++----------------+--------+-------------+<br>
+<br>
+* *Message ID* identifies the message, and is echoed in the command&#39;s =
reply<br>
+=C2=A0 message. Message IDs belong entirely to the sender, can be re-used =
(even<br>
+=C2=A0 concurrently) and the receiver must not make any assumptions about =
their<br>
+=C2=A0 uniqueness.<br>
+* *Command* specifies the command to be executed, listed in Commands_.<br>
+* *Message size* contains the size of the entire message, including the he=
ader.<br>
+* *Flags* contains attributes of the message:<br>
+<br>
+=C2=A0 * The *Type* bits indicate the message type.<br>
+<br>
+=C2=A0 =C2=A0 *=C2=A0 *Command* (value 0x0) indicates a command message.<b=
r>
+=C2=A0 =C2=A0 *=C2=A0 *Reply* (value 0x1) indicates a reply message acknow=
ledging a previous<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0command with the same message ID.<br>
+=C2=A0 * *No_reply* in a command message indicates that no reply is needed=
 for this command.<br>
+=C2=A0 =C2=A0 This is commonly used when multiple commands are sent, and o=
nly the last needs<br>
+=C2=A0 =C2=A0 acknowledgement.<br>
+=C2=A0 * *Error* in a reply message indicates the command being acknowledg=
ed had<br>
+=C2=A0 =C2=A0 an error. In this case, the *Error* field will be valid.<br>
+<br>
+* *Error* in a reply message is an optional UNIX errno value. It may be ze=
ro<br>
+=C2=A0 even if the Error bit is set in Flags. It is reserved in a command =
message.<br>
+<br>
+Each command message in Commands_ must be replied to with a reply message,=
 unless the<br>
+message sets the *No_Reply* bit.=C2=A0 The reply consists of the header wi=
th the *Reply*<br>
+bit set, plus any additional data.<br>
+<br>
+If an error occurs, the reply message must only include the reply header.<=
br>
+<br>
+VFIO_USER_VERSION<br>
+-----------------<br>
+<br>
+This is the initial message sent by the client after the socket connection=
 is<br>
+established:<br></blockquote><div><br></div><div><br></div>Contradictory w=
ith the above.</div><div class=3D"gmail_quote"><br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+-------------------------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+-------------------------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+-------------------------------------------+<br>
+| Message size | 16 + version header + version data length |<br>
++--------------+-------------------------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+-------------------------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+-------------------------------------------+<br>
+| Version=C2=A0 =C2=A0 =C2=A0 | version header=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+-------------------------------------------+<br>
+<br>
+Version Header Format<br>
+^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
++---------------+--------+------------------------------------------------=
+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Offset | Size=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| version major | 16=C2=A0 =C2=A0 =C2=A0| 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++---------------+--------+------------------------------------------------=
+<br>
+| version minor | 18=C2=A0 =C2=A0 =C2=A0| 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++---------------+--------+------------------------------------------------=
+<br>
+| version data=C2=A0 | 22=C2=A0 =C2=A0 =C2=A0| variable (including termina=
ting NUL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | character). Optional.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++---------------+--------+------------------------------------------------=
+<br></blockquote><div><br></div><div><br></div><div>Annoying that this ver=
sion won&#39;t be easily human-readable. (you can&#39;t simply netcat to a =
vfio server and get the version)</div><div></div><div>iirc, earlier version=
s of the proposal just sent a json message straight without a header.</div>=
<div><br></div><div>This initial text-phase is imho more interesting, as th=
e binary protocol requirements are mostly for machine-convenience and perfo=
rmance reasons when the device is actually running.<br></div><div> <br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+Version Data Format<br>
+^^^^^^^^^^^^^^^^^^^<br>
+<br>
+The version data is an optional JSON byte array with the following format:=
<br>
+<br>
++--------------------+------------------+---------------------------------=
--+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Type=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Description=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
+<br>
+| ``&quot;capabilities&quot;`` | collection of=C2=A0 =C2=A0 | Contains com=
mon capabilities that |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | n=
ame/value pairs | the sender supports. Optional.=C2=A0 =C2=A0 |<br>
++--------------------+------------------+---------------------------------=
--+<br>
+<br>
+Capabilities:<br>
+<br>
++--------------------+------------------+---------------------------------=
----+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Type=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Description=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+<br>
+| ``&quot;max_fds&quot;``=C2=A0 =C2=A0 =C2=A0 | number=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| Maximum number of file descriptors=C2=A0 |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | the can be=
 received by the sender.=C2=A0 |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Optional. =
If not specified then the |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | receiver m=
ust assume=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ``&quot;ma=
x_fds&quot;=3D1``.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |<br>
++--------------------+------------------+---------------------------------=
----+<br>
+| ``&quot;max_msg_size&quot;`` | number=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| Maximum message size in bytes that=C2=A0 |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | the receiv=
er can handle, including=C2=A0 |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | the header=
. Optional. If not=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | specified =
then the receiver must=C2=A0 =C2=A0 |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | assume ``&=
quot;max_msg_size&quot;=3D4096``.=C2=A0 =C2=A0 =C2=A0|<br>
++--------------------+------------------+---------------------------------=
----+<br>
+| ``&quot;migration&quot;``=C2=A0 =C2=A0 | collection of=C2=A0 =C2=A0 | Mi=
gration capability parameters. If |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | n=
ame/value pairs | missing then migration is not=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | supported =
by the sender.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------------+------------------+---------------------------------=
----+<br>
+<br>
+The migration capability contains the following name/value pairs:<br>
+<br>
++--------------+--------+-----------------------------------------------+<=
br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Type=C2=A0 =C2=A0| Description=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| ``&quot;pgsize&quot;`` | number | Page size of dirty pages bitmap. The s=
mallest |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | between the client and the server is used.=C2=A0 =C2=A0 |<br>
++--------------+--------+-----------------------------------------------+<=
br>
+<br>
+<br>
+.. _Version:<br>
+<br>
+Versioning and Feature Support<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+Upon accepting a connection, the client must send a VFIO_USER_VERSION mess=
age<br>
+proposing a protocol version and a set of capabilities. The server compare=
s<br>
+these with the versions and capabilities it supports and sends a<br>
+VFIO_USER_VERSION reply according to the following rules.<br></blockquote>=
<div><br></div><div>I don&#39;t think the server will be as adaptable as th=
e client. Again, it feels backward to me.<br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
+<br>
+* The major version in the reply must be the same as proposed. If the clie=
nt<br>
+=C2=A0 does not support the proposed major, it closes the connection.<br>
+* The minor version in the reply must be equal to or less than the minor<b=
r>
+=C2=A0 version proposed.<br>
+* The capability list must be a subset of those proposed. If the server<br=
>
+=C2=A0 requires a capability the client did not include, it closes the con=
nection.<br>
+<br>
+The protocol major version will only change when incompatible protocol cha=
nges<br>
+are made, such as changing the message format. The minor version may chang=
e<br>
+when compatible changes are made, such as adding new messages or capabilit=
ies,<br>
+Both the client and server must support all minor versions less than the<b=
r>
+maximum minor version it supports. E.g., an implementation that supports<b=
r>
+version 1.3 must also support 1.0 through 1.2.<br>
+<br>
+When making a change to this specification, the protocol version number mu=
st<br>
+be included in the form &quot;added in version X.Y&quot;<br>
+<br>
+<br>
+VFIO_USER_DMA_MAP<br>
+-----------------<br>
+<br>
+Message Format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Message size | 16 + table size=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 | array of table entries |<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent by the client to the server to inform it of t=
he<br>
+memory regions the server can access. It must be sent before the server ca=
n<br>
+perform any DMA to the client. It is normally sent directly after the vers=
ion<br>
+handshake is completed, but may also occur when memory is added to the cli=
ent,<br>
+or if the client uses a vIOMMU. If the client does not expect the server t=
o<br>
+perform DMA then it does not need to send to the server VFIO_USER_DMA_MAP<=
br>
+commands. If the server does not need to perform DMA then it can ignore su=
ch<br>
+commands but it must still reply to them. The table is an array of the<br>
+following structure:<br>
+<br>
+Table entry format<br>
+^^^^^^^^^^^^^^^^^^<br>
+<br>
++-------------+--------+-------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Offset | Size=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Address=C2=A0 =C2=A0 =C2=A0| 0=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------------+--------+-------------+<br>
+| Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------------+--------+-------------+<br>
+| Offset=C2=A0 =C2=A0 =C2=A0 | 16=C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------------+--------+-------------+<br>
+| Protections | 24=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|<br>
++-------------+--------+-------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0| 28=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------------+--------+-------------+<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+------------+ |<=
br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| | Bit | Definition | |<=
br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| | 0=C2=A0 =C2=A0| Mappa=
ble=C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+------------+ |<=
br>
++-------------+--------+-------------+<br>
+<br>
+* *Address* is the base DMA address of the region.<br>
+* *Size* is the size of the region.<br>
+* *Offset* is the file offset of the region with respect to the associated=
 file<br>
+=C2=A0 descriptor.<br>
+* *Protections* are the region&#39;s protection attributes as encoded in<b=
r>
+=C2=A0 ``&lt;sys/mman.h&gt;``.<br>
+* *Flags* contains the following region attributes:<br>
+<br>
+=C2=A0 * *Mappable* indicates that the region can be mapped via the mmap()=
 system<br>
+=C2=A0 =C2=A0 call using the file descriptor provided in the message meta-=
data.<br>
+<br>
+This structure is 32 bytes in size, so the message size is:<br>
+16 + (# of table entries * 32).<br>
+<br>
+If a DMA region being added can be directly mapped by the server, an array=
 of<br>
+file descriptors must be sent as part of the message meta-data. Each mappa=
ble<br>
+region entry must have a corresponding file descriptor. On AF_UNIX sockets=
, the<br>
+file descriptors must be passed as SCM_RIGHTS type ancillary data. Otherwi=
se,<br>
+if a DMA region cannot be directly mapped by the server, it can be accesse=
d by<br>
+the server using VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE messages, expl=
ained<br>
+in `Read and Write Operations`_. A command to map over an existing region =
must<br>
+be failed by the server with ``EEXIST`` set in error field in the reply.<b=
r>
+<br>
+Adding multiple DMA regions can partially fail. The response does not indi=
cate<br>
+which regions were added and which were not, therefore it is a client<br>
+implementation detail how to recover from the failure.<br>
+<br>
+.. Note::<br>
+=C2=A0 =C2=A0The server can optionally remove succesfully added DMA region=
s making this<br>
+=C2=A0 =C2=A0operation atomic.<br>
+=C2=A0 =C2=A0The client can recover by attempting to unmap one by one all =
the DMA regions<br>
+=C2=A0 =C2=A0in the VFIO_USER_DMA_MAP command, ignoring failures for regio=
ns that do not<br>
+=C2=A0 =C2=A0exist.<br>
+<br>
+<br>
+<br>
+VFIO_USER_DMA_UNMAP<br>
+-------------------<br>
+<br>
+Message Format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Message size | 16 + table size=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 | array of table entries |<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent by the client to the server to inform it that=
 a<br>
+DMA region, previously made available via a VFIO_USER_DMA_MAP command mess=
age,<br>
+is no longer available for DMA. It typically occurs when memory is subtrac=
ted<br>
+from the client or if the client uses a vIOMMU. If the client does not exp=
ect<br>
+the server to perform DMA then it does not need to send to the server<br>
+VFIO_USER_DMA_UNMAP commands. If the server does not need to perform DMA t=
hen<br>
+it can ignore such commands but it must still reply to them. The table is =
an<br>
+array of the following structure:<br>
+<br>
+Table entry format<br>
+^^^^^^^^^^^^^^^^^^<br>
+<br>
++--------------+--------+---------------------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Offset | Size=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Address=C2=A0 =C2=A0 =C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+--------+---------------------------------------+<br>
+| Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+--------+---------------------------------------+<br>
+| Offset=C2=A0 =C2=A0 =C2=A0 =C2=A0| 16=C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+--------+---------------------------------------+<br>
+| Protections=C2=A0 | 24=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+--------+---------------------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+--------+---------------------------------------+<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+---------------=
-----------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | Bit | Definition=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | 0=C2=A0 =C2=A0| VFIO=
_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+---------------=
-----------------------+ |<br>
++--------------+--------+---------------------------------------+<br>
+| VFIO Bitmaps | 32=C2=A0 =C2=A0 =C2=A0| variable=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>
++--------------+--------+---------------------------------------+<br>
+<br>
+* *Address* is the base DMA address of the region.<br>
+* *Size* is the size of the region.<br>
+* *Offset* is the file offset of the region with respect to the associated=
 file<br>
+=C2=A0 descriptor.<br>
+* *Protections* are the region&#39;s protection attributes as encoded in<b=
r>
+=C2=A0 ``&lt;sys/mman.h&gt;``.<br>
+* *Flags* contains the following region attributes:<br>
+<br>
+=C2=A0 * *VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP* indicates that a dirty pag=
e bitmap<br>
+=C2=A0 =C2=A0 must be populated before unmapping the DMA region. The clien=
t must provide<br>
+=C2=A0 =C2=A0 a ``struct vfio_bitmap`` in the VFIO bitmaps field for each =
region, with<br>
+=C2=A0 =C2=A0 the ``vfio_bitmap.pgsize`` and ``vfio_bitmap.size`` fields i=
nitialized.<br>
+<br>
+* *VFIO Bitmaps* contains one ``struct vfio_bitmap`` per region if<br>
+=C2=A0 ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags.<br>
+<br>
+VFIO bitmap format<br>
+^^^^^^^^^^^^^^^^^^<br>
+<br>
++--------+--------+------+<br>
+| Name=C2=A0 =C2=A0| Offset | Size |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D+<br>
+| pgsize | 0=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 |<br>
++--------+--------+------+<br>
+| size=C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 |<br>
++--------+--------+------+<br>
+| data=C2=A0 =C2=A0| 16=C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=A0 |<br>
++--------+--------+------+<br>
+<br>
+* *pgsize* is the page size for the bitmap, in bytes.<br>
+* *size* is the size for the bitmap, in bytes, excluding the VFIO bitmap h=
eader.<br>
+* *data* This field is unused in vfio-user.<br>
+<br>
+The VFIO bitmap structure is defined in ``&lt;linux/vfio.h&gt;``<br>
+(``struct vfio_bitmap``).<br>
+<br>
+If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is not set in Flags then the s=
ize<br>
+of the message is: 16 + (# of table entries * 32).<br>
+If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags then the size =
of<br>
+the message is: 16 + (# of table entries * 56).<br>
+<br>
+Upon receiving a VFIO_USER_DMA_UNMAP command, if the file descriptor is ma=
pped<br>
+then the server must release all references to that DMA region before repl=
ying,<br>
+which includes potentially in flight DMA transactions. Removing a portion =
of a<br>
+DMA region is possible. If the VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP bit is=
 set<br>
+in the request, the server must append to the header the ``struct vfio_bit=
map``<br>
+received in the command followed by the bitmap, for each region. Thus, the=
<br>
+message size the client should expect is the size of the header plus the s=
ize<br>
+of ``struct vfio_bitmap`` plus ``vfio_bitmap.size`` bytes for each region.=
 Each<br>
+bit in the bitmap represents one page of size ``vfio_bitmap.pgsize``.<br>
+<br>
+<br>
+VFIO_USER_DEVICE_GET_INFO<br>
+-------------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+----------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+----------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+----------------------------+<br>
+| Message size | 16 in command, 32 in reply |<br>
++--------------+----------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply=C2=A0 =C2=A0 =
=C2=A0|<br>
++--------------+----------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+----------------------------+<br>
+| Device info=C2=A0 | VFIO device info=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|<br>
++--------------+----------------------------+<br>
+<br>
+This command message is sent by the client to the server to query for basi=
c<br>
+information about the device. Only the message header is needed in the com=
mand<br>
+message.=C2=A0 The VFIO device info structure is defined in ``&lt;linux/vf=
io.h&gt;``<br>
+(``struct vfio_device_info``).<br>
+<br>
+VFIO device info format<br>
+^^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
++-------------+--------+--------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Offset | Size=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<b=
r>
+| argsz=C2=A0 =C2=A0 =C2=A0 =C2=A0| 16=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br=
>
++-------------+--------+--------------------------+<br>
+| flags=C2=A0 =C2=A0 =C2=A0 =C2=A0| 20=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br=
>
++-------------+--------+--------------------------+<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+----------------=
---------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| | Bit | Definition=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |<br=
>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| | 0=C2=A0 =C2=A0| VFIO_=
DEVICE_FLAGS_RESET | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+----------------=
---------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| | 1=C2=A0 =C2=A0| VFIO_=
DEVICE_FLAGS_PCI=C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+----------------=
---------+ |<br>
++-------------+--------+--------------------------+<br>
+| num_regions | 24=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++-------------+--------+--------------------------+<br>
+| num_irqs=C2=A0 =C2=A0 | 28=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++-------------+--------+--------------------------+<br>
+<br>
+* *argsz* is the size of the VFIO device info structure.<br>
+* *flags* contains the following device attributes.<br>
+<br>
+=C2=A0 * VFIO_DEVICE_FLAGS_RESET indicates that the device supports the<br=
>
+=C2=A0 =C2=A0 VFIO_USER_DEVICE_RESET message.<br>
+=C2=A0 * VFIO_DEVICE_FLAGS_PCI indicates that the device is a PCI device.<=
br>
+<br>
+* *num_regions* is the number of memory regions that the device exposes.<b=
r>
+* *num_irqs* is the number of distinct interrupt types that the device sup=
ports.<br>
+<br>
+This version of the protocol only supports PCI devices. Additional devices=
 may<br>
+be supported in future versions.<br>
+<br>
+VFIO_USER_DEVICE_GET_REGION_INFO<br>
+--------------------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Message size | 48 + any caps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Region info=C2=A0 | VFIO region info=C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent by the client to the server to query for<br>
+information about device memory regions. The VFIO region info structure is=
<br>
+defined in ``&lt;linux/vfio.h&gt;`` (``struct vfio_region_info``). Since t=
he client<br>
+does not know the size of the capabilities, the size of the reply it shoul=
d<br>
+expect is 48 plus any capabilities whose size is indicated in the size fie=
ld of<br>
+the reply header.<br>
+<br>
+VFIO region info format<br>
+^^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
++------------+--------+------------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0| Offset | Size=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+<br>
+| argsz=C2=A0 =C2=A0 =C2=A0 | 16=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>
++------------+--------+------------------------------+<br>
+| flags=C2=A0 =C2=A0 =C2=A0 | 20=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>
++------------+--------+------------------------------+<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+----------------------=
-------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | Bit | Definition=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | 0=C2=A0 =C2=A0| VFIO_REGION=
_INFO_FLAG_READ=C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+----------------------=
-------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | 1=C2=A0 =C2=A0| VFIO_REGION=
_INFO_FLAG_WRITE | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+----------------------=
-------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | 2=C2=A0 =C2=A0| VFIO_REGION=
_INFO_FLAG_MMAP=C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+----------------------=
-------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | 3=C2=A0 =C2=A0| VFIO_REGION=
_INFO_FLAG_CAPS=C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | +-----+----------------------=
-------+ |<br>
++------------+--------+------------------------------+<br>
+| index=C2=A0 =C2=A0 =C2=A0 | 24=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>
++------------+--------+------------------------------+<br>
+| cap_offset | 28=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++------------+--------+------------------------------+<br>
+| size=C2=A0 =C2=A0 =C2=A0 =C2=A0| 32=C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>
++------------+--------+------------------------------+<br>
+| offset=C2=A0 =C2=A0 =C2=A0| 40=C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>
++------------+--------+------------------------------+<br>
+<br>
+* *argsz* is the size of the VFIO region info structure plus the<br>
+=C2=A0 size of any region capabilities returned.<br>
+* *flags* are attributes of the region:<br>
+<br>
+=C2=A0 * *VFIO_REGION_INFO_FLAG_READ* allows client read access to the reg=
ion.<br>
+=C2=A0 * *VFIO_REGION_INFO_FLAG_WRITE* allows client write access to the r=
egion.<br>
+=C2=A0 * *VFIO_REGION_INFO_FLAG_MMAP* specifies the client can mmap() the =
region.<br>
+=C2=A0 =C2=A0 When this flag is set, the reply will include a file descrip=
tor in its<br>
+=C2=A0 =C2=A0 meta-data. On AF_UNIX sockets, the file descriptors will be =
passed as<br>
+=C2=A0 =C2=A0 SCM_RIGHTS type ancillary data.<br>
+=C2=A0 * *VFIO_REGION_INFO_FLAG_CAPS* indicates additional capabilities fo=
und in the<br>
+=C2=A0 =C2=A0 reply.<br>
+<br>
+* *index* is the index of memory region being queried, it is the only fiel=
d<br>
+=C2=A0 that is required to be set in the command message.<br>
+* *cap_offset* describes where additional region capabilities can be found=
.<br>
+=C2=A0 cap_offset is relative to the beginning of the VFIO region info str=
ucture.<br>
+=C2=A0 The data structure it points is a VFIO cap header defined in<br>
+=C2=A0 ``&lt;linux/vfio.h&gt;``.<br>
+* *size* is the size of the region.<br>
+* *offset* is the offset given to the mmap() system call for regions with =
the<br>
+=C2=A0 MMAP attribute. It is also used as the base offset when mapping a V=
FIO<br>
+=C2=A0 sparse mmap area, described below.<br>
+<br>
+VFIO Region capabilities<br>
+^^^^^^^^^^^^^^^^^^^^^^^^<br>
+The VFIO region information can also include a capabilities list. This lis=
t is<br>
+similar to a PCI capability list - each entry has a common header that<br>
+identifies a capability and where the next capability in the list can be f=
ound.<br>
+The VFIO capability header format is defined in ``&lt;linux/vfio.h&gt;`` (=
``struct<br>
+vfio_info_cap_header``).<br>
+<br>
+VFIO cap header format<br>
+^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
++---------+--------+------+<br>
+| Name=C2=A0 =C2=A0 | Offset | Size |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D+<=
br>
+| id=C2=A0 =C2=A0 =C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0 |<br>
++---------+--------+------+<br>
+| version | 2=C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0 |<br>
++---------+--------+------+<br>
+| next=C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 |<br>
++---------+--------+------+<br>
+<br>
+* *id* is the capability identity.<br>
+* *version* is a capability-specific version number.<br>
+* *next* specifies the offset of the next capability in the capability lis=
t. It<br>
+=C2=A0 is relative to the beginning of the VFIO region info structure.<br>
+<br>
+VFIO sparse mmap<br>
+^^^^^^^^^^^^^^^^<br>
+<br>
++------------------+----------------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+<br>
+| id=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| VFIO_REGION_I=
NFO_CAP_SPARSE_MMAP |<br>
++------------------+----------------------------------+<br>
+| version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0x1=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>
++------------------+----------------------------------+<br>
+| next=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| &lt;next&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|<br>
++------------------+----------------------------------+<br>
+| sparse mmap info | VFIO region info sparse mmap=C2=A0 =C2=A0 =C2=A0|<br>
++------------------+----------------------------------+<br>
+<br>
+This capability is defined when only a subrange of the region supports<br>
+direct access by the client via mmap(). The VFIO sparse mmap area is defin=
ed in<br>
+``&lt;linux/vfio.h&gt;`` (``struct vfio_region_sparse_mmap_area``).<br>
+<br>
+VFIO region info cap sparse mmap<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
++----------+--------+------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0| Offset | Size |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D+<br>
+| nr_areas | 0=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 |<br>
++----------+--------+------+<br>
+| reserved | 4=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 |<br>
++----------+--------+------+<br>
+| offset=C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 |<br>
++----------+--------+------+<br>
+| size=C2=A0 =C2=A0 =C2=A0| 16=C2=A0 =C2=A0 =C2=A0| 9=C2=A0 =C2=A0 |<br>
++----------+--------+------+<br>
+| ...=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=
=A0 |<br>
++----------+--------+------+<br>
+<br>
+* *nr_areas* is the number of sparse mmap areas in the region.<br>
+* *offset* and size describe a single area that can be mapped by the clien=
t.<br>
+=C2=A0 There will be nr_areas pairs of offset and size. The offset will be=
 added to<br>
+=C2=A0 the base offset given in the VFIO_USER_DEVICE_GET_REGION_INFO to fo=
rm the<br>
+=C2=A0 offset argument of the subsequent mmap() call.<br>
+<br>
+The VFIO sparse mmap area is defined in ``&lt;linux/vfio.h&gt;`` (``struct=
<br>
+vfio_region_info_cap_sparse_mmap``).<br>
+<br>
+VFIO Region Type<br>
+^^^^^^^^^^^^^^^^<br>
+<br>
++------------------+---------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| id=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| VFIO_REGION_I=
NFO_CAP_TYPE |<br>
++------------------+---------------------------+<br>
+| version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0x1=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++------------------+---------------------------+<br>
+| next=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| &lt;next&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++------------------+---------------------------+<br>
+| region info type | VFIO region info type=C2=A0 =C2=A0 =C2=A0|<br>
++------------------+---------------------------+<br>
+<br>
+This capability is defined when a region is specific to the device.<br>
+<br>
+VFIO region info type<br>
+^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
+The VFIO region info type is defined in ``&lt;linux/vfio.h&gt;``<br>
+(``struct vfio_region_info_cap_type``).<br>
+<br>
++---------+--------+------+<br>
+| Name=C2=A0 =C2=A0 | Offset | Size |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D+<=
br>
+| type=C2=A0 =C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 |<br>
++---------+--------+------+<br>
+| subtype | 4=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 |<br>
++---------+--------+------+<br>
+<br>
+The only device-specific region type and subtype supported by vfio-user is=
<br>
+VFIO_REGION_TYPE_MIGRATION (3) and VFIO_REGION_SUBTYPE_MIGRATION (1).<br>
+<br>
+VFIO Device Migration Info<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
+The beginning of the subregion must contain<br>
+``struct vfio_device_migration_info``, defined in ``&lt;linux/vfio.h&gt;``=
. This<br>
+subregion is accessed like any other part of a standard vfio-user PCI regi=
on<br>
+using VFIO_USER_REGION_READ/VFIO_USER_REGION_WRITE.<br>
+<br>
++---------------+--------+-----------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Offset | Size=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+<br>
+| device_state=C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<=
br>
++---------------+--------+-----------------------------+<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+---------=
-------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| | Bit | Definiti=
on=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +=3D=3D=3D=3D=3D=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| | 0=C2=A0 =C2=A0=
| VFIO_DEVICE_STATE_RUNNING=C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+---------=
-------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| | 1=C2=A0 =C2=A0=
| VFIO_DEVICE_STATE_SAVING=C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+---------=
-------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| | 2=C2=A0 =C2=A0=
| VFIO_DEVICE_STATE_RESUMING | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+---------=
-------------------+ |<br>
++---------------+--------+-----------------------------+<br>
+| reserved=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|<br>
++---------------+--------+-----------------------------+<br>
+| pending_bytes | 8=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++---------------+--------+-----------------------------+<br>
+| data_offset=C2=A0 =C2=A0| 16=C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|<br>
++---------------+--------+-----------------------------+<br>
+| data_size=C2=A0 =C2=A0 =C2=A0| 24=C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|<br>
++---------------+--------+-----------------------------+<br>
+<br>
+* *device_state* defines the state of the device:<br>
+<br>
+=C2=A0 The client initiates device state transition by writing the intende=
d state.<br>
+=C2=A0 The server must respond only after it has succesfully transitioned =
to the new<br>
+=C2=A0 state. If an error occurs then the server must respond to the<br>
+=C2=A0 VFIO_USER_REGION_WRITE operation with the Error field set according=
ly and<br>
+=C2=A0 must remain at the previous state, or in case of internal error it =
must<br>
+=C2=A0 transtition to the error state, defined as<br>
+=C2=A0 VFIO_DEVICE_STATE_RESUMING | VFIO_DEVICE_STATE_SAVING. The client m=
ust<br>
+=C2=A0 re-read the device state in order to determine it afresh.<br>
+<br>
+=C2=A0 The following device states are defined:<br>
+<br>
+=C2=A0 +-----------+---------+----------+---------------------------------=
--+<br>
+=C2=A0 | _RESUMING | _SAVING | _RUNNING | Description=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+=C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Device is stopped.=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+=C2=A0 +-----------+---------+----------+---------------------------------=
--+<br>
+=C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Device is running, default state. |<br>
+=C2=A0 +-----------+---------+----------+---------------------------------=
--+<br>
+=C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Stop-and-copy state=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 +-----------+---------+----------+---------------------------------=
--+<br>
+=C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Pre-copy state=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+=C2=A0 +-----------+---------+----------+---------------------------------=
--+<br>
+=C2=A0 | 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Resuming=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+=C2=A0 +-----------+---------+----------+---------------------------------=
--+<br>
+=C2=A0 | 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Invalid state=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 +-----------+---------+----------+---------------------------------=
--+<br>
+=C2=A0 | 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Error state=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 +-----------+---------+----------+---------------------------------=
--+<br>
+=C2=A0 | 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Invalid state=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 +-----------+---------+----------+---------------------------------=
--+<br>
+<br>
+=C2=A0 Valid state transitions are shown in the following table:<br>
+<br>
+=C2=A0 +-------------------------+---------+---------+---------------+----=
------+----------+<br>
+=C2=A0 | |darr| From / To |rarr| | Stopped | Running | Stop-and-copy | Pre=
-copy | Resuming |<br>
+=C2=A0 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+=C2=A0 | Stopped=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 \-=C2=A0 =C2=A0|=C2=A0 =C2=A0 0=C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 |<br>
+=C2=A0 +-------------------------+---------+---------+---------------+----=
------+----------+<br>
+=C2=A0 | Running=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 1=C2=A0 =C2=A0 |=C2=A0 =C2=A0 \-=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 |<br>
+=C2=A0 +-------------------------+---------+---------+---------------+----=
------+----------+<br>
+=C2=A0 | Stop-and-copy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 1=C2=A0 =C2=A0 |=C2=A0 =C2=A0 0=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=
=A0\-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A00=C2=A0 =C2=A0 |<br>
+=C2=A0 +-------------------------+---------+---------+---------------+----=
------+----------+<br>
+=C2=A0 | Pre-copy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 0=C2=A0 =C2=A0 |=C2=A0 =C2=A0 0=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
=C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 \-=C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 |<br>
+=C2=A0 +-------------------------+---------+---------+---------------+----=
------+----------+<br>
+=C2=A0 | Resuming=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 0=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
=C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 =C2=A0\-=C2=A0 =C2=A0|<br>
+=C2=A0 +-------------------------+---------+---------+---------------+----=
------+----------+<br>
+<br>
+=C2=A0 A device is migrated to the destination as follows:<br>
+<br>
+=C2=A0 * The source client transitions the device state from the running s=
tate to<br>
+=C2=A0 =C2=A0 the pre-copy state. This transition is optional for the clie=
nt but must be<br>
+=C2=A0 =C2=A0 supported by the server. The souce server starts sending dev=
ice state data<br>
+=C2=A0 =C2=A0 to the source client through the migration region while the =
device is<br>
+=C2=A0 =C2=A0 running.<br>
+<br>
+=C2=A0 * The source client transitions the device state from the running s=
tate or the<br>
+=C2=A0 =C2=A0 pre-copy state to the stop-and-copy state. The source server=
 stops the<br>
+=C2=A0 =C2=A0 device, saves device state and sends it to the source client=
 through the<br>
+=C2=A0 =C2=A0 migration region.<br>
+<br>
+=C2=A0 The source client is responsible for sending the migration data to =
the<br>
+=C2=A0 destination client.<br>
+<br>
+=C2=A0 A device is resumed on the destination as follows:<br>
+<br>
+=C2=A0 * The destination client transitions the device state from the runn=
ing state<br>
+=C2=A0 =C2=A0 to the resuming state. The destination server uses the devic=
e state data<br>
+=C2=A0 =C2=A0 received through the migration region to resume the device.<=
br>
+<br>
+=C2=A0 * The destination client provides saved device state to the destina=
tion<br>
+=C2=A0 =C2=A0 server and then transitions the device to back to the runnin=
g state.<br>
+<br>
+* *reserved* This field is reserved and any access to it must be ignored b=
y the<br>
+=C2=A0 server.<br>
+<br>
+* *pending_bytes* Remaining bytes to be migrated by the server. This field=
 is<br>
+=C2=A0 read only.<br>
+<br>
+* *data_offset* Offset in the migration region where the client must:<br>
+<br>
+=C2=A0 * read from, during the pre-copy or stop-and-copy state, or<br>
+<br>
+=C2=A0 * write to, during the resuming state.<br>
+<br>
+=C2=A0 This field is read only.<br>
+<br>
+* *data_size* Contains the size, in bytes, of the amount of data copied to=
:<br>
+<br>
+=C2=A0 * the source migration region by the source server during the pre-c=
opy or<br>
+=C2=A0 =C2=A0 stop-and copy state, or<br>
+<br>
+=C2=A0 * the destination migration region by the destination client during=
 the<br>
+=C2=A0 =C2=A0 resuming state.<br>
+<br>
+Device-specific data must be stored at any position after<br>
+`struct vfio_device_migration_info`. Note that the migration region can be=
<br>
+memory mappable, even partially. In practise, only the migration data port=
ion<br>
+can be memory mapped.<br>
+<br>
+The client processes device state data during the pre-copy and the<br>
+stop-and-copy state in the following iterative manner:<br>
+<br>
+=C2=A0 1. The client reads `pending_bytes` to mark a new iteration. Repeat=
ed reads<br>
+=C2=A0 =C2=A0 =C2=A0of this field is an idempotent operation. If there are=
 no migration data<br>
+=C2=A0 =C2=A0 =C2=A0to be consumed then the next step depends on the curre=
nt device state:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0* pre-copy: the client must try again.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0* stop-and-copy: this procedure can end and the device=
 can now start<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0resuming on the destination.<br>
+<br>
+=C2=A0 2. The client reads `data_offset`; at thich point the server must m=
ake<br>
+=C2=A0 =C2=A0 =C2=A0available a portion of migration data at this offset t=
o be read by the<br>
+=C2=A0 =C2=A0 =C2=A0client, which must happen *before* completing the read=
 operation. The<br>
+=C2=A0 =C2=A0 =C2=A0amount of data to be read must be stored in the `data_=
size` field, which<br>
+=C2=A0 =C2=A0 =C2=A0the client reads next.<br>
+<br>
+=C2=A0 3. The client reads `data_size` to determine the amount of migratio=
n data<br>
+=C2=A0 =C2=A0 =C2=A0available.<br>
+<br>
+=C2=A0 4. The client reads and processes the migration data.<br>
+<br>
+=C2=A0 5. Go to step 1.<br>
+<br>
+Note that the client can transition the device from the pre-copy state to =
the<br>
+stop-and-copy state at any time; `pending_bytes` does not need to become z=
ero.<br>
+<br>
+The client initializes the device state on the destination by setting the<=
br>
+device state in the resuming state and writing the migration data to the<b=
r>
+destination migration region at `data_offset` offset. The client can write=
 the<br>
+source migration data in an iterative manner and the server must consume t=
his<br>
+data before completing each write operation, updating the `data_offset` fi=
eld.<br>
+The server must apply the source migration data on the device resume state=
. The<br>
+client must write data on the same order and transction size as read.<br>
+<br>
+If an error occurs then the server must fail the read or write operation. =
It is<br>
+an implementation detail of the client how to handle errors.<br>
+<br>
+VFIO_USER_DEVICE_GET_IRQ_INFO<br>
+-----------------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Message size | 32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| IRQ info=C2=A0 =C2=A0 =C2=A0| VFIO IRQ info=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent by the client to the server to query for<br>
+information about device interrupt types. The VFIO IRQ info structure is<b=
r>
+defined in ``&lt;linux/vfio.h&gt;`` (``struct vfio_irq_info``).<br>
+<br>
+VFIO IRQ info format<br>
+^^^^^^^^^^^^^^^^^^^^<br>
+<br>
++-------+--------+---------------------------+<br>
+| Name=C2=A0 | Offset | Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| argsz | 16=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------+--------+---------------------------+<br>
+| flags | 20=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------+--------+---------------------------+<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+--------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | Bit | Definition=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 0=C2=A0 =C2=A0| VFIO_IRQ_INFO_EVENTFD=C2=
=A0 =C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+--------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 1=C2=A0 =C2=A0| VFIO_IRQ_INFO_MASKABLE=C2=
=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+--------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 2=C2=A0 =C2=A0| VFIO_IRQ_INFO_AUTOMASKED |=
 |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+--------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 3=C2=A0 =C2=A0| VFIO_IRQ_INFO_NORESIZE=C2=
=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+--------------------------+ |<br>
++-------+--------+---------------------------+<br>
+| index | 24=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------+--------+---------------------------+<br>
+| count | 28=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------+--------+---------------------------+<br>
+<br>
+* *argsz* is the size of the VFIO IRQ info structure.<br>
+* *flags* defines IRQ attributes:<br>
+<br>
+=C2=A0 * *VFIO_IRQ_INFO_EVENTFD* indicates the IRQ type can support server=
 eventfd<br>
+=C2=A0 =C2=A0 signalling.<br>
+=C2=A0 * *VFIO_IRQ_INFO_MASKABLE* indicates that the IRQ type supports the=
 MASK and<br>
+=C2=A0 =C2=A0 UNMASK actions in a VFIO_USER_DEVICE_SET_IRQS message.<br>
+=C2=A0 * *VFIO_IRQ_INFO_AUTOMASKED* indicates the IRQ type masks itself af=
ter being<br>
+=C2=A0 =C2=A0 triggered, and the client must send an UNMASK action to rece=
ive new<br>
+=C2=A0 =C2=A0 interrupts.<br>
+=C2=A0 * *VFIO_IRQ_INFO_NORESIZE* indicates VFIO_USER_SET_IRQS operations =
setup<br>
+=C2=A0 =C2=A0 interrupts as a set, and new sub-indexes cannot be enabled w=
ithout disabling<br>
+=C2=A0 =C2=A0 the entire type.<br>
+<br>
+* index is the index of IRQ type being queried, it is the only field that =
is<br>
+=C2=A0 required to be set in the command message.<br>
+* count describes the number of interrupts of the queried type.<br>
+<br>
+VFIO_USER_DEVICE_SET_IRQS<br>
+-------------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Message size | 36 + any data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| IRQ set=C2=A0 =C2=A0 =C2=A0 | VFIO IRQ set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent by the client to the server to set actions fo=
r<br>
+device interrupt types. The VFIO IRQ set structure is defined in<br>
+``&lt;linux/vfio.h&gt;`` (``struct vfio_irq_set``).<br>
+<br>
+VFIO IRQ set format<br>
+^^^^^^^^^^^^^^^^^^^<br>
+<br>
++-------+--------+------------------------------+<br>
+| Name=C2=A0 | Offset | Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| argsz | 16=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++-------+--------+------------------------------+<br>
+| flags | 20=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++-------+--------+------------------------------+<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-----------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | Bit | Definition=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 0=C2=A0 =C2=A0| VFIO_IRQ_SET_DATA_NONE=C2=
=A0 =C2=A0 =C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-----------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 1=C2=A0 =C2=A0| VFIO_IRQ_SET_DATA_BOOL=C2=
=A0 =C2=A0 =C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-----------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 2=C2=A0 =C2=A0| VFIO_IRQ_SET_DATA_EVENTFD=
=C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-----------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 3=C2=A0 =C2=A0| VFIO_IRQ_SET_ACTION_MASK=
=C2=A0 =C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-----------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 4=C2=A0 =C2=A0| VFIO_IRQ_SET_ACTION_UNMASK=
=C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-----------------------------+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 5=C2=A0 =C2=A0| VFIO_IRQ_SET_ACTION_TRIGGE=
R | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-----------------------------+ |<br>
++-------+--------+------------------------------+<br>
+| index | 24=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++-------+--------+------------------------------+<br>
+| start | 28=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++-------+--------+------------------------------+<br>
+| count | 32=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++-------+--------+------------------------------+<br>
+| data=C2=A0 | 36=C2=A0 =C2=A0 =C2=A0| variable=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------+--------+------------------------------+<br>
+<br>
+* *argsz* is the size of the VFIO IRQ set structure, including any *data* =
field.<br>
+* *flags* defines the action performed on the interrupt range. The DATA fl=
ags<br>
+=C2=A0 describe the data field sent in the message; the ACTION flags descr=
ibe the<br>
+=C2=A0 action to be performed. The flags are mutually exclusive for both s=
ets.<br>
+<br>
+=C2=A0 * *VFIO_IRQ_SET_DATA_NONE* indicates there is no data field in the =
command.<br>
+=C2=A0 =C2=A0 The action is performed unconditionally.<br>
+=C2=A0 * *VFIO_IRQ_SET_DATA_BOOL* indicates the data field is an array of =
boolean<br>
+=C2=A0 =C2=A0 bytes. The action is performed if the corresponding boolean =
is true.<br>
+=C2=A0 * *VFIO_IRQ_SET_DATA_EVENTFD* indicates an array of event file desc=
riptors<br>
+=C2=A0 =C2=A0 was sent in the message meta-data. These descriptors will be=
 signalled when<br>
+=C2=A0 =C2=A0 the action defined by the action flags occurs. In AF_UNIX so=
ckets, the<br>
+=C2=A0 =C2=A0 descriptors are sent as SCM_RIGHTS type ancillary data.<br>
+=C2=A0 * *VFIO_IRQ_SET_ACTION_MASK* indicates a masking event. It can be u=
sed with<br>
+=C2=A0 =C2=A0 VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to mask an =
interrupt, or<br>
+=C2=A0 =C2=A0 with VFIO_IRQ_SET_DATA_EVENTFD to generate an event when the=
 guest masks<br>
+=C2=A0 =C2=A0 the interrupt.<br>
+=C2=A0 * *VFIO_IRQ_SET_ACTION_UNMASK* indicates an unmasking event. It can=
 be used<br>
+=C2=A0 =C2=A0 with VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to unm=
ask an<br>
+=C2=A0 =C2=A0 interrupt, or with VFIO_IRQ_SET_DATA_EVENTFD to generate an =
event when the<br>
+=C2=A0 =C2=A0 guest unmasks the interrupt.<br>
+=C2=A0 * *VFIO_IRQ_SET_ACTION_TRIGGER* indicates a triggering event. It ca=
n be used<br>
+=C2=A0 =C2=A0 with VFIO_IRQ_SET_DATA_BOOL or VFIO_IRQ_SET_DATA_NONE to tri=
gger an<br>
+=C2=A0 =C2=A0 interrupt, or with VFIO_IRQ_SET_DATA_EVENTFD to generate an =
event when the<br>
+=C2=A0 =C2=A0 server triggers the interrupt.<br>
+<br>
+* *index* is the index of IRQ type being setup.<br>
+* *start* is the start of the sub-index being set.<br>
+* *count* describes the number of sub-indexes being set. As a special case=
, a<br>
+=C2=A0 count of 0 with data flags of VFIO_IRQ_SET_DATA_NONE disables all i=
nterrupts<br>
+=C2=A0 of the index.<br>
+* *data* is an optional field included when the<br>
+=C2=A0 VFIO_IRQ_SET_DATA_BOOL flag is present. It contains an array of boo=
leans<br>
+=C2=A0 that specify whether the action is to be performed on the correspon=
ding<br>
+=C2=A0 index. It&#39;s used when the action is only performed on a subset =
of the range<br>
+=C2=A0 specified.<br>
+<br>
+Not all interrupt types support every combination of data and action flags=
.<br>
+The client must know the capabilities of the device and IRQ index before i=
t<br>
+sends a VFIO_USER_DEVICE_SET_IRQ message.<br>
+<br>
+.. _Read and Write Operations:<br>
+<br>
+Read and Write Operations<br>
+-------------------------<br>
+<br>
+Not all I/O operations between the client and server can be done via direc=
t<br>
+access of memory mapped with an mmap() call. In these cases, the client an=
d<br>
+server use messages sent over the socket. It is expected that these operat=
ions<br>
+will have lower performance than direct access.<br>
+<br>
+The client can access server memory with VFIO_USER_REGION_READ and<br>
+VFIO_USER_REGION_WRITE commands. These share a common data structure that<=
br>
+appears after the message header.<br>
+<br>
+REGION Read/Write Data<br>
+^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
++--------+--------+----------+<br>
+| Name=C2=A0 =C2=A0| Offset | Size=C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+<br>
+| Offset | 16=C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------+--------+----------+<br>
+| Region | 24=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------+--------+----------+<br>
+| Count=C2=A0 | 28=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------+--------+----------+<br>
+| Data=C2=A0 =C2=A0| 32=C2=A0 =C2=A0 =C2=A0| variable |<br>
++--------+--------+----------+<br>
+<br>
+* *Offset* into the region being accessed.<br>
+* *Region* is the index of the region being accessed.<br>
+* *Count* is the size of the data to be transferred.<br>
+* *Data* is the data to be read or written.<br>
+<br>
+The server can access client memory with VFIO_USER_DMA_READ and<br>
+VFIO_USER_DMA_WRITE messages. These also share a common data structure tha=
t<br>
+appears after the message header.<br>
+<br>
+DMA Read/Write Data<br>
+^^^^^^^^^^^^^^^^^^^<br>
+<br>
++---------+--------+----------+<br>
+| Name=C2=A0 =C2=A0 | Offset | Size=C2=A0 =C2=A0 =C2=A0|<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+<br>
+| Address | 16=C2=A0 =C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++---------+--------+----------+<br>
+| Count=C2=A0 =C2=A0| 24=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |<br>
++---------+--------+----------+<br>
+| Data=C2=A0 =C2=A0 | 28=C2=A0 =C2=A0 =C2=A0| variable |<br>
++---------+--------+----------+<br>
+<br>
+* *Address* is the area of client memory being accessed. This address must=
 have<br>
+=C2=A0 been previously exported to the server with a VFIO_USER_DMA_MAP mes=
sage.<br>
+* *Count* is the size of the data to be transferred.<br>
+* *Data* is the data to be read or written.<br>
+<br>
+VFIO_USER_REGION_READ<br>
+---------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Message size | 32 + data size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Read info=C2=A0 =C2=A0 | REGION read/write data |<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent from the client to the server to read from se=
rver<br>
+memory.=C2=A0 In the command messages, there is no data, and the count is =
the amount<br>
+of data to be read. The reply message must include the data read, and its =
count<br>
+field is the amount of data read.<br>
+<br>
+VFIO_USER_REGION_WRITE<br>
+----------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Message size | 32 + data size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| Write info=C2=A0 =C2=A0| REGION read/write data |<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent from the client to the server to write to ser=
ver<br>
+memory.=C2=A0 The command message must contain the data to be written, and=
 its count<br>
+field must contain the amount of write data. The count field in the reply<=
br>
+message must be zero.<br>
+<br>
+VFIO_USER_DMA_READ<br>
+------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 10=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Message size | 28 + data size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| DMA info=C2=A0 =C2=A0 =C2=A0| DMA read/write data=C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent from the server to the client to read from cl=
ient<br>
+memory.=C2=A0 In the command message, there is no data, and the count must=
 will be<br>
+the amount of data to be read. The reply message must include the data rea=
d,<br>
+and its count field must be the amount of data read.<br>
+<br>
+VFIO_USER_DMA_WRITE<br>
+-------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Message size | 28 + data size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+| DMA info=C2=A0 =C2=A0 =C2=A0| DMA read/write data=C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent from the server to the client to write to cli=
ent<br>
+memory.=C2=A0 The command message must contain the data to be written, and=
 its count<br>
+field must contain the amount of write data. The count field in the reply<=
br>
+message must be zero.<br>
+<br>
+VFIO_USER_VM_INTERRUPT<br>
+----------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++----------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++----------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++----------------+------------------------+<br>
+| Message size=C2=A0 =C2=A0| 20=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++----------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++----------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++----------------+------------------------+<br>
+| Interrupt info | &lt;interrupt&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |<br>
++----------------+------------------------+<br>
+<br>
+This command message is sent from the server to the client to signal the d=
evice<br>
+has raised an interrupt.<br>
+<br>
+Interrupt info format<br>
+^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
++-----------+--------+------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 | Offset | Size |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D+<br>
+| Sub-index | 16=C2=A0 =C2=A0 =C2=A0| 4=C2=A0 =C2=A0 |<br>
++-----------+--------+------+<br>
+<br>
+* *Sub-index* is relative to the IRQ index, e.g., the vector number used i=
n PCI<br>
+=C2=A0 MSI/X type interrupts.<br>
+<br>
+VFIO_USER_DEVICE_RESET<br>
+----------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 | 13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Message size | 16=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in reply |<br>
++--------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------+------------------------+<br>
+<br>
+This command message is sent from the client to the server to reset the de=
vice.<br>
+<br>
+VFIO_USER_DIRTY_PAGES<br>
+---------------------<br>
+<br>
+Message format<br>
+^^^^^^^^^^^^^^<br>
+<br>
++--------------------+------------------------+<br>
+| Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Value=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| Message ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| &lt;ID&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------------+------------------------+<br>
+| Command=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------------+------------------------+<br>
+| Message size=C2=A0 =C2=A0 =C2=A0 =C2=A0| 16=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++--------------------+------------------------+<br>
+| Flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Reply bit set in=
 reply |<br>
++--------------------+------------------------+<br>
+| Error=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0/errno=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++--------------------+------------------------+<br>
+| VFIO Dirty bitmap=C2=A0 | &lt;dirty bitmap&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|<br>
++--------------------+------------------------+<br>
+<br>
+This command is analogous to VFIO_IOMMU_DIRTY_PAGES. It is sent by the cli=
ent<br>
+to the server in order to control logging of dirty pages, usually during a=
 live<br>
+migration. The VFIO dirty bitmap structure is defined in ``&lt;linux/vfio.=
h&gt;``<br>
+(``struct vfio_iommu_type1_dirty_bitmap``).<br>
+<br>
+VFIO Dirty Bitmap Format<br>
+^^^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
++-------+--------+-----------------------------------------+<br>
+| Name=C2=A0 | Offset | Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>
++=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+<br>
+| argsz | 0=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------+--------+-----------------------------------------+<br>
+| flags | 4=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------+--------+-----------------------------------------+<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-------------------------------------=
---+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | Bit | Definition=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 0=C2=A0 =C2=A0| VFIO_IOMMU_DIRTY_PAGES_FLA=
G_START=C2=A0 =C2=A0 =C2=A0 | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-------------------------------------=
---+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 1=C2=A0 =C2=A0| VFIO_IOMMU_DIRTY_PAGES_FLA=
G_STOP=C2=A0 =C2=A0 =C2=A0 =C2=A0| |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-------------------------------------=
---+ |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| | 2=C2=A0 =C2=A0| VFIO_IOMMU_DIRTY_PAGES_FLA=
G_GET_BITMAP | |<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0| +-----+-------------------------------------=
---+ |<br>
++-------+--------+-----------------------------------------+<br>
+| data=C2=A0 | 8=C2=A0 =C2=A0 =C2=A0 | 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++-------+--------+-----------------------------------------+<br>
+<br>
+* *argsz* is the size of the VFIO dirty bitmap info structure.<br>
+<br>
+* *flags* defines the action to be performed by the server:<br>
+<br>
+=C2=A0 * *VFIO_IOMMU_DIRTY_PAGES_FLAG_START* instructs the server to start=
 logging<br>
+=C2=A0 =C2=A0 pages it dirties. Logging continues until explicitly disable=
d by<br>
+=C2=A0 =C2=A0 VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP.<br>
+<br>
+=C2=A0 * *VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP* instructs the server to stop l=
ogging<br>
+=C2=A0 =C2=A0 dirty pages.<br>
+<br>
+=C2=A0 * *VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP* requests from the server=
 to return<br>
+=C2=A0 =C2=A0 the dirty bitmap for a specific IOVA range. The IOVA range i=
s specified by<br>
+=C2=A0 =C2=A0 &quot;VFIO dirty bitmap get&quot; structure, which must imme=
diatelly follow the<br>
+=C2=A0 =C2=A0 &quot;VFIO dirty bitmap&quot; structure, explained next. Thi=
s operation is only valid<br>
+=C2=A0 =C2=A0 if logging of dirty pages has been previously started. The s=
erver must<br>
+=C2=A0 =C2=A0 respond the same way it does for VFIO_USER_DMA_UNMAP (the di=
rty pages<br>
+=C2=A0 =C2=A0 bitmap must follow the response header).<br>
+<br>
+=C2=A0 These flags are mutually exclusive with each other.<br>
+<br>
+* *data* This field is unused in vfio-user.<br>
+<br>
+VFIO Dirty Bitmap Get Format<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
++--------+--------+------+<br>
+| Name=C2=A0 =C2=A0| Offset | Size |<br>
++=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D+<br>
+| iova=C2=A0 =C2=A0| 0=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 |<br>
++--------+--------+------+<br>
+| size=C2=A0 =C2=A0| 8=C2=A0 =C2=A0 =C2=A0 | 8=C2=A0 =C2=A0 |<br>
++--------+--------+------+<br>
+| bitmap | 16=C2=A0 =C2=A0 =C2=A0| 24=C2=A0 =C2=A0|<br>
++--------+--------+------+<br>
+<br>
+* *iova* is the IOVA offset<br>
+<br>
+* *size* is the size of the IOVA region<br>
+<br>
+* *bitmap* is the VFIO bitmap (``struct vfio_bitmap``), with the same sema=
ntics<br>
+=C2=A0 as VFIO_USER_DMA_UNMAP.<br>
+<br>
+<br>
+Appendices<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+Unused VFIO ioctl() commands<br>
+----------------------------<br>
+<br>
+The following VFIO commands do not have an equivalent vfio-user command:<b=
r>
+<br>
+* VFIO_GET_API_VERSION<br>
+* VFIO_CHECK_EXTENSION<br>
+* VFIO_SET_IOMMU<br>
+* VFIO_GROUP_GET_STATUS<br>
+* VFIO_GROUP_SET_CONTAINER<br>
+* VFIO_GROUP_UNSET_CONTAINER<br>
+* VFIO_GROUP_GET_DEVICE_FD<br>
+* VFIO_IOMMU_GET_INFO<br>
+<br>
+However, once support for live migration for VFIO devices is finalized som=
e<br>
+of the above commands may have to be handled by the client in their<br>
+corresponding vfio-user form. This will be addressed in a future protocol<=
br>
+version.<br>
+<br>
+VFIO groups and containers<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
+The current VFIO implementation includes group and container idioms that<b=
r>
+describe how a device relates to the host IOMMU. In the vfio-user<br>
+implementation, the IOMMU is implemented in SW by the client, and is not<b=
r>
+visible to the server. The simplest idea would be that the client put each=
<br>
+device into its own group and container.<br>
+<br>
+Backend Program Conventions<br>
+---------------------------<br>
+<br>
+vfio-user backend program conventions are based on the vhost-user ones.<br=
>
+<br>
+* The backend program must not daemonize itself.<br>
+* No assumptions must be made as to what access the backend program has on=
 the<br>
+=C2=A0 system.<br>
+* File descriptors 0, 1 and 2 must exist, must have regular<br>
+=C2=A0 stdin/stdout/stderr semantics, and can be redirected.<br>
+* The backend program must honor the SIGTERM signal.<br>
+* The backend program must accept the following commands line options:<br>
+<br>
+=C2=A0 * ``--socket-path=3DPATH``: path to UNIX domain socket,<br>
+=C2=A0 * ``--fd=3DFDNUM``: file descriptor for UNIX domain socket, incompa=
tible with<br>
+=C2=A0 =C2=A0 ``--socket-path``<br>
+* The backend program must be accompanied with a JSON file stored under<br=
>
+=C2=A0 ``/usr/share/vfio-user``.<br>
-- <br>
2.12.2<br>
</blockquote></div><div><br></div><div>Is there a schema for it? (similar t=
o docs/interop/vhost-user.json). If it&#39;s left for later, then a TODO no=
te should be left.<br></div><div><br></div><br>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004fb1eb05b562f7e0--

