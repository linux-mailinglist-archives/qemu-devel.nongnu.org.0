Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5842E8B21
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 07:21:16 +0100 (CET)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvwlO-0004Y1-Pn
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 01:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kvwkG-0003wz-O9
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 01:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kvwkD-0004Ke-PL
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 01:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609654799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZV4ESUTEm4/NFs9xk2SVzg76VPanAnOXfaOCXfwdcI=;
 b=iHQZXPueZevcs0HcRixx+J6X8QLWvZiA8/J/Xx5ZC5Z4mf3yUmy9CqTvBTAz3cM9KKzl3d
 KSViT4jFtI5l3FlROOgxlVLWI75jc1dfEMQSnJ079NwnBUAeE/Ec8upMZ5gCOtVOP3pVBm
 l60k58wkcOiy9WRF4yyJNBb77zaPUIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-7niGeP92OOW8Pgev4lacQA-1; Sun, 03 Jan 2021 01:19:55 -0500
X-MC-Unique: 7niGeP92OOW8Pgev4lacQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF035107ACE6;
 Sun,  3 Jan 2021 06:19:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF5936F447;
 Sun,  3 Jan 2021 06:19:50 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] ppc4xx: Move common dependency on serial to common
 option
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1609636173.git.balaton@eik.bme.hu>
 <94f1eb7cfb7f315bd883d825f3ce7e0cfc2f2b69.1609636173.git.balaton@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2f801d9c-abe9-95c7-9b6a-ec1d66f83286@redhat.com>
Date: Sun, 3 Jan 2021 07:19:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <94f1eb7cfb7f315bd883d825f3ce7e0cfc2f2b69.1609636173.git.balaton@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.118, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/01/2021 02.09, BALATON Zoltan via wrote:
> All machines that select SERIAL also select PPC4XX so we can just add
> this common dependency there once.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/Kconfig | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index dd86e664d2..8548f42b0d 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -37,7 +37,6 @@ config PPC405
>       select M48T59
>       select PFLASH_CFI02
>       select PPC4XX
> -    select SERIAL
>   
>   config PPC440
>       bool
> @@ -46,13 +45,13 @@ config PPC440
>       imply E1000_PCI
>       select PCI_EXPRESS
>       select PPC4XX
> -    select SERIAL
>       select FDT_PPC
>   
>   config PPC4XX
>       bool
>       select BITBANG_I2C
>       select PCI
> +    select SERIAL

Not sure whether this is really the right way to go... serial_hd() and 
serial_mm_init() are only used in ppc405_uc.c
and ppc440_bamboo.c, so IMHO it does make sense to keep the SERIAL setting 
with PPC405 and PPC440.


>   config SAM460EX
>       bool
> @@ -61,7 +60,6 @@ config SAM460EX
>       select IDE_SII3112
>       select M41T80
>       select PPC440
> -    select SERIAL

But this hunk here should be fine, I think, since PPC440 already includes 
the SERIAL switch.

  Thomas


>       select SM501
>       select SMBUS_EEPROM
>       select USB_EHCI_SYSBUS
> @@ -123,7 +121,6 @@ config VIRTEX
>       bool
>       select PPC4XX
>       select PFLASH_CFI01
> -    select SERIAL
>       select XILINX
>       select XILINX_ETHLITE
>       select FDT_PPC
> 


