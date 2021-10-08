Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CFE426214
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 03:34:41 +0200 (CEST)
Received: from localhost ([::1]:34098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYemW-0003rF-6V
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 21:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mYekk-0002Mn-0K
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:32:50 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mYekh-0002wD-Ff
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:32:49 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HQVz05km2zPjxb;
 Fri,  8 Oct 2021 09:31:40 +0800 (CST)
Received: from dggpemm100010.china.huawei.com (7.185.36.24) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 09:32:34 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm100010.china.huawei.com (7.185.36.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 09:32:34 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.008;
 Fri, 8 Oct 2021 09:32:34 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v3 8/9] Revert "vfio: Avoid disabling and enabling vectors
 repeatedly in VFIO migration"
Thread-Topic: [PATCH v3 8/9] Revert "vfio: Avoid disabling and enabling
 vectors repeatedly in VFIO migration"
Thread-Index: AQHXrnOMW/vHEYygKEG6BM2Wv0jCaqu+TlQAgAocIVA=
Date: Fri, 8 Oct 2021 01:32:33 +0000
Message-ID: <f13d32d7d4a243338427b82928a564ea@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
 <20210920230202.1439-9-longpeng2@huawei.com>
 <20211001170422.5802c600.alex.williamson@redhat.com>
In-Reply-To: <20211001170422.5802c600.alex.williamson@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: chenjiashang <chenjiashang@huawei.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alex Williamson [mailto:alex.williamson@redhat.com]
> Sent: Saturday, October 2, 2021 7:04 AM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: philmd@redhat.com; pbonzini@redhat.com; marcel.apfelbaum@gmail.com;
> mst@redhat.com; qemu-devel@nongnu.org; Gonglei (Arei)
> <arei.gonglei@huawei.com>; chenjiashang <chenjiashang@huawei.com>
> Subject: Re: [PATCH v3 8/9] Revert "vfio: Avoid disabling and enabling ve=
ctors
> repeatedly in VFIO migration"
>=20
> On Tue, 21 Sep 2021 07:02:01 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
>=20
> > Commit ecebe53fe993 ("vfio: Avoid disabling and enabling vectors
> > repeatedly in VFIO migration") avoid inefficiently disabling and
>=20
> s/avoid/avoids/
>=20
> > enabling vectors repeatedly and let the unmasked vectors to be
>=20
> s/let/lets/  s/to//
>=20
> > enabled one by one.
> >
> > But we want to batch multiple routes and defer the commit, and only
> > commit once out side the loop of setting vector notifiers, so we
>=20
> s/out side/outside/
>=20
> > cannot to enable the vectors one by one in the loop now.
>=20
> s/to//
>=20

Thanks. All the typos and grammatical errors you pointed out will
be fixed in v4.

> Thanks,
> Alex
>=20
> >
> > Revert that commit and we will take another way in the next patch,
> > it can not only avoid disabling/enabling vectors repeatedly, but
> > also satisfy our requirement of defer to commit.
> >
> > Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> > ---
> >  hw/vfio/pci.c | 20 +++-----------------
> >  1 file changed, 3 insertions(+), 17 deletions(-)
> >
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index 8fe238b11d..2de1cc5425 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -610,9 +610,6 @@ static __attribute__((unused)) void
> vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev
> >
> >  static void vfio_msix_enable(VFIOPCIDevice *vdev)
> >  {
> > -    PCIDevice *pdev =3D &vdev->pdev;
> > -    unsigned int nr, max_vec =3D 0;
> > -
> >      vfio_disable_interrupts(vdev);
> >
> >      vdev->msi_vectors =3D g_new0(VFIOMSIVector, vdev->msix->entries);
> > @@ -631,22 +628,11 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
> >       * triggering to userspace, then immediately release the vector, l=
eaving
> >       * the physical device with no vectors enabled, but MSI-X enabled,=
 just
> >       * like the guest view.
> > -     * If there are already unmasked vectors (in migration resume phas=
e and
> > -     * some guest startups) which will be enabled soon, we can allocat=
e all
> > -     * of them here to avoid inefficiently disabling and enabling vect=
ors
> > -     * repeatedly later.
> >       */
> > -    if (!pdev->msix_function_masked) {
> > -        for (nr =3D 0; nr < msix_nr_vectors_allocated(pdev); nr++) {
> > -            if (!msix_is_masked(pdev, nr)) {
> > -                max_vec =3D nr;
> > -            }
> > -        }
> > -    }
> > -    vfio_msix_vector_do_use(pdev, max_vec, NULL, NULL);
> > -    vfio_msix_vector_release(pdev, max_vec);
> > +    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
> > +    vfio_msix_vector_release(&vdev->pdev, 0);
> >
> > -    if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
> > +    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
> >                                    vfio_msix_vector_release, NULL)) {
> >          error_report("vfio: msix_set_vector_notifiers failed");
> >      }


