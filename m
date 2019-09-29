Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2208C13B8
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Sep 2019 09:03:33 +0200 (CEST)
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iETEy-0002FA-JN
	for lists+qemu-devel@lfdr.de; Sun, 29 Sep 2019 03:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iETD2-0001iG-Ji
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 03:01:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iETD1-0004My-Cb
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 03:01:32 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37339)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iETD1-0004L7-6H; Sun, 29 Sep 2019 03:01:31 -0400
Received: by mail-wm1-x341.google.com with SMTP id f22so9386456wmc.2;
 Sun, 29 Sep 2019 00:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=aTjM0Vqa+j9qU1fkiZJNLaRwCamX5h5TIzCgksf4YYY=;
 b=AQVXoi+TF1rnJ/eh5Ou+/C9aWRfJ9M6bGJyzRdKdmg5Ww3GMhjIXv0cd2OVafv3yxN
 nRx46A/giYfkfDUXT0j8CtXrXdUmJ+h/KZsJH+Pqb1vxcTA2qa6TIqGaC443byHjCWVk
 N2pX2FD00VkHQmr69Gy3KyjCULvE0YjvOpRlTVtIBGXHr5VA/G8VKdfxZSJhnLhe+WMa
 Z057V3ou+8sAzgftBoyrQc87QU7tQP1AxQG8dMne3ivutLJRtnyfG4FNHV7GuQsp5e8G
 5J8AfFbXZhhB93OHlXpJTfXFxuAdV03UNSZfIVLorkwER3RdoOJqKiyTGcGPOr7NhF3F
 kGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=aTjM0Vqa+j9qU1fkiZJNLaRwCamX5h5TIzCgksf4YYY=;
 b=dZMfXXqKqtNn+xBstgDTQvDkkb+LVbsPSY5dow9aw1JqJVuEJ7XjuOZ1Koxh4eREQE
 6g9X4kdmKOFotxXhjCOqrgjXHJQJO//m5IesqnjQSaYVB0M1vJJtxalulC6pH4z/lTMc
 jKVHEW2kuUuKdULIgsLM77REwzeGGPT6mTmyXi/JJCGfxQ6drsoOqoFTXpA0ZVSxPykp
 KU1xMd+XxDwBa0EKyme/SvecM5ErFqIPiMaeeS3Yz/Kb6j8bFc0v/IbU/6UxiPOH0Knm
 rCkNbAG8l1/YBbQeKqwB3RGRQOMBbjIqChWlMmmTtriw3LyyoD6oB1mP108gvCNr3gyj
 nnBQ==
X-Gm-Message-State: APjAAAVaa+GTGaIBxTA8TFA49Bavpl0uZQOpEQRBAGWVgCxIAG/gJw5i
 sFdXPrf1bL81SHYoiRtPx24=
X-Google-Smtp-Source: APXvYqxvPZ4jvps0KLujCX8ArEKBSChBHALU2QF7IyZr0mxBgkNNxeg0jYuIcc9c+uQahMY2smkG9g==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr12963915wme.152.1569740489763; 
 Sun, 29 Sep 2019 00:01:29 -0700 (PDT)
Received: from ?IPv6:2a01:c22:b04f:b200:7a70:bbc8:8101:45be?
 ([2a01:c22:b04f:b200:7a70:bbc8:8101:45be])
 by smtp.gmail.com with ESMTPSA id q192sm16026929wme.23.2019.09.29.00.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 00:01:29 -0700 (PDT)
Message-ID: <d02a29663183b8963bc34a0d1b031442d997ab62.camel@gmail.com>
Subject: Re: [RFC PATCH 03/14] hw/misc/bcm2835_property: Handle the 'domain
 state' property
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  qemu-devel@nongnu.org, Pekka Enberg
 <penberg@iki.fi>,  =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>
Date: Sun, 29 Sep 2019 09:01:19 +0200
In-Reply-To: <20190904171315.8354-4-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-4-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
> The kernel is happy with this change, so we don't need
> to do anything more sophisticated.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/misc/bcm2835_property.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 399f0d9dd5..d8eb28f267 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -127,6 +127,14 @@ static void
> bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>              resplen = 8;
>              break;
>  
> +        case 0x00030030: /* Get domain state */
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: 0x%08x get domain state
> NYI\n",
> +                          tag);
> +            /* FIXME returning uninitialized memory */
> +            resplen = 8;
> +            break;
> +
>          case 0x00038002: /* Set clock rate */
>          case 0x00038004: /* Set max clock rate */
>          case 0x00038007: /* Set min clock rate */

Searching this property in the kernel, I found a lot of properties not
implemented. 
https://github.com/raspberrypi/linux/blob/rpi-4.19.y/include/soc/bcm2835/raspberrypi-firmware.h#L41
Are the properties only added when they are necessaries for the
standard kernel use?



