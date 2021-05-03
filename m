Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FBC371177
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 08:06:04 +0200 (CEST)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldRiV-0002fE-88
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 02:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldRgs-0002De-2f
 for qemu-devel@nongnu.org; Mon, 03 May 2021 02:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldRgp-00085C-7y
 for qemu-devel@nongnu.org; Mon, 03 May 2021 02:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620021858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KkchxmXU7kySPMeDvThyQlvRmfEcYF+DhpspVl4l3M=;
 b=YYUDE2n/z1wOcFTSxSkXVgSrUm5hUwk/E7eYl1sHakisKSvfOCDvM+qwxmE8PhldSVHiBF
 plCvv/L/D9IDzlCYDNbxdaqwZhXl6oKTdXF2Tpac8RgdiFmpGGv8w6eNwbtGyiz94Zt5GO
 JYV2a1RVLvfJwr3oIEVvp3oGhJ2h85A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-_LfXYkYDPoq5LQ5hPXVU8g-1; Mon, 03 May 2021 02:04:17 -0400
X-MC-Unique: _LfXYkYDPoq5LQ5hPXVU8g-1
Received: by mail-wr1-f72.google.com with SMTP id
 63-20020adf84450000b029010dd0171a96so2740929wrf.21
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 23:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8KkchxmXU7kySPMeDvThyQlvRmfEcYF+DhpspVl4l3M=;
 b=clatXV2uaPM0NPuTsI1TsPE3kVyajvl1VCt0uebqI9daz3ZnXrbPSIUPA56lBkp6B1
 sNSKFoAUQjKrxmciDl6YjJcp30OEROsSiUJdGOK0A/3FRseHrCLT9un0fLOoEhwoAPRG
 0muwhyBPCQIA6tMQJZqmD6kFxOYbcMPBKMHf09yksKHvd8qMcHNRtzOvz60ndkQacbUk
 Mxt+FsSyu00oyYptXOpe+Smk+lgl92A51AMVOH8FSpiQx4I8DqVmsH93MCkTCJMrjT5R
 9fyNvPPYipGJLMyu085z/dSlq6kJBNy02hsMNguZPC5DRGTcQJoVQMGldfTw2Xy1y+Zt
 svmA==
X-Gm-Message-State: AOAM532twWKkTHl8S8i2BI9pcK2e/zV2YlNdx2fRdipeXtVRpfUdIS9B
 3kaQlcOlNHJf2Ef/GqletvVy6v1iw0AESHWDS31z3Mw3IOF6LDU1TZ/TRz/FxaDB79pXWyoHM49
 QPTWGiT692IqBmCE=
X-Received: by 2002:a1c:3:: with SMTP id 3mr29494511wma.32.1620021855941;
 Sun, 02 May 2021 23:04:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfYvhjz8/v1alnnDthQk9cCBXkUX5zf8Ixxw8wL2Ukzo8AQT9IkfBx/qZzHnNmdYY1dPI+WA==
X-Received: by 2002:a1c:3:: with SMTP id 3mr29494489wma.32.1620021855653;
 Sun, 02 May 2021 23:04:15 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id k15sm11057162wro.87.2021.05.02.23.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 23:04:15 -0700 (PDT)
Subject: Re: [PATCH for-6.1 2/4] migration: Move populate_vfio_info() into a
 separate file
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210414112004.943383-1-thuth@redhat.com>
 <20210414112004.943383-3-thuth@redhat.com>
Message-ID: <79ee65be-2ad2-a671-667d-b1cc95a39c24@redhat.com>
Date: Mon, 3 May 2021 08:04:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210414112004.943383-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/04/2021 13.20, Thomas Huth wrote:
> The CONFIG_VFIO switch only works in target specific code. Since
> migration/migration.c is common code, the #ifdef does not have
> the intended behavior here. Move the related code to a separate
> file now which gets compiled via specific_ss instead.
> 
> Fixes: 3710586caa ("qapi: Add VFIO devices migration stats in Migration stats")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   migration/meson.build |  3 ++-
>   migration/migration.c | 15 ---------------
>   migration/migration.h |  2 ++
>   migration/target.c    | 25 +++++++++++++++++++++++++
>   4 files changed, 29 insertions(+), 16 deletions(-)
>   create mode 100644 migration/target.c
> 
> diff --git a/migration/meson.build b/migration/meson.build
> index 3ecedce94d..f8714dcb15 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -31,4 +31,5 @@ softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
>   softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
>   softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
>   
> -specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c', 'ram.c'))
> +specific_ss.add(when: 'CONFIG_SOFTMMU',
> +                if_true: files('dirtyrate.c', 'ram.c', 'target.c'))
> diff --git a/migration/migration.c b/migration/migration.c
> index 8ca034136b..db8c378079 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -60,10 +60,6 @@
>   #include "qemu/yank.h"
>   #include "sysemu/cpus.h"
>   
> -#ifdef CONFIG_VFIO
> -#include "hw/vfio/vfio-common.h"
> -#endif
> -
>   #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>   
>   /* Amount of time to allocate to each "chunk" of bandwidth-throttled
> @@ -1059,17 +1055,6 @@ static void populate_disk_info(MigrationInfo *info)
>       }
>   }
>   
> -static void populate_vfio_info(MigrationInfo *info)
> -{
> -#ifdef CONFIG_VFIO
> -    if (vfio_mig_active()) {
> -        info->has_vfio = true;
> -        info->vfio = g_malloc0(sizeof(*info->vfio));
> -        info->vfio->transferred = vfio_mig_bytes_transferred();
> -    }
> -#endif
> -}
> -
>   static void fill_source_migration_info(MigrationInfo *info)
>   {
>       MigrationState *s = migrate_get_current();
> diff --git a/migration/migration.h b/migration/migration.h
> index db6708326b..2730fa05c0 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -376,4 +376,6 @@ void migration_make_urgent_request(void);
>   void migration_consume_urgent_request(void);
>   bool migration_rate_limit(void);
>   
> +void populate_vfio_info(MigrationInfo *info);
> +
>   #endif
> diff --git a/migration/target.c b/migration/target.c
> new file mode 100644
> index 0000000000..907ebf0a0a
> --- /dev/null
> +++ b/migration/target.c
> @@ -0,0 +1,25 @@
> +/*
> + * QEMU live migration - functions that need to be compiled target-specific
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2
> + * or (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-types-migration.h"
> +#include "migration.h"
> +
> +#ifdef CONFIG_VFIO
> +#include "hw/vfio/vfio-common.h"
> +#endif
> +
> +void populate_vfio_info(MigrationInfo *info)
> +{
> +#ifdef CONFIG_VFIO
> +    if (vfio_mig_active()) {
> +        info->has_vfio = true;
> +        info->vfio = g_malloc0(sizeof(*info->vfio));
> +        info->vfio->transferred = vfio_mig_bytes_transferred();
> +    }
> +#endif
> +}
> 

Ping!

David, Juan, any comments on this one?

  Thomas


