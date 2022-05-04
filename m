Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11551AF9E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 22:43:48 +0200 (CEST)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmLqd-0003MF-2L
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 16:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmLp4-0001Hs-J4; Wed, 04 May 2022 16:42:10 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:32835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmLp2-0008W2-Np; Wed, 04 May 2022 16:42:10 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e656032735so2432359fac.0; 
 Wed, 04 May 2022 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x3j4kw1BcXSXdntmfqU8JVDTk0YIV26nI9dZDJmNg50=;
 b=YOj0ZtfhCMSC8O1bQCKEP1GfUDT1lVLd/6/I18G99mCnz7IJw7knzyvEhWl1LR6skd
 QVLhUvEY90x5ruXEdJtEtlRUkUtS0y1OKcojROAJyM4Rdvo2e+wGj+eesGlw1Rpzd3fC
 4itGIwocVE+VQ03StTBjXwKgA52sUohhCniuGKPEHJlwsdY5DUkP3tQq4b4f3XYOubsJ
 tLz/HrLvlSU9TC6zQ+0+QNSNUvUfXHt9f4Icwn2MM3o70K/9ioIhWQew26UtmdO54or6
 l5g7Nwi7UzjOuoPkD4r4B5irYoMxkX81Dh3T+slUlTFw8+2O1qrkaBSK4rN9Jy3iDIDD
 3I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x3j4kw1BcXSXdntmfqU8JVDTk0YIV26nI9dZDJmNg50=;
 b=YOaaFXqs/3DNIOt42MZPK70a+bj86ADLxU1+pCJZkvgBgUIHW60ozv4Je7KPvbA+g+
 eJ2OQBN0GZRqJ031/GnCL+Z+Y1QKloak8wkwAZFFRyfA+ukQ7Je4Qxrt9dXusGYofl69
 oaLdeRwJzJJ7hwYHBGzmgUwtmjTzOGxpFSTzD+jrG5H3OK/EGpyzewaWfh1CMl4gyMZp
 pa29f9yw2uwz9MSp/d29OsdGID1nV19wBzlSE1hbZrJ3coa3QwQrDb9lOsVRIi4PnT4d
 WU5Cf4U6IYjUB1c2Cy2UOfwOG82KE510GEgsAeUGFHEyQnwiZ9nFhGD3Ascqlx16MuK+
 hdMg==
X-Gm-Message-State: AOAM531Mju4CX6DuR0Lz3e2VCTdQRmO9p9UXKTgjFEnMuJrjqkBhXatS
 lSZtMGuL/rwUzSLozvt+RxU=
X-Google-Smtp-Source: ABdhPJytbcGTYEuQxZtx5159N3WLIlDrX8SLVFA6eKw8aeoE6EF0ja4HgJR7XtGN1rWgjSwl76uy9A==
X-Received: by 2002:a05:6870:5627:b0:ed:aafa:ede7 with SMTP id
 m39-20020a056870562700b000edaafaede7mr714406oao.98.1651696927043; 
 Wed, 04 May 2022 13:42:07 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 c19-20020a9d7853000000b006060322124csm5534451otm.28.2022.05.04.13.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 13:42:06 -0700 (PDT)
Message-ID: <3424d1a8-df39-bcb7-972f-c314bdf1525f@gmail.com>
Date: Wed, 4 May 2022 17:42:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] vhost-user: Use correct macro name TARGET_PPC64
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 mopsfelder@gmail.com, Fabiano Rosas <farosas@linux.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Peter Turschmid <peter.turschm@nutanix.com>
References: <20220503180108.34506-1-muriloo@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220503180108.34506-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael,

I'll send a PR in the next few days. This change seems trivial enough to me
to push via the PPC64 tree.

Let me know if you're ok with that or if you want to pick it via the vhost tree.



Thanks,


Daniel


On 5/3/22 15:01, Murilo Opsfelder Araujo wrote:
> The correct name of the macro is TARGET_PPC64.
> 
> Fixes: 27598393a232 ("Lift max memory slots limit imposed by vhost-user")
> Reported-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: Peter Turschmid <peter.turschm@nutanix.com>
> ---
>   hw/virtio/vhost-user.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 9c4f84f35f..e356c72c81 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -51,7 +51,7 @@
>   #include "hw/acpi/acpi.h"
>   #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
>   
> -#elif defined(TARGET_PPC) || defined(TARGET_PPC_64)
> +#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
>   #include "hw/ppc/spapr.h"
>   #define VHOST_USER_MAX_RAM_SLOTS SPAPR_MAX_RAM_SLOTS
>   

