Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEDF550FC6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 07:49:22 +0200 (CEST)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3AHp-0004zC-5V
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 01:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o3AFe-0003bD-S7
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o3AFc-0002vf-PO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655704023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S5LwZDfjNpGOhThCdJsRHyAo5fnAJXaIczE88koFsm4=;
 b=PEW+Xd83g0UupuxUak/yyAObXzvpi7WnWcyocFgZJ4Z39Ebv/xsV7NReK4ZBgHsOq7wUxs
 Y1a98lYxlCcGeTnU0SOIcTssT3JA9w1XG1XotQZHu7MjKq3X208ghfu2TrrtgxM3kkaHcm
 2NQAtkmurgH9O5dwJEAU44BK3gRx7Jg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-ougTTD_BM7W8uUefTZGvAg-1; Mon, 20 Jun 2022 01:47:01 -0400
X-MC-Unique: ougTTD_BM7W8uUefTZGvAg-1
Received: by mail-ed1-f72.google.com with SMTP id
 o2-20020a056402438200b00434ec3efc03so7803645edc.9
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 22:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S5LwZDfjNpGOhThCdJsRHyAo5fnAJXaIczE88koFsm4=;
 b=RBN2CkKjiVeRmx2OoLuNtYG59B6SvYx02M/Z2LJH8DZhT8k4VD+IDT7ZtKlteLY+cj
 h0ysPsESjzw6FTUvpaP4RGHCxr1LOoQNDvWo7sUjLUZ067KGQQ6JYEtZYb3Si1AYX7yY
 Iy6raZXl/AwtB12Xmx/dh5HzRHYzn6+x2P99Sam7uo6teJvAyYOqsNT33d8CqxynylDs
 LjN3nZki9wCAckRjIBKuymc5s1pHPfoen5jnsfrJ82x1ksDjDMifFTE8PVNBBkQPbBdv
 qiXD27byK7hTbRiIy4DBaZo1r3WFQ7wavVOYA3QDZkLv3IEMjK2k+PkdNATcNfZfQ9Xz
 2Quw==
X-Gm-Message-State: AJIora9+6h0bvcR08UOGe8a7p5GQ34Tvz4dWlOGXTM11U9qQQw6I4CrY
 aYApHMmf/7fhFHYuS2IbMz5QOaz9XCPjtiPv3GBS3INNpkkfNh5L2RkLZOq1e9fVGkTyojXhXv9
 4tju4f/hO3A+DkA3SwuYSu2rZuoqiYqM=
X-Received: by 2002:a17:906:130c:b0:715:785b:b624 with SMTP id
 w12-20020a170906130c00b00715785bb624mr19569028ejb.331.1655704020343; 
 Sun, 19 Jun 2022 22:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyN0Eyx0dDquvnf8D0rTSJno0URkrFh8wEI9aD8nmOjJeZijCCClxouQ+m7DlypRmgueMBbnUtfLNktdfspDg=
X-Received: by 2002:a17:906:130c:b0:715:785b:b624 with SMTP id
 w12-20020a170906130c00b00715785bb624mr19569009ejb.331.1655704020047; Sun, 19
 Jun 2022 22:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-5-leobras@redhat.com>
In-Reply-To: <20220620053944.257547-5-leobras@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 20 Jun 2022 02:46:48 -0300
Message-ID: <CAJ6HWG4JX4yCqyeRe73+dTjwESC40uzLhrLC5jCkU4U_0MEQow@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] migration: Change zero_copy_send from migration
 parameter to migration capability
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, 
 Jiri Denemark <jdenemar@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
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

CC: Jiri Denemark <jdenemar@redhat.com>

On Mon, Jun 20, 2022 at 2:40 AM Leonardo Bras <leobras@redhat.com> wrote:
>
> When originally implemented, zero_copy_send was designed as a Migration
> paramenter.
>
> But taking into account how is that supposed to work, and how
> the difference between a capability and a parameter, it only makes sense
> that zero-copy-send would work better as a capability.
>
> Taking into account how recently the change got merged, it was decided
> that it's still time to make it right, and convert zero_copy_send into
> a Migration capability.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  qapi/migration.json   | 33 ++++++++-------------------
>  migration/migration.c | 52 ++++++++++++++++---------------------------
>  monitor/hmp-cmds.c    |  6 -----
>  3 files changed, 28 insertions(+), 63 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 6130cd9fae..baf8d734de 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -461,6 +461,13 @@
>  #                       procedure starts. The VM RAM is saved with running VM.
>  #                       (since 6.0)
>  #
> +# @zero-copy-send: Controls behavior on sending memory pages on migration.
> +#                  When true, enables a zero-copy mechanism for sending
> +#                  memory pages, if host supports it.
> +#                  Requires that QEMU be permitted to use locked memory
> +#                  for guest RAM pages.
> +#                  (since 7.1)
> +#
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>  #
> @@ -474,7 +481,8 @@
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
> -           'validate-uuid', 'background-snapshot'] }
> +           'validate-uuid', 'background-snapshot',
> +           { 'name': 'zero-copy-send', 'if' : 'CONFIG_LINUX'}] }
>
>  ##
>  # @MigrationCapabilityStatus:
> @@ -738,12 +746,6 @@
>  #                      will consume more CPU.
>  #                      Defaults to 1. (Since 5.0)
>  #
> -# @zero-copy-send: Controls behavior on sending memory pages on migration.
> -#                  When true, enables a zero-copy mechanism for sending
> -#                  memory pages, if host supports it.
> -#                  Requires that QEMU be permitted to use locked memory
> -#                  for guest RAM pages.
> -#                  Defaults to false. (Since 7.1)
>  #
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migration.  Such
> @@ -784,7 +786,6 @@
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
>             'multifd-zlib-level' ,'multifd-zstd-level',
> -           { 'name': 'zero-copy-send', 'if' : 'CONFIG_LINUX'},
>             'block-bitmap-mapping' ] }
>
>  ##
> @@ -911,13 +912,6 @@
>  #                      will consume more CPU.
>  #                      Defaults to 1. (Since 5.0)
>  #
> -# @zero-copy-send: Controls behavior on sending memory pages on migration.
> -#                  When true, enables a zero-copy mechanism for sending
> -#                  memory pages, if host supports it.
> -#                  Requires that QEMU be permitted to use locked memory
> -#                  for guest RAM pages.
> -#                  Defaults to false. (Since 7.1)
> -#
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migration.  Such
>  #                        aliases may for example be the corresponding names on the
> @@ -972,7 +966,6 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>
>  ##
> @@ -1119,13 +1112,6 @@
>  #                      will consume more CPU.
>  #                      Defaults to 1. (Since 5.0)
>  #
> -# @zero-copy-send: Controls behavior on sending memory pages on migration.
> -#                  When true, enables a zero-copy mechanism for sending
> -#                  memory pages, if host supports it.
> -#                  Requires that QEMU be permitted to use locked memory
> -#                  for guest RAM pages.
> -#                  Defaults to false. (Since 7.1)
> -#
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migration.  Such
>  #                        aliases may for example be the corresponding names on the
> @@ -1178,7 +1164,6 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>
>  ##
> diff --git a/migration/migration.c b/migration/migration.c
> index 31739b2af9..cc253d66e3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -163,7 +163,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>      MIGRATION_CAPABILITY_COMPRESS,
>      MIGRATION_CAPABILITY_XBZRLE,
>      MIGRATION_CAPABILITY_X_COLO,
> -    MIGRATION_CAPABILITY_VALIDATE_UUID);
> +    MIGRATION_CAPABILITY_VALIDATE_UUID,
> +    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
>
>  /* When we add fault tolerance, we could have several
>     migrations at once.  For now we don't need to add
> @@ -910,10 +911,6 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>      params->multifd_zlib_level = s->parameters.multifd_zlib_level;
>      params->has_multifd_zstd_level = true;
>      params->multifd_zstd_level = s->parameters.multifd_zstd_level;
> -#ifdef CONFIG_LINUX
> -    params->has_zero_copy_send = true;
> -    params->zero_copy_send = s->parameters.zero_copy_send;
> -#endif
>      params->has_xbzrle_cache_size = true;
>      params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
>      params->has_max_postcopy_bandwidth = true;
> @@ -1275,6 +1272,18 @@ static bool migrate_caps_check(bool *cap_list,
>          }
>      }
>
> +#ifdef CONFIG_LINUX
> +    if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
> +        (!cap_list[MIGRATION_CAPABILITY_MULTIFD] ||
> +         migrate_use_compression() ||
> +         migrate_use_tls())) {
> +        error_setg(errp,
> +                   "Zero copy only available for non-compressed non-TLS multifd migration");
> +        return false;
> +    }
> +#endif
> +
> +
>      /* incoming side only */
>      if (runstate_check(RUN_STATE_INMIGRATE) &&
>          !migrate_multi_channels_is_allowed() &&
> @@ -1497,16 +1506,6 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
>          error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
>          return false;
>      }
> -#ifdef CONFIG_LINUX
> -    if (params->zero_copy_send &&
> -        (!migrate_use_multifd() ||
> -         params->multifd_compression != MULTIFD_COMPRESSION_NONE ||
> -         (params->tls_creds && *params->tls_creds))) {
> -        error_setg(errp,
> -                   "Zero copy only available for non-compressed non-TLS multifd migration");
> -        return false;
> -    }
> -#endif
>      return true;
>  }
>
> @@ -1580,11 +1579,6 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>      if (params->has_multifd_compression) {
>          dest->multifd_compression = params->multifd_compression;
>      }
> -#ifdef CONFIG_LINUX
> -    if (params->has_zero_copy_send) {
> -        dest->zero_copy_send = params->zero_copy_send;
> -    }
> -#endif
>      if (params->has_xbzrle_cache_size) {
>          dest->xbzrle_cache_size = params->xbzrle_cache_size;
>      }
> @@ -1697,11 +1691,6 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>      if (params->has_multifd_compression) {
>          s->parameters.multifd_compression = params->multifd_compression;
>      }
> -#ifdef CONFIG_LINUX
> -    if (params->has_zero_copy_send) {
> -        s->parameters.zero_copy_send = params->zero_copy_send;
> -    }
> -#endif
>      if (params->has_xbzrle_cache_size) {
>          s->parameters.xbzrle_cache_size = params->xbzrle_cache_size;
>          xbzrle_cache_resize(params->xbzrle_cache_size, errp);
> @@ -2593,7 +2582,7 @@ bool migrate_use_zero_copy_send(void)
>
>      s = migrate_get_current();
>
> -    return s->parameters.zero_copy_send;
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
>  }
>  #endif
>
> @@ -4249,10 +4238,6 @@ static Property migration_properties[] = {
>      DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
>                        parameters.multifd_zstd_level,
>                        DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
> -#ifdef CONFIG_LINUX
> -    DEFINE_PROP_BOOL("zero_copy_send", MigrationState,
> -                      parameters.zero_copy_send, false),
> -#endif
>      DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
>                        parameters.xbzrle_cache_size,
>                        DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
> @@ -4290,6 +4275,10 @@ static Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
>      DEFINE_PROP_MIG_CAP("x-background-snapshot",
>              MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
> +#ifdef CONFIG_LINUX
> +    DEFINE_PROP_MIG_CAP("x-zero-copy-send",
> +            MIGRATION_CAPABILITY_ZERO_COPY_SEND),
> +#endif
>
>      DEFINE_PROP_END_OF_LIST(),
>  };
> @@ -4350,9 +4339,6 @@ static void migration_instance_init(Object *obj)
>      params->has_multifd_compression = true;
>      params->has_multifd_zlib_level = true;
>      params->has_multifd_zstd_level = true;
> -#ifdef CONFIG_LINUX
> -    params->has_zero_copy_send = true;
> -#endif
>      params->has_xbzrle_cache_size = true;
>      params->has_max_postcopy_bandwidth = true;
>      params->has_max_cpu_throttle = true;
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 47a27326ee..ca98df0495 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1311,12 +1311,6 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          p->has_multifd_zstd_level = true;
>          visit_type_uint8(v, param, &p->multifd_zstd_level, &err);
>          break;
> -#ifdef CONFIG_LINUX
> -    case MIGRATION_PARAMETER_ZERO_COPY_SEND:
> -        p->has_zero_copy_send = true;
> -        visit_type_bool(v, param, &p->zero_copy_send, &err);
> -        break;
> -#endif
>      case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
>          p->has_xbzrle_cache_size = true;
>          if (!visit_type_size(v, param, &cache_size, &err)) {
> --
> 2.36.1
>


