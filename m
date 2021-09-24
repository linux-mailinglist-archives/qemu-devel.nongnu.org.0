Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D7A417139
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:48:57 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjhI-0006uy-Pw
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTjdC-00040O-Jr
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:44:42 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:24680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTjcy-0001UP-7p
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:44:42 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-qE3imIqsNv-cD6ClOZYSIw-1; Fri, 24 Sep 2021 07:44:15 -0400
X-MC-Unique: qE3imIqsNv-cD6ClOZYSIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C67BAF86;
 Fri, 24 Sep 2021 11:44:13 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 798E96A900;
 Fri, 24 Sep 2021 11:44:10 +0000 (UTC)
Date: Fri, 24 Sep 2021 13:44:09 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 4/5] MAINTAINERS: Add information for OpenPIC
Message-ID: <20210924134409.1011b0c4@bahia.huguette>
In-Reply-To: <20210924095536.441849-5-david@gibson.dropbear.id.au>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
 <20210924095536.441849-5-david@gibson.dropbear.id.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, hpussin@reactos.org,
 aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sep 2021 19:55:35 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> The OpenPIC interrupt controller was once the de facto standard on ppc
> machines.  In qemu it's now only used on some Macintosh and the
> Freescale e500 machine.  It has no listed maintainer, and as far as I
> know, no-one who's really familiar with it any more.
>=20
> Since I'm moving away from the area, I no longer have capacity to do even
> minimal maintenance of it under the auspices of the ppc targets in genera=
l.
>=20
> Therefore, this patch lists the main part of openpic, and marks it as
> "Odd Fixes" to be looked after by Mark Cave-Ayland who handles the
> Macintosh targets.  The openpic_kvm variant is only used on e500, so
> add it to the files for that machine type (itself already Orphaned).
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c82a634a70..937c191c8d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1256,6 +1256,8 @@ F: hw/pci-host/ppce500.c
>  F: include/hw/ppc/ppc_e500.h
>  F: include/hw/pci-host/ppce500.h
>  F: pc-bios/u-boot.e500
> +F: hw/intc/openpic_kvm.h
> +F: include/hw/ppc/openpic_kvm.h
> =20
>  mpc8544ds
>  L: qemu-ppc@nongnu.org
> @@ -2255,6 +2257,12 @@ F: net/can/*
>  F: hw/net/can/*
>  F: include/net/can_*.h
> =20
> +OpenPIC interrupt controller
> +M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> +S: Odd Fixes
> +F: hw/intc/openpic.c
> +F: include/hw/ppc/openpic.h
> +
>  Subsystems
>  ----------
>  Overall Audio backends


