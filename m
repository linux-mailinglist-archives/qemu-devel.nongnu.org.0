Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E715486506
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:14:13 +0100 (CET)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Saq-0001jU-LH
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:14:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5SY2-00006z-5M
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5SXw-000848-Ec
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641474669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oD/3zU+RZx8/majnC7BhEaYJ2jXOyCS+zHXfLhHxx5o=;
 b=WifTX6a8lfqqjAfrYOuqeYwkVvdqC1CdRXrErGeiT0XVPk7JRjVdWcc1QtRwzI/InhzPpd
 lJqfqqlyn9YsUjuDGyf1wHL1OuxC6pWAkWloggVhSyPuJwpna/IaLyCEj/DLLhTUJClTEQ
 Xdi/QLJUnVjHx6zooGPlXI17qGSddaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-hHvIX3xzNR6iuvAu-g9Gyg-1; Thu, 06 Jan 2022 08:11:06 -0500
X-MC-Unique: hHvIX3xzNR6iuvAu-g9Gyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C9D11006AA5;
 Thu,  6 Jan 2022 13:11:04 +0000 (UTC)
Received: from localhost (unknown [10.39.193.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE347D3E9;
 Thu,  6 Jan 2022 13:10:52 +0000 (UTC)
Date: Thu, 6 Jan 2022 13:10:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 11/14] vfio-user: IOMMU support for remote device
Message-ID: <YdbqW465lBlM//FD@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <acae079dec4261d762311b86a0e699ba9ad79737.1639549843.git.jag.raman@oracle.com>
 <YbtP2eaBnptogQDf@stefanha-x1.localdomain>
 <A2ABC44E-0EDA-4FDB-B3A4-64CE1AA84560@oracle.com>
 <YcCVBLdd/WtLR49h@stefanha-x1.localdomain>
 <D9E0A4CC-83E9-460F-BBB9-D5DABBA9ED19@oracle.com>
MIME-Version: 1.0
In-Reply-To: <D9E0A4CC-83E9-460F-BBB9-D5DABBA9ED19@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GvyaacAVcwl9i0No"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GvyaacAVcwl9i0No
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 04:32:05AM +0000, Jag Raman wrote:
> > On Dec 20, 2021, at 9:36 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> > On Fri, Dec 17, 2021 at 08:00:35PM +0000, Jag Raman wrote:
> >>> On Dec 16, 2021, at 9:40 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >>> On Wed, Dec 15, 2021 at 10:35:35AM -0500, Jagannathan Raman wrote:
> >>> Also, why is PCI Memory Space isolated via VFUIOMMU but PCI IO Space =
is
> >>> not?
> >>=20
> >> If I understand correctly, the IO address space translates sysmem addr=
ess to
> >> direct device access (such as I2C). Once we are inside a device, we al=
ready
> >> have access to all parts of the device (unlike RAM which sits outside =
the device).
> >> So didn=E2=80=99t think device would go via IOMMU to access IO. Also d=
idn=E2=80=99t see any
> >> other IOMMU translating IO address space accesses.
> >=20
> > I reviewed how BARs are configured with VFIO:
> >=20
> > 1. When the guest writes to the vfio-pci PCIDevice's Configuration Spac=
e
> >   the write is forwarded to the VFIO device (i.e. vfio-user or VFIO
> >   kernel ioctl).
> >=20
> > 2. The vfio-user server receives the Configuration Space write and
> >   forwards it to pci_dev (the PCIDevice we're serving up). BAR mappings
> >   are updated in the vfio-user server so the BAR MemoryRegions are
> >   mapped/unmapped at the locations given by the guest.
> >=20
> > This applies for both Memory and IO Space accesses.
> >=20
> > Because this patch series does not isolate IO Space between VfuObject
> > instances the MemoryRegions will collide when two guests map IO Space
> > BARs of different devices at the same IO Space address. In other words,
> > vfu_object_bar_rw() uses the global address_space_io and that means
> > collisions can occur.
>=20
> I agree that collision could occur from the CPU end. But I'm not if IOMMU
> needs to translate IO space.

QEMU's IOMMUs do not translate IO Space addresses AFAIK.

IO Space just needs to be isolated between vfio-user server instances so
there is no collision when one client maps an IO Space BAR to the same
address as another client.

I think the cleanest way of achieving that is by creating a
per-vfio-user server PCI bus with an address_space_io MemoryRegion.

Stefan

--GvyaacAVcwl9i0No
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHW6loACgkQnKSrs4Gr
c8ii8gf+KI5O3FaNM5iyoVuERTzxOReiWISGTCYZH/kUmY8U5q0eXRjfSeyPspLp
qiQ3JSz3GVy6FkiidNDzXtP7XHg8GEZpDPzUBcE3TU+CPnjYhHzevZCYI+ZmqfRz
jNJDYwn7tO8ljo1mlJZzrNNMztiizu8ABRjeAK8o3FrSmvmzGMPsuz9heX18J8Od
s/h2urCMUoM9oQWfIqpeKBQ+DQODkPpQG7RKOJlXMxhhVi4IARv3zMRJIyz2nHhk
bdhIQmBzpIbqqSBFa3zz8VxUHBsFnfD+E4dKSpmCCDDM2sTop4ZZPWO2u3cYARP1
OY3Pt4pm7L/n6dYlbp9G50dsPXP7lg==
=Bji2
-----END PGP SIGNATURE-----

--GvyaacAVcwl9i0No--


