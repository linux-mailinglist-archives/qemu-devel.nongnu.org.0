Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1914353D7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 21:32:40 +0200 (CEST)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdHKF-00079F-AD
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 15:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mdGwN-00041K-OY; Wed, 20 Oct 2021 15:07:55 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:39879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mdGwL-00021p-D5; Wed, 20 Oct 2021 15:07:55 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 362BF3201C39;
 Wed, 20 Oct 2021 15:07:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 20 Oct 2021 15:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ve4skNB4mTp3vOHZgodZTYwjmo0
 AIWaVph3sIxvehbE=; b=fMh97TWxO0Y6RDjaNaKCe7+rCKC8EIjuKVT9UjYHYkL
 U+hzoVuEz1ButNjgNb1nD2AxCTc/zE8Ll4EyPfvJhkrCq4k2+7fIcenfgcV1BRwi
 j3ypVxrX8Cga0xNAJqgV6Fhxy84LtyBis2CI4M7mggU09gdeiwoKrpPKPT1lcahh
 wEfqn0Hhe74j8dmDQaVSdt8hXGrTtsANl/a5YaphufhkqSW/O7WDvWFEZwZUYWRH
 rqiVrCLMJmn1Pop5+0WmHPBaBuuPy5A3G3XzYFkYtL45eOuwMJk/fRZcJuB0080b
 zbAJ00SVfkPqCtrGU5RGd2HlD0YovFbfV6raX7v2N5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ve4skN
 B4mTp3vOHZgodZTYwjmo0AIWaVph3sIxvehbE=; b=AygDpaTe28fdK0dR4PH/CL
 3Lj0jaOY0fxU9nsJnAR432cU0hfP3ya2gMNqIlqRqjv+O0dsTqrpUdn4F5eT9rD1
 /2ywJhde25jDn45reNQE3zXoggKT2oB+gz8AVI+9Ol48SjNIW0E/fcninpqot/vD
 pBFxuvC3hgpXY2EeZt/n+tfj7wvwGDYtOkq2zTMYWeaujpOBnek6/lfsmX5dXFHs
 p7bjdBaXfd84RZfJbz81igFo7ORbRoOZ2wgDVoHeFSG1JC/iYZYlcLADqpfMnt3o
 7LPsAKXEr2uNhI4yOX/YfvAdrxa/ba+Up95ezCgFhIlRCkt+S78OsCuiCFWxbCAA
 ==
X-ME-Sender: <xms:BmlwYbkgq5DCC6SMVvTVkChejJ98lddYrwThlCqWqvH2RZqhJJx0Rg>
 <xme:BmlwYe1AxTi1invTPZKa3METXbuBXypWp09S6ZJrup9RcCDxpaFbP_lsvu6eTb8V2
 mdjHIf-U00TxjNg85s>
X-ME-Received: <xmr:BmlwYRrrLbycCo8SADzJj-bn-mGLwEIEHbNW0Ql2NyGVkogdzpv6rOjHEX7BXBGZKq2yLWnsf8ekfFXyx7gU6_RwCE6h6fuaeSMhazzOqacDOibfbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BmlwYTnioe3FpJXvAZeV9nLLHo9fDleYXiaKsKhWd6dHCuerdxpIRw>
 <xmx:BmlwYZ1M_NXBJsyOzca52n2XhvxI-dAOMGFXg4czN4lPj-xznMtwIg>
 <xmx:BmlwYStJ5BA6uBkN9Ii0Ya9M-B298_X4H-0boNlwlrKPykWUuv9A-Q>
 <xmx:BmlwYTom9vB1by8_MJRNGyzYXAEpNfaF57CNPkijqhTUBm3mztSjyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Oct 2021 15:07:49 -0400 (EDT)
Date: Wed, 20 Oct 2021 21:07:47 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 05/15] hw/nvme: Add support for SR-IOV
Message-ID: <YXBpA7ydMl9//wZ1@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-6-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rGMfoqr83zDoNpob"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-6-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rGMfoqr83zDoNpob
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct  7 18:23, Lukasz Maniak wrote:
> This patch implements initial support for Single Root I/O Virtualization
> on an NVMe device.
>=20
> Essentially, it allows to define the maximum number of virtual functions
> supported by the NVMe controller via sriov_max_vfs parameter.
>=20
> Passing a non-zero value to sriov_max_vfs triggers reporting of SR-IOV
> capability by a physical controller and ARI capability by both the
> physical and virtual function devices.
>=20
> NVMe controllers created via virtual functions mirror functionally
> the physical controller, which may not entirely be the case, thus
> consideration would be needed on the way to limit the capabilities of
> the VF.
>=20
> NVMe subsystem is required for the use of SR-IOV.
>=20
> Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> ---
>  hw/nvme/ctrl.c           | 74 ++++++++++++++++++++++++++++++++++++++--
>  hw/nvme/nvme.h           |  1 +
>  include/hw/pci/pci_ids.h |  1 +
>  3 files changed, 73 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 6a571d18cf..ad79ff0c00 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -35,6 +35,7 @@
>   *              mdts=3D<N[optional]>,vsl=3D<N[optional]>, \
>   *              zoned.zasl=3D<N[optional]>, \
>   *              zoned.auto_transition=3D<on|off[optional]>, \
> + *              sriov_max_vfs=3D<N[optional]> \
>   *              subsys=3D<subsys_id>
>   *      -device nvme-ns,drive=3D<drive_id>,bus=3D<bus_name>,nsid=3D<nsid=
>,\
>   *              zoned=3D<true|false[optional]>, \
> @@ -106,6 +107,12 @@
>   *   transitioned to zone state closed for resource management purposes.
>   *   Defaults to 'on'.
>   *
> + * - `sriov_max_vfs`
> + *   Indicates the maximum number of PCIe virtual functions supported
> + *   by the controller. The default value is 0. Specifying a non-zero va=
lue
> + *   enables reporting of both SR-IOV and ARI capabilities by the NVMe d=
evice.
> + *   Virtual function controllers will not report SR-IOV capability.
> + *
>   * nvme namespace device parameters
>   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   * - `shared`
> @@ -160,6 +167,7 @@
>  #include "sysemu/block-backend.h"
>  #include "sysemu/hostmem.h"
>  #include "hw/pci/msix.h"
> +#include "hw/pci/pcie_sriov.h"
>  #include "migration/vmstate.h"
> =20
>  #include "nvme.h"
> @@ -175,6 +183,9 @@
>  #define NVME_TEMPERATURE_CRITICAL 0x175
>  #define NVME_NUM_FW_SLOTS 1
>  #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
> +#define NVME_MAX_VFS 127
> +#define NVME_VF_OFFSET 0x1
> +#define NVME_VF_STRIDE 1
> =20
>  #define NVME_GUEST_ERR(trace, fmt, ...) \
>      do { \
> @@ -5583,6 +5594,10 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
>          g_free(event);
>      }
> =20
> +    if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
> +        pcie_sriov_pf_disable_vfs(&n->parent_obj);
> +    }
> +
>      n->aer_queued =3D 0;
>      n->outstanding_aers =3D 0;
>      n->qs_created =3D false;
> @@ -6264,6 +6279,19 @@ static void nvme_check_constraints(NvmeCtrl *n, Er=
ror **errp)
>          error_setg(errp, "vsl must be non-zero");
>          return;
>      }
> +
> +    if (params->sriov_max_vfs) {
> +        if (!n->subsys) {
> +            error_setg(errp, "subsystem is required for the use of SR-IO=
V");
> +            return;
> +        }
> +
> +        if (params->sriov_max_vfs > NVME_MAX_VFS) {
> +            error_setg(errp, "sriov_max_vfs must be between 0 and %d",
> +                       NVME_MAX_VFS);
> +            return;
> +        }
> +    }
>  }
> =20
>  static void nvme_init_state(NvmeCtrl *n)
> @@ -6321,6 +6349,20 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *=
pci_dev)
>      memory_region_set_enabled(&n->pmr.dev->mr, false);
>  }
> =20
> +static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t of=
fset,
> +                            uint64_t bar_size)
> +{
> +    uint16_t vf_dev_id =3D n->params.use_intel_id ?
> +                         PCI_DEVICE_ID_INTEL_NVME : PCI_DEVICE_ID_REDHAT=
_NVME;
> +
> +    pcie_sriov_pf_init(pci_dev, offset, "nvme", vf_dev_id,
> +                       n->params.sriov_max_vfs, n->params.sriov_max_vfs,
> +                       NVME_VF_OFFSET, NVME_VF_STRIDE, NULL);

Did you consider adding a new device for the virtual function device,
"nvmevf"?

Down the road it might help with the variations in capabilities that you
describe.

--rGMfoqr83zDoNpob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFwaQEACgkQTeGvMW1P
DelNHwf/SA6or6DI5YYG/qAwli89h1ZpxG4cVKILWSVhu6rYLkfMQAUw793QtYAn
4PWi74xbiP9Cg7De+fTsl6cJ5pIMIkMk2GTKG2tc+kbhy8bLohK5CWcfb9/GiGTq
2pvrN2To38VmdqEmnpfFDCkOY476xDXQ7jt0KKSPPnuEQ2WZg4H0DVSLk11gvn90
wqYojGLMv80mbXvcnQ0NxgWB3KjLlwlEb623RIS/ynNfb5Ab5dhYRZpsY0MiNzIr
xuUTQDN74+gB6HdnefqVJuxvRbAWbJilPn9cfeJHFERNZvnIyG+mTrcAVZdz+m4Y
KO2KxhZhnH9+8LLH0PJrWF8DtVVNVg==
=9wBP
-----END PGP SIGNATURE-----

--rGMfoqr83zDoNpob--

