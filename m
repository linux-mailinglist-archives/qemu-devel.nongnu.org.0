Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F32A391C45
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:44:11 +0200 (CEST)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvha-0005Jk-Ge
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1llvgA-0003ny-MF
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:42:42 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:33263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1llvg9-0007Mx-Bx
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:42:42 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-kgtoC1LBOUGmudl8XkkCjA-1; Wed, 26 May 2021 11:42:27 -0400
X-MC-Unique: kgtoC1LBOUGmudl8XkkCjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C8771020C2E;
 Wed, 26 May 2021 15:42:26 +0000 (UTC)
Received: from bahia.lan (ovpn-112-179.ams2.redhat.com [10.36.112.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C46436DE;
 Wed, 26 May 2021 15:42:24 +0000 (UTC)
Date: Wed, 26 May 2021 17:42:22 +0200
From: Greg Kurz <groug@kaod.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 1/3] spapr: Remove stale comment about power-saving
 LPCR bits
Message-ID: <20210526174222.44c80a03@bahia.lan>
In-Reply-To: <20210526091626.3388262-2-npiggin@gmail.com>
References: <20210526091626.3388262-1-npiggin@gmail.com>
 <20210526091626.3388262-2-npiggin@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 19:16:24 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> Commit 47a9b551547 ("spapr: Clean up handling of LPCR power-saving exit
> bits") moved this logic but did not remove the comment from the
> previous location.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_rtas.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 03355b4c0a..63d96955c0 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -164,7 +164,6 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, Spapr=
MachineState *spapr,
>      env->msr =3D (1ULL << MSR_SF) | (1ULL << MSR_ME);
>      hreg_compute_hflags(env);
> =20
> -    /* Enable Power-saving mode Exit Cause exceptions for the new CPU */
>      lpcr =3D env->spr[SPR_LPCR];
>      if (!pcc->interrupts_big_endian(callcpu)) {
>          lpcr |=3D LPCR_ILE;


