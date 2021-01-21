Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AEC2FF1B2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:22:10 +0100 (CET)
Received: from localhost ([::1]:54270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2der-0006gt-Fs
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l2dRF-0001jB-6n
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:08:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l2dRC-00024w-MR
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611248881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4d1SDJAryZUSdcBi2waoAe3tBbirmDgXG2tM0wZ9I8=;
 b=cNzy7sUb2jHfpBjLqSGmSSDqUbS5BsO8HjdL0oB1tNNboeMWc9GXYeLchWSETiC3HyISGP
 BJG7Ht+cdUfbG1Z4euWptefkQI3PP6req3fUkyyx61mvpQA92y6NzztTY0ZDctYrpCRIcq
 vy17bkO7NrQPea37vAPmIm4IUK+VAzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-fPpkCvswMQmAsDBPDXshXg-1; Thu, 21 Jan 2021 12:07:49 -0500
X-MC-Unique: fPpkCvswMQmAsDBPDXshXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04D311081B2A;
 Thu, 21 Jan 2021 17:07:47 +0000 (UTC)
Received: from localhost (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DE4061F55;
 Thu, 21 Jan 2021 17:07:37 +0000 (UTC)
Date: Thu, 21 Jan 2021 17:07:36 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v20 00/20] Initial support for multi-process Qemu
Message-ID: <20210121170736.GF59088@stefanha-x1.localdomain>
References: <cover.1611081587.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 03:28:17PM -0500, Jagannathan Raman wrote:
> Hi,
>=20
> This is the v20 of the patchset. This version has the following changes:
>=20
> [PATCH v18 08/20] io: add qio_channel_readv_full_all_eof &
>                 qio_channel_readv_full_all helpers
>   - Considers fds as part of the "data" for both
>     qio_channel_readv_full_all_eof() &
>     qio_channel_readv_full_all().
>   - Addresses some of the error scenarios
>     which were not addressed in the previous revisions
>=20
> To touch upon the history of this project, we posted the Proof Of Concept
> patches before the BoF session in 2018. Subsequently, we have posted 19
> versions on the qemu-devel mailing list. You can find them by following
> the links below ([1] - [19]). Following people contributed to the design =
and
> implementation of this project:
> Jagannathan Raman <jag.raman@oracle.com>
> Elena Ufimtseva <elena.ufimtseva@oracle.com>
> John G Johnson <john.g.johnson@oracle.com>
> Stefan Hajnoczi <stefanha@redhat.com>
> Konrad Wilk <konrad.wilk@oracle.com>
> Kanth Ghatraju <kanth.ghatraju@oracle.com>
>=20
> We would like to thank you for your feedback in the
> design and implementation of this project. Qemu wiki page:
> https://wiki.qemu.org/Features/MultiProcessQEMU
>=20
> For the full concept writeup about QEMU multi-process, please
> refer to docs/devel/qemu-multiprocess.rst. Also, see
> docs/qemu-multiprocess.txt for usage information.
>=20
> Thank you for reviewing this series!
>=20
> [POC]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg566538.html
> [1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg602285.html
> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg624877.html
> [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html
> [4]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.html
> [5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg682429.html
> [6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg697484.html
> [7]: https://patchew.org/QEMU/cover.1593273671.git.elena.ufimtseva@oracle=
.com/
> [8]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg727007.html
> [9]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html
> [10]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.html
> [11]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg750972.html
> [12]: https://patchew.org/QEMU/cover.1606853298.git.jag.raman@oracle.com/
> [13]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg766825.html
> [14]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg768376.html
> [15]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg769178.html
> [16]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg771455.html
> [17]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg772512.html
> [18]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg772602.html
> [19]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg772980.html
>=20
> Elena Ufimtseva (8):
>   multi-process: add configure and usage information
>   io: add qio_channel_writev_full_all helper
>   io: add qio_channel_readv_full_all_eof & qio_channel_readv_full_all
>     helpers
>   multi-process: define MPQemuMsg format and transmission functions
>   multi-process: introduce proxy object
>   multi-process: add proxy communication functions
>   multi-process: Forward PCI config space acceses to the remote process
>   multi-process: perform device reset in the remote process
>=20
> Jagannathan Raman (11):
>   memory: alloc RAM from file at offset
>   multi-process: Add config option for multi-process QEMU
>   multi-process: setup PCI host bridge for remote device
>   multi-process: setup a machine object for remote device process
>   multi-process: Initialize message handler in remote device
>   multi-process: Associate fd of a PCIDevice with its object
>   multi-process: setup memory manager for remote device
>   multi-process: PCI BAR read/write handling for proxy & remote
>     endpoints
>   multi-process: Synchronize remote memory
>   multi-process: create IOHUB object to handle irq
>   multi-process: Retrieve PCI info from remote process
>=20
> John G Johnson (1):
>   multi-process: add the concept description to
>     docs/devel/qemu-multiprocess
>=20
>  docs/devel/index.rst                      |   1 +
>  docs/devel/multi-process.rst              | 966 ++++++++++++++++++++++++=
++++++
>  docs/multi-process.rst                    |  64 ++
>  configure                                 |  10 +
>  meson.build                               |   5 +-
>  hw/remote/trace.h                         |   1 +
>  include/exec/memory.h                     |   2 +
>  include/exec/ram_addr.h                   |   2 +-
>  include/hw/pci-host/remote.h              |  30 +
>  include/hw/pci/pci_ids.h                  |   3 +
>  include/hw/remote/iohub.h                 |  42 ++
>  include/hw/remote/machine.h               |  38 ++
>  include/hw/remote/memory.h                |  19 +
>  include/hw/remote/mpqemu-link.h           |  99 +++
>  include/hw/remote/proxy-memory-listener.h |  28 +
>  include/hw/remote/proxy.h                 |  48 ++
>  include/io/channel.h                      |  78 +++
>  include/qemu/mmap-alloc.h                 |   4 +-
>  include/sysemu/iothread.h                 |   6 +
>  backends/hostmem-memfd.c                  |   2 +-
>  hw/misc/ivshmem.c                         |   3 +-
>  hw/pci-host/remote.c                      |  75 +++
>  hw/remote/iohub.c                         | 119 ++++
>  hw/remote/machine.c                       |  80 +++
>  hw/remote/memory.c                        |  65 ++
>  hw/remote/message.c                       | 230 +++++++
>  hw/remote/mpqemu-link.c                   | 267 +++++++++
>  hw/remote/proxy-memory-listener.c         | 227 +++++++
>  hw/remote/proxy.c                         | 379 ++++++++++++
>  hw/remote/remote-obj.c                    | 203 +++++++
>  io/channel.c                              | 121 +++-
>  iothread.c                                |   6 +
>  softmmu/memory.c                          |   3 +-
>  softmmu/physmem.c                         |  11 +-
>  util/mmap-alloc.c                         |   7 +-
>  util/oslib-posix.c                        |   2 +-
>  Kconfig.host                              |   4 +
>  MAINTAINERS                               |  24 +
>  hw/Kconfig                                |   1 +
>  hw/meson.build                            |   1 +
>  hw/pci-host/Kconfig                       |   3 +
>  hw/pci-host/meson.build                   |   1 +
>  hw/remote/Kconfig                         |   4 +
>  hw/remote/meson.build                     |  13 +
>  hw/remote/trace-events                    |   4 +
>  45 files changed, 3265 insertions(+), 36 deletions(-)
>  create mode 100644 docs/devel/multi-process.rst
>  create mode 100644 docs/multi-process.rst
>  create mode 100644 hw/remote/trace.h
>  create mode 100644 include/hw/pci-host/remote.h
>  create mode 100644 include/hw/remote/iohub.h
>  create mode 100644 include/hw/remote/machine.h
>  create mode 100644 include/hw/remote/memory.h
>  create mode 100644 include/hw/remote/mpqemu-link.h
>  create mode 100644 include/hw/remote/proxy-memory-listener.h
>  create mode 100644 include/hw/remote/proxy.h
>  create mode 100644 hw/pci-host/remote.c
>  create mode 100644 hw/remote/iohub.c
>  create mode 100644 hw/remote/machine.c
>  create mode 100644 hw/remote/memory.c
>  create mode 100644 hw/remote/message.c
>  create mode 100644 hw/remote/mpqemu-link.c
>  create mode 100644 hw/remote/proxy-memory-listener.c
>  create mode 100644 hw/remote/proxy.c
>  create mode 100644 hw/remote/remote-obj.c
>  create mode 100644 hw/remote/Kconfig
>  create mode 100644 hw/remote/meson.build
>  create mode 100644 hw/remote/trace-events
>=20
> --=20
> 1.8.3.1
>=20

I will merge this when Daniel Berrange has reviewed it.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAJtNgACgkQnKSrs4Gr
c8gOwQgAjW9dw4KuW9Q/Hcux217R7VsypQMgnpXOP3eFyKevpqbHT4RDbky3AXvq
umR/n2FLDbidrdqjgG+pVWFraSSZ1H0tahSisoKw0SQalS09kcfq4d6WcVfw00j4
cN6GF1rbuVYwfOKgecZ3UVbGetzGeZBLJemdOMBq7NPJNuCnO0aSYzG6YSRzWQMg
DK3XPQaxIDsgTn4iQSBCZZ9ozkDXGmkPVfW7fMUYxc67ZWwMCOR6LeZDcaMUn0uM
z3EIvbds2NVfUXXQC8GaKN/1mu1LSe2Prf6hzEDlCg7NMRI6X8TNgT5QJbzMgTUC
FlStpnw53dbrtb1X1wN0x9jdQSlzLA==
=5jRS
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--


