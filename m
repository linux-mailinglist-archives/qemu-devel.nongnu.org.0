Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA1B37B5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 12:03:43 +0200 (CEST)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9nrC-0006rH-6D
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 06:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i9noR-0005oh-En
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 06:00:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i9noL-0004zK-1j
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 06:00:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41738)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i9noK-0004z5-QG
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 06:00:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 15F3318C4278
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 10:00:44 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFEC45D9E1;
 Mon, 16 Sep 2019 10:00:37 +0000 (UTC)
Date: Mon, 16 Sep 2019 11:00:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 stefanha@redhat.com
Message-ID: <20190916100035.GC2887@work-vm>
References: <20190912122514.22504-1-marcandre.lureau@redhat.com>
 <20190912122514.22504-6-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190912122514.22504-6-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Mon, 16 Sep 2019 10:00:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 5/6] docs: start a document to describe
 D-Bus usage
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
Cc: mprivozn@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Copying in Stefan since he was looking at DBus for virtiofs)

* Marc-Andr=E9 Lureau (marcandre.lureau@redhat.com) wrote:
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/interop/dbus.rst  | 73 ++++++++++++++++++++++++++++++++++++++++++
>  docs/interop/index.rst |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 docs/interop/dbus.rst
>=20
> diff --git a/docs/interop/dbus.rst b/docs/interop/dbus.rst
> new file mode 100644
> index 0000000000..c08f026edc
> --- /dev/null
> +++ b/docs/interop/dbus.rst
> @@ -0,0 +1,73 @@
> +=3D=3D=3D=3D=3D
> +D-Bus
> +=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +QEMU may be running with various helper processes involved:
> + - vhost-user* processes (gpu, virtfs, input, etc...)
> + - TPM emulation (or other devices)
> + - user networking (slirp)
> + - network services (DHCP/DNS, samba/ftp etc)
> + - background tasks (compression, streaming etc)
> + - client UI
> + - admin & cli
> +
> +Having several processes allows stricter security rules, as well as
> +greater modularity.
> +
> +While QEMU itself uses QMP as primary IPC (and Spice/VNC for remote
> +display), D-Bus is the de facto IPC of choice on Unix systems. The
> +wire format is machine friendly, good bindings exist for various
> +languages, and there are various tools available.
> +
> +Using a bus, helper processes can discover and communicate with each
> +other easily, without going through QEMU. The bus topology is also
> +easier to apprehend and debug than a mesh. However, it is wise to
> +consider the security aspects of it.
> +
> +Security
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A QEMU D-Bus bus should be private to a single VM. Thus, only
> +cooperative tasks are running on the same bus to serve the VM.
> +
> +D-Bus, the protocol and standard, doesn't have mechanisms to enforce
> +security between peers once the connection is established. Peers may
> +have additional mechanisms to enforce security rules, based for
> +example on UNIX credentials.
> +
> +dbus-daemon can enforce various policies based on the UID/GID of the
> +processes that are connected to it. It is thus a good idea to run
> +helpers as different UID from QEMU and set appropriate policies (so
> +helper processes are only allowed to talk to qemu for example).
> +
> +For example, this allows only ``qemu`` user to talk to ``qemu-helper``
> +``org.qemu.Helper1`` service:
> +
> +.. code:: xml
> +
> +  <policy user=3D"qemu">
> +     <allow send_destination=3D"org.qemu.Helper1"/>
> +     <allow receive_sender=3D"org.qemu.Helper1"/>
> +  </policy>
> +
> +  <policy user=3D"qemu-helper">
> +     <allow own=3D"org.qemu.Helper1"/>
> +  </policy>
> +
> +
> +dbus-daemon can also perfom SELinux checks based on the security
> +context of the source and the target. For example, ``virtiofs_t``
> +could be allowed to send a message to ``svirt_t``, but ``virtiofs_t``
> +wouldn't be allowed to send a message to ``virtiofs_t``.

I think we need to start thinking about this more now rather than
'can'. .

Dave

> +Guidelines
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +When implementing new D-Bus interfaces, it is recommended to follow
> +the "D-Bus API Design Guidelines":
> +https://dbus.freedesktop.org/doc/dbus-api-design.html
> +
> +The "org.qemu*" prefix is reserved for the QEMU project.
> diff --git a/docs/interop/index.rst b/docs/interop/index.rst
> index b4bfcab417..fa4478ce2e 100644
> --- a/docs/interop/index.rst
> +++ b/docs/interop/index.rst
> @@ -13,6 +13,7 @@ Contents:
>     :maxdepth: 2
> =20
>     bitmaps
> +   dbus
>     live-block-operations
>     pr-helper
>     vhost-user
> --=20
> 2.23.0
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

