Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA98572975
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:45:39 +0200 (CEST)
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOdO-0003gV-Jh
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oBOaI-0006Q1-Na
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oBOaF-0005dL-FF
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657665742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qB25PnKKz0kM85qpHXnFn21oDlnh5IWH3DKAzR3n7wM=;
 b=T2E4I7sx4jDVdXVjdherkMGu9CvMVER4d0i59S2qeFIz6WKdDi85Hh3oKNoDfkZ95U32Fo
 waX47e/YhyPS4r9MNXLxLJ/fwQdUKBYiu7YpKsTdDoU2cY+uz2HzALcJTkD4MHmLZP1aRC
 GG0GQT7nLCHmRhc9ixFSRdiZKN2Dc4k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-YlWXDEzoMj6jf9fhr4gYqg-1; Tue, 12 Jul 2022 18:42:21 -0400
X-MC-Unique: YlWXDEzoMj6jf9fhr4gYqg-1
Received: by mail-qk1-f197.google.com with SMTP id
 k9-20020a05620a414900b006b58d6a89f2so5224511qko.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qB25PnKKz0kM85qpHXnFn21oDlnh5IWH3DKAzR3n7wM=;
 b=erZKXTODbvPQ8lergq0sriqgQZeyN6lzK8tmPDU2ZGM+vy7HdhWGc6b5MemneOBBnd
 gONxB6nPZJoFDn0DC1H2wBmOln46MRd4p6H6G9+zyiW2xXKFYd6wj/5ZnheI+fQpEPzA
 j/Z5/X5FOQIBg1HxeRXrmyG4fGVznFC30y/BjkOgdHT7oTEkuPv6lgP0zbV2tng1smth
 jL7sbnz4iS2pq7oWZ5KSi/e8WGaFUBZBm7q17OjSeTAiaAwI+JKBnUgHrYCwOt2Fou1r
 p8Wdc7OyOIi91CCLQmthn6pIibWc64h0ccM/H7DI8jhap478v7qb23Ea2hecTFGUvtTM
 C4Fg==
X-Gm-Message-State: AJIora84YceyLclg2oiL9T42GKR9bskXGxvfVK2UN+nSsMdt8KJx8sCM
 oyVOalovcIQyHIG1SemKQsnoajIkrJLjqrJsqcUd478OOr7l8qwZGeyW4RrmPNe0Ww9uwFUmdqC
 nljw0GkTSSCZq82Q=
X-Received: by 2002:a05:6214:e63:b0:473:2661:6102 with SMTP id
 jz3-20020a0562140e6300b0047326616102mr293247qvb.116.1657665741401; 
 Tue, 12 Jul 2022 15:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1veuVF4IBDmSEgRAdb8tZiOp1kZQC822vpOxKVCldm0KNocTiiC/jltEtIleHECLsTX7+OLVA==
X-Received: by 2002:a05:6214:e63:b0:473:2661:6102 with SMTP id
 jz3-20020a0562140e6300b0047326616102mr293238qvb.116.1657665741229; 
 Tue, 12 Jul 2022 15:42:21 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
 by smtp.gmail.com with ESMTPSA id
 v8-20020ac873c8000000b00317ccf991a3sm8106163qtp.19.2022.07.12.15.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 15:42:20 -0700 (PDT)
Date: Tue, 12 Jul 2022 18:42:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/3] Add dirty-sync-missed-zero-copy migration stat
Message-ID: <Ys34yyAJ5VAAI1lO@xz-m1.local>
References: <20220711211112.18951-1-leobras@redhat.com>
 <20220711211112.18951-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220711211112.18951-3-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Mon, Jul 11, 2022 at 06:11:12PM -0300, Leonardo Bras wrote:
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  qapi/migration.json   | 7 ++++++-
>  migration/migration.c | 2 ++
>  monitor/hmp-cmds.c    | 5 +++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 7102e474a6..4a03e8f173 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -55,6 +55,10 @@
>  # @postcopy-bytes: The number of bytes sent during the post-copy phase
>  #                  (since 7.0).
>  #
> +# @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
> +#                               not avoid copying dirty pages. This is between
> +#                               0 and @dirty-sync-count * @multifd-channels.
> +#                               (since 7.1)
>  # Since: 0.14
>  ##
>  { 'struct': 'MigrationStats',
> @@ -65,7 +69,8 @@
>             'postcopy-requests' : 'int', 'page-size' : 'int',
>             'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
>             'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
> -           'postcopy-bytes' : 'uint64' } }
> +           'postcopy-bytes' : 'uint64',
> +           'dirty-sync-missed-zero-copy' : 'uint64' } }
>  
>  ##
>  # @XBZRLECacheStats:
> diff --git a/migration/migration.c b/migration/migration.c
> index 78f5057373..048f7f8bdb 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1027,6 +1027,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>      info->ram->normal_bytes = ram_counters.normal * page_size;
>      info->ram->mbps = s->mbps;
>      info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
> +    info->ram->dirty_sync_missed_zero_copy =
> +            ram_counters.dirty_sync_missed_zero_copy;
>      info->ram->postcopy_requests = ram_counters.postcopy_requests;
>      info->ram->page_size = page_size;
>      info->ram->multifd_bytes = ram_counters.multifd_bytes;
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index ca98df0495..a6dc79e0d5 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -307,6 +307,11 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>              monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
>                             info->ram->postcopy_bytes >> 10);
>          }
> +        if (info->ram->dirty_sync_missed_zero_copy) {
> +            monitor_printf(mon,
> +                           "Zero-copy-send fallbacks happened: %" PRIu64 " times\n",
> +                           info->ram->dirty_sync_missed_zero_copy);

Thanks, this looks better.  Though I think all the "dirty-sync" wordings
are still kept there, assuming flush() is bound to dirty sync even it's not
yet.  Not a big deal, but let's still keep an eye on the follow up patches..

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


