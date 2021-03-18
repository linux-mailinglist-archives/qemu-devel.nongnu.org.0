Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0652B340E48
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:32:33 +0100 (CET)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMyNk-0002xb-4T
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMyM5-0002UQ-Ex
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMyM2-0001ow-EK
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616095845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8+5Q4hwBCEYWJDjEO7PZVP4AqWg0X7Ka0wvlnOXQykQ=;
 b=dq9iuFjiAx+iU1O+WuieagGDoSJ1IPnxWgFSPEeHPohx9IlFr0Nb/kpWpWq/8GLYcs2KSV
 kVByaS+wi9v8fGKPVd0IaQhwhCb1Rqk5D321FeFfcRtWXIpB2ljsAPvBokKT0KNv2WPwhL
 GXv9U9WVkrF/A6zrdgo1d7d6Z7eZ908=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-7y-RvdkFOYut0VV0h4iSXg-1; Thu, 18 Mar 2021 15:30:42 -0400
X-MC-Unique: 7y-RvdkFOYut0VV0h4iSXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DD63593B0;
 Thu, 18 Mar 2021 19:30:41 +0000 (UTC)
Received: from localhost (ovpn-115-62.ams2.redhat.com [10.36.115.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6265147;
 Thu, 18 Mar 2021 19:30:40 +0000 (UTC)
Date: Thu, 18 Mar 2021 19:30:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: Microsoft and Intel NVDIMM ACPI _DSM interfaces status?
Message-ID: <YFOqX3ghd/fggpPR@stefanha-x1.localdomain>
References: <YFHsy8599w7KT1SB@stefanha-x1.localdomain>
 <eaee4c20-5fd7-f257-eddf-331ffe4e39ef@redhat.com>
 <MW2PR2101MB1756B8A06546D00D9307BA4CBF699@MW2PR2101MB1756.namprd21.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MW2PR2101MB1756B8A06546D00D9307BA4CBF699@MW2PR2101MB1756.namprd21.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fgqKLBSkMXh6JQ/D"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Haozhong Zhang <haozhong.zhang@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jeff Moyer <jmoyer@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>,
 Ross Zwisler <ross.zwisler@linux.intel.com>, Laszlo Ersek <lersek@redhat.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fgqKLBSkMXh6JQ/D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 02:00:29AM +0000, Dexuan Cui wrote:
> > From: Laszlo Ersek <lersek@redhat.com>
> > Sent: Wednesday, March 17, 2021 3:45 PM
> > > The specs for the Intel interface are available here:
> > > ...
> > > This is the interface that QEMU emulates. It has been reported that
> > > Windows 2016 Server and 2019 Server guests do not recognize QEMU's
> > > emulated NVDIMM devices using the Microsoft driver.
>=20
> I'm not sure why this happens -- sorry, I have no Windows knowledge.
> =20
> > > Should QEMU emulate both of them to make running Windows guests easy?
>=20
> I'm not sure about the background here, but since it looks like QEMU is a=
lready
> able to emulate the Intel NVDIMM, I suppose it should be quick to add the
> emulation of the Hyper-V NVDIMM. I think they're pretty similar, and the
> _DSM interface supported by Hyper-V NVDIMM is simple.
> =20
> > In my (uneducated) opinion: yes. Microsoft standarized their Region
> > Format Interface, with their _DSM UUID and all; and right now, that spe=
c
> > seems to be the *only* officially approved format in the RFIC registry.
> > So it's plausible to me that, unlike the Linux kernel, Microsoft's
> > driver doesn't support the -- technically unapproved, nonstandard --
> > Intel Region Format Interface.
> >=20
> > Dexuan, please correct me if I'm wrong.
> >=20
> > Thanks,
> > Laszlo
>=20
> Hi Laszlo, I'm not 100% sure, but I guess your may be correct.
>=20
> BTW, earlier in 2019, we made the below patches (which are in the mainlin=
e):
>=20
> 2019-02-28    libnvdimm/btt: Fix LBA masking during 'free list' populatio=
n
> 2019-02-12    acpi/nfit: Require opt-in for read-only label configuration=
s
> 2019-02-02    libnvdimm/dimm: Add a no-BLK quirk based on NVDIMM family
> 2019-01-29    nfit: Add Hyper-V NVDIMM DSM command set to white list
> 2019-01-29    nfit: acpi_nfit_ctl(): Check out_obj->type in the right pla=
ce
>=20
> The patches improve the interoperability between Windows VM and=20
> Linux VM, e.g. the same Hyper-V NVDIMM device can work this way:
> the Windows VM creates an NTFS partition based on the device, and
> creates a text file in the partition, and later we shut down the Windows =
VM
> and assign the device to Linux VM, and Linux VM is able to read the text =
file.
>=20
> Before the patches, IIRC, Linux VM could only use the Hyper-V NVIDMM
> device in label-less mode.
>=20
> Let me share some old 2019 notes about Hyper-V NVDIMM, in case the
> info may be helpful to you:=20
>=20
> "
> In Linux VM, IMO the label-less mode is preferred for Hyper-V NVDIMM,
> because Hyper-V does not support _LSW (I'm not sure about the latest
> status), so Dan made the patch "acpi/nfit: Require opt-in for read-only
> label configurations" to not use the Hyper-V label info, by default.
> In label-less mode, when creating a namespace, Linux can set it to
> one of the 4 namespace modes: fsdax, devdax, sector, and raw (these
> namespace modes are Linux-specific and can not be recognized
> by Windows.).=20
>=20
> With the "nfit.force_labels" bootup-time kernel parameter, Linux can
> be forced to be in label mode, and then if Hyper-V initializes the 4KB
> BTT Info Block(s) with the standard EFI_BTT_ABSTRACTION_GUID
> (which is defined in UEFI 2.7 spec), we're supposed to support the
> "interoperability" between Windows VM and Linux VM.
>=20
> Note: label-less mode is incompatible with label mode. A namespace
> created in one mode can't be recognized when Linux runs in the other
> mode. In label mode, so far, only 2 namespace modes (raw and sector)
> can be supported by the Hyper-V NVDIMM, because Hyper-V doesn't
> support _LSW, yet. If Hyper-V sets the EFI_BTT_ABSTRACTION_GUID,
> the namespace is "BTT-capable" and can be in sector namespace
> mode, otherwise it's in raw namespace mode.
>=20
> After a Windows VM initializes a BTT-capable namespace in a Hyper-V
> NVDIMM device by creating a NTFS file system in the namespace, we
> can re-assign the Hyper-V NVDIMM device to Linux VM, and in label
> mode Linux VM is supposed to be able to read and write the files in
> the NTFS file system.
> "

Thank you, Laszlo and Dexuan!

I wonder if there are existing Windows drivers available that work with
QEMU's NVDIMM device. Otherwise it may make sense to implement the
Hyper-V interface.

Stefan

Stefan

--fgqKLBSkMXh6JQ/D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBTql8ACgkQnKSrs4Gr
c8hS4QgAmfbZ8PAAu+MXAMaoC8zex7vp9BkWjas1/WyVmn/QIBKSWeEyuO3goRRH
jBOWcY/zmovQkCnFgJyN49oqr4b/2aolPKPXgB7eEToWPDEro7gP03GqRGLrvp+D
o2W5E8ueKgRV/ZUtvyQpen3ONIuXQe1FhkzuXR8BKeY0SfUNjlWRXES+sQq7YdYK
YRemum+yl4T3YSrBlZEMyfHi6XNa41IWp8kqciemwBS2rBtzexAuuQnw6BXYC4Rw
oweTYb2cyZ8LRFgVtg2ZUumo60KzwDIuLnm3THoWkQsGQpRh+398Fjx0NLYbDN/y
0h46DL09Vvk26zCCviyDytPXFdTSrg==
=ZpX5
-----END PGP SIGNATURE-----

--fgqKLBSkMXh6JQ/D--


