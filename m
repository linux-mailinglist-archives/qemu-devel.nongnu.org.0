Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42C4553C51
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 23:06:10 +0200 (CEST)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3l4b-0000ET-Fd
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 17:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3l2Z-0007oD-D3
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 17:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3l2V-0003Y8-9F
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 17:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655845438;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KXKn49rZGTzIIaEjVA5c+LgKDuUr4Fd2P/H61EIaKss=;
 b=D60gu9aD0vUnVLWIa+b+uViP/rX6lENmg3EZSD17BLQYE0h/5lxJTiC5c6BqP8YephwDJN
 2PhyUnYPsYSRBGomAdlSeVmQYIvE85GAc7FWBxvp5yBD4fJDSdXHtKYjhDQGteGLRH44RV
 oAtdSqvKyQlNK8vajMR6nUCak0/wsnE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-NtWVuX4IOeCEioJG6imrBQ-1; Tue, 21 Jun 2022 17:03:56 -0400
X-MC-Unique: NtWVuX4IOeCEioJG6imrBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k34-20020a05600c1ca200b0039c7db490c8so6745625wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 14:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=KXKn49rZGTzIIaEjVA5c+LgKDuUr4Fd2P/H61EIaKss=;
 b=XOVuxF4CI9xLWMCDMEtqBp1LfELxlKCERIC+F60ywfOqG2UyUonwlh0jKhSzYtQLEf
 IIVmwdG2cSj3q29slAz7GxHfgBHPDGHA8PyplSFt/6FkwxJEvWrCk+uZiWboGyMgJP0J
 qRyHDHIJ+Lvl3d8fu5gvWrqpVdatJ8qIzzPZJPhKdhF2p5xkXZvs697v8+Nvwb+Z2Of6
 cNy1vA7BnEOjoEKuNFApBPNBp6kUsdrGkjRhw5LfSz0tY1P7yD9i/jOrEIxKsmw+G+LM
 FJE6W+m14OBOHrPRaqsPkQKGfP6xPSkUd60Atk/QJF0bkXjJPs9ZHshh+YX+7UyYHXgm
 mHKA==
X-Gm-Message-State: AJIora+TMmOaFUI0J8E2vJsbR/ahJnfCjDXQwMm4lA8YIRR68csLXSCJ
 WufECfDuY3UQj68QzJNn7/dXVb9PV6nBQDK+s6Bxp4wxvFBUoLQdzvQbgdMx32J2/sL7++qfQxq
 ttsa+KSdxV8BUNjI=
X-Received: by 2002:adf:d084:0:b0:21b:8a7c:d260 with SMTP id
 y4-20020adfd084000000b0021b8a7cd260mr15769461wrh.68.1655845435579; 
 Tue, 21 Jun 2022 14:03:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tF5dHI28Uu7lqxi6k4PkwAvqQcMomZw8ul3/QQiTgNAbbmKp7TM+grx6wEOsh9xFO+Zz8uKw==
X-Received: by 2002:adf:d084:0:b0:21b:8a7c:d260 with SMTP id
 y4-20020adfd084000000b0021b8a7cd260mr15769439wrh.68.1655845435309; 
 Tue, 21 Jun 2022 14:03:55 -0700 (PDT)
Received: from localhost (84.125.73.40.dyn.user.ono.com. [84.125.73.40])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a1c7514000000b0039c4ec6fdacsm19219263wmc.40.2022.06.21.14.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 14:03:54 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  "Daniel P . Berrange" <berrange@redhat.com>,  "Dr
 . David Alan Gilbert" <dgilbert@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v7 01/14] migration: Add postcopy-preempt capability
In-Reply-To: <20220524221151.18225-2-peterx@redhat.com> (Peter Xu's message of
 "Tue, 24 May 2022 18:11:38 -0400")
References: <20220524221151.18225-1-peterx@redhat.com>
 <20220524221151.18225-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 21 Jun 2022 23:03:53 +0200
Message-ID: <87v8stvidi.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Firstly, postcopy already preempts precopy due to the fact that we do
> unqueue_page() first before looking into dirty bits.
>
> However that's not enough, e.g., when there're host huge page enabled, when
> sending a precopy huge page, a postcopy request needs to wait until the whole
> huge page that is sending to finish.  That could introduce quite some delay,
> the bigger the huge page is the larger delay it'll bring.
>
> This patch adds a new capability to allow postcopy requests to preempt existing
> precopy page during sending a huge page, so that postcopy requests can be
> serviced even faster.
>
> Meanwhile to send it even faster, bypass the precopy stream by providing a
> standalone postcopy socket for sending requested pages.
>
> Since the new behavior will not be compatible with the old behavior, this will
> not be the default, it's enabled only when the new capability is set on both
> src/dst QEMUs.
>
> This patch only adds the capability itself, the logic will be added in follow
> up patches.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 23 +++++++++++++++++++++++
>  migration/migration.h |  1 +
>  qapi/migration.json   |  8 +++++++-
>  3 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 31739b2af9..f15e1593ac 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1240,6 +1240,11 @@ static bool migrate_caps_check(bool *cap_list,
>              error_setg(errp, "Postcopy is not compatible with ignore-shared");
>              return false;
>          }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
> +            error_setg(errp, "Multifd is not supported in postcopy");
> +            return false;
> +        }
>      }


Multifd is supported with postcopy.  We just switch to old precopy when
we switch to postcopy.

I am dropping that chunk.

For the rest:

Reviewed-by: Juan Quintela <quintela@redhat.com>


>  
>      if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
> @@ -1283,6 +1288,13 @@ static bool migrate_caps_check(bool *cap_list,
>          return false;
>      }
>  
> +    if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
> +        if (!cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
> +            error_setg(errp, "Postcopy preempt requires postcopy-ram");
> +            return false;
> +        }
> +    }
> +
>      return true;
>  }
>  
> @@ -2669,6 +2681,15 @@ bool migrate_background_snapshot(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
>  }
>  
> +bool migrate_postcopy_preempt(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
> +}
> +
>  /* migration thread support */
>  /*
>   * Something bad happened to the RP stream, mark an error
> @@ -4283,6 +4304,8 @@ static Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-compress", MIGRATION_CAPABILITY_COMPRESS),
>      DEFINE_PROP_MIG_CAP("x-events", MIGRATION_CAPABILITY_EVENTS),
>      DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
> +    DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
> +                        MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
>      DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
>      DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
>      DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
> diff --git a/migration/migration.h b/migration/migration.h
> index 485d58b95f..d2269c826c 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -400,6 +400,7 @@ int migrate_decompress_threads(void);
>  bool migrate_use_events(void);
>  bool migrate_postcopy_blocktime(void);
>  bool migrate_background_snapshot(void);
> +bool migrate_postcopy_preempt(void);
>  
>  /* Sending on the return path - generic and then for each message type */
>  void migrate_send_rp_shut(MigrationIncomingState *mis,
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 6130cd9fae..d8c3810ba2 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -461,6 +461,12 @@
>  #                       procedure starts. The VM RAM is saved with running VM.
>  #                       (since 6.0)
>  #
> +# @postcopy-preempt: If enabled, the migration process will allow postcopy
> +#                    requests to preempt precopy stream, so postcopy requests
> +#                    will be handled faster.  This is a performance feature and
> +#                    should not affect the correctness of postcopy migration.
> +#                    (since 7.1)
> +#
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>  #
> @@ -474,7 +480,7 @@
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
> -           'validate-uuid', 'background-snapshot'] }
> +           'validate-uuid', 'background-snapshot', 'postcopy-preempt'] }
>  
>  ##
>  # @MigrationCapabilityStatus:


