Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB4E5FABCD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 07:05:10 +0200 (CEST)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi7S1-00052V-6T
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 01:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oi7Pq-0002Vr-IF
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 01:02:54 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:35504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oi7Po-0003Qe-IF
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 01:02:54 -0400
Received: by mail-io1-xd2b.google.com with SMTP id z197so5067891iof.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 22:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lC+g4RzYID5l8umOXYdhVzXdO4sGT5W0LjwIEpO/k0w=;
 b=6x2+mSZcV6B6Lveg+rGcO1BWlKlXaar+n4PlTKA992wxjwr6/CxNrhT+e9XN9wwxx1
 Gm3sNrQb/1z/cnJc/JCIF4VUmNBVCol1Ca6gt6xmOS25kGtE0umwrSltIlhXDjskwkao
 VJIPkLlMj3FcLvG87GMIUH2STA8bHLckfVGfuo/S2HVYdtEIJ6Wb2Zej/gOVBtTc8Fmo
 BFWTxa0U9W3Q6HKTHR5ZL7SkRM7UH3fdhp5PdPRcaJ580JHln+60aZvD18gQ6uqN5Q9r
 iamK2ww9axY3z2GwI3NGVRVcA2N8VsQrW+UD/qQD4G5clCUuV3zXRGjxVe9pBa4lmT1t
 aZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lC+g4RzYID5l8umOXYdhVzXdO4sGT5W0LjwIEpO/k0w=;
 b=dLcIJ8svM2h02oIF7waKQbaZXsXeU7/+j5wXgbP1mTzIB8V0hzXuI+1gkVFLtX2rBw
 DSzum25Xq+gn0cybG0YmUSRCWx2jyw3uvT00JLQWLKVajMF9FwhOIF2TKqyU4xGaTyaW
 eFXxS9pwjHb1ChtUmT8k8NLePChCvVYYMu2n2wkB+E+4ef55k+NQKbyaB08i+zZFBdQk
 pPo3myfNoioBoehOqyQhcmMd138jWluTGzao7tuZqMhcgQp2fuyLrMc1ekzapoxQ9Ao/
 2pQW1SlLiEYwuUN12GQlFEds+yV2UyaXZV/sd7+h0uuJnFSrzSz3Wc6iygBhhzvMgw+U
 Lw+g==
X-Gm-Message-State: ACrzQf2GtF13X1m8hslpogEXNNNJ5BSsX/MGs/zMo9jPkwSca2OIroTe
 z+EkGoZzstSqAg0Gr/ufGcb7+x5sO+3s445NWyo48A==
X-Google-Smtp-Source: AMsMyM6E1PL1MImLCPAkqK253kgwYw13Q79cNAG3MrnZltchIQ7wGPN72WlV9j0h7b3duyHLlxvIU9eLZL1cOtP+Obg=
X-Received: by 2002:a05:6638:12d6:b0:35a:801c:2136 with SMTP id
 v22-20020a05663812d600b0035a801c2136mr11980382jas.309.1665464571138; Mon, 10
 Oct 2022 22:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221010132300.96935-1-miguel.luis@oracle.com>
 <20221010132300.96935-3-miguel.luis@oracle.com>
In-Reply-To: <20221010132300.96935-3-miguel.luis@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 11 Oct 2022 10:32:40 +0530
Message-ID: <CAARzgwxOxPqAGe76LS-ETpReGrCHvLQjHKvJUJ6AZCmCGMy6tg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] acpi: fadt: support revision 6.0 of the ACPI
 specification
To: miguel.luis@oracle.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, shannon.zhaosl@gmail.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 10, 2022 at 6:53 PM Miguel Luis <miguel.luis@oracle.com> wrote:
>
> Update the Fixed ACPI Description Table (FADT) to revision 6.0 of the ACPI
> specification adding the field "Hypervisor Vendor Identity" that was missing.
>
> This field's description states the following: "64-bit identifier of hypervisor
> vendor. All bytes in this field are considered part of the vendor identity.
> These identifiers are defined independently by the vendors themselves,
> usually following the name of the hypervisor product. Version information
> should NOT be included in this field - this shall simply denote the vendor's
> name or identifier. Version information can be communicated through a
> supplemental vendor-specific hypervisor API. Firmware implementers would
> place zero bytes into this field, denoting that no hypervisor is present in
> the actual firmware."
>
> Hereupon, what should a valid identifier of an Hypervisor Vendor ID be and
> where should QEMU provide that information?
>
> On the v1 [1] of this RFC there's the suggestion of having this information
> in sync by the current acceleration name. This also seems to imply that QEMU,
> which generates the FADT table, and the FADT consumer need to be in sync with
> the values of this field.
>
> This version follows Ani Sinha's suggestion [2] of using "QEMU" for the
> hypervisor vendor ID.
>
> [1]: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg00911.html
> [2]: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg00989.html
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/acpi/aml-build.c      | 13 ++++++++++---
>  hw/arm/virt-acpi-build.c | 10 +++++-----
>  2 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index e6bfac95c7..42feb4d4d7 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2070,7 +2070,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>      acpi_table_end(linker, &table);
>  }
>
> -/* build rev1/rev3/rev5.1 FADT */
> +/* build rev1/rev3/rev5.1/rev6.0 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
>  {
> @@ -2193,8 +2193,15 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      /* SLEEP_STATUS_REG */
>      build_append_gas_from_struct(tbl, &f->sleep_sts);
>
> -    /* TODO: extra fields need to be added to support revisions above rev5 */
> -    assert(f->rev == 5);
> +    if (f->rev == 5) {
> +        goto done;
> +    }
> +
> +    /* Hypervisor Vendor Identity */
> +    build_append_padded_str(tbl, "QEMU", 8, '\0');
> +
> +    /* TODO: extra fields need to be added to support revisions above rev6 */
> +    assert(f->rev == 6);
>
>  done:
>      acpi_table_end(linker, &table);
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9b3aee01bf..72bb6f61a5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -809,13 +809,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  }
>
>  /* FADT */
> -static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
> +static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
>                              VirtMachineState *vms, unsigned dsdt_tbl_offset)
>  {
> -    /* ACPI v5.1 */
> +    /* ACPI v6.0 */
>      AcpiFadtData fadt = {
> -        .rev = 5,
> -        .minor_ver = 1,
> +        .rev = 6,
> +        .minor_ver = 0,
>          .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
>          .xdsdt_tbl_offset = &dsdt_tbl_offset,
>      };
> @@ -945,7 +945,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>
>      /* FADT MADT PPTT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
> -    build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
> +    build_fadt_rev6(tables_blob, tables->linker, vms, dsdt);
>
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
> --
> 2.37.3
>

