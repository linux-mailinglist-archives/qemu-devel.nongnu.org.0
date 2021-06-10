Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5203A3083
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:24:33 +0200 (CEST)
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNTs-00044z-6V
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lrNSy-0002da-Vg
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:23:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lrNSv-0007Ik-QR
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623342212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P8ghX/0gIAqbpi+uFKoCfaCZHtbm4WdrXPNrux6nnx8=;
 b=Y0URp7ZvLTRE6tGPfhEdO17CSke9kSSyMH+L7EZABxMN072T7bxKjJFlpcAYUJt7od2jsi
 hatWiRUuGCgUOAJph+uL4V2a3MyfH/Ylm5+kiTyj62umElUgpVif41H4cJfQ/t5wH3enqG
 M8G/dLelEe1OAZwhlUtcVJFWhLImZqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-UOA77lUDP9SuRmIOe98jVQ-1; Thu, 10 Jun 2021 12:23:30 -0400
X-MC-Unique: UOA77lUDP9SuRmIOe98jVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5D6B8015C6;
 Thu, 10 Jun 2021 16:23:29 +0000 (UTC)
Received: from localhost (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 154DC46;
 Thu, 10 Jun 2021 16:23:25 +0000 (UTC)
Date: Thu, 10 Jun 2021 17:23:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 26/26] virtiofsd: Ask qemu to drop CAP_FSETID if
 client asked for it
Message-ID: <YMI8fS6m8CjtUtmE@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-27-dgilbert@redhat.com>
 <YJQNIPaFCJlG7ZKc@stefanha-x1.localdomain>
 <20210506160223.GA277745@redhat.com>
 <YJj3RSxXKZHxmiKu@stefanha-x1.localdomain>
 <20210510152324.GB150402@horse>
 <YJlSHZ0vzNtCAjkJ@stefanha-x1.localdomain>
 <YK/uUUZI3zy9k8Vk@work-vm> <YMIv5odJWdkbJzWL@work-vm>
MIME-Version: 1.0
In-Reply-To: <YMIv5odJWdkbJzWL@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qj6oTXXpImQHk+rE"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qj6oTXXpImQHk+rE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 04:29:42PM +0100, Dr. David Alan Gilbert wrote:
> * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
>=20
> <snip>
>=20
> > > Instead I was thinking about VHOST_USER_DMA_READ/WRITE messages
> > > containing the address (a device IOVA, it could just be a guest physi=
cal
> > > memory address in most cases) and the length. The WRITE message would
> > > also contain the data that the vhost-user device wishes to write. The
> > > READ message reply would contain the data that the device read from
> > > QEMU.
> > >=20
> > > QEMU would implement this using QEMU's address_space_read/write() API=
s.
> > >=20
> > > So basically just a new vhost-user protocol message to do a memcpy(),
> > > but with guest addresses and vIOMMU support :).
> >=20
> > This doesn't actually feel that hard - ignoring vIOMMU for a minute
> > which I know very little about - I'd have to think where the data
> > actually flows, probably the slave fd.
> >=20
> > > The vhost-user device will need to do bounce buffering so using these
> > > new messages is slower than zero-copy I/O to shared guest RAM.
> >=20
> > I guess the theory is it's only in the weird corner cases anyway.

The feature is also useful if DMA isolation is desirable (i.e.
security/reliability are more important than performance). Once this new
vhost-user protocol feature is available it will be possible to run
vhost-user devices without shared memory or with limited shared memory
(e.g. just the vring).

> The direction I'm going is something like the following;
> the idea is that the master will have to handle the requests on a
> separate thread, to avoid any problems with side effects from the memory
> accesses; the slave will then have to parkt he requests somewhere and
> handle them later.
>=20
>=20
> From 07aacff77c50c8a2b588b2513f2dfcfb8f5aa9df Mon Sep 17 00:00:00 2001
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Date: Thu, 10 Jun 2021 15:34:04 +0100
> Subject: [PATCH] WIP: vhost-user: DMA type interface
>=20
> A DMA type interface where the slave can ask for a stream of bytes
> to be read/written to the guests memory by the master.
> The interface is asynchronous, since a request may have side effects
> inside the guest.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  docs/interop/vhost-user.rst               | 33 +++++++++++++++++++++++
>  hw/virtio/vhost-user.c                    |  4 +++
>  subprojects/libvhost-user/libvhost-user.h | 24 +++++++++++++++++
>  3 files changed, 61 insertions(+)

Use of the word "RAM" in this patch is a little unclear since we need
these new messages precisely when it's not ordinary guest RAM :-). Maybe
referring to the address space is more general.

> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 9ebd05e2bf..b9b5322147 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -1347,6 +1347,15 @@ Master message types
>    query the backend for its device status as defined in the Virtio
>    specification.
> =20
> +``VHOST_USER_MEM_DATA``
> +  :id: 41
> +  :equivalent ioctl: N/A
> +  :slave payload: N/A
> +  :master payload: ``struct VhostUserMemReply``
> +
> +  This message is an asynchronous response to a ``VHOST_USER_SLAVE_MEM_A=
CCESS``
> +  message.  Where the request was for the master to read data, this
> +  message will be followed by the data that was read.

Please explain why this message is asynchronous. Implementors will need
to understand the gotchas around deadlocks, etc.

> =20
>  Slave message types
>  -------------------
> @@ -1469,6 +1478,30 @@ Slave message types
>    The ``VHOST_USER_FS_FLAG_MAP_W`` flag must be set in the ``flags`` fie=
ld to
>    write to the file from RAM.
> =20
> +``VHOST_USER_SLAVE_MEM_ACCESS``
> +  :id: 9
> +  :equivalent ioctl: N/A
> +  :slave payload: ``struct VhostUserMemAccess``
> +  :master payload: N/A
> +
> +  Requests that the master perform a range of memory accesses on behalf
> +  of the slave that the slave can't perform itself.
> +
> +  The ``VHOST_USER_MEM_FLAG_TO_MASTER`` flag must be set in the ``flags`=
`
> +  field for the slave to write data into the RAM of the master.   In thi=
s
> +  case the data to write follows the ``VhostUserMemAccess`` on the fd.
> +  The ``VHOST_USER_MEM_FLAG_FROM_MASTER`` flag must be set in the ``flag=
s``
> +  field for the slave to read data from the RAM of the master.
> +
> +  When the master has completed the access it replies on the main fd wit=
h
> +  a ``VHOST_USER_MEM_DATA`` message.
> +
> +  The master is allowed to complete part of the request and reply statin=
g
> +  the amount completed, leaving it to the slave to resend further compon=
ents.
> +  This may happen to limit memory allocations in the master or to simpli=
fy
> +  the implementation.
> +
> +
>  .. _reply_ack:
> =20
>  VHOST_USER_PROTOCOL_F_REPLY_ACK
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 39a0e55cca..a3fefc4c1d 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -126,6 +126,9 @@ typedef enum VhostUserRequest {
>      VHOST_USER_GET_MAX_MEM_SLOTS =3D 36,
>      VHOST_USER_ADD_MEM_REG =3D 37,
>      VHOST_USER_REM_MEM_REG =3D 38,
> +    VHOST_USER_SET_STATUS =3D 39,
> +    VHOST_USER_GET_STATUS =3D 40,
> +    VHOST_USER_MEM_DATA =3D 41,
>      VHOST_USER_MAX
>  } VhostUserRequest;
> =20
> @@ -139,6 +142,7 @@ typedef enum VhostUserSlaveRequest {
>      VHOST_USER_SLAVE_FS_MAP =3D 6,
>      VHOST_USER_SLAVE_FS_UNMAP =3D 7,
>      VHOST_USER_SLAVE_FS_IO =3D 8,
> +    VHOST_USER_SLAVE_MEM_ACCESS =3D 9,
>      VHOST_USER_SLAVE_MAX
>  }  VhostUserSlaveRequest;
> =20
> diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libv=
host-user/libvhost-user.h
> index eee611a2f6..b5444f4f6f 100644
> --- a/subprojects/libvhost-user/libvhost-user.h
> +++ b/subprojects/libvhost-user/libvhost-user.h
> @@ -109,6 +109,9 @@ typedef enum VhostUserRequest {
>      VHOST_USER_GET_MAX_MEM_SLOTS =3D 36,
>      VHOST_USER_ADD_MEM_REG =3D 37,
>      VHOST_USER_REM_MEM_REG =3D 38,
> +    VHOST_USER_SET_STATUS =3D 39,
> +    VHOST_USER_GET_STATUS =3D 40,
> +    VHOST_USER_MEM_DATA =3D 41,
>      VHOST_USER_MAX
>  } VhostUserRequest;
> =20
> @@ -122,6 +125,7 @@ typedef enum VhostUserSlaveRequest {
>      VHOST_USER_SLAVE_FS_MAP =3D 6,
>      VHOST_USER_SLAVE_FS_UNMAP =3D 7,
>      VHOST_USER_SLAVE_FS_IO =3D 8,
> +    VHOST_USER_SLAVE_MEM_ACCESS =3D 9,
>      VHOST_USER_SLAVE_MAX
>  }  VhostUserSlaveRequest;
> =20
> @@ -220,6 +224,24 @@ typedef struct VhostUserInflight {
>      uint16_t queue_size;
>  } VhostUserInflight;
> =20
> +/* For the flags field of VhostUserMemAccess and VhostUserMemReply */
> +#define VHOST_USER_MEM_FLAG_TO_MASTER (1u << 0)
> +#define VHOST_USER_MEM_FLAG_FROM_MASTER (1u << 1)
> +typedef struct VhostUserMemAccess {
> +    uint32_t id; /* Included in the reply */
> +    uint32_t flags;

Is VHOST_USER_MEM_FLAG_TO_MASTER | VHOST_USER_MEM_FLAG_FROM_MASTER
valid?

> +    uint64_t addr; /* In the bus address of the device */

Please check the spec for preferred terminology. "bus address" isn't
used in the spec, so there's probably another term for it.

> +    uint64_t len;  /* In bytes */
> +} VhostUserMemAccess;
> +
> +typedef struct VhostUserMemReply {
> +    uint32_t id; /* From the request */
> +    uint32_t flags;

Are any flags defined?

> +    uint32_t err; /* 0 on success */
> +    uint32_t align;

Is this a reserved padding field? "align" is confusing because it could
refer to some kind of memory alignment value. "reserved" or "padding" is
clearer.

> +    uint64_t len;
> +} VhostUserMemReply;
> +
>  #if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
>  # define VU_PACKED __attribute__((gcc_struct, packed))
>  #else
> @@ -248,6 +270,8 @@ typedef struct VhostUserMsg {
>          VhostUserVringArea area;
>          VhostUserInflight inflight;
>          VhostUserFSSlaveMsgMax fs_max;
> +        VhostUserMemAccess memaccess;
> +        VhostUserMemReply  memreply;
>      } payload;
> =20
>      int fds[VHOST_MEMORY_BASELINE_NREGIONS];
> --=20
> 2.31.1
>=20
> --=20
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>=20

--qj6oTXXpImQHk+rE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDCPH0ACgkQnKSrs4Gr
c8hrHggAxjTpWefcfpB+NyorglfeAAFFuAsMvL9eIBlXa2RbRGX8XZ9W76RkA3JN
eNPZ4XTYnbGbS/Lp6xUt7rdWIZmLaH2V8b8HZHJCcXmwCONO97jiuoJ7KxZnE2jU
fcBCP/Ldk3QkpIYo9K0zL9Rh9poJo71BckyMShTAn0FdlCEjSFiruYp+30CYGAr1
C8hV89aXyButGQuz26t8c32vGf2PS45+pNOJxLqhUvSNGsIxEv3wJReO4zm9hdTL
9/VxPxkNr8UUL4RggjXWZMIvfRbkoJnrEhlAfsaBqYtkAkpr/7t8P3fgxzN4uHfZ
rhLOBfyzZ2M0v7oQDDwzvN1bZAGhGw==
=XKaC
-----END PGP SIGNATURE-----

--qj6oTXXpImQHk+rE--


