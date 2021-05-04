Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D91372BE7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:20:31 +0200 (CEST)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvuZ-0001Z7-0I
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ldvme-0003nS-2j
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:12:20 -0400
Received: from 8.mo51.mail-out.ovh.net ([46.105.45.231]:59611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ldvmX-0008H2-Ea
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:12:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 1829F297B71;
 Tue,  4 May 2021 16:11:55 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 4 May 2021
 16:11:32 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059937f50a-f377-4106-9467-b3b86bf2979e,
 233BADB9E061AA125F593C9F78707CF28220F307) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 4 May 2021 16:11:31 +0200
From: Greg Kurz <groug@kaod.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <20210504161131.2ed74d7b@bahia.lan>
In-Reply-To: <YJFMZ8KYVCDwUBPU@kroah.com>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
 <20210504152034.18e41ec3@bahia.lan> <YJFMZ8KYVCDwUBPU@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: effd68a3-6459-416d-a28c-4964cefb2245
X-Ovh-Tracer-Id: 6202864065056512385
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdefiedgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=groug@kaod.org;
 helo=8.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Vetter <daniel@ffwll.ch>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>, Paul
 Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-api@vger.kernel.org, qemu-ppc@nongnu.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 May 2021 15:30:15 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, May 04, 2021 at 03:20:34PM +0200, Greg Kurz wrote:
> > On Tue, 4 May 2021 14:59:07 +0200
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >=20
> > > On Tue, May 04, 2021 at 02:22:36PM +0200, Greg Kurz wrote:
> > > > On Fri, 26 Mar 2021 07:13:09 +0100
> > > > Christoph Hellwig <hch@lst.de> wrote:
> > > >=20
> > > > > Hi all,
> > > > >=20
> > > > > the nvlink2 vfio subdriver is a weird beast.  It supports a hardw=
are
> > > > > feature without any open source component - what would normally be
> > > > > the normal open source userspace that we require for kernel drive=
rs,
> > > > > although in this particular case user space could of course be a
> > > > > kernel driver in a VM.  It also happens to be a complete mess that
> > > > > does not properly bind to PCI IDs, is hacked into the vfio_pci dr=
iver
> > > > > and also pulles in over 1000 lines of code always build into powe=
rpc
> > > > > kernels that have Power NV support enabled.  Because of all these
> > > > > issues and the lack of breaking userspace when it is removed I th=
ink
> > > > > the best idea is to simply kill.
> > > > >=20
> > > > > Changes since v1:
> > > > >  - document the removed subtypes as reserved
> > > > >  - add the ACK from Greg
> > > > >=20
> > > > > Diffstat:
> > > > >  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ------------=
---------------
> > > > >  b/arch/powerpc/include/asm/opal.h            |    3=20
> > > > >  b/arch/powerpc/include/asm/pci-bridge.h      |    1=20
> > > > >  b/arch/powerpc/include/asm/pci.h             |    7=20
> > > > >  b/arch/powerpc/platforms/powernv/Makefile    |    2=20
> > > > >  b/arch/powerpc/platforms/powernv/opal-call.c |    2=20
> > > > >  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
> > > > >  b/arch/powerpc/platforms/powernv/pci.c       |   11=20
> > > > >  b/arch/powerpc/platforms/powernv/pci.h       |   17=20
> > > > >  b/arch/powerpc/platforms/pseries/pci.c       |   23=20
> > > > >  b/drivers/vfio/pci/Kconfig                   |    6=20
> > > > >  b/drivers/vfio/pci/Makefile                  |    1=20
> > > > >  b/drivers/vfio/pci/vfio_pci.c                |   18=20
> > > > >  b/drivers/vfio/pci/vfio_pci_private.h        |   14=20
> > > > >  b/include/uapi/linux/vfio.h                  |   38 -
> > > >=20
> > > >=20
> > > > Hi Christoph,
> > > >=20
> > > > FYI, these uapi changes break build of QEMU.
> > >=20
> > > What uapi changes?
> > >=20
> >=20
> > All macros and structure definitions that are being removed
> > from include/uapi/linux/vfio.h by patch 1.
> >=20
> > > What exactly breaks?
> > >=20
> >=20
> > These macros and types are used by the current QEMU code base.
> > Next time the QEMU source tree updates its copy of the kernel
> > headers, the compilation of affected code will fail.
>=20
> So does QEMU use this api that is being removed, or does it just have
> some odd build artifacts of the uapi things?
>=20

These are region subtypes definition and associated capabilities.
QEMU basically gets information on VFIO regions from the kernel
driver and for those regions with a nvlink2 subtype, it tries
to extract some more nvlink2 related info.

> What exactly is the error messages here?
>=20

[55/143] Compiling C object libqemu-ppc64-softmmu.fa.p/hw_vfio_pci-quirks.c=
.o
FAILED: libqemu-ppc64-softmmu.fa.p/hw_vfio_pci-quirks.c.o=20
cc -Ilibqemu-ppc64-softmmu.fa.p -I. -I../.. -Itarget/ppc -I../../target/ppc=
 -I../../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader -I/usr/i=
nclude/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -fdia=
gnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g=
 -isystem /home/greg/Work/qemu/qemu-virtiofs/linux-headers -isystem linux-h=
eaders -iquote . -iquote /home/greg/Work/qemu/qemu-virtiofs -iquote /home/g=
reg/Work/qemu/qemu-virtiofs/include -iquote /home/greg/Work/qemu/qemu-virti=
ofs/disas/libvixl -iquote /home/greg/Work/qemu/qemu-virtiofs/tcg/ppc -iquot=
e /home/greg/Work/qemu/qemu-virtiofs/accel/tcg -pthread -U_FORTIFY_SOURCE -=
D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SO=
URCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissin=
g-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declarati=
on -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Win=
it-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -=
Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs =
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC -isyste=
m../../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D=
"ppc64-softmmu-config-target.h"' '-DCONFIG_DEVICES=3D"ppc64-softmmu-config-=
devices.h"' -MD -MQ libqemu-ppc64-softmmu.fa.p/hw_vfio_pci-quirks.c.o -MF l=
ibqemu-ppc64-softmmu.fa.p/hw_vfio_pci-quirks.c.o.d -o libqemu-ppc64-softmmu=
.fa.p/hw_vfio_pci-quirks.c.o -c ../../hw/vfio/pci-quirks.c
../../hw/vfio/pci-quirks.c: In function =E2=80=98vfio_pci_nvidia_v100_ram_i=
nit=E2=80=99:
../../hw/vfio/pci-quirks.c:1597:36: error: =E2=80=98VFIO_REGION_SUBTYPE_NVI=
DIA_NVLINK2_RAM=E2=80=99 undeclared (first use in this function); did you m=
ean =E2=80=98VFIO_REGION_SUBTYPE_CCW_ASYNC_CMD=E2=80=99?
                                    VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM,
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                    VFIO_REGION_SUBTYPE_CCW_ASYNC_CMD
../../hw/vfio/pci-quirks.c:1597:36: note: each undeclared identifier is rep=
orted only once for each function it appears in
../../hw/vfio/pci-quirks.c:1603:44: error: =E2=80=98VFIO_REGION_INFO_CAP_NV=
LINK2_SSATGT=E2=80=99 undeclared (first use in this function); did you mean=
 =E2=80=98VFIO_REGION_INFO_CAP_SPARSE_MMAP=E2=80=99?
     hdr =3D vfio_get_region_info_cap(nv2reg, VFIO_REGION_INFO_CAP_NVLINK2_=
SSATGT);
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
                                            VFIO_REGION_INFO_CAP_SPARSE_MMAP
../../hw/vfio/pci-quirks.c:1624:49: error: dereferencing pointer to incompl=
ete type =E2=80=98struct vfio_region_info_cap_nvlink2_ssatgt=E2=80=99
                         (void *) (uintptr_t) cap->tgt);
                                                 ^~
../../hw/vfio/pci-quirks.c: In function =E2=80=98vfio_pci_nvlink2_init=E2=
=80=99:
../../hw/vfio/pci-quirks.c:1646:36: error: =E2=80=98VFIO_REGION_SUBTYPE_IBM=
_NVLINK2_ATSD=E2=80=99 undeclared (first use in this function); did you mea=
n =E2=80=98VFIO_REGION_SUBTYPE_CCW_ASYNC_CMD=E2=80=99?
                                    VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD,
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                    VFIO_REGION_SUBTYPE_CCW_ASYNC_CMD
../../hw/vfio/pci-quirks.c:1653:36: error: =E2=80=98VFIO_REGION_INFO_CAP_NV=
LINK2_SSATGT=E2=80=99 undeclared (first use in this function); did you mean=
 =E2=80=98VFIO_REGION_INFO_CAP_SPARSE_MMAP=E2=80=99?
                                    VFIO_REGION_INFO_CAP_NVLINK2_SSATGT);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                    VFIO_REGION_INFO_CAP_SPARSE_MMAP
../../hw/vfio/pci-quirks.c:1661:36: error: =E2=80=98VFIO_REGION_INFO_CAP_NV=
LINK2_LNKSPD=E2=80=99 undeclared (first use in this function); did you mean=
 =E2=80=98VFIO_REGION_INFO_CAP_SPARSE_MMAP=E2=80=99?
                                    VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                    VFIO_REGION_INFO_CAP_SPARSE_MMAP
../../hw/vfio/pci-quirks.c:1685:52: error: dereferencing pointer to incompl=
ete type =E2=80=98struct vfio_region_info_cap_nvlink2_ssatgt=E2=80=99
                         (void *) (uintptr_t) captgt->tgt);
                                                    ^~
../../hw/vfio/pci-quirks.c:1691:54: error: dereferencing pointer to incompl=
ete type =E2=80=98struct vfio_region_info_cap_nvlink2_lnkspd=E2=80=99
                         (void *) (uintptr_t) capspeed->link_speed);
                                                      ^~

> And if we put the uapi .h file stuff back, is that sufficient for qemu
> to work, as it should be checking at runtime what the kernel has / has
> not anyway, right?
>=20

Right. This will just be dead code in QEMU for newer kernels.

Anyway, as said in some other mail, it is probably time for QEMU to
start deprecating this code as well.

> thanks,
>=20
> greg k-h


