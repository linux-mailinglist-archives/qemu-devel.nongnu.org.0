Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02803DED82
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 15:27:29 +0200 (CEST)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMXiZ-0000xH-BS
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 09:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iMXgR-0007or-08
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 09:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iMXgO-0003FF-37
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 09:25:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22437
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iMXgN-0003E9-UZ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 09:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571664310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0RO8/gl+tXR/OIo+S0TAAJc8NLmd9hDKS5Q6E039SE8=;
 b=STjMWUWrJ/5DwTd0u1wtJt9e+KiHaXvmNLZmuUBPQhN6BNsy9kJsYHKLzvZpPPHM3VcR9d
 E/oiewZqP18C/pjI7ZD/OZsEPYIVQ7MsI0FfLMjx85IbRfsw1u4rWf03O/mMvuM1I7s+tV
 RDEXPskpYn0CbGKmE3mcanYRyXqsiMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-c8nyKL9zMz-nuGByMg7g9A-1; Mon, 21 Oct 2019 09:25:02 -0400
X-MC-Unique: c8nyKL9zMz-nuGByMg7g9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C65F61005500;
 Mon, 21 Oct 2019 13:24:56 +0000 (UTC)
Received: from localhost (ovpn-116-128.ams2.redhat.com [10.36.116.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5820162A7D;
 Mon, 21 Oct 2019 13:24:56 +0000 (UTC)
Date: Mon, 21 Oct 2019 14:24:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>
Subject: Re: [PATCH] virtio: fix IO request length in virtio SCSI/block
 #PSBM-78839
Message-ID: <20191021132455.GH22659@stefanha-x1.localdomain>
References: <20191018115547.19299-1-dplotnikov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20191018115547.19299-1-dplotnikov@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tT3UgwmDxwvOMqfu"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, den@virtuozzo.com, mst@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tT3UgwmDxwvOMqfu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 02:55:47PM +0300, Denis Plotnikov wrote:
> From: "Denis V. Lunev" <den@openvz.org>
>=20
> Linux guests submit IO requests no longer than PAGE_SIZE * max_seg
> field reported by SCSI controler. Thus typical sequential read with
> 1 MB size results in the following pattern of the IO from the guest:
>   8,16   1    15754     2.766095122  2071  D   R 2095104 + 1008 [dd]
>   8,16   1    15755     2.766108785  2071  D   R 2096112 + 1008 [dd]
>   8,16   1    15756     2.766113486  2071  D   R 2097120 + 32 [dd]
>   8,16   1    15757     2.767668961     0  C   R 2095104 + 1008 [0]
>   8,16   1    15758     2.768534315     0  C   R 2096112 + 1008 [0]
>   8,16   1    15759     2.768539782     0  C   R 2097120 + 32 [0]
> The IO was generated by
>   dd if=3D/dev/sda of=3D/dev/null bs=3D1024 iflag=3Ddirect
>=20
> This effectively means that on rotational disks we will observe 3 IOPS
> for each 2 MBs processed. This definitely negatively affects both
> guest and host IO performance.
>=20
> The cure is relatively simple - we should report lengthy scatter-gather
> ability of the SCSI controller. Fortunately the situation here is very
> good. VirtIO transport layer can accomodate 1024 items in one request
> while we are using only 128. This situation is present since almost
> very beginning. 2 items are dedicated for request metadata thus we
> should publish VIRTQUEUE_MAX_SIZE - 2 as max_seg.
>=20
> The following pattern is observed after the patch:
>   8,16   1     9921     2.662721340  2063  D   R 2095104 + 1024 [dd]
>   8,16   1     9922     2.662737585  2063  D   R 2096128 + 1024 [dd]
>   8,16   1     9923     2.665188167     0  C   R 2095104 + 1024 [0]
>   8,16   1     9924     2.665198777     0  C   R 2096128 + 1024 [0]
> which is much better.
>=20
> The dark side of this patch is that we are tweaking guest visible
> parameter, though this should be relatively safe as above transport
> layer support is present in QEMU/host Linux for a very long time.
> The patch adds configurable property for VirtIO SCSI with a new default
> and hardcode option for VirtBlock which does not provide good
> configurable framework.
>=20
> Unfortunately the commit can not be applied as is. For the real cure we
> need guest to be fixed to accomodate that queue length, which is done
> only in the latest 4.14 kernel. Thus we are going to expose the property
> and tweak it on machine type level.
>=20
> The problem with the old kernels is that they have
> max_segments <=3D virtqueue_size restriction which cause the guest
> crashing in the case of violation.
> To fix the case described above in the old kernels we can increase
> virtqueue_size to 256 and max_segments to 254. The pitfall here is
> that seabios allows the virtqueue_size-s < 128, however, the seabios
> patch extending that value to 256 is pending.

If I understand correctly you are relying on Indirect Descriptor support
in the guest driver in order to exceed the Virtqueue Descriptor Table
size.

Unfortunately the "max_segments <=3D virtqueue_size restriction" is
required by the VIRTIO 1.1 specification:

  2.6.5.3.1 Driver Requirements: Indirect Descriptors

  A driver MUST NOT create a descriptor chain longer than the Queue
  Size of the device.

So this idea seems to be in violation of the specification?

There is a bug in hw/block/virtio-blk.c:virtio_blk_update_config() and
hw/scsi/virtio-scsi.c:virtio_scsi_get_config():

  virtio_stl_p(vdev, &blkcfg.seg_max, 128 - 2);

This number should be the minimum of blk_get_max_iov() and
virtio_queue_get_num(), minus 2 for the header and footer.

I looked at the Linux SCSI driver code and it seems each HBA has a
single max_segments number - it does not vary on a per-device basis.
This could be a problem if two host block device with different
max_segments are exposed to the guest through the same virtio-scsi
controller.  Another bug? :(

Anyway, if you want ~1024 descriptors you should set Queue Size to 1024.
I don't see a spec-compliant way of doing it otherwise.  Hopefully I
have overlooked something and there is a nice way to solve this.

Stefan

--tT3UgwmDxwvOMqfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2tsaYACgkQnKSrs4Gr
c8huzQf/USex74JrdWydEB3il3vdNHnUY63cUlDMbmEomvltXn0KqECTep86gaMv
zDZk13FMR5WKZffLA9LBs82G99okEbUxV15VAWOpkTpQHj8FPdqAssUboerJnCy+
5rckEnkwUzvuia3GNiDUMLV2TszMXxXxvAlB0xtIvREWNJ9mERgXEOLx2q5VZJO3
AA8EjR1BSmFwuhvUeOykkkrSX13f10GAWV/FayGreHQ22Zrfp0HUtbDol7W6gYMR
jsuXebzhmm2AF5O59GmX95kHCbnXPFWBzri6tVnxDfSuCcMoigmS9RkULGRDmFJE
qYLay81NcPeCN3BZBt1igocEBvrm7A==
=1o3N
-----END PGP SIGNATURE-----

--tT3UgwmDxwvOMqfu--


