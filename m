Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD6B132883
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 15:11:52 +0100 (CET)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iopaI-0005Oz-Cw
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 09:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ionyD-0008WT-Of
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:28:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ionyC-0001fO-In
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:28:25 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29926
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ionyC-0001f0-FJ
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578400103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=rgjIeN9fW6PDPiN1JnJX+1UrJfYAxkoiS6V428rLXHY=;
 b=d1at4WqmkAEgGURBQwZWcTk/qs5vJPlDppyYgCIUN2/tJKgUlWxzMu1+TRU7ZWXcMxOsJP
 qd0BDIM8GQ3Sy6Fj2r1x6bPxxBepGEcMQLKmNtwFnJJXij9FkGB1LKFvogbosbXEL6Mflo
 3Lgue+COnPStgqfybzfB5kOEkad7sDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-4NJXbiEIMRuyfPhX1Yp-UQ-1; Tue, 07 Jan 2020 07:28:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4BA818A8C81;
 Tue,  7 Jan 2020 12:28:20 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-116.ams2.redhat.com [10.36.116.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C911D7FB50;
 Tue,  7 Jan 2020 12:28:09 +0000 (UTC)
Subject: Re: [PATCH 02/14] hw/intc/i8259: Fix Kconfig dependency on ISA bus
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20191231183216.6781-1-philmd@redhat.com>
 <20191231183216.6781-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <7e292052-f40b-3690-3ac4-8dc21e2611b1@redhat.com>
Date: Tue, 7 Jan 2020 13:28:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191231183216.6781-3-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 4NJXbiEIMRuyfPhX1Yp-UQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/12/2019 19.32, Philippe Mathieu-Daud=C3=A9 wrote:
> The 8259 Interrupt Controller sits on a ISA bus.
> Add the missing dependency to fix:
>=20
>     LINK    x86_64-softmmu/qemu-system-x86_64
>   /usr/bin/ld: ../hw/intc/i8259_common.o: in function `pic_common_realize=
':
>   hw/intc/i8259_common.c:84: undefined reference to `isa_register_ioport'
>   /usr/bin/ld: hw/intc/i8259_common.c:86: undefined reference to `isa_reg=
ister_ioport'
>   /usr/bin/ld: ../hw/intc/i8259_common.o: in function `i8259_init_chip':
>   hw/intc/i8259_common.c:97: undefined reference to `isa_create'
>   collect2: error: ld returned 1 exit status
>   make[1]: *** [Makefile:206: qemu-system-x86_64] Error 1
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com> (supporter:PC Chipset)
> ---
>  hw/intc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 10a680b53a..a189d6fedd 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -3,6 +3,7 @@ config HEATHROW_PIC
> =20
>  config I8259
>      bool
> +    select ISA_BUS
> =20
>  config PL190
>      bool
>=20

The code uses "parent =3D TYPE_ISA_DEVICE", so this seems to be right.

Reviewed-by: Thomas Huth <thuth@redhat.com>


