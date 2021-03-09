Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98E333020
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:42:54 +0100 (CET)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjBt-0002Tj-7t
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJiah-0008Se-Pp
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:04:27 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:17592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJiad-00075v-Vp
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:04:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3DEC17456E3;
 Tue,  9 Mar 2021 21:04:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 215037456B4; Tue,  9 Mar 2021 21:04:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1F40E7456B8;
 Tue,  9 Mar 2021 21:04:19 +0100 (CET)
Date: Tue, 9 Mar 2021 21:04:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/3] hw/southbridge: Add missing Kconfig dependency
 VT82C686 on USB_UHCI
In-Reply-To: <20210309190802.830969-2-f4bug@amsat.org>
Message-ID: <e078d05f-8988-9845-553-d0d5726287ce@eik.bme.hu>
References: <20210309190802.830969-1-f4bug@amsat.org>
 <20210309190802.830969-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-147441024-1615320259=:45902"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-147441024-1615320259=:45902
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
> The VT82C686 south bridge provides a USB UHCI bus via a PCI function.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/isa/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index c7f07854f7e..2691eae2f0c 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -47,6 +47,7 @@ config VT82C686
>     select ACPI_SMBUS
>     select SERIAL_ISA
>     select FDC
> +    select USB_UHCI
>
> config SMC37C669
>     bool
>
--3866299591-147441024-1615320259=:45902--

