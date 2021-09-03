Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981933FFD69
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:45:58 +0200 (CEST)
Received: from localhost ([::1]:35628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5ll-0000a3-KL
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mM5kn-0008F5-UK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:44:57 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:28539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mM5kl-0005Uo-Gq
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:44:57 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-0275xLpvOM-CksMqM6oAIg-1; Fri, 03 Sep 2021 05:44:03 -0400
X-MC-Unique: 0275xLpvOM-CksMqM6oAIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8706107ACC7;
 Fri,  3 Sep 2021 09:44:01 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9571A19C79;
 Fri,  3 Sep 2021 09:44:00 +0000 (UTC)
Date: Fri, 3 Sep 2021 11:43:59 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 01/20] docs/system: ppc: Update the URL for OpenPOWER
 firmware images
Message-ID: <20210903114359.42d5200b@bahia.lan>
In-Reply-To: <20210902130928.528803-2-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
 <20210902130928.528803-2-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, PDS_OTHER_BAD_TLD=2,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sep 2021 15:09:09 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> This also fixes a small skiboot/skiroot typo and removes the links to
> the specific POWER8 and POWER9 images since the firmware images can be
> used to run all machines.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>=20

Reviewed-by: Greg Kurz <groug@kaod.org>

>  v2: fixed URL
>=20
>  docs/system/ppc/powernv.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
> index 4c4cdea527e2..86186b7d2cb7 100644
> --- a/docs/system/ppc/powernv.rst
> +++ b/docs/system/ppc/powernv.rst
> @@ -53,8 +53,7 @@ initramfs ``skiroot``. Source code can be found on GitH=
ub:
> =20
>    https://github.com/open-power.
> =20
> -Prebuilt images of ``skiboot`` and ``skiboot`` are made available on the=
 `OpenPOWER <https://openpower.xyz/job/openpower/job/openpower-op-build/>`_=
_ site. To boot a POWER9 machine, use the `witherspoon <https://openpower.x=
yz/job/openpower/job/openpower-op-build/label=3Dslave,target=3Dwitherspoon/=
lastSuccessfulBuild/>`__ images. For POWER8, use
> -the `palmetto <https://openpower.xyz/job/openpower/job/openpower-op-buil=
d/label=3Dslave,target=3Dpalmetto/lastSuccessfulBuild/>`__ images.
> +Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the=
 `OpenPOWER <https://github.com/open-power/op-build/releases/>`__ site.
> =20
>  QEMU includes a prebuilt image of ``skiboot`` which is updated when a
>  more recent version is required by the models.


