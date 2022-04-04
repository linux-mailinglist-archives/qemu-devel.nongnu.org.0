Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B24F1A29
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 22:41:22 +0200 (CEST)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbTVp-00057Y-PT
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 16:41:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ztong0001@gmail.com>)
 id 1nbSEM-0006jA-6r
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 15:19:14 -0400
Received: from [2607:f8b0:4864:20::82f] (port=40939
 helo=mail-qt1-x82f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ztong0001@gmail.com>)
 id 1nbSEK-0008LE-JN
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 15:19:13 -0400
Received: by mail-qt1-x82f.google.com with SMTP id i4so8610358qti.7
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 12:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=95OywlD1CSIf3qwS0056RsX7eSrGjupy3ny6169oNc0=;
 b=O5FdBNrkMpZ9UAJ5rc5b1iUZJg1dJwPBOkN8tpWgvHEBRPFDsW37yOLDcg+t7oVn4x
 P2Rp5M71Gl2fKc/mIwZUHXg3nBbNE7iLDJcYXlnsYTCdmF7wKT4+ZT5SAYDkn4bxWQs/
 poiuqexoNn17/g9WCQLDFUpoeSy8klqH79rS1iRrMbQvfASQbjJRhfiLutTfVHPiVCOR
 65PDySI7vG50Wi7tlQ/TtcNRCQPf7YXKcThyA/UeIRluafuKxk1OmRj5XABa9J0+xh/h
 S8Gonr3Ll4iWJoMLVy2m/wvPb1N1FzlS41oWE+rHKKGPqPWuA7tSmKEmk1XkJhdGYBXL
 pkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=95OywlD1CSIf3qwS0056RsX7eSrGjupy3ny6169oNc0=;
 b=eBXzrgvoYIbgij4mvlnRW8BvsZeMSNMTvJJTj1Tfz4qeSQDGKdAF4Ii52CZ32iEx6Y
 95EiCbnfWwHKTis2jIcMM0eg0Ae29oft/M6js2AAU0R3EP59GE0Dh1khmNd8j9b75liF
 mkRaW9fXQjvi+bkL90tzRPN5i6zJnxKd/02pkqzMGkB5AInLm0sBKF4/T82wc6wHUE1E
 T0xinAan8goSrReyU0bz0br6U4up9uH2ryo9kVY8OubkAioONKMJ80j/U/+5n5oVMqd+
 2QiJm2mZ6qdUEVl2CV3KIrATOEp0ch3SjnhMJ8Dm8KAVNA5/L24UsNfCHb4EN7gfypjg
 q1LA==
X-Gm-Message-State: AOAM530bTF3KI6VoPUYax63b6eMIJ6OuTWB8AEfWOuEKKL7PQnP8/X+8
 yEFlUoypzcaoJXkKxwkGuz8=
X-Google-Smtp-Source: ABdhPJyE6ripkBu+Okix3ICyYspwQP+wSTguS2V2zDOH+6a7gqN9dzhF2QojrPHgDjWQal/qtFlaPg==
X-Received: by 2002:ac8:5784:0:b0:2e1:ed90:fc65 with SMTP id
 v4-20020ac85784000000b002e1ed90fc65mr1473205qta.232.1649099950985; 
 Mon, 04 Apr 2022 12:19:10 -0700 (PDT)
Received: from smtpclient.apple
 (99-105-211-126.lightspeed.sntcca.sbcglobal.net. [99.105.211.126])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a37a014000000b0067b3a0c7d89sm6614694qke.38.2022.04.04.12.19.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:19:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH v9 18/45] hw/cxl/device: Implement MMIO HDM decoding
 (8.2.5.12)
From: Tong Zhang <ztong0001@gmail.com>
In-Reply-To: <20220404151445.10955-19-Jonathan.Cameron@huawei.com>
Date: Mon, 4 Apr 2022 12:19:07 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC543734-8626-4F14-8449-E22969D18A7D@gmail.com>
References: <20220404151445.10955-1-Jonathan.Cameron@huawei.com>
 <20220404151445.10955-19-Jonathan.Cameron@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=ztong0001@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 04 Apr 2022 16:39:58 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alison Schofield <alison.schofield@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linuxarm@huawei.com,
 linux-cxl@vger.kernel.org, Adam Manzanares <a.manzanares@samsung.com>,
 dave@stgolabs.net, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
 Tong Zhang <t.zhang2@samsung.com>, Chris Browy <cbrowy@avery-design.com>,
 Saransh Gupta1 <saransh@ibm.com>, qemu-devel@nongnu.org,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 "k . jensen @ samsung . com" <k.jensen@samsung.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 4, 2022, at 8:14 AM, Jonathan Cameron via =
<qemu-devel@nongnu.org> wrote:
>=20
> From: Ben Widawsky <ben.widawsky@intel.com>
>=20
> A device's volatile and persistent memory are known Host Defined =
Memory
> (HDM) regions. The mechanism by which the device is programmed to =
claim
> the addresses associated with those regions is through dedicated logic
> known as the HDM decoder. In order to allow the OS to properly program
> the HDMs, the HDM decoders must be modeled.
>=20
> There are two ways the HDM decoders can be implemented, the legacy
> mechanism is through the PCIe DVSEC programming from CXL 1.1 =
(8.1.3.8),
> and MMIO is found in 8.2.5.12 of the spec. For now, 8.1.3.8 is not
> implemented.
>=20
> Much of CXL device logic is implemented in cxl-utils. The HDM decoder
> however is implemented directly by the device implementation.
> Whilst the implementation currently does no validity checks on the
> encoder set up, future work will add sanity checking specific to
> the type of cxl component.
>=20
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
> hw/mem/cxl_type3.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 55 insertions(+)
>=20
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 329a6ea2a9..5c93fbbd9b 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -50,6 +50,48 @@ static void build_dvsecs(CXLType3Dev *ct3d)
>                                GPF_DEVICE_DVSEC_REVID, dvsec);
> }
>=20
> +static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
> +{
> +    ComponentRegisters *cregs =3D &ct3d->cxl_cstate.crb;
> +    uint32_t *cache_mem =3D cregs->cache_mem_registers;
> +
> +    assert(which =3D=3D 0);
> +
> +    /* TODO: Sanity checks that the decoder is possible */
> +    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> +    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
> +
> +    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> +}
> +
> +static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t =
value,
> +                           unsigned size)
> +{
> +    CXLComponentState *cxl_cstate =3D opaque;
> +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> +    CXLType3Dev *ct3d =3D container_of(cxl_cstate, CXLType3Dev, =
cxl_cstate);
> +    uint32_t *cache_mem =3D cregs->cache_mem_registers;
> +    bool should_commit =3D false;
> +    int which_hdm =3D -1;
> +
> +    assert(size =3D=3D 4);
> +    g_assert(offset <=3D CXL2_COMPONENT_CM_REGION_SIZE);
> +

Looks like this will allow offset =3D=3D CXL2_COMPONENT_CM_REGION_SIZE =
to pass the check, and cause a buffer overrun.
Shouldn=E2=80=99t this be g_assert(offset< =
CXL2_COMPONENT_CM_REGION_SIZE)?
We also need to make sure (offset + 4<=3D =
CXL2_COMPONENT_CM_REGION_SIZE).
Or maybe we just need offset +4 <=3D CXL2_COMPONENT_CM_REGION_SIZE here, =
if offset < CXL2_COMPONENT_CM_REGION_SIZE is already checked somewhere =
else.

> +    switch (offset) {
> +    case A_CXL_HDM_DECODER0_CTRL:
> +        should_commit =3D FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, =
COMMIT);
> +        which_hdm =3D 0;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    stl_le_p((uint8_t *)cache_mem + offset, value);
> +    if (should_commit) {
> +        hdm_decoder_commit(ct3d, which_hdm);
> +    }
> +}
> +
> static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
> {
>     MemoryRegion *mr;
> @@ -93,6 +135,9 @@ static void ct3_realize(PCIDevice *pci_dev, Error =
**errp)
>     ct3d->cxl_cstate.pdev =3D pci_dev;
>     build_dvsecs(ct3d);
>=20
> +    regs->special_ops =3D g_new0(MemoryRegionOps, 1);
> +    regs->special_ops->write =3D ct3d_reg_write;
> +
>     cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
>                                       TYPE_CXL_TYPE3);
>=20
> @@ -107,6 +152,15 @@ static void ct3_realize(PCIDevice *pci_dev, Error =
**errp)
>                      &ct3d->cxl_dstate.device_registers);
> }
>=20
> +static void ct3_exit(PCIDevice *pci_dev)
> +{
> +    CXLType3Dev *ct3d =3D CXL_TYPE3(pci_dev);
> +    CXLComponentState *cxl_cstate =3D &ct3d->cxl_cstate;
> +    ComponentRegisters *regs =3D &cxl_cstate->crb;
> +
> +    g_free(regs->special_ops);
> +}
> +
> static void ct3d_reset(DeviceState *dev)
> {
>     CXLType3Dev *ct3d =3D CXL_TYPE3(dev);
> @@ -128,6 +182,7 @@ static void ct3_class_init(ObjectClass *oc, void =
*data)
>     PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(oc);
>=20
>     pc->realize =3D ct3_realize;
> +    pc->exit =3D ct3_exit;
>     pc->class_id =3D PCI_CLASS_STORAGE_EXPRESS;
>     pc->vendor_id =3D PCI_VENDOR_ID_INTEL;
>     pc->device_id =3D 0xd93; /* LVF for now */
> --=20
> 2.32.0
>=20
>=20
>=20


