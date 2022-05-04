Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15E51B007
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:02:45 +0200 (CEST)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmM8y-0008MX-6Q
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nmM66-0005q0-Ee
 for qemu-devel@nongnu.org; Wed, 04 May 2022 16:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nmM62-0005gs-Qf
 for qemu-devel@nongnu.org; Wed, 04 May 2022 16:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651697978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dWxnlC7wB8YqtotXAbxmzQTqy8EDzZFlucUQhgZaxXo=;
 b=DRh1OLX4hVENtBLh63qK81EaCFEpwXfBJ7kwq0sPFTj2CfA85Lr3PzDhjt0IvqgjlZe6W9
 R81+FgbKmNxXAclD5PI8rSvhOc+IHmxm2/ZTmGj9pPL9wX4mE3k+c1cCWTqlGMOHGqsCUr
 dp1Fr6T+XEOS45+W8wlSJrSDrTbyE/s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-gGqdBorXOtWt4on1Ev7PWg-1; Wed, 04 May 2022 16:59:37 -0400
X-MC-Unique: gGqdBorXOtWt4on1Ev7PWg-1
Received: by mail-ej1-f70.google.com with SMTP id
 sh14-20020a1709076e8e00b006f4a5de6888so1508980ejc.8
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 13:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dWxnlC7wB8YqtotXAbxmzQTqy8EDzZFlucUQhgZaxXo=;
 b=PXzqA1pv9erjoO28A6L+H0loBqrTvkZfyWvkNrtWEH1BnR4co5bsa8vkE9f1OaKlYK
 LywczInXq3T8UBQUDpED9bu2lpVzFRo9XPnND5iB5IMayNUjiubuxR3/Wc1WuKsWgW2p
 xAZQ8hVmVEJixKlI7aVcYrOR2gxRoCJsqaWFUEspTBf2JDNXOi3YxwGBCbcjJu4v2u1n
 rUqliiJF39Le5X5NMjJrKv/yl//3op97ht+NprlkojccZ2q+bA5XxW6vUaKqXSSYFTje
 BipqHDEpB25MiAfhit6z/RrkrALKPC7sqSHq4Yqgv6aHgpc4CEQ4Ds4FaFYh/L/dst5I
 vbyA==
X-Gm-Message-State: AOAM530/R9jYp2tj/ililvWdtYl4rqGLprcuxM0mv5oELmdqgyGSpoL3
 GtEpaaeMD0e2FjJrK9tXbTDHXetO4GF7xKhGXXsC7Xc9nFmhtIpxoJV6sZR41sS233WWXKyckn5
 B6mu+9Bkpx2tHKYM=
X-Received: by 2002:aa7:c49a:0:b0:425:d526:98ad with SMTP id
 m26-20020aa7c49a000000b00425d52698admr25068173edq.352.1651697976131; 
 Wed, 04 May 2022 13:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY/zszcIC/Z4oJhhQNqk6fuqQaNv7P2z/IptsskyZhaJ8FzN0knR2/O7W2wrF48KzDOloWJA==
X-Received: by 2002:aa7:c49a:0:b0:425:d526:98ad with SMTP id
 m26-20020aa7c49a000000b00425d52698admr25068152edq.352.1651697975954; 
 Wed, 04 May 2022 13:59:35 -0700 (PDT)
Received: from redhat.com ([2.53.148.199]) by smtp.gmail.com with ESMTPSA id
 eb7-20020a170907280700b006f3ef214e46sm6146207ejc.172.2022.05.04.13.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:59:35 -0700 (PDT)
Date: Wed, 4 May 2022 16:59:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, mopsfelder@gmail.com,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Peter Turschmid <peter.turschm@nutanix.com>
Subject: Re: [PATCH] vhost-user: Use correct macro name TARGET_PPC64
Message-ID: <20220504165920-mutt-send-email-mst@kernel.org>
References: <20220503180108.34506-1-muriloo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503180108.34506-1-muriloo@linux.ibm.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 03, 2022 at 03:01:08PM -0300, Murilo Opsfelder Araujo wrote:
> The correct name of the macro is TARGET_PPC64.
> 
> Fixes: 27598393a232 ("Lift max memory slots limit imposed by vhost-user")
> Reported-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: Peter Turschmid <peter.turschm@nutanix.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

ok to merge through the ppc tree

> ---
>  hw/virtio/vhost-user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 9c4f84f35f..e356c72c81 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -51,7 +51,7 @@
>  #include "hw/acpi/acpi.h"
>  #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
>  
> -#elif defined(TARGET_PPC) || defined(TARGET_PPC_64)
> +#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
>  #include "hw/ppc/spapr.h"
>  #define VHOST_USER_MAX_RAM_SLOTS SPAPR_MAX_RAM_SLOTS
>  
> -- 
> 2.35.1


