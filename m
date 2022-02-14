Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CEE4B54CC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:29:54 +0100 (CET)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdIX-0006T4-MW
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:29:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJcjG-0001Cp-Ee
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:53:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJcj7-0005B5-90
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644850387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Lcx1zAu9pDARJIiAqnZ+V960RgWWr0RCbglrlP81gk=;
 b=H3LWEkiYoyyMgkmU+zMd00e4GXHMbg5H8lgK/NXqoLbyqRhKoO1aiF+nm64wALeo1ama7l
 N/9pw9o46OnqwTOWe+6qbta0qe+XlcQMT2yBoDjCqOwlvZ+z9rRnLMmfGD6OhoIg64zftx
 ZGqU0908lx8LM3+nFZZ39rIDP7Wqa38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-l51nYjzXMeWqCg5GbNVlfA-1; Mon, 14 Feb 2022 09:53:06 -0500
X-MC-Unique: l51nYjzXMeWqCg5GbNVlfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2A4B1006AA3;
 Mon, 14 Feb 2022 14:53:04 +0000 (UTC)
Received: from localhost (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0804B7DE48;
 Mon, 14 Feb 2022 14:52:30 +0000 (UTC)
Date: Mon, 14 Feb 2022 14:52:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [RFC 0/8] ioregionfd introduction
Message-ID: <YgpsrdhBKfhbXPnG@stefanha-x1.localdomain>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UXI8lKy/UsBH2d4H"
Content-Disposition: inline
In-Reply-To: <cover.1644302411.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 mst@redhat.com, berrange@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UXI8lKy/UsBH2d4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 11:22:14PM -0800, Elena Ufimtseva wrote:
> This patchset is an RFC version for the ioregionfd implementation
> in QEMU. The kernel patches are to be posted with some fixes as a v4.
>=20
> For this implementation version 3 of the posted kernel patches was user:
> https://lore.kernel.org/kvm/cover.1613828726.git.eafanasova@gmail.com/
>=20
> The future version will include support for vfio/libvfio-user.
> Please refer to the design discussion here proposed by Stefan:
> https://lore.kernel.org/all/YXpb1f3KicZxj1oj@stefanha-x1.localdomain/T/
>=20
> The vfio-user version needed some bug-fixing and it was decided to send
> this for multiprocess first.
>=20
> The ioregionfd is configured currently trough the command line and each
> ioregionfd represent an object. This allow for easy parsing and does
> not require device/remote object command line option modifications.
>=20
> The following command line can be used to specify ioregionfd:
> <snip>
>   '-object', 'x-remote-object,id=3Drobj1,devid=3Dlsi0,fd=3D'+str(remote.f=
ileno()),\
>   '-object', 'ioregionfd-object,id=3Dioreg2,devid=3Dlsi0,iofd=3D'+str(ior=
d.fileno())+',bar=3D1',\
>   '-object', 'ioregionfd-object,id=3Dioreg3,devid=3Dlsi0,iofd=3D'+str(ior=
d.fileno())+',bar=3D2',\

Explicit configuration of ioregionfd-object is okay for early
prototyping, but what is the plan for integrating this? I guess
x-remote-object would query the remote device to find out which
ioregionfds need to be registered and the user wouldn't need to specify
ioregionfds on the command-line?

> </snip>
>=20
> Proxy side of ioregionfd in this version uses only one file descriptor:
> <snip>
>   '-device', 'x-pci-proxy-dev,id=3Dlsi0,fd=3D'+str(proxy.fileno())+',iore=
gfd=3D'+str(iowr.fileno()), \
> </snip>

This raises the question of the ioregionfd file descriptor lifecycle. In
the end I think it shouldn't be specified on the command-line. Instead
the remote device should create it and pass it to QEMU over the
mpqemu/remote fd?

>=20
> This is done for RFC version and my though was that next version will
> be for vfio-user, so I have not dedicated much effort to this command
> line options.
>=20
> The multiprocess messaging protocol was extended to support inquiries
> by the proxy if device has any ioregionfds.
> This RFC implements inquires by proxy about the type of BAR (ioregionfd
> or not) and the type of it (memory/io).
>=20
> Currently there are few limitations in this version of ioregionfd.
>  - one ioregionfd per bar, only full bar size is supported;
>  - one file descriptor per device for all of its ioregionfds;
>  - each remote device runs fd handler for all its BARs in one IOThread;
>  - proxy supports only one fd.
>=20
> Some of these limitations will be dropped in the future version.
> This RFC is to acquire the feedback/suggestions from the community
> on the general approach.
>=20
> The quick performance test was done for the remote lsi device with
> ioregionfd and without for both mem BARs (1 and 2) with help
> of the fio tool:
>=20
> Random R/W:
>=20
> 	             read IOPS	read BW     write IOPS   write BW
> no ioregionfd	 889	    3559KiB/s   890          3561KiB/s
> ioregionfd	     938	    3756KiB/s   939          3757KiB/s

This is extremely slow, even for random I/O. How does this compare to
QEMU running the LSI device without multi-process mode?

> Sequential Read and Sequential Write:
>=20
>                  Sequential read		Sequential write=09
>                  read IOPS	read BW	    write IOPS	 write BW
>=20
> no ioregionfd    367k	    1434MiB/s	76k	         297MiB/s
> ioregionfd       374k	    1459MiB/s	77.3k	     302MiB/s

It's normal for read and write IOPS to differ, but the read IOPS are
very high. I wonder if caching and read-ahead are hiding the LSI
device's actual performance here.

What are the fio and QEMU command-lines?

In order to benchmark ioregionfd it's best to run a benchmark where the
bottleneck is MMIO/PIO dispatch. Otherwise we're looking at some other
bottleneck (e.g. physical disk I/O performance) and the MMIO/PIO
dispatch cost doesn't affect IOPS significantly.

I suggest trying --blockdev null-co,size=3D64G,id=3Dnull0 as the disk
instead of a file or host block device. The fio block size should be 4k
to minimize the amount of time spent on I/O buffer contents and
iodepth=3D1 because batching multiple requests with iodepth > 0 hides the
MMIO/PIO dispatch bottleneck.

Stefan

--UXI8lKy/UsBH2d4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIKbK0ACgkQnKSrs4Gr
c8hliQf/fzyJGeCkJFsG4DK5d8juLKEm9W4dCdclbFe9cNT1mt4Ftg8bHoP4TJMP
o8awCkXQylJOwMdtd7bZxuraJziZvMCm0Kbm4L0xa8S9a7k9EJto3dsNBEI080e7
NVLO0A2sYLheEFVTvoFKnwvHGnqGfUbQu/2UYXPG/0mCF+yiAL9Oh4mazs3cZQsk
FBMZLSVVPhuWT1Y4033V81TUqxCpG2mlENrS92br5j32FQmokzCr41E0kd23cVGi
MA1EhmeNKz+ZvYiIdD72oj0g4km+pBdnvh9fCHcjMe/igeHz0Q/Yz9eBlb3jutYu
mCgglH8Mh/sYWfe7XjWsVkL/exRL+g==
=5PAT
-----END PGP SIGNATURE-----

--UXI8lKy/UsBH2d4H--


