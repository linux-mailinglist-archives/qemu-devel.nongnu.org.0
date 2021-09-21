Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61D412F28
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:16:37 +0200 (CEST)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSa16-00073Q-6m
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSZye-0004b6-J9
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 03:14:04 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:20704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSZyd-0002ak-3z
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 03:14:04 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-eA9brJRWPJ2lD4f0tGBIDA-1; Tue, 21 Sep 2021 03:13:58 -0400
X-MC-Unique: eA9brJRWPJ2lD4f0tGBIDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A57FF9126B;
 Tue, 21 Sep 2021 07:13:56 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D4B710013D7;
 Tue, 21 Sep 2021 07:13:55 +0000 (UTC)
Date: Tue, 21 Sep 2021 09:13:54 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] spapr/xive: Fix kvm_xive_source_reset trace event
Message-ID: <20210921091354.02d4be4d@bahia.huguette>
In-Reply-To: <20210921065652.1121406-1-clg@kaod.org>
References: <20210921065652.1121406-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Tue, 21 Sep 2021 08:56:52 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Maybe add ?

Fixes: 4e960974d4ee ("xive: Add trace events")

anyway

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/intc/spapr_xive_kvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 53731d158625..7ac2502cc013 100644
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
> @@ -323,8 +325,6 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int src=
no, uint32_t offset,
>          return xive_esb_rw(xsrc, srcno, offset, data, 1);
>      }
> =20
> -    trace_kvm_xive_source_reset(srcno);
> -
>      /*
>       * Special Load EOI handling for LSI sources. Q bit is never set
>       * and the interrupt should be re-triggered if the level is still


