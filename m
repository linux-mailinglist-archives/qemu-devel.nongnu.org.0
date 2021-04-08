Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAFF358DFA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:00:53 +0200 (CEST)
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUapg-0005Ub-8I
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lUals-0002Z9-HN
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lUalr-0007xy-4a
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617911814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cH6dQwZ6YCP+7uE2hsHG8RuSZEYpib8DHunfLn6gtb8=;
 b=USy6AhiHOjR4BL07J/Hcs0UnPuf1Kgmeg5lkF+F3rnu+oOJawIW2X+zTvwOMai53ntIpeI
 KtRHoOD6moYUTqFfzJ5y827Z3DYbK7YGweY6aPG4an7vNoSnJu5giyHPWVtZxvNB4hk4fJ
 CRmxMySONrj9AZqRET/HlWurgOb0Jdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-VzE_JYLDNcCfsfI0N_yhsA-1; Thu, 08 Apr 2021 15:56:50 -0400
X-MC-Unique: VzE_JYLDNcCfsfI0N_yhsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D3611A7369;
 Thu,  8 Apr 2021 19:56:49 +0000 (UTC)
Received: from localhost (unknown [10.40.208.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58F185D9DC;
 Thu,  8 Apr 2021 19:56:46 +0000 (UTC)
Date: Thu, 8 Apr 2021 21:56:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.0?] hw/arm/imx25_pdk: Fix error message for
 invalid RAM size
Message-ID: <20210408215645.09e0d7c0@redhat.com>
In-Reply-To: <20210407225608.1882855-1-f4bug@amsat.org>
References: <20210407225608.1882855-1-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  8 Apr 2021 00:56:08 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> The i.MX25 PDK board has 2 banks for SDRAM, each can
> address up to 256 MiB. So the total RAM usable for this
> board is 512M. When we ask for more we get a misleading
> error message:
>=20
>   $ qemu-system-arm -M imx25-pdk -m 513M
>   qemu-system-arm: Invalid RAM size, should be 128 MiB
>=20
> Update the error message to better match the reality:
>=20
>   $ qemu-system-arm -M imx25-pdk -m 513M
>   qemu-system-arm: RAM size more than 512 MiB is not supported
>=20
> Fixes: bf350daae02 ("arm/imx25_pdk: drop RAM size fixup")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/imx25_pdk.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 1c201d0d8ed..51fde71b1bd 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -67,7 +67,6 @@ static struct arm_boot_info imx25_pdk_binfo;
> =20
>  static void imx25_pdk_init(MachineState *machine)
>  {
> -    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>      IMX25PDK *s =3D g_new0(IMX25PDK, 1);
>      unsigned int ram_size;
>      unsigned int alias_offset;
> @@ -79,8 +78,8 @@ static void imx25_pdk_init(MachineState *machine)
> =20
>      /* We need to initialize our memory */
>      if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SI=
ZE)) {
> -        char *sz =3D size_to_str(mc->default_ram_size);
> -        error_report("Invalid RAM size, should be %s", sz);
> +        char *sz =3D size_to_str(FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM=
1_SIZE);
> +        error_report("RAM size more than %s is not supported", sz);
>          g_free(sz);
>          exit(EXIT_FAILURE);
>      }


