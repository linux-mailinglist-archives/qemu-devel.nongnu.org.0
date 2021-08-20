Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8E3F2DCC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:14:34 +0200 (CEST)
Received: from localhost ([::1]:45218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5I1-0002qT-Bo
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH5Fu-0000En-Uy
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:12:22 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:29926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH5Ft-0005ti-LI
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:12:22 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-e4tCX56FNmmqlwnUcM4YFQ-1; Fri, 20 Aug 2021 10:12:16 -0400
X-MC-Unique: e4tCX56FNmmqlwnUcM4YFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EB7393921;
 Fri, 20 Aug 2021 14:12:15 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 415295C25D;
 Fri, 20 Aug 2021 14:12:14 +0000 (UTC)
Date: Fri, 20 Aug 2021 16:12:13 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 06/26] ppc/pnv: add a chip topology index for POWER10
Message-ID: <20210820161213.1634f63f@bahia.lan>
In-Reply-To: <20210809134547.689560-7-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-7-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 15:45:27 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Maybe add a short description of its purpose in the changelog
for the records ? What's the difference with "ibm,chip-id" ?

> ---
>  hw/ppc/pnv_xscom.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index be7018e8ac59..faa488e3117a 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -284,6 +284,8 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_o=
ffset,
>      _FDT(xscom_offset);
>      g_free(name);
>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,chip-id", chip->chip_=
id)));
> +    _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,primary-topology-inde=
x",
> +                           chip->chip_id)));
>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "#address-cells", 1)));
>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "#size-cells", 1)));
>      _FDT((fdt_setprop(fdt, xscom_offset, "reg", reg, sizeof(reg))));


