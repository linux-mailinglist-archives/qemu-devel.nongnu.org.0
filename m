Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472E931F376
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 01:56:47 +0100 (CET)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCu6A-0002Ln-Cr
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 19:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1lCu5G-0001py-GG
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:55:50 -0500
Received: from server.avery-design.com ([198.57.169.184]:53572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1lCu5C-0001kV-Lw
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:55:50 -0500
Received: from ool-944ab965.dyn.optonline.net ([148.74.185.101]:56118
 helo=[192.168.1.180])
 by server.avery-design.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <cbrowy@avery-design.com>)
 id 1lCtvG-00015m-Bv; Fri, 19 Feb 2021 00:45:30 +0000
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC v2 2/2] Basic CXL DOE for CDAT and Compliance Mode
From: Chris Browy <cbrowy@avery-design.com>
In-Reply-To: <20210218191515.00007a2a@Huawei.com>
Date: Thu, 18 Feb 2021 19:53:12 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <164BFF23-7227-4458-9692-13EF1DF61AF4@avery-design.com>
References: <1612900760-7361-1-git-send-email-cbrowy@avery-design.com>
 <1612902963-10071-1-git-send-email-cbrowy@avery-design.com>
 <20210212172317.00003c1d@Huawei.com>
 <F892C4DB-320F-440C-BB36-0B5A9473B753@avery-design.com>
 <20210218191515.00007a2a@Huawei.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.avery-design.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - avery-design.com
X-Get-Message-Sender-Via: server.avery-design.com: authenticated_id:
 cbrowy@avery-design.com
X-Authenticated-Sender: server.avery-design.com: cbrowy@avery-design.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=198.57.169.184;
 envelope-from=cbrowy@avery-design.com; helo=server.avery-design.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-To: "20210218191515.00007a2a@huawei.com"
 <20210218191515.00007a2a@Huawei.com>
Cc: Ben Widawsky <ben.widawsky@intel.com>, david@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, jgroves@micron.com,
 f4bug@amsat.org, linux-cxl@vger.kernel.org, armbru@redhat.com, mst@redhat.com,
 imammedo@redhat.com, dan.j.williams@intel.com, ira.weiny@intel.com,
 "20210212172317.00003c1d@huawei.com" <20210212172317.00003c1d@Huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 18, 2021, at 2:15 PM, Jonathan Cameron =
<jonathan.cameron@huawei.com> wrote:
>=20
> On Fri, 12 Feb 2021 17:26:50 -0500
> Chris Browy <cbrowy@avery-design.com> wrote:
>=20
>>> On Feb 12, 2021, at 12:23 PM, Jonathan Cameron =
<jonathan.cameron@huawei.com> wrote:
>>>=20
>>> On Tue, 9 Feb 2021 15:36:03 -0500
>>> Chris Browy <cbrowy@avery-design.com> wrote:
>>>=20
>>> Split this into two patches for v3.  CDAT in one, compliance mode in =
the other.
>>>=20
>>=20
>> Compliance mode is an optional feature.  We=E2=80=99ll split it out.
>>=20
>>> I'd also move the actual elements out into the cxl components so =
that we
>>> can register only what makes sense for a given device.   My guess
>>> is that for now that will be static const anyway.
>>>=20
>>> Coming together fine. Hopefully I'll start poking at the linux side =
of things
>>> next week.  First job being simply providing a file to allow us to =
dump
>>> the whole CDAT table.  Let me know if you get this loading an .aml =
file
>>> in the meantime as that'll make it easier to test (if not I'll hack =
it
>>> on top of these patches) =20
>>=20
>> We can get the .aml loading by Thurs next week.  Holiday next few =
days for=20
>> some of our folks.
>>=20
>>>=20
>>> If needed I'll add it to iASL as well (may well be already in hand!)
>=20
> There is a potential problem doing this.  CDAT doesn't have the table
> type ID that an ACPI table would have.  That means raw CDAT tables
> are not identifiable and I think this makes it hard to use iASL with =
them
> without changing it's general means of functioning.
>=20
> We can probably do something with an extra parameter, but this lack of
> identifier is going to make it harder to persuade people that it's =
sensible to
> including CDAT in iASL.

This would be worth requesting the responsible ACPI or UEFI working =
group=20
of UEFI.org to weight in on the original intent since this must have =
been considered
despite not being addressed in the specification.

The spec is clear:

	Note: The data structures defined in this document are NOT ACPI =
tables.

I can=E2=80=99t find the author or working group designator in the spec =
although it is
	Copyright 2020 Unified EFI, Inc. All Rights Reserved.

>=20
>>>=20
>>> I think my version of this stuff did a useful job in improving my =
understanding
>>> of what we were trying to do, but that done I'm assuming we'll just =
abandon it
>>> as the disposable prototype it was :)
>>>=20
>>=20
>> Thanks for focusing in on the area and uncovering problems with both =
our versions!
>>=20
>> Still lots of pieces need to come together and get working to be able =
to fully enumerate=20
>> and configure the device!
>>=20
>>> Jonathan
>>>=20
>>>=20
>>>> ---
>>>> hw/cxl/cxl-component-utils.c   | 132 +++++++++++++++++++
>>>> hw/mem/cxl_type3.c             | 172 ++++++++++++++++++++++++
>>>> include/hw/cxl/cxl_cdat.h      | 120 +++++++++++++++++
>>>> include/hw/cxl/cxl_compl.h     | 289 =
+++++++++++++++++++++++++++++++++++++++++
>>>> include/hw/cxl/cxl_component.h | 126 ++++++++++++++++++
>>>> include/hw/cxl/cxl_device.h    |   3 +
>>>> include/hw/cxl/cxl_pci.h       |   4 +
>>>> 7 files changed, 846 insertions(+)
>>>> create mode 100644 include/hw/cxl/cxl_cdat.h
>>>> create mode 100644 include/hw/cxl/cxl_compl.h
>>>>=20
>>>> diff --git a/hw/cxl/cxl-component-utils.c =
b/hw/cxl/cxl-component-utils.c
>>>> index e1bcee5..fc6c538 100644
>>>> --- a/hw/cxl/cxl-component-utils.c
>>>> +++ b/hw/cxl/cxl-component-utils.c
>>>> @@ -195,3 +195,135 @@ void =
cxl_component_create_dvsec(CXLComponentState *cxl, uint16_t length,
>>>>    range_init_nofail(&cxl->dvsecs[type], cxl->dvsec_offset, =
length);
>>>>    cxl->dvsec_offset +=3D length;
>>>> }
>>>> +
>>>> +/* Return the sum of bytes */
>>>> +static void cdat_ent_init(CDATStruct *cs, void *base, uint32_t =
len)
>>>> +{
>>>> +    cs->base =3D base;
>>>> +    cs->length =3D len;
>>>> +}
>>>> +
>>>> +void cxl_doe_cdat_init(CXLComponentState *cxl_cstate)
>>>> +{
>>>> +    uint8_t sum =3D 0;
>>>> +    uint32_t len =3D 0;
>>>> +    int i, j;
>>>> +
>>>> +    cxl_cstate->cdat_ent_len =3D 7;
>>>> +    cxl_cstate->cdat_ent =3D
>>>> +        g_malloc0(sizeof(CDATStruct) * cxl_cstate->cdat_ent_len);
>>>> +
>>>> +    cdat_ent_init(&cxl_cstate->cdat_ent[0],
>>>> +                  &cxl_cstate->cdat_header, =
sizeof(cxl_cstate->cdat_header));
>>>> +    cdat_ent_init(&cxl_cstate->cdat_ent[1],
>>>> +                  &cxl_cstate->dsmas, sizeof(cxl_cstate->dsmas));
>>>> +    cdat_ent_init(&cxl_cstate->cdat_ent[2],
>>>> +                  &cxl_cstate->dslbis, =
sizeof(cxl_cstate->dslbis));
>>>> +    cdat_ent_init(&cxl_cstate->cdat_ent[3],
>>>> +                  &cxl_cstate->dsmscis, =
sizeof(cxl_cstate->dsmscis));
>>>> +    cdat_ent_init(&cxl_cstate->cdat_ent[4],
>>>> +                  &cxl_cstate->dsis, sizeof(cxl_cstate->dsis));
>>>> +    cdat_ent_init(&cxl_cstate->cdat_ent[5],
>>>> +                  &cxl_cstate->dsemts, =
sizeof(cxl_cstate->dsemts));
>>>> +    cdat_ent_init(&cxl_cstate->cdat_ent[6],
>>>> +                  &cxl_cstate->sslbis, =
sizeof(cxl_cstate->sslbis));
>>>> +
>>>> +    /* Set the DSMAS entry, ent =3D 1 */
>>>> +    cxl_cstate->dsmas.header.type =3D CDAT_TYPE_DSMAS;
>>>> +    cxl_cstate->dsmas.header.reserved =3D 0x0;
>>>> +    cxl_cstate->dsmas.header.length =3D sizeof(cxl_cstate->dsmas);
>>>> +    cxl_cstate->dsmas.DSMADhandle =3D 0x0;
>>>> +    cxl_cstate->dsmas.flags =3D 0x0;
>>>> +    cxl_cstate->dsmas.reserved2 =3D 0x0;
>>>> +    cxl_cstate->dsmas.DPA_base =3D 0x0;
>>>> +    cxl_cstate->dsmas.DPA_length =3D 0x40000; =20
>>>=20
>>> Look to move the instances of these down into the memory device and =
expose
>>> cdat_ent_init() to there.
>>>=20
>>> That way, we can add whatever elements make sense for each type
>>> of component.
>>>=20
>>=20
>>> Also have a cdat_ents_finalize() or similar to call at the end
>>> which calculates overall length + checksum. =20
>>=20
>> OK
>>=20
>>>=20
>>> Should also be easy enough to add a simple bit of code to call
>>> cdat_ent_init() for each element of a passed in CDAT.aml file.
>>>=20
>>=20
>> We=E2=80=99ll address all the above when we add the CDAT.aml file =
support=20
>> which may only pass a subset of structures.=20
>>=20
>>>> +
>>>> +    /* Set the DSLBIS entry, ent =3D 2 */
>>>> +    cxl_cstate->dslbis.header.type =3D CDAT_TYPE_DSLBIS;
>>>> +    cxl_cstate->dslbis.header.reserved =3D 0;
>>>> +    cxl_cstate->dslbis.header.length =3D =
sizeof(cxl_cstate->dslbis);
>>>> +    cxl_cstate->dslbis.handle =3D 0;
>>>> +    cxl_cstate->dslbis.flags =3D 0;
>>>> +    cxl_cstate->dslbis.data_type =3D 0;
>>>> +    cxl_cstate->dslbis.reserved2 =3D 0;
>>>> +    cxl_cstate->dslbis.entry_base_unit =3D 0;
>>>> +    cxl_cstate->dslbis.entry[0] =3D 0;
>>>> +    cxl_cstate->dslbis.entry[1] =3D 0;
>>>> +    cxl_cstate->dslbis.entry[2] =3D 0;
>>>> +    cxl_cstate->dslbis.reserved3 =3D 0;
>>>> +
>>>> +    /* Set the DSMSCIS entry, ent =3D 3 */
>>>> +    cxl_cstate->dsmscis.header.type =3D CDAT_TYPE_DSMSCIS;
>>>> +    cxl_cstate->dsmscis.header.reserved =3D 0;
>>>> +    cxl_cstate->dsmscis.header.length =3D =
sizeof(cxl_cstate->dsmscis);
>>>> +    cxl_cstate->dsmscis.DSMASH_handle =3D 0;
>>>> +    cxl_cstate->dsmscis.reserved2[0] =3D 0;
>>>> +    cxl_cstate->dsmscis.reserved2[1] =3D 0;
>>>> +    cxl_cstate->dsmscis.reserved2[2] =3D 0;
>>>> +    cxl_cstate->dsmscis.memory_side_cache_size =3D 0;
>>>> +    cxl_cstate->dsmscis.cache_attributes =3D 0;
>>>> +
>>>> +    /* Set the DSIS entry, ent =3D 4 */
>>>> +    cxl_cstate->dsis.header.type =3D CDAT_TYPE_DSIS;
>>>> +    cxl_cstate->dsis.header.reserved =3D 0;
>>>> +    cxl_cstate->dsis.header.length =3D sizeof(cxl_cstate->dsis);
>>>> +    cxl_cstate->dsis.flags =3D 0;
>>>> +    cxl_cstate->dsis.handle =3D 0;
>>>> +    cxl_cstate->dsis.reserved2 =3D 0;
>>>> +
>>>> +    /* Set the DSEMTS entry, ent =3D 5 */
>>>> +    cxl_cstate->dsemts.header.type =3D CDAT_TYPE_DSEMTS;
>>>> +    cxl_cstate->dsemts.header.reserved =3D 0;
>>>> +    cxl_cstate->dsemts.header.length =3D =
sizeof(cxl_cstate->dsemts);
>>>> +    cxl_cstate->dsemts.DSMAS_handle =3D 0;
>>>> +    cxl_cstate->dsemts.EFI_memory_type_attr =3D 0;
>>>> +    cxl_cstate->dsemts.reserved2 =3D 0;
>>>> +    cxl_cstate->dsemts.DPA_offset =3D 0;
>>>> +    cxl_cstate->dsemts.DPA_length =3D 0;
>>>> +
>>>> +    /* Set the SSLBIS entry, ent =3D 6 */
>>>> +    cxl_cstate->sslbis.sslbis_h.header.type =3D CDAT_TYPE_SSLBIS;
>>>> +    cxl_cstate->sslbis.sslbis_h.header.reserved =3D 0;
>>>> +    cxl_cstate->sslbis.sslbis_h.header.length =3D =
sizeof(cxl_cstate->sslbis);
>>>> +    cxl_cstate->sslbis.sslbis_h.data_type =3D 0;
>>>> +    cxl_cstate->sslbis.sslbis_h.reserved2[0] =3D 0;
>>>> +    cxl_cstate->sslbis.sslbis_h.reserved2[1] =3D 0;
>>>> +    cxl_cstate->sslbis.sslbis_h.reserved2[2] =3D 0;
>>>> +    /* Set the SSLBE entry */
>>>> +    cxl_cstate->sslbis.sslbe[0].port_x_id =3D 0;
>>>> +    cxl_cstate->sslbis.sslbe[0].port_y_id =3D 0;
>>>> +    cxl_cstate->sslbis.sslbe[0].latency_bandwidth =3D 0;
>>>> +    cxl_cstate->sslbis.sslbe[0].reserved =3D 0;
>>>> +    /* Set the SSLBE entry */
>>>> +    cxl_cstate->sslbis.sslbe[1].port_x_id =3D 1;
>>>> +    cxl_cstate->sslbis.sslbe[1].port_y_id =3D 1;
>>>> +    cxl_cstate->sslbis.sslbe[1].latency_bandwidth =3D 0;
>>>> +    cxl_cstate->sslbis.sslbe[1].reserved =3D 0;
>>>> +    /* Set the SSLBE entry */
>>>> +    cxl_cstate->sslbis.sslbe[2].port_x_id =3D 2;
>>>> +    cxl_cstate->sslbis.sslbe[2].port_y_id =3D 2;
>>>> +    cxl_cstate->sslbis.sslbe[2].latency_bandwidth =3D 0;
>>>> +    cxl_cstate->sslbis.sslbe[2].reserved =3D 0;
>>>> +
>>>> +    /* Set CDAT header, ent =3D 0 */
>>>> +    cxl_cstate->cdat_header.revision =3D CXL_CDAT_REV;
>>>> +    cxl_cstate->cdat_header.reserved[0] =3D 0;
>>>> +    cxl_cstate->cdat_header.reserved[1] =3D 0;
>>>> +    cxl_cstate->cdat_header.reserved[2] =3D 0;
>>>> +    cxl_cstate->cdat_header.reserved[3] =3D 0;
>>>> +    cxl_cstate->cdat_header.reserved[4] =3D 0;
>>>> +    cxl_cstate->cdat_header.reserved[5] =3D 0;
>>>> +    cxl_cstate->cdat_header.sequence =3D 0;
>>>> +
>>>> +    for (i =3D cxl_cstate->cdat_ent_len - 1; i >=3D 0; i--) {
>>>> +        /* Add length of each CDAT struct to total length */
>>>> +        len =3D cxl_cstate->cdat_ent[i].length;
>>>> +        cxl_cstate->cdat_header.length +=3D len;
>>>> +
>>>> +        /* Calculate checksum of each CDAT struct */
>>>> +        for (j =3D 0; j < len; j++) {
>>>> +            sum +=3D *(uint8_t *)(cxl_cstate->cdat_ent[i].base + =
j);
>>>> +        }
>>>> +    }
>>>> +    cxl_cstate->cdat_header.checksum =3D ~sum + 1;
>>>> +}
>>>> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
>>>> index d091e64..86c762f 100644
>>>> --- a/hw/mem/cxl_type3.c
>>>> +++ b/hw/mem/cxl_type3.c
>>>> @@ -13,6 +13,150 @@
>>>> #include "qemu/rcu.h"
>>>> #include "sysemu/hostmem.h"
>>>> #include "hw/cxl/cxl.h"
>>>> +#include "hw/pci/msi.h"
>>>> +#include "hw/pci/msix.h"
>>>> +
>>>> +uint32_t cxl_doe_compliance_init(DOECap *doe_cap) =20
>>> local to file, static and remove from header. =20
>>>> +{
>>>> +    CXLComponentState *cxl_cstate =3D =
&CT3(doe_cap->doe->pdev)->cxl_cstate;
>>>> +    uint32_t req;
>>>> +    uint32_t byte_cnt =3D 0;
>>>> +
>>>> +    DOE_DBG(">> %s\n",  __func__);
>>>> +
>>>> +    req =3D ((struct cxl_compliance_mode_cap =
*)pcie_doe_get_req(doe_cap))
>>>> +        ->req_code;
>>>> +    switch (req) {
>>>> +    case CXL_COMP_MODE_CAP:
>>>> +        byte_cnt =3D sizeof(struct cxl_compliance_mode_cap_rsp); =20=

>>>=20
>>> Use a local variable to cap_rsp or assign it via a structure here.
>>> Basically get rid of the repitition of
>>> cxl_cstate->doe_resp.cap_rsp
>>> in the interests of readability.
>>>=20
>>>=20
>>>> +        cxl_cstate->doe_resp.cap_rsp.header.vendor_id =3D =
CXL_VENDOR_ID;
>>>> +        cxl_cstate->doe_resp.cap_rsp.header.doe_type =3D =
CXL_DOE_COMPLIANCE;
>>>> +        cxl_cstate->doe_resp.cap_rsp.header.reserved =3D 0x0;
>>>> +        cxl_cstate->doe_resp.cap_rsp.header.length =3D
>>>> +            dwsizeof(struct cxl_compliance_mode_cap_rsp);
>>>> +        cxl_cstate->doe_resp.cap_rsp.rsp_code =3D 0x0;
>>>> +        cxl_cstate->doe_resp.cap_rsp.version =3D 0x1;
>>>> +        cxl_cstate->doe_resp.cap_rsp.length =3D 0x1c;
>>>> +        cxl_cstate->doe_resp.cap_rsp.status =3D 0x0;
>>>> +        cxl_cstate->doe_resp.cap_rsp.available_cap_bitmask =3D =
0x3;
>>>> +        cxl_cstate->doe_resp.cap_rsp.enabled_cap_bitmask =3D 0x3;
>>>> +        break;
>>>> +    case CXL_COMP_MODE_STATUS:
>>>> +        byte_cnt =3D sizeof(struct =
cxl_compliance_mode_status_rsp);
>>>> +        cxl_cstate->doe_resp.status_rsp.header.vendor_id =3D =
CXL_VENDOR_ID;
>>>> +        cxl_cstate->doe_resp.status_rsp.header.doe_type =3D =
CXL_DOE_COMPLIANCE;
>>>> +        cxl_cstate->doe_resp.status_rsp.header.reserved =3D 0x0;
>>>> +        cxl_cstate->doe_resp.status_rsp.header.length =3D
>>>> +            dwsizeof(struct cxl_compliance_mode_status_rsp);
>>>> +        cxl_cstate->doe_resp.status_rsp.rsp_code =3D 0x1;
>>>> +        cxl_cstate->doe_resp.status_rsp.version =3D 0x1;
>>>> +        cxl_cstate->doe_resp.status_rsp.length =3D 0x14;
>>>> +        cxl_cstate->doe_resp.status_rsp.cap_bitfield =3D 0x3;
>>>> +        cxl_cstate->doe_resp.status_rsp.cache_size =3D 0;
>>>> +        cxl_cstate->doe_resp.status_rsp.cache_size_units =3D 0;
>>>> +        break;
>>>> +    default: =20
>>>=20
>>> I guess the intent at somepoint is to actually hook some of these =
up?
>>>=20
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    DOE_DBG("  REQ=3D%x, RSP BYTE_CNT=3D%d\n", req, byte_cnt);
>>>> +    DOE_DBG("<< %s\n",  __func__);
>>>> +    return byte_cnt;
>>>> +}
>>>> +
>>>> +
>>>> +bool cxl_doe_compliance_rsp(DOECap *doe_cap) =20
>>>=20
>>> Currently this is local to this file, so drop it form the header and
>>> mark it static. =20
>>>=20
>>>> +{
>>>> +    CXLComponentState *cxl_cstate =3D =
&CT3(doe_cap->doe->pdev)->cxl_cstate;
>>>> +    uint32_t byte_cnt;
>>>> +    uint32_t dw_cnt;
>>>> +
>>>> +    DOE_DBG(">> %s\n",  __func__);
>>>> +
>>>> +    byte_cnt =3D cxl_doe_compliance_init(doe_cap);
>>>> +    dw_cnt =3D byte_cnt / 4;
>>>> +    memcpy(doe_cap->read_mbox,
>>>> +           cxl_cstate->doe_resp.data_byte, byte_cnt);
>>>> +
>>>> +    doe_cap->read_mbox_len +=3D dw_cnt;
>>>> +
>>>> +    DOE_DBG("  LEN=3D%x, RD MBOX[%d]=3D%x\n", dw_cnt - 1,
>>>> +            doe_cap->read_mbox_len,
>>>> +            *(doe_cap->read_mbox + dw_cnt - 1));
>>>> +
>>>> +    DOE_DBG("<< %s\n",  __func__);
>>>> +
>>>> +    return DOE_SUCCESS;
>>>> +}
>>>> +
>>>> +bool cxl_doe_cdat_rsp(DOECap *doe_cap) =20
>>> Local to this file I think so drop it from header and mark it =
static.
>>>=20
>>>> +{
>>>> +    CXLComponentState *cxl_cstate =3D =
&CT3(doe_cap->doe->pdev)->cxl_cstate;
>>>> +    uint16_t ent;
>>>> +    void *base;
>>>> +    uint32_t len;
>>>> +    struct cxl_cdat *req =3D pcie_doe_get_req(doe_cap);
>>>> +
>>>> +    ent =3D req->entry_handle;
>>>> +    base =3D cxl_cstate->cdat_ent[ent].base;
>>>> +    len =3D cxl_cstate->cdat_ent[ent].length;
>>>> +
>>>> +    struct cxl_cdat_rsp rsp =3D {
>>>> +        .header =3D {
>>>> +            .vendor_id =3D CXL_VENDOR_ID,
>>>> +            .doe_type =3D CXL_DOE_TABLE_ACCESS,
>>>> +            .reserved =3D 0x0,
>>>> +            .length =3D (sizeof(struct cxl_cdat_rsp) + len) / 4,
>>>> +        },
>>>> +        .req_code =3D CXL_DOE_TAB_RSP,
>>>> +        .table_type =3D CXL_DOE_TAB_TYPE_CDAT,
>>>> +        .entry_handle =3D (++ent < cxl_cstate->cdat_ent_len) ? ent =
: CXL_DOE_TAB_ENT_MAX,
>>>> +    };
>>>> +
>>>> +    memcpy(doe_cap->read_mbox, &rsp, sizeof(rsp));
>>>> +    memcpy(doe_cap->read_mbox + sizeof(rsp) / 4, base, len);
>>>> +
>>>> +    doe_cap->read_mbox_len +=3D rsp.header.length;
>>>> +    DOE_DBG("  read_mbox_len=3D%x\n", doe_cap->read_mbox_len);
>>>> +
>>>> +    for (int i =3D 0; i < doe_cap->read_mbox_len; i++) {
>>>> +        DOE_DBG("  RD MBOX[%d]=3D%08x\n", i, =
doe_cap->read_mbox[i]);
>>>> +    }
>>>> +
>>>> +    return DOE_SUCCESS;
>>>> +}
>>>> +
>>>> +static uint32_t ct3d_config_read(PCIDevice *pci_dev,
>>>> +                            uint32_t addr, int size)
>>>> +{
>>>> +    CXLType3Dev *ct3d =3D CT3(pci_dev);
>>>> +    PCIEDOE *doe =3D &ct3d->doe;
>>>> +    DOECap *doe_cap;
>>>> +
>>>> +    doe_cap =3D pcie_doe_covers_addr(doe, addr);
>>>> +    if (doe_cap) {
>>>> +        DOE_DBG(">> %s addr=3D%x, size=3D%x\n", __func__, addr, =
size);
>>>> +        return pcie_doe_read_config(doe_cap, addr, size);
>>>> +    } else {
>>>> +        return pci_default_read_config(pci_dev, addr, size);
>>>> +    }
>>>> +}
>>>> +
>>>> +static void ct3d_config_write(PCIDevice *pci_dev,
>>>> +                            uint32_t addr, uint32_t val, int size)
>>>> +{
>>>> +    CXLType3Dev *ct3d =3D CT3(pci_dev);
>>>> +    PCIEDOE *doe =3D &ct3d->doe;
>>>> +    DOECap *doe_cap;
>>>> +
>>>> +    doe_cap =3D pcie_doe_covers_addr(doe, addr);
>>>> +    if (doe_cap) {
>>>> +        DOE_DBG(">> %s addr=3D%x, val=3D%x, size=3D%x\n", =
__func__, addr, val, size);
>>>> +        pcie_doe_write_config(doe_cap, addr, val, size);
>>>> +    } else {
>>>> +        pci_default_write_config(pci_dev, addr, val, size);
>>>> +    }
>>>> +}
>>>>=20
>>>> static void build_dvsecs(CXLType3Dev *ct3d)
>>>> {
>>>> @@ -210,6 +354,9 @@ static void ct3_realize(PCIDevice *pci_dev, =
Error **errp)
>>>>    ComponentRegisters *regs =3D &cxl_cstate->crb;
>>>>    MemoryRegion *mr =3D &regs->component_registers;
>>>>    uint8_t *pci_conf =3D pci_dev->config;
>>>> +    unsigned short msix_num =3D 2;
>>>> +    int rc;
>>>> +    int i;
>>>>=20
>>>>    if (!ct3d->cxl_dstate.pmem) {
>>>>        cxl_setup_memory(ct3d, errp);
>>>> @@ -239,6 +386,28 @@ static void ct3_realize(PCIDevice *pci_dev, =
Error **errp)
>>>>                     PCI_BASE_ADDRESS_SPACE_MEMORY |
>>>>                         PCI_BASE_ADDRESS_MEM_TYPE_64,
>>>>                     &ct3d->cxl_dstate.device_registers);
>>>> +
>>>> +    msix_init_exclusive_bar(pci_dev, msix_num, 4, NULL);
>>>> +    for (i =3D 0; i < msix_num; i++) {
>>>> +        msix_vector_use(pci_dev, i);
>>>> +    }
>>>> +
>>>> +    /* msi_init(pci_dev, 0x60, 16, true, false, NULL); */ =20
>>>=20
>>> Tidy this up or parameterize it.
>>>=20
>>>> +
>>>> +    pcie_doe_init(pci_dev, &ct3d->doe);
>>>> +    rc =3D pcie_cap_doe_add(&ct3d->doe, 0x160, true, 0); =20
>>>=20
>>> check rc here.
>>>=20
>>>> +    rc =3D pcie_cap_doe_add(&ct3d->doe, 0x190, true, 1);
>>>> +    if (rc) {
>>>> +        error_setg(errp, "fail to add DOE cap");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    pcie_doe_register_protocol(&ct3d->doe, CXL_VENDOR_ID, =
CXL_DOE_COMPLIANCE,
>>>> +                               cxl_doe_compliance_rsp);
>>>> +    pcie_doe_register_protocol(&ct3d->doe, CXL_VENDOR_ID, =
CXL_DOE_TABLE_ACCESS,
>>>> +                               cxl_doe_cdat_rsp);
>>>> +
>>>> +    cxl_doe_cdat_init(cxl_cstate);
>>>> }
>>>>=20
>>>> static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
>>>> @@ -357,6 +526,9 @@ static void ct3_class_init(ObjectClass *oc, =
void *data)
>>>>    DeviceClass *dc =3D DEVICE_CLASS(oc);
>>>>    PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(oc);
>>>>    MemoryDeviceClass *mdc =3D MEMORY_DEVICE_CLASS(oc);
>>>> +
>>>> +    pc->config_write =3D ct3d_config_write;
>>>> +    pc->config_read =3D ct3d_config_read;
>>>>    CXLType3Class *cvc =3D CXL_TYPE3_DEV_CLASS(oc);
>>>>=20
>>>>    pc->realize =3D ct3_realize;
>>>> diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
>>>> new file mode 100644
>>>> index 0000000..fbbd494
>>>> --- /dev/null
>>>> +++ b/include/hw/cxl/cxl_cdat.h
>>>> @@ -0,0 +1,120 @@
>>>> +#include "hw/cxl/cxl_pci.h"
>>>> +
>>>> +
>>>> +enum {
>>>> +    CXL_DOE_COMPLIANCE             =3D 0,
>>>> +    CXL_DOE_TABLE_ACCESS           =3D 2,
>>>> +    CXL_DOE_MAX_PROTOCOL
>>>> +};
>>>> +
>>>> +#define CXL_DOE_PROTOCOL_COMPLIANCE ((CXL_DOE_COMPLIANCE << 16) | =
CXL_VENDOR_ID)
>>>> +#define CXL_DOE_PROTOCOL_CDAT     ((CXL_DOE_TABLE_ACCESS << 16) | =
CXL_VENDOR_ID)
>>>> +
>>>> +/*
>>>> + * DOE CDAT Table Protocol (CXL Spec)
>>>> + */
>>>> +#define CXL_DOE_TAB_REQ 0
>>>> +#define CXL_DOE_TAB_RSP 0
>>>> +#define CXL_DOE_TAB_TYPE_CDAT 0
>>>> +#define CXL_DOE_TAB_ENT_MAX 0xFFFF
>>>> +
>>>> +/* Read Entry Request, 8.1.11.1 Table 134 */
>>>> +struct cxl_cdat {
>>>> +    DOEHeader header;
>>>> +    uint8_t req_code;
>>>> +    uint8_t table_type;
>>>> +    uint16_t entry_handle;
>>>> +} QEMU_PACKED;
>>>> +
>>>> +/* Read Entry Response, 8.1.11.1 Table 135 */
>>>> +#define cxl_cdat_rsp    cxl_cdat    /* Same as request */
>>>> + =20
>>> ... Note I'm just snipping out these big defines as I check them
>>> against the spec :) Hence the gap.
>>> ...
>>>=20
>>>> +struct cdat_dsmscis {
>>>> +    struct cdat_sub_header header;
>>>> +    uint8_t DSMASH_handle; =20
>>>=20
>>> DMSAS_handle;
>>>=20
>>>> +    uint8_t reserved2[3];
>>>> +    uint64_t memory_side_cache_size;
>>>> +    uint32_t cache_attributes;
>>>> +} QEMU_PACKED;
>>>> + =20
>>>=20
>>>=20
>>>> +
>>>> +struct cdat_sslbis_header {
>>>> +    struct cdat_sub_header header;
>>>> +    uint8_t data_type;
>>>> +    uint8_t reserved2[3];
>>>> +    uint64_t entry_base_unit;
>>>> +} QEMU_PACKED;
>>>> diff --git a/include/hw/cxl/cxl_compl.h =
b/include/hw/cxl/cxl_compl.h
>>>> new file mode 100644
>>>> index 0000000..ebbe488
>>>> --- /dev/null
>>>> +++ b/include/hw/cxl/cxl_compl.h
>>>> @@ -0,0 +1,289 @@
>>>> +/*
>>>> + * CXL Compliance Mode Protocol =20
>>>=20
>>> Needs license etc I think
>>>=20
>>>> + */ =20
>>>=20
>>> A bunch of the responses below are all of this form, perhaps we
>>> could just have one cxl_compliance_mode_generic_status_rsp ?
>>> if you really want to then define the others perhaps use
>>> #define to do it rather than lots of identical structures
>>> each specified fully. =20
>>=20
>>=20
>> Got it.   Should have simplified it after cutting and pasting so many =
times.
>>>=20
>>>=20
>>>> +struct cxl_compliance_mode_inject_mac_delay_rsp {
>>>> +    DOEHeader header;
>>>> +    uint8_t rsp_code;
>>>> +    uint8_t version;
>>>> +    uint8_t length;
>>>> +    uint8_t status;
>>>> +} QEMU_PACKED;
>>>> + =20
>>>=20
>>>=20
>>>=20
>>>> +struct cxl_compliance_mode_ignore_bit_error {
>>>> +    DOEHeader header;
>>>> +    uint8_t req_code;
>>>> +    uint8_t version;
>>>> +    uint16_t reserved;
>>>> +    uint8_t opcode;
>>>> +} QEMU_PACKED;
>>>> + =20
>>> This last one doesn't seem to line up with the CXL 2.0 spec. =20
>>=20
>> Good catch!
>>=20
>>>=20
>>>> +struct cxl_compliance_mode_ignore_bit_error_rsp {
>>>> +    DOEHeader header;
>>>> +    uint8_t rsp_code;
>>>> +    uint8_t version;
>>>> +    uint8_t reserved[6];
>>>> +} QEMU_PACKED; =20
>>>=20
>>>=20
>>>> diff --git a/include/hw/cxl/cxl_component.h =
b/include/hw/cxl/cxl_component.h
>>>> index 762feb5..23923df 100644
>>>> --- a/include/hw/cxl/cxl_component.h
>>>> +++ b/include/hw/cxl/cxl_component.h
>>>> @@ -132,6 +132,23 @@ HDM_DECODER_INIT(0);
>>>> _Static_assert((CXL_SNOOP_REGISTERS_OFFSET + =
CXL_SNOOP_REGISTERS_SIZE) < 0x1000,
>>>>               "No space for registers"); =20
>>>=20
>>> ...
>>>=20
>>>> typedef struct component_registers {
>>>>    /*
>>>>     * Main memory region to be registered with QEMU core.
>>>> @@ -160,6 +177,10 @@ typedef struct component_registers {
>>>>    MemoryRegionOps *special_ops;
>>>> } ComponentRegisters;
>>>>=20
>>>> +typedef struct cdat_struct {
>>>> +    void *base;
>>>> +    uint32_t length;
>>>> +} CDATStruct;
>>>> /*
>>>> * A CXL component represents all entities in a CXL hierarchy. This =
includes,
>>>> * host bridges, root ports, upstream/downstream switch ports, and =
devices
>>>> @@ -173,6 +194,104 @@ typedef struct cxl_component {
>>>>            struct PCIDevice *pdev;
>>>>        };
>>>>    };
>>>> +
>>>> +    /*
>>>> +     * SW write write mailbox and GO on last DW
>>>> +     * device sets READY of offset DW in DO types to copy
>>>> +     * to read mailbox register on subsequent cfg_read
>>>> +     * of read mailbox register and then on cfg_write to
>>>> +     * denote success read increments offset to next DW
>>>> +     */
>>>> +
>>>> +    union doe_request_u {
>>>> +        /* Compliance DOE Data Objects Type=3D0*/
>>>> +        struct cxl_compliance_mode_cap
>>>> +            mode_cap; =20
>>>=20
>>> I'd only add line breaks for the longer ones of these.
>>>=20
>>>> +        struct cxl_compliance_mode_status
>>>> +            mode_status;
>>>> +        struct cxl_compliance_mode_halt
>>>> +            mode_halt;
>>>> +        struct cxl_compliance_mode_multiple_write_streaming
>>>> +            multiple_write_streaming;
>>>> +        struct cxl_compliance_mode_producer_consumer
>>>> +            producer_consumer;
>>>> +        struct cxl_compliance_mode_inject_bogus_writes
>>>> +            inject_bogus_writes;
>>>> +        struct cxl_compliance_mode_inject_poison
>>>> +            inject_poison;
>>>> +        struct cxl_compliance_mode_inject_crc
>>>> +            inject_crc;
>>>> +        struct cxl_compliance_mode_inject_flow_control
>>>> +            inject_flow_control;
>>>> +        struct cxl_compliance_mode_toggle_cache_flush
>>>> +            toggle_cache_flush;
>>>> +        struct cxl_compliance_mode_inject_mac_delay
>>>> +            inject_mac_delay;
>>>> +        struct cxl_compliance_mode_insert_unexp_mac
>>>> +            insert_unexp_mac;
>>>> +        struct cxl_compliance_mode_inject_viral
>>>> +            inject_viral;
>>>> +        struct cxl_compliance_mode_inject_almp
>>>> +            inject_almp;
>>>> +        struct cxl_compliance_mode_ignore_almp
>>>> +            ignore_almp;
>>>> +        struct cxl_compliance_mode_ignore_bit_error
>>>> +            ignore_bit_error;
>>>> +        char data_byte[128];
>>>> +    } doe_request;
>>>> +
>>>> +    union doe_resp_u {
>>>> +        /* Compliance DOE Data Objects Type=3D0*/
>>>> +        struct cxl_compliance_mode_cap_rsp
>>>> +            cap_rsp;
>>>> +        struct cxl_compliance_mode_status_rsp
>>>> +            status_rsp;
>>>> +        struct cxl_compliance_mode_halt_rsp
>>>> +            halt_rsp;
>>>> +        struct cxl_compliance_mode_multiple_write_streaming_rsp
>>>> +            multiple_write_streaming_rsp;
>>>> +        struct cxl_compliance_mode_producer_consumer_rsp
>>>> +            producer_consumer_rsp;
>>>> +        struct cxl_compliance_mode_inject_bogus_writes_rsp
>>>> +            inject_bogus_writes_rsp;
>>>> +        struct cxl_compliance_mode_inject_poison_rsp
>>>> +            inject_poison_rsp;
>>>> +        struct cxl_compliance_mode_inject_crc_rsp
>>>> +            inject_crc_rsp;
>>>> +        struct cxl_compliance_mode_inject_flow_control_rsp
>>>> +            inject_flow_control_rsp;
>>>> +        struct cxl_compliance_mode_toggle_cache_flush_rsp
>>>> +            toggle_cache_flush_rsp;
>>>> +        struct cxl_compliance_mode_inject_mac_delay_rsp
>>>> +            inject_mac_delay_rsp;
>>>> +        struct cxl_compliance_mode_insert_unexp_mac_rsp
>>>> +            insert_unexp_mac_rsp;
>>>> +        struct cxl_compliance_mode_inject_viral
>>>> +            inject_viral_rsp;
>>>> +        struct cxl_compliance_mode_inject_almp_rsp
>>>> +            inject_almp_rsp;
>>>> +        struct cxl_compliance_mode_ignore_almp_rsp
>>>> +            ignore_almp_rsp;
>>>> +        struct cxl_compliance_mode_ignore_bit_error_rsp
>>>> +            ignore_bit_error_rsp;
>>>> +        char data_byte[520 * 4];
>>>> +        uint32_t data_dword[520];
>>>> +    } doe_resp;
>>>> +
>>>> +    /* Table entry types */ =20
>>> Hmm. Not sure all CXL components will have CDAT.  Root ports for
>>> example?
>>>=20
>>>> +    struct cdat_table_header cdat_header;
>>>> +    struct cdat_dsmas dsmas;
>>>> +    struct cdat_dslbis dslbis; =20
>>>=20
>>> As I said in v1, some of these will need to be multiples so this
>>> flat structure just doesn't work.
>>>=20
>>>> +    struct cdat_dsmscis dsmscis;
>>>> +    struct cdat_dsis dsis;
>>>> +    struct cdat_dsemts dsemts;
>>>> +    struct {
>>>> +        struct cdat_sslbis_header sslbis_h;
>>>> +        struct cdat_sslbe sslbe[3]; =20
>>>=20
>>> I'm curious.  Why 3?  This is between pairs of ports so 1USP 2DSP =
switch?
>>>=20
>>>> +    } sslbis; =20
>>>=20
>>>=20
>>>> +
>>>> +    CDATStruct *cdat_ent;
>>>> +    int cdat_ent_len;
>>>> } CXLComponentState;
>>>>=20
>>>> void cxl_component_register_block_init(Object *obj,
>>>> @@ -184,4 +303,11 @@ void =
cxl_component_register_init_common(uint32_t *reg_state,
>>>> void cxl_component_create_dvsec(CXLComponentState *cxl_cstate, =
uint16_t length,
>>>>                                uint16_t type, uint8_t rev, uint8_t =
*body);
>>>>=20
>>>> +void cxl_component_create_doe(CXLComponentState *cxl_cstate,
>>>> +                              uint16_t offset, unsigned vec); =20
>>>=20
>>> Doesn't seem to exist.
>>>=20
>>> Some of the following are local to one file so shouldn't be here =
iether.
>>>=20
>>>> +uint32_t cxl_doe_compliance_init(DOECap *doe_cap);
>>>> +bool cxl_doe_compliance_rsp(DOECap *doe_cap);
>>>> +void cxl_doe_cdat_init(CXLComponentState *cxl_cstate);
>>>> +bool cxl_doe_cdat_rsp(DOECap *doe_cap);
>>>> +uint32_t cdat_zero_checksum(uint32_t *mbox, uint32_t dw_cnt); =20
>>>=20
>>> Doesn't seem to exist.
>>>=20
>>>> #endif
>>>> diff --git a/include/hw/cxl/cxl_device.h =
b/include/hw/cxl/cxl_device.h
>>>> index c608ced..08bf646 100644
>>>> --- a/include/hw/cxl/cxl_device.h
>>>> +++ b/include/hw/cxl/cxl_device.h
>>>> @@ -223,6 +223,9 @@ typedef struct cxl_type3_dev {
>>>>    /* State */
>>>>    CXLComponentState cxl_cstate;
>>>>    CXLDeviceState cxl_dstate;
>>>> +
>>>> +    /* DOE */
>>>> +    PCIEDOE doe;
>>>> } CXLType3Dev;
>>>>=20
>>>> #ifndef TYPE_CXL_TYPE3_DEV
>>>> diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
>>>> index 9ec28c9..5cab197 100644
>>>> --- a/include/hw/cxl/cxl_pci.h
>>>> +++ b/include/hw/cxl/cxl_pci.h
>>>> @@ -12,6 +12,8 @@
>>>>=20
>>>> #include "hw/pci/pci.h"
>>>> #include "hw/pci/pcie.h"
>>>> +#include "hw/cxl/cxl_cdat.h"
>>>> +#include "hw/cxl/cxl_compl.h"
>>>>=20
>>>> #define CXL_VENDOR_ID 0x1e98
>>>>=20
>>>> @@ -54,6 +56,8 @@ struct dvsec_header {
>>>> _Static_assert(sizeof(struct dvsec_header) =3D=3D 10,
>>>>               "dvsec header size incorrect");
>>>>=20
>>>> +/* CXL 2.0 - 8.1.11 */
>>>> + =20
>>>=20
>>> Clean this out next time - doesn't belong in this patch.
>>>=20
>>>> /*
>>>> * CXL 2.0 devices must implement certain DVSEC IDs, and can =
[optionally]
>>>> * implement others. =20
>>>=20
>>=20
>=20


