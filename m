Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD136D8F7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:57:06 +0200 (CEST)
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkgb-0001TU-QX
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lbkYp-0001v3-OG
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:49:03 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lbkYm-0003H2-1w
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:49:03 -0400
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FVfwR32lwz6wjw9;
 Wed, 28 Apr 2021 21:43:19 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 15:48:57 +0200
Received: from localhost (10.52.123.69) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 28 Apr
 2021 14:48:55 +0100
Date: Wed, 28 Apr 2021 14:47:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [PATCH v5 cxl2.0-v3-doe 5/6] cxl/cdat: CXL CDAT Data Object
 Exchange implementation
Message-ID: <20210428144722.00003e5d@Huawei.com>
In-Reply-To: <1619458562-14431-1-git-send-email-cbrowy@avery-design.com>
References: <1619454964-10190-1-git-send-email-cbrowy@avery-design.com>
 <1619458562-14431-1-git-send-email-cbrowy@avery-design.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.52.123.69]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: ben.widawsky@intel.com, jgroves@micron.com, david@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, mst@redhat.com,
 armbru@redhat.com, linux-cxl@vger.kernel.org, f4bug@amsat.org,
 hchkuo@avery-design.com.tw, tyshao@avery-design.com.tw, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 13:36:02 -0400
Chris Browy <cbrowy@avery-design.com> wrote:

> From: hchkuo <hchkuo@avery-design.com.tw>
>=20
> The Data Object Exchange implementation of CXL Coherent Device Attribute
> Table (CDAT). This implementation is referring to "Coherent Device
> Attribute Table Specification, Rev. 1.02, Oct. 2020" and "Compute
> Express Link Specification, Rev. 2.0, Oct. 2020"
>=20
> The CDAT can be specified in two ways. One is to add ",cdat=3D<filename>"
> in "-device cxl-type3"'s command option. The file is required to provide
> the whole CDAT table in binary mode. The other is to use the default
> CDAT value created by build_cdat_table in hw/cxl/cxl-cdat.c.
>=20
> A DOE capability of CDAT is added to hw/mem/cxl_type3.c with capability
> offset 0x190. The config read/write to this capability range can be
> generated in the OS to request the CDAT data.
>=20
> Signed-off-by: Chris Browy <cbrowy@avery-design.com>

What is here is mostly fine, but I'm not sure we want to integrate a
default table that doesn't make sense for the device that it is associated
with.  So I'd move the table generation to cxl_type3 and make sure it is
'reasonable' for the device in question.  Hardcoded is probably fine for no=
w,
but ultimately it still needs to be reasonable even if that emulation becom=
es
more parameterized than currently.

One other comment on a possible (but incredibly unlikely) issue with
a file containing far more entries than are ever likely to make sense!

Jonathan

> ---
>  hw/cxl/cxl-cdat.c              | 228 +++++++++++++++++++++++++++++++++
>  hw/cxl/meson.build             |   1 +
>  hw/mem/cxl_type3.c             |  57 ++++++++-
>  include/hw/cxl/cxl_cdat.h      | 149 +++++++++++++++++++++
>  include/hw/cxl/cxl_component.h |   4 +
>  include/hw/cxl/cxl_device.h    |   1 +
>  include/hw/cxl/cxl_pci.h       |   1 +
>  7 files changed, 440 insertions(+), 1 deletion(-)
>  create mode 100644 hw/cxl/cxl-cdat.c
>  create mode 100644 include/hw/cxl/cxl_cdat.h
>=20
> diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> new file mode 100644
> index 0000000000..3b86ecaddf
> --- /dev/null
> +++ b/hw/cxl/cxl-cdat.c
> @@ -0,0 +1,228 @@
> +/*
> + * CXL CDAT Structure
> + *
> + * Copyright (C) 2021 Avery Design Systems, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/pci/pci.h"
> +#include "hw/cxl/cxl.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +
> +static void build_cdat_table(void ***cdat_table, int *len) {
> +    struct cdat_dsmas *dsmas =3D g_malloc(sizeof(struct cdat_dsmas));
> +    struct cdat_dslbis *dslbis =3D g_malloc(sizeof(struct cdat_dslbis));
> +    struct cdat_dsmscis *dsmscis =3D g_malloc(sizeof(struct cdat_dsmscis=
));
> +    struct cdat_dsis *dsis =3D g_malloc(sizeof(struct cdat_dsis));
> +    struct cdat_dsemts *dsemts =3D g_malloc(sizeof(struct cdat_dsemts));
> +    struct cdat_sslbis {
> +        struct cdat_sslbis_header sslbis_header;
> +        struct cdat_sslbe sslbe[2];
> +    };
> +    struct cdat_sslbis *sslbis =3D g_malloc(sizeof(struct cdat_sslbis));
> +    void *__cdat_table[] =3D {
> +        dsmas,
> +        dslbis,
> +        dsmscis,
> +        dsis,
> +        dsemts,
> +        sslbis,
> +    };
> +
> +    *dsmas =3D (struct cdat_dsmas){
> +        .header =3D {
> +            .type =3D CDAT_TYPE_DSMAS,
> +            .length =3D sizeof(struct cdat_dsmas),
> +        },
> +        .DSMADhandle =3D 0,
> +        .flags =3D 0,
> +        .DPA_base =3D 0,
> +        .DPA_length =3D 0,
> +    };
> +    *dslbis =3D (struct cdat_dslbis){
> +        .header =3D {
> +            .type =3D CDAT_TYPE_DSLBIS,
> +            .length =3D sizeof(struct cdat_dslbis),
> +        },
> +        .handle =3D 0,
> +        .flags =3D 0,
> +        .data_type =3D 0,
> +        .entry_base_unit =3D 0,
> +    };
> +    *dsmscis =3D (struct cdat_dsmscis){
> +        .header =3D {
> +            .type =3D CDAT_TYPE_DSMSCIS,
> +            .length =3D sizeof(struct cdat_dsmscis),
> +        },
> +        .DSMAS_handle =3D 0,
> +        .memory_side_cache_size =3D 0,
> +        .cache_attributes =3D 0,
> +    };
> +    *dsis =3D (struct cdat_dsis){
> +        .header =3D {
> +            .type =3D CDAT_TYPE_DSIS,
> +            .length =3D sizeof(struct cdat_dsis),
> +        },
> +        .flags =3D 0,
> +        .handle =3D 0,
> +    };
> +    *dsemts =3D (struct cdat_dsemts){
> +        .header =3D {
> +            .type =3D CDAT_TYPE_DSEMTS,
> +            .length =3D sizeof(struct cdat_dsemts),
> +        },
> +        .DSMAS_handle =3D 0,
> +        .EFI_memory_type_attr =3D 0,
> +        .DPA_offset =3D 0,
> +        .DPA_length =3D 0,
> +    };
> +    *sslbis =3D (struct cdat_sslbis){
> +        .sslbis_header =3D {
> +            .header =3D {
> +                .type =3D CDAT_TYPE_SSLBIS,
> +                .length =3D sizeof(sslbis->sslbis_header) +
> +                          sizeof(struct cdat_sslbe) * 2,
> +            },
> +            .data_type =3D 0,
> +            .entry_base_unit =3D 0,
> +        },
> +        .sslbe[0] =3D {
> +            .port_x_id =3D 0,
> +            .port_y_id =3D 0,
> +            .latency_bandwidth =3D 0,
> +        },
> +        .sslbe[1] =3D {
> +            .port_x_id =3D 0,
> +            .port_y_id =3D 0,
> +            .latency_bandwidth =3D 0,

=46rom a testing point of view, perhaps add some plausible numbers here for s=
ome sort
of device?

Having the default created in here, as opposed to as part of the device spe=
cific
emulation seems like a bad idea.  Perhaps just move this over to the cxl mem
device?

> +        },
> +    };
> +
> +    *len =3D ARRAY_SIZE(__cdat_table);
> +    *cdat_table =3D g_malloc0((*len) * sizeof(void *));
> +    memcpy(*cdat_table, __cdat_table, (*len) * sizeof(void *));
> +}
> +
> +static void cdat_len_check(struct cdat_sub_header *hdr, Error **errp)
> +{
> +    assert(hdr->length);
> +    assert(hdr->reserved =3D=3D 0);
> +
> +    switch (hdr->type) {
> +    case CDAT_TYPE_DSMAS:
> +        assert(hdr->length =3D=3D sizeof(struct cdat_dsmas));
> +        break;
> +    case CDAT_TYPE_DSLBIS:
> +        assert(hdr->length =3D=3D sizeof(struct cdat_dslbis));
> +        break;
> +    case CDAT_TYPE_DSMSCIS:
> +        assert(hdr->length =3D=3D sizeof(struct cdat_dsmscis));
> +        break;
> +    case CDAT_TYPE_DSIS:
> +        assert(hdr->length =3D=3D sizeof(struct cdat_dsis));
> +        break;
> +    case CDAT_TYPE_DSEMTS:
> +        assert(hdr->length =3D=3D sizeof(struct cdat_dsemts));
> +        break;
> +    case CDAT_TYPE_SSLBIS:
> +        assert(hdr->length >=3D sizeof(struct cdat_sslbis_header));
> +        assert((hdr->length - sizeof(struct cdat_sslbis_header)) %
> +               sizeof(struct cdat_sslbe) =3D=3D 0);
> +        break;
> +    default:
> +        error_setg(errp, "Type %d is reserved", hdr->type);
> +    }
> +}
> +
> +void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp)
> +{
> +    CDATObject *cdat =3D &cxl_cstate->cdat;
> +    CDATEntry cdat_st[1024];
> +    uint8_t sum =3D 0, *buf;
> +    int i =3D 0, ent =3D 1, file_size =3D 0, cdat_table_len =3D 0;
> +    struct cdat_sub_header *hdr;
> +    struct cdat_table_header *cdat_header;
> +    FILE *fp;
> +    void **cdat_table =3D NULL;
> +
> +    fp =3D fopen(cdat->filename, "r");
> +
> +    if (fp) {
> +        /* Read CDAT file and create its cache */
> +        fseek(fp, 0, SEEK_END);
> +        file_size =3D ftell(fp);
> +        fseek(fp, 0, SEEK_SET);
> +        cdat->buf =3D g_malloc0(file_size);
> +
> +        if (fread(cdat->buf, file_size, 1, fp) =3D=3D 0) {
> +            error_setg(errp, "File read failed");
> +        }
> +
> +        fclose(fp);
> +
> +        /* Set CDAT header, Entry =3D 0 */
> +        cdat_st[0].base =3D cdat->buf;
> +        cdat_st[0].length =3D sizeof(struct cdat_table_header);
> +        while (i < cdat_st[0].length) {
> +            sum +=3D cdat->buf[i++];
> +        }
> +
> +        /* Read CDAT structures */
> +        while (i < file_size) {
> +            hdr =3D (struct cdat_sub_header *)(cdat->buf + i);
> +            cdat_len_check(hdr, errp);
> +
> +            cdat_st[ent].base =3D hdr;
> +            cdat_st[ent].length =3D hdr->length;
> +
> +            while (cdat->buf + i < (char *)cdat_st[ent].base + cdat_st[e=
nt].length) {
> +                assert(i < file_size);
> +                sum +=3D cdat->buf[i++];
> +            }
> +
> +            ent++;

Whilst it seems unlikely - there isn't anything 'stopping' ent being greate=
r than
the 1024 that are available.  Add a sanity check on that.  Could even dynam=
ically
allocate that array, either by walking the CDAT twice, or the lazy option of
worst case - so divide the length by the smallest structure length possible=
 and
use that.  This isn't necessary however, just the check on ent < 1024 is.



> +        }
> +
> +        if (sum !=3D 0) {
> +            warn_report("Found checksum mismatch in %s\n", cdat->filenam=
e);
> +        }
> +    } else {
> +        /* Use default table if fopen =3D=3D NULL */
> +        cdat_header =3D g_malloc0(sizeof(struct cdat_table_header));
> +        build_cdat_table(&cdat_table, &cdat_table_len);
> +
> +        /* Entry 0 for CDAT header, starts with Entry 1 */
> +        for (; ent < cdat_table_len + 1; ent++) {
> +            hdr =3D cdat_table[ent - 1];
> +            buf =3D cdat_table[ent - 1];
> +
> +            cdat_st[ent].base =3D hdr;
> +            cdat_st[ent].length =3D hdr->length;
> +
> +            cdat_header->length +=3D hdr->length;
> +            for (i =3D 0; i < hdr->length; i++) {
> +                sum +=3D buf[i];
> +            }
> +        }
> +
> +        /* Generate CDAT header */
> +        cdat_header->revision =3D CXL_CDAT_REV;
> +        cdat_header->sequence =3D 0;
> +        cdat_header->length +=3D sizeof(struct cdat_table_header);
> +        sum +=3D cdat_header->revision + cdat_header->sequence +
> +               cdat_header->length;
> +        cdat_header->checksum =3D ~sum + 1;
> +
> +        cdat_st[0].base =3D cdat_header;
> +        cdat_st[0].length =3D sizeof(struct cdat_table_header);
> +    }
> +
> +    /* Copy from temp struct */
> +    cdat->entry_len =3D ent;
> +    cdat->entry =3D g_malloc0(sizeof(CDATEntry) * ent);
> +    memcpy(cdat->entry, cdat_st, sizeof(CDATEntry) * ent);
> +}
> diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> index 0eca715d10..9e2e5f4094 100644
> --- a/hw/cxl/meson.build
> +++ b/hw/cxl/meson.build
> @@ -2,4 +2,5 @@ softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
>    'cxl-component-utils.c',
>    'cxl-device-utils.c',
>    'cxl-mailbox-utils.c',
> +  'cxl-cdat.c',
>  ))
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 569872eb36..c6ebeb1bb2 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -121,6 +121,49 @@ bool cxl_doe_compliance_rsp(DOECap *doe_cap)
>      return true;
>  }
> =20
> +bool cxl_doe_cdat_rsp(DOECap *doe_cap)
> +{
> +    CDATObject *cdat =3D &CT3(doe_cap->pdev)->cxl_cstate.cdat;
> +    uint16_t ent;
> +    void *base;
> +    uint32_t len;
> +    struct cxl_cdat_req *req =3D pcie_doe_get_write_mbox_ptr(doe_cap);
> +    struct cxl_cdat_rsp rsp;
> +
> +    assert(cdat->entry_len);
> +
> +    /* Discard if request length mismatched */
> +    if (pcie_doe_get_obj_len(req) <
> +        DIV_ROUND_UP(sizeof(struct cxl_cdat_req), DWORD_BYTE)) {

Maybe sizeof(*req)?

> +        return false;
> +    }
> +
> +    ent =3D req->entry_handle;
> +    base =3D cdat->entry[ent].base;
> +    len =3D cdat->entry[ent].length;
> +
> +    rsp =3D (struct cxl_cdat_rsp) {
> +        .header =3D {
> +            .vendor_id =3D CXL_VENDOR_ID,
> +            .data_obj_type =3D CXL_DOE_TABLE_ACCESS,
> +            .reserved =3D 0x0,
> +            .length =3D DIV_ROUND_UP((sizeof(rsp) + len), DWORD_BYTE),
> +        },
> +        .rsp_code =3D CXL_DOE_TAB_RSP,
> +        .table_type =3D CXL_DOE_TAB_TYPE_CDAT,
> +        .entry_handle =3D (ent < cdat->entry_len - 1) ?
> +                        ent + 1 : CXL_DOE_TAB_ENT_MAX,
> +    };
> +
> +    memcpy(doe_cap->read_mbox, &rsp, sizeof(rsp));
> +    memcpy(doe_cap->read_mbox + DIV_ROUND_UP(sizeof(rsp), DWORD_BYTE),
> +           base, len);
> +
> +    doe_cap->read_mbox_len +=3D rsp.header.length;
> +
> +    return true;
> +}
> +
>  static uint32_t ct3d_config_read(PCIDevice *pci_dev, uint32_t addr, int =
size)
>  {
>      CXLType3Dev *ct3d =3D CT3(pci_dev);
> @@ -128,6 +171,8 @@ static uint32_t ct3d_config_read(PCIDevice *pci_dev, =
uint32_t addr, int size)
> =20
>      if (pcie_doe_read_config(&ct3d->doe_comp, addr, size, &val)) {
>          return val;
> +    } else if (pcie_doe_read_config(&ct3d->doe_cdat, addr, size, &val)) {
> +        return val;
>      }
> =20
>      return pci_default_read_config(pci_dev, addr, size);
> @@ -139,6 +184,7 @@ static void ct3d_config_write(PCIDevice *pci_dev, uin=
t32_t addr, uint32_t val,
>      CXLType3Dev *ct3d =3D CT3(pci_dev);
> =20
>      pcie_doe_write_config(&ct3d->doe_comp, addr, val, size);
> +    pcie_doe_write_config(&ct3d->doe_cdat, addr, val, size);
>      pci_default_write_config(pci_dev, addr, val, size);
>  }
> =20
> @@ -336,6 +382,11 @@ static DOEProtocol doe_comp_prot[] =3D {
>      {},
>  };
> =20
> +static DOEProtocol doe_cdat_prot[] =3D {
> +    {CXL_VENDOR_ID, CXL_DOE_TABLE_ACCESS, cxl_doe_cdat_rsp},
> +    {},
> +};
> +
>  static void ct3_realize(PCIDevice *pci_dev, Error **errp)
>  {
>      CXLType3Dev *ct3d =3D CT3(pci_dev);
> @@ -343,7 +394,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **e=
rrp)
>      ComponentRegisters *regs =3D &cxl_cstate->crb;
>      MemoryRegion *mr =3D &regs->component_registers;
>      uint8_t *pci_conf =3D pci_dev->config;
> -    unsigned short msix_num =3D 1;
> +    unsigned short msix_num =3D 2;
>      int i;
> =20
>      if (!ct3d->cxl_dstate.pmem) {
> @@ -383,6 +434,9 @@ static void ct3_realize(PCIDevice *pci_dev, Error **e=
rrp)
> =20
>      /* DOE Initailization */
>      pcie_doe_init(pci_dev, &ct3d->doe_comp, 0x160, doe_comp_prot, true, =
0);
> +    pcie_doe_init(pci_dev, &ct3d->doe_cdat, 0x190, doe_cdat_prot, true, =
1);
> +
> +    cxl_doe_cdat_init(cxl_cstate, errp);
>  }
> =20
>  static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
> @@ -419,6 +473,7 @@ static Property ct3_props[] =3D {
>                       HostMemoryBackend *),
>      DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
>                       HostMemoryBackend *),
> +    DEFINE_PROP_STRING("cdat", CXLType3Dev, cxl_cstate.cdat.filename),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
> new file mode 100644
> index 0000000000..f97b9db870
> --- /dev/null
> +++ b/include/hw/cxl/cxl_cdat.h
> @@ -0,0 +1,149 @@
> +/*
> + * CXL CDAT Structure
> + *
> + * Copyright (C) 2021 Avery Design Systems, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef CXL_CDAT_H
> +#define CXL_CDAT_H
> +
> +#include "hw/cxl/cxl_pci.h"
> +
> +/*
> + * Reference:
> + *   Coherent Device Attribute Table (CDAT) Specification, Rev. 1.02, Oc=
t. 2020
> + *   Compute Express Link (CXL) Specification, Rev. 2.0, Oct. 2020
> + */
> +/* Table Access DOE - CXL 8.1.11 */
> +#define CXL_DOE_TABLE_ACCESS      2
> +#define CXL_DOE_PROTOCOL_CDAT     ((CXL_DOE_TABLE_ACCESS << 16) | CXL_VE=
NDOR_ID)
> +
> +/* Read Entry - CXL 8.1.11.1 */
> +#define CXL_DOE_TAB_TYPE_CDAT 0
> +#define CXL_DOE_TAB_ENT_MAX 0xFFFF
> +
> +/* Read Entry Request - CXL 8.1.11.1 Table 134 */
> +#define CXL_DOE_TAB_REQ 0
> +struct cxl_cdat_req {
> +    DOEHeader header;
> +    uint8_t req_code;
> +    uint8_t table_type;
> +    uint16_t entry_handle;
> +} QEMU_PACKED;
> +
> +/* Read Entry Response - CXL 8.1.11.1 Table 135 */
> +#define CXL_DOE_TAB_RSP 0
> +struct cxl_cdat_rsp {
> +    DOEHeader header;
> +    uint8_t rsp_code;
> +    uint8_t table_type;
> +    uint16_t entry_handle;
> +} QEMU_PACKED;
> +
> +/* CDAT Table Format - CDAT Table 1 */
> +#define CXL_CDAT_REV 1
> +struct cdat_table_header {
> +    uint32_t length;
> +    uint8_t revision;
> +    uint8_t checksum;
> +    uint8_t reserved[6];
> +    uint32_t sequence;
> +} QEMU_PACKED;
> +
> +/* CDAT Structure Types - CDAT Table 2 */
> +enum cdat_type {
> +    CDAT_TYPE_DSMAS =3D 0,
> +    CDAT_TYPE_DSLBIS =3D 1,
> +    CDAT_TYPE_DSMSCIS =3D 2,
> +    CDAT_TYPE_DSIS =3D 3,
> +    CDAT_TYPE_DSEMTS =3D 4,
> +    CDAT_TYPE_SSLBIS =3D 5,
> +};
> +
> +struct cdat_sub_header {
> +    uint8_t type;
> +    uint8_t reserved;
> +    uint16_t length;
> +};
> +
> +/* Device Scoped Memory Affinity Structure - CDAT Table 3 */
> +struct cdat_dsmas {
> +    struct cdat_sub_header header;
> +    uint8_t DSMADhandle;
> +    uint8_t flags;
> +    uint16_t reserved;
> +    uint64_t DPA_base;
> +    uint64_t DPA_length;
> +} QEMU_PACKED;
> +
> +/* Device Scoped Latency and Bandwidth Information Structure - CDAT Tabl=
e 5 */
> +struct cdat_dslbis {
> +    struct cdat_sub_header header;
> +    uint8_t handle;
> +    uint8_t flags;
> +    uint8_t data_type;
> +    uint8_t reserved;
> +    uint64_t entry_base_unit;
> +    uint16_t entry[3];
> +    uint16_t reserved2;
> +} QEMU_PACKED;
> +
> +/* Device Scoped Memory Side Cache Information Structure - CDAT Table 6 =
*/
> +struct cdat_dsmscis {
> +    struct cdat_sub_header header;
> +    uint8_t DSMAS_handle;
> +    uint8_t reserved[3];
> +    uint64_t memory_side_cache_size;
> +    uint32_t cache_attributes;
> +} QEMU_PACKED;
> +
> +/* Device Scoped Initiator Structure - CDAT Table 7 */
> +struct cdat_dsis {
> +    struct cdat_sub_header header;
> +    uint8_t flags;
> +    uint8_t handle;
> +    uint16_t reserved;
> +} QEMU_PACKED;
> +
> +/* Device Scoped EFI Memory Type Structure - CDAT Table 8 */
> +struct cdat_dsemts {
> +    struct cdat_sub_header header;
> +    uint8_t DSMAS_handle;
> +    uint8_t EFI_memory_type_attr;
> +    uint16_t reserved;
> +    uint64_t DPA_offset;
> +    uint64_t DPA_length;
> +} QEMU_PACKED;
> +
> +/* Switch Scoped Latency and Bandwidth Information Structure - CDAT Tabl=
e 9 */
> +struct cdat_sslbis_header {
> +    struct cdat_sub_header header;
> +    uint8_t data_type;
> +    uint8_t reserved[3];
> +    uint64_t entry_base_unit;
> +} QEMU_PACKED;
> +
> +/* Switch Scoped Latency and Bandwidth Entry - CDAT Table 10 */
> +struct cdat_sslbe {
> +    uint16_t port_x_id;
> +    uint16_t port_y_id;
> +    uint16_t latency_bandwidth;
> +    uint16_t reserved;
> +} QEMU_PACKED;
> +
> +typedef struct CDATEntry {
> +    void *base;
> +    uint32_t length;
> +} CDATEntry;
> +
> +typedef struct CDATObject {
> +    CDATEntry *entry;
> +    int entry_len;
> +
> +    char *filename;
> +    char *buf;
> +} CDATObject;
> +#endif /* CXL_CDAT_H */
> diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_componen=
t.h
> index d299c77ae3..a156803f51 100644
> --- a/include/hw/cxl/cxl_component.h
> +++ b/include/hw/cxl/cxl_component.h
> @@ -18,6 +18,7 @@
>  #include "qemu/range.h"
>  #include "qemu/typedefs.h"
>  #include "hw/register.h"
> +#include "qapi/error.h"
> =20
>  enum reg_type {
>      CXL2_DEVICE,
> @@ -175,6 +176,7 @@ typedef struct cxl_component {
>      };
> =20
>      ComplianceObject compliance;
> +    CDATObject cdat;
>  } CXLComponentState;
> =20
>  void cxl_component_register_block_init(Object *obj,
> @@ -187,4 +189,6 @@ void cxl_component_create_dvsec(CXLComponentState *cx=
l_cstate, uint16_t length,
>                                  uint16_t type, uint8_t rev, uint8_t *bod=
y);
> =20
>  bool cxl_doe_compliance_rsp(DOECap *doe_cap);
> +void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp);
> +bool cxl_doe_cdat_rsp(DOECap *doe_cap);
>  #endif
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index f0cb7de795..de006ff463 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -239,6 +239,7 @@ typedef struct cxl_type3_dev {
> =20
>      /* DOE */
>      DOECap doe_comp;
> +    DOECap doe_cdat;
>  } CXLType3Dev;
> =20
>  #ifndef TYPE_CXL_TYPE3_DEV
> diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
> index 129bdf3238..c4516d3403 100644
> --- a/include/hw/cxl/cxl_pci.h
> +++ b/include/hw/cxl/cxl_pci.h
> @@ -12,6 +12,7 @@
> =20
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pcie.h"
> +#include "hw/cxl/cxl_cdat.h"
>  #include "hw/cxl/cxl_compliance.h"
> =20
>  #define CXL_VENDOR_ID 0x1e98


