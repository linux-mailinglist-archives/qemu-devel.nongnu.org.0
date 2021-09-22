Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86AC414251
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:08:33 +0200 (CEST)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSwMq-00017Z-Ow
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSwLA-0008CG-28
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:06:48 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:33691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSwL8-000267-Hk
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:06:47 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-Dmhb4HIQMAaESNznbkZR_A-1; Wed, 22 Sep 2021 03:06:31 -0400
X-MC-Unique: Dmhb4HIQMAaESNznbkZR_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FD3D9F92D;
 Wed, 22 Sep 2021 07:06:30 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 722F979445;
 Wed, 22 Sep 2021 07:06:29 +0000 (UTC)
Date: Wed, 22 Sep 2021 09:06:27 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2] spapr/xive: Fix kvm_xive_source_reset trace event
Message-ID: <20210922090627.12378b3b@bahia.huguette>
In-Reply-To: <20210922070205.1235943-1-clg@kaod.org>
References: <20210922070205.1235943-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Wed, 22 Sep 2021 09:02:05 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> The trace event was placed in the wrong routine. Move it under
> kvmppc_xive_source_reset_one().
>=20
> Fixes: 4e960974d4ee ("xive: Add trace events")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/intc/spapr_xive_kvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index beb904d5bdee..bf43ffb54018 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -236,6 +236,8 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, in=
t srcno, Error **errp)
>      SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
>      uint64_t state =3D 0;
> =20
> +    trace_kvm_xive_source_reset(srcno);
> +
>      assert(xive->fd !=3D -1);
> =20
>      if (xive_source_irq_is_lsi(xsrc, srcno)) {
> @@ -328,8 +330,6 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int src=
no, uint32_t offset,
>          return xive_esb_rw(xsrc, srcno, offset, data, 1);
>      }
> =20
> -    trace_kvm_xive_source_reset(srcno);
> -
>      /*
>       * Special Load EOI handling for LSI sources. Q bit is never set
>       * and the interrupt should be re-triggered if the level is still


