Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C873B4CBBB9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 11:51:28 +0100 (CET)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPj3P-0005eo-TV
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 05:51:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nPj1r-0004UV-AF
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:49:51 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:57399
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nPj1o-0005fr-Q8
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:49:51 -0500
HMM_SOURCE_IP: 172.18.0.188:41090.296885218
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 68E9428009D;
 Thu,  3 Mar 2022 18:49:43 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id e2ef7a6f2cac4238932aa8db9d1c0af5 for
 qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:49:46 CST
X-Transaction-ID: e2ef7a6f2cac4238932aa8db9d1c0af5
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <17f131cc-7275-2991-cf71-aa1a735320ec@chinatelecom.cn>
Date: Thu, 3 Mar 2022 18:49:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] migration: Introduce dirtylimit capability
To: qemu-devel <qemu-devel@nongnu.org>
References: <cover.1646300129.git.huangy81@chinatelecom.cn>
 <bbdfab0f94a1f90c983c4fe331c47972e4336e92.1646133752.git.huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <bbdfab0f94a1f90c983c4fe331c47972e4336e92.1646133752.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Sent by accident, please ignore, I'll send v1 when ready."

在 2022/3/3 18:45, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   migration/migration.c | 19 +++++++++++++++++++
>   migration/migration.h |  1 +
>   migration/ram.c       | 24 ++++++++++++++++++++++++
>   qapi/migration.json   | 36 +++++++++++++++++++++++++++++++-----
>   4 files changed, 75 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index bcc385b..0b89468 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -116,6 +116,9 @@
>   #define DEFAULT_MIGRATE_ANNOUNCE_ROUNDS    5
>   #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
>   
> +#define DEFAULT_MIGRATE_MIN_DIRTYLIMIT_RATE     1
> +#define DEFAULT_MIGRATE_DIRTYLIMIT_STEP_SIZE    10
> +
>   static NotifierList migration_state_notifiers =
>       NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
>   
> @@ -2397,6 +2400,15 @@ bool migrate_auto_converge(void)
>       return s->enabled_capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
>   }
>   
> +bool migrate_dirtylimit(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTYLIMIT];
> +}
> +
>   bool migrate_zero_blocks(void)
>   {
>       MigrationState *s;
> @@ -4215,6 +4227,12 @@ static Property migration_properties[] = {
>       DEFINE_PROP_SIZE("announce-step", MigrationState,
>                         parameters.announce_step,
>                         DEFAULT_MIGRATE_ANNOUNCE_STEP),
> +    DEFINE_PROP_UINT64("min-dirtylimit-rate", MigrationState,
> +                      parameters.min_dirtylimit_rate,
> +                      DEFAULT_MIGRATE_ANNOUNCE_STEP),
> +    DEFINE_PROP_UINT64("dirtylimit-step-size", MigrationState,
> +                      parameters.dirtylimit_step_size,
> +                      DEFAULT_MIGRATE_ANNOUNCE_STEP),
>   
>       /* Migration capabilities */
>       DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> @@ -4231,6 +4249,7 @@ static Property migration_properties[] = {
>       DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
>       DEFINE_PROP_MIG_CAP("x-background-snapshot",
>               MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
> +    DEFINE_PROP_MIG_CAP("x-dirtylimit", MIGRATION_CAPABILITY_DIRTYLIMIT),
>   
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/migration/migration.h b/migration/migration.h
> index 8130b70..f2bf226 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -332,6 +332,7 @@ bool migrate_ignore_shared(void);
>   bool migrate_validate_uuid(void);
>   
>   bool migrate_auto_converge(void);
> +bool migrate_dirtylimit(void);
>   bool migrate_use_multifd(void);
>   bool migrate_pause_before_switchover(void);
>   int migrate_multifd_channels(void);
> diff --git a/migration/ram.c b/migration/ram.c
> index 781f074..cf18536 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -56,6 +56,7 @@
>   #include "qemu/iov.h"
>   #include "multifd.h"
>   #include "sysemu/runstate.h"
> +#include "sysemu/dirtylimit.h"
>   
>   #include "hw/boards.h" /* for machine_dump_guest_core() */
>   
> @@ -1082,6 +1083,27 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
>       }
>   }
>   
> +/**
> + * mig_dirtylimit_guest_down: enable dirtylimit to throttle down the guest
> + */
> +static void mig_dirtylimit_guest_down(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +    uint64_t current_dirtyrate = s->mbps / 8;
> +    uint64_t min_dirtyrate = s->parameters.min_dirtylimit_rate;
> +    uint64_t step_size = s->parameters.dirtylimit_step_size;
> +    static uint64_t quota_dirtyrate;
> +
> +    if (!dirtylimit_in_service()) {
> +        quota_dirtyrate = MAX(current_dirtyrate, min_dirtyrate);
> +        dirtylimit_set_all(quota_dirtyrate, true);
> +    } else {
> +        quota_dirtyrate -= step_size;
> +        quota_dirtyrate = MAX(current_dirtyrate, min_dirtyrate);
> +        dirtylimit_set_all(quota_dirtyrate, true);
> +    }
> +}
> +
>   static void migration_trigger_throttle(RAMState *rs)
>   {
>       MigrationState *s = migrate_get_current();
> @@ -1108,6 +1130,8 @@ static void migration_trigger_throttle(RAMState *rs)
>               mig_throttle_guest_down(bytes_dirty_period,
>                                       bytes_dirty_threshold);
>           }
> +    } else if (migrate_dirtylimit() && kvm_dirty_ring_enabled()) {
> +        mig_dirtylimit_guest_down();
>       }
>   }
>   
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 2ccbb92..e074dc8 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -463,6 +463,9 @@
>   #                       procedure starts. The VM RAM is saved with running VM.
>   #                       (since 6.0)
>   #
> +# @dirtylimit: Use dirtylimit to throttle down guest if enabled.
> +#              (since 6.1)
> +#
>   # Features:
>   # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>   #
> @@ -476,7 +479,7 @@
>              'block', 'return-path', 'pause-before-switchover', 'multifd',
>              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>              { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
> -           'validate-uuid', 'background-snapshot'] }
> +           'validate-uuid', 'background-snapshot', 'dirtylimit'] }
>   
>   ##
>   # @MigrationCapabilityStatus:
> @@ -760,6 +763,12 @@
>   #                        block device name if there is one, and to their node name
>   #                        otherwise. (Since 5.2)
>   #
> +# @min-dirtylimit-rate: minimum qouta for limiting dirty page rate.
> +#                       Defaults to 1. (Since 6.1)
> +#
> +# @dirtylimit-step-size: step size (MB/s) for limiting dirty page rate.
> +#                        Defaults to 10. (Since 6.1)
> +#
>   # Features:
>   # @unstable: Member @x-checkpoint-delay is experimental.
>   #
> @@ -779,8 +788,9 @@
>              'multifd-channels',
>              'xbzrle-cache-size', 'max-postcopy-bandwidth',
>              'max-cpu-throttle', 'multifd-compression',
> -           'multifd-zlib-level' ,'multifd-zstd-level',
> -           'block-bitmap-mapping' ] }
> +           'multifd-zlib-level', 'multifd-zstd-level',
> +           'block-bitmap-mapping', 'min-dirtylimit-rate',
> +           'dirtylimit-step-size' ] }
>   
>   ##
>   # @MigrateSetParameters:
> @@ -925,6 +935,12 @@
>   #                        block device name if there is one, and to their node name
>   #                        otherwise. (Since 5.2)
>   #
> +# @min-dirtylimit-rate: minimum qouta for limiting dirty page rate.
> +#                       Defaults to 1. (Since 6.1)
> +#
> +# @dirtylimit-step-size: step size (MB/s) for limiting dirty page rate.
> +#                        Defaults to 10. (Since 6.1)
> +#
>   # Features:
>   # @unstable: Member @x-checkpoint-delay is experimental.
>   #
> @@ -960,7 +976,9 @@
>               '*multifd-compression': 'MultiFDCompression',
>               '*multifd-zlib-level': 'uint8',
>               '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*min-dirtylimit-rate': 'uint64',
> +            '*dirtylimit-step-size': 'uint64' } }
>   
>   ##
>   # @migrate-set-parameters:
> @@ -1125,6 +1143,12 @@
>   #                        block device name if there is one, and to their node name
>   #                        otherwise. (Since 5.2)
>   #
> +# @min-dirtylimit-rate: minimum qouta for limiting dirty page rate.
> +#                       Defaults to 1. (Since 6.1)
> +#
> +# @dirtylimit-step-size: step size (MB/s) for limiting dirty page rate.
> +#                        Defaults to 10. (Since 6.1)
> +#
>   # Features:
>   # @unstable: Member @x-checkpoint-delay is experimental.
>   #
> @@ -1158,7 +1182,9 @@
>               '*multifd-compression': 'MultiFDCompression',
>               '*multifd-zlib-level': 'uint8',
>               '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*min-dirtylimit-rate': 'uint64',
> +            '*dirtylimit-step-size': 'uint64' } }
>   
>   ##
>   # @query-migrate-parameters:

-- 
Best regard

Hyman Huang(黄勇)

