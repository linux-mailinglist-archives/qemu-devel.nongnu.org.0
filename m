Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E93FB1F9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:36:07 +0200 (CEST)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbpu-0004un-8Y
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mKbou-00042N-Mc
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:35:04 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:36059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mKbos-0005gR-M5
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:35:04 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-oM2mfi8yPr2wsKBmw2HFAA-1; Mon, 30 Aug 2021 03:34:50 -0400
X-MC-Unique: oM2mfi8yPr2wsKBmw2HFAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2899CC73A0;
 Mon, 30 Aug 2021 07:34:49 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D80B65C1D5;
 Mon, 30 Aug 2021 07:34:47 +0000 (UTC)
Date: Mon, 30 Aug 2021 09:34:46 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 1/5] hw, spapr: add 6.2 compat pseries machine
Message-ID: <20210830093446.0b80edfb@bahia.lan>
In-Reply-To: <20210827092455.125411-2-danielhb413@gmail.com>
References: <20210827092455.125411-1-danielhb413@gmail.com>
 <20210827092455.125411-2-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Aug 2021 06:24:51 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

We usually introduce the compat machine types for all archs in a
single patch. One was already posted for 6.2 :

https://patchwork.ozlabs.org/project/qemu-devel/patch/20210823122804.7692-7=
-wangyanan55@huawei.com/


>  hw/core/machine.c   |  3 +++
>  hw/ppc/spapr.c      | 15 +++++++++++++--
>  include/hw/boards.h |  3 +++
>  3 files changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 54e040587d..067f42b528 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
> =20
> +GlobalProperty hw_compat_6_1[] =3D {};
> +const size_t hw_compat_6_1_len =3D G_N_ELEMENTS(hw_compat_6_1);
> +
>  GlobalProperty hw_compat_6_0[] =3D {
>      { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>      { "i8042", "extended-state", "false"},
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 81699d4f8b..d39fd4e644 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4685,15 +4685,26 @@ static void spapr_machine_latest_class_options(Ma=
chineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
> =20
> +/*
> + * pseries-6.2
> + */
> +static void spapr_machine_6_2_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class *=
/
> +}
> +
> +DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
> +
>  /*
>   * pseries-6.1
>   */
>  static void spapr_machine_6_1_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class *=
/
> +    spapr_machine_6_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len)=
;
>  }
> =20
> -DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
> +DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
> =20
>  /*
>   * pseries-6.0
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index accd6eff35..463a5514f9 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -353,6 +353,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
> =20
> +extern GlobalProperty hw_compat_6_1[];
> +extern const size_t hw_compat_6_1_len;
> +
>  extern GlobalProperty hw_compat_6_0[];
>  extern const size_t hw_compat_6_0_len;
> =20


