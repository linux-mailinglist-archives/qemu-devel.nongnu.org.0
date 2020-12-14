Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C42D9745
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:20:41 +0100 (CET)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koluC-00070x-H8
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kolsw-0006QJ-J3
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kolsu-00007e-U1
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607944760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WEgFakCCg1V2Vl+pkwUDOx6xcrAvPU/1oM1IgQbjhTk=;
 b=QsAt+q9sfmHXMnuyh93L1TuwlHABSbuJm9a2B+Y/UsB0pcgbDiF46Uru19mtEOPf+ANErq
 Qj7VoMRolPgTy9mivwtCZ8w1N25aJ+JqFFIp2JevacvEFnZKGZn3p7kfoNBvCfEGQZ8MTK
 dVSguw7RxIQea3pDTc+PPWhHA3f3GBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-AMvsz9NQMTWLuIEIJOqyxw-1; Mon, 14 Dec 2020 06:19:19 -0500
X-MC-Unique: AMvsz9NQMTWLuIEIJOqyxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2CF4803620;
 Mon, 14 Dec 2020 11:19:17 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E8B410013C1;
 Mon, 14 Dec 2020 11:19:07 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:19:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 3/3] nvdimm: honor -object memory-backend-file,
 readonly=on option
Message-ID: <20201214121905.45bf4d13@redhat.com>
In-Reply-To: <20200916095150.755714-4-stefanha@redhat.com>
References: <20200916095150.755714-1-stefanha@redhat.com>
 <20200916095150.755714-4-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 qemu-devel@nongnu.org, eric.g.ernst@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Sep 2020 10:51:50 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Make it possible to present read-only files to the guest as "unarmed"
> NVDIMMs. The Linux NVDIMM device (/dev/pmemX) is read-only.
>=20
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/nvdimm.txt | 8 +++++++-
>  hw/mem/nvdimm.c | 4 ++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
> index c2c6e441b3..06c2008107 100644
> --- a/docs/nvdimm.txt
> +++ b/docs/nvdimm.txt
> @@ -17,7 +17,7 @@ following command line options:
> =20
>   -machine pc,nvdimm
>   -m $RAM_SIZE,slots=3D$N,maxmem=3D$MAX_SIZE
> - -object memory-backend-file,id=3Dmem1,share=3Don,mem-path=3D$PATH,size=
=3D$NVDIMM_SIZE
> + -object memory-backend-file,id=3Dmem1,share=3Don,mem-path=3D$PATH,size=
=3D$NVDIMM_SIZE,readonly=3Doff
>   -device nvdimm,id=3Dnvdimm1,memdev=3Dmem1
> =20
>  Where,
> @@ -42,6 +42,12 @@ Where,
>     "share=3Doff", then guest writes won't be applied to the backend
>     file and thus will be invisible to other guests.
> =20
> +   "readonly=3Don/off" controls whether the file $PATH is opened read-on=
ly or
> +   read/write (default). "readonly=3Don" sets the ACPI NFIT NVDIMM Regio=
n Mapping
> +   Structure "NVDIMM State Flags" Bit 3 indicating that the device is "u=
narmed"
> +   and cannot accept persistent writes. Linux guest drivers set the devi=
ce to
> +   read-only when this bit is present.
> +
>   - "device nvdimm,id=3Dnvdimm1,memdev=3Dmem1" creates a virtual NVDIMM
>     device whose storage is provided by above memory backend device.
> =20
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index e1574bc07c..848cd65917 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -146,6 +146,10 @@ static void nvdimm_prepare_memory_region(NVDIMMDevic=
e *nvdimm, Error **errp)
>          return;
>      }
> =20
> +    if (memory_region_is_rom(mr)) {
> +        nvdimm->unarmed =3D true; /* this device is read-only */
> +    }
we probably should error out in case 'backend,readonly=3Dtrue + nvdimm,unar=
med=3Dfalse'
instead of silently ignoring user's input

>      nvdimm->nvdimm_mr =3D g_new(MemoryRegion, 1);
>      memory_region_init_alias(nvdimm->nvdimm_mr, OBJECT(dimm),
>                               "nvdimm-memory", mr, 0, pmem_size);


