Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE8382D98
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:39:19 +0200 (CEST)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidSo-00005D-F5
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lidR0-0007Pn-DT; Mon, 17 May 2021 09:37:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lidQw-00078w-Fr; Mon, 17 May 2021 09:37:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id n2so6514938wrm.0;
 Mon, 17 May 2021 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g4HogUNzpVM7cWVapgE/o1FZYYt4rMwRLalhKEYxkP8=;
 b=DaLMQ6mhCxlpehySY2Hd3lg2sjNs3sMrCCQI0e/sVuuG43/tbDRSvW7Ze19KpOj50I
 P+Ykd9b3c3Nu+cVIR9qHsVZeypLFr9q19Qysr2mbsmhNyxILNtrvqpJ4zrPr3S58GBjp
 16K7PnOjFA8oGrG+0HL+wloCDXpPDv9c5GmhnalzbCuiVB3OPdSlxb3idJPmhLYCUoxW
 gmsbSIO/zF1iEEAazGj7WJi1yDHY6/oLv779bHoaEYPwJ/sQadNt2Bbt4Jhm2+zZIYZq
 Q7Eg7Y/FEjbqbviS9CVG2VIQfK6XJY4YZnNbnsNIlofYMbp6qfL/MySyZb35GOqSjhww
 31Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g4HogUNzpVM7cWVapgE/o1FZYYt4rMwRLalhKEYxkP8=;
 b=c+Eg0S5iW8LAfw3zRKVBbnj6a+Nfg7sg7dM6aVU8haSGyqYVyjbsfpf4WzG60RJ6gq
 JzkBH+sfkoQmo7LtQmShSK3rBZPUwpuiOdH0627+nzAPgRtFzEOiQuqfwLJgL9rX0K4b
 ZP6wpXQ68u5GGlO/8cQQmJuSjN3IUUGAyqV0FxOE6i4LHCUCQcQLw486RDJYWQesbTfs
 +4dlmq0rAfLGw2G1Dq2uOZ1JEYDDYYJhA3hGi+6r0RW3bi99HuxEr8cf43q9NUospvYL
 d6yvMtCMmfN5SOgpCcBh27yILBSZtlv57SQtuslcAeaQ4mgiLz2FFa49RabCRp4BYmI9
 hjxA==
X-Gm-Message-State: AOAM5326pK+Lytp/MkNU5ZSEY9Lp7PR/1Vy5z7wbUYKvxapHWSpNsogC
 mddAWYtW4Ksg4vfcgx5NvGI=
X-Google-Smtp-Source: ABdhPJxT01SNB5vs8VFDkRs/yGypJi3alCOxYhRuc6y4Zx86KRR3YZfkfPWOVmwmwkDqcBvhEAzFJA==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr6707565wrn.368.1621258639734; 
 Mon, 17 May 2021 06:37:19 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id m9sm7322924wmq.40.2021.05.17.06.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 06:37:19 -0700 (PDT)
Date: Mon, 17 May 2021 14:37:17 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 0/4] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <YKJxjao6Pf7IJEyl@stefanha-x1.localdomain>
References: <20210507165905.748196-1-groug@kaod.org>
 <YJv84RIViv6KvCHb@stefanha-x1.localdomain>
 <20210517103259.4689ad2d@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9I5eTmfqRc+X+aLk"
Content-Disposition: inline
In-Reply-To: <20210517103259.4689ad2d@bahia.lan>
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9I5eTmfqRc+X+aLk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 10:32:59AM +0200, Greg Kurz wrote:
> On Wed, 12 May 2021 17:05:53 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Fri, May 07, 2021 at 06:59:01PM +0200, Greg Kurz wrote:
> > > Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> > > a serious slow down may be observed on setups with a big enough number
> > > of vCPUs.
> > >=20
> > > Exemple with a pseries guest on a bi-POWER9 socket system (128 HW thr=
eads):
> > >=20
> > >               virtio-scsi      virtio-blk
> > >=20
> > > 1		0m20.922s	0m21.346s
> > > 2		0m21.230s	0m20.350s
> > > 4		0m21.761s	0m20.997s
> > > 8		0m22.770s	0m20.051s
> > > 16		0m22.038s	0m19.994s
> > > 32		0m22.928s	0m20.803s
> > > 64		0m26.583s	0m22.953s
> > > 128		0m41.273s	0m32.333s
> > > 256		2m4.727s 	1m16.924s
> > > 384		6m5.563s 	3m26.186s
> > >=20
> > > Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> > > the ioeventfds:
> > >=20
> > >  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
> > >   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_sin=
gle
> > >   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> > > =3D>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioeve=
ntfd_before
> > > =3D>2.12%  qemu-kvm        qemu-kvm           [.] address_space_updat=
e_ioeventfds
> > >   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_sin=
gle
> > >=20
> > > address_space_update_ioeventfds() is called when committing an MR
> > > transaction, i.e. for each ioeventfd with the current code base,
> > > and it internally loops on all ioventfds:
> > >=20
> > > static void address_space_update_ioeventfds(AddressSpace *as)
> > > {
> > > [...]
> > >     FOR_EACH_FLAT_RANGE(fr, view) {
> > >         for (i =3D 0; i < fr->mr->ioeventfd_nb; ++i) {
> > >=20
> > > This means that the setup of ioeventfds for these devices has
> > > quadratic time complexity.
> > >=20
> > > This series simply changes the device models to extend the transaction
> > > to all virtqueueues, like already done in the past in the generic
> > > code with 710fccf80d78 ("virtio: improve virtio devices initialization
> > > time").
> > >=20
> > > Only virtio-scsi and virtio-blk are covered here, but a similar change
> > > might also be beneficial to other device types such as host-scsi-pci,
> > > vhost-user-scsi-pci and vhost-user-blk-pci.
> > >=20
> > >               virtio-scsi      virtio-blk
> > >=20
> > > 1		0m21.271s	0m22.076s
> > > 2		0m20.912s	0m19.716s
> > > 4		0m20.508s	0m19.310s
> > > 8		0m21.374s	0m20.273s
> > > 16		0m21.559s	0m21.374s
> > > 32		0m22.532s	0m21.271s
> > > 64		0m26.550s	0m22.007s
> > > 128		0m29.115s	0m27.446s
> > > 256		0m44.752s	0m41.004s
> > > 384		1m2.884s	0m58.023s
> > >=20
> > > This should fix https://bugzilla.redhat.com/show_bug.cgi?id=3D1927108
> > > which reported the issue for virtio-scsi-pci.
> > >=20
> > > Changes since v1:
> > > - Add some comments (Stefan)
> > > - Drop optimization on the error path in patch 2 (Stefan)
> > >=20
> > > Changes since RFC:
> > >=20
> > > As suggested by Stefan, splimplify the code by directly beginning and
> > > committing the memory transaction from the device model, without all
> > > the virtio specific proxying code and no changes needed in the memory
> > > subsystem.
> > >=20
> > > Greg Kurz (4):
> > >   virtio-blk: Fix rollback path in virtio_blk_data_plane_start()
> > >   virtio-blk: Configure all host notifiers in a single MR transaction
> > >   virtio-scsi: Set host notifiers and callbacks separately
> > >   virtio-scsi: Configure all host notifiers in a single MR transaction
> > >=20
> > >  hw/block/dataplane/virtio-blk.c | 45 ++++++++++++++++++++-
> > >  hw/scsi/virtio-scsi-dataplane.c | 72 ++++++++++++++++++++++++-------=
--
> > >  2 files changed, 97 insertions(+), 20 deletions(-)
> > >=20
> > > --=20
> > > 2.26.3
> > >=20
> >=20
> > Thanks, applied to my block tree:
> > https://gitlab.com/stefanha/qemu/commits/block
> >=20
>=20
> Hi Stefan,
>=20
> It seems that Michael already merged the previous version of this
> patch set with its latest PR.
>=20
> https://gitlab.com/qemu-project/qemu/-/commit/6005ee07c380cbde44292f5f6c9=
6e7daa70f4f7d
>=20
> It is thus missing the v1->v2 changes. Basically some comments to
> clarify the optimization we're doing with the MR transaction and
> the removal of the optimization on an error path.
>=20
> The optimization on the error path isn't needed indeed but it
> doesn't hurt. No need to change that now that the patches are
> upstream.
>=20
> I can post a follow-up patch to add the missing comments though.
> While here, I'd even add these comments in the generic
> virtio_device_*_ioeventfd_impl() calls as well, since they already
> have the very same optimization.
>=20
> Anyway, I guess you can drop the patches from your tree.

Okay, I have dropped them.

Stefan

--9I5eTmfqRc+X+aLk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCicY0ACgkQnKSrs4Gr
c8hSygf9GYGxp9mnzpuIk2AyiNLiJz1BKc83cwfI3nDWJCWUALdd1A1tZd2f7cxC
CvBDlCSmQzOjMSlQ7qKr0mkJDIJbTt6OVkhvkVnai4ojFl6YsNePvc4//T+QB5AT
O/HNnFAtXmzIRiW/fcNKskEcSMoQkX6LH08QUAixAuaJvbu5N2pvMDLsIYQfo0au
C7FaNMsC9gPeMIy5hw1VP01VT511eqQAAcGTz89xCjmpH51pc/+bkisyB9qoWVbu
51sNY+l1S41ow99xDxxeRtqkHd1p0x0sJL3Q0vyY97OqcrscA/fJKeft2hdMYmNf
Tu6SvPO3ggZQolZf7xkw2zl8IXtffw==
=3rPT
-----END PGP SIGNATURE-----

--9I5eTmfqRc+X+aLk--

