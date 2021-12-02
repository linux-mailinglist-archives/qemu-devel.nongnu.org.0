Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C334466A8D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:38:57 +0100 (CET)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msruy-0007SQ-GA
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:38:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msra6-0001nq-AE
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:17:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msra3-0004Xi-6D
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638472637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lQtLiv1OMYS4pK5xE4DpK8KHWNCC3PM5BTx7HnKCFA=;
 b=ZoFHqKtj9b136IHGejimbC/oWWRlEAuq59wuxuIjqaUl6ahTvDyVYf4U6p4ixr3Iqpdg7A
 vp0GsTGuv/U5obAdRfDweZjDdJJ9hxFqTl1BzjjndcrnoOnd5CXAhxnOPxuPyKSJOcR+CQ
 RrFI39gCBslcC3leAv7k/X5Xapn0stc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-NKZJDT_1MaW65-hkAOtSjw-1; Thu, 02 Dec 2021 14:17:16 -0500
X-MC-Unique: NKZJDT_1MaW65-hkAOtSjw-1
Received: by mail-wm1-f69.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so2184693wma.3
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 11:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9lQtLiv1OMYS4pK5xE4DpK8KHWNCC3PM5BTx7HnKCFA=;
 b=va3qpLDTheDxEdIiH+YCDvpQ4p+si1Uh+I5WChRxBtA40kJ8xG80HkCgkAQ1GlTOUe
 3TA7gHaO2b1t+4jyvCZLsyARj0EOD7oByRCgleNpHDXF/lzl3GM+PnJW31yaTfo/Deii
 1sjnjneC1oCgUkHuZWneCIhkoSPVE7CGo88CZ71LPZt5R0RhtNwfeO4FJn4w+oGBIPcx
 NV3kOjJsvMJ0dft2bGR+y/pKwnmqNQEjXOKGhddYdLc3wohnmmSO0dYVwPRUpP63Tg5s
 /i4dW2ZWRtYCTBB00336BriE247kJ34E2ZvuZVxjrgQTpRksRiYpoQmoWyqqzax88fa5
 Mw/g==
X-Gm-Message-State: AOAM530LdkRbKjaEI9wHTSy24dlwPjor0KMniA5Sr54kRdunnStD720v
 aBKag1dLvCWVaCKlZv7ftI4xRUpP8XxSwWJnAFW+uUyzMk4+ihJjAWWyakiwS18Ny+AqmgWv3m/
 ncWjBsOIJYiaMORQ=
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr16995980wrr.58.1638472635473; 
 Thu, 02 Dec 2021 11:17:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRJOUdaI00ikG0Yk+iW3oO+vmTDlORNBI29pBGMiFfpI5lEvf3Z13w7GdLx6p2zch482YPWw==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr16995940wrr.58.1638472635118; 
 Thu, 02 Dec 2021 11:17:15 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id g18sm607445wrv.42.2021.12.02.11.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 11:17:14 -0800 (PST)
Message-ID: <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
Date: Thu, 2 Dec 2021 20:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202191446.1292125-1-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211202191446.1292125-1-clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.3, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/2021 20.14, Cédric Le Goater wrote:
> The default addresses to load the kernel, fdt, initrd of AMCC boards
> in U-Boot v2015.10 are :
> 
> 	"kernel_addr_r=1000000\0"
> 	"fdt_addr_r=1800000\0"
> 	"ramdisk_addr_r=1900000\0"
> 
> The taihu is one of these boards, the ref405ep is not but we don't
> have much information on it and both boards have a very similar
> address space layout. Change the kernel load address to match U-Boot
> expectations and fix loading.

You could additionally mention that U-Boot corrupts the kernel if it gets 
loaded to address 0.

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ppc/ppc405_boards.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 972a7a4a3e5d..b4249f4626e6 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -45,7 +45,7 @@
>   #define BIOS_FILENAME "ppc405_rom.bin"
>   #define BIOS_SIZE (2 * MiB)
>   
> -#define KERNEL_LOAD_ADDR 0x00000000
> +#define KERNEL_LOAD_ADDR 0x01000000
>   #define INITRD_LOAD_ADDR 0x01800000
>   
>   #define USE_FLASH_BIOS

Reviewed-by: Thomas Huth <thuth@redhat.com>


