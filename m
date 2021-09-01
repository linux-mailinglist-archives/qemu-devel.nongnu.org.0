Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BEE3FD772
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:14:32 +0200 (CEST)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNGJ-0008Ak-Vs
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mLNDO-00055e-E3
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:11:31 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:35903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mLNDN-0000Ty-2p
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:11:30 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-kIf0Vr1cNmaZcex1sVj-pg-1; Wed, 01 Sep 2021 06:11:25 -0400
X-MC-Unique: kIf0Vr1cNmaZcex1sVj-pg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27792801A92;
 Wed,  1 Sep 2021 10:11:24 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.193.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C756100164C;
 Wed,  1 Sep 2021 10:11:22 +0000 (UTC)
Date: Wed, 1 Sep 2021 12:11:21 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/8] ppc/spapr: Add a POWER10 DD2 CPU
Message-ID: <20210901121121.769a424c@bahia.lan>
In-Reply-To: <20210901094153.227671-3-clg@kaod.org>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-3-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Wed, 1 Sep 2021 11:41:47 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_cpu_core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 4f316a6f9d31..58e7341cb784 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -382,6 +382,7 @@ static const TypeInfo spapr_cpu_core_type_infos[] =3D=
 {
>      DEFINE_SPAPR_CPU_CORE_TYPE("power9_v1.0"),
>      DEFINE_SPAPR_CPU_CORE_TYPE("power9_v2.0"),
>      DEFINE_SPAPR_CPU_CORE_TYPE("power10_v1.0"),
> +    DEFINE_SPAPR_CPU_CORE_TYPE("power10_v2.0"),
>  #ifdef CONFIG_KVM
>      DEFINE_SPAPR_CPU_CORE_TYPE("host"),
>  #endif


