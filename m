Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97F6E9DAD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:09:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbW2-0000Cu-0d; Thu, 20 Apr 2023 17:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dg@treblig.org>)
 id 1ppbVz-0000Ay-2I; Thu, 20 Apr 2023 17:08:27 -0400
Received: from mx.treblig.org ([46.235.229.95])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dg@treblig.org>)
 id 1ppbVw-0001CR-KU; Thu, 20 Apr 2023 17:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=4NT4L2rjOEdkbvsvpF1n1tLPTUA4gi/JCV1yDGUghvw=; b=FRUvy4AUeHbaTDwbY7oB+6ltrS
 LrvcGdwiLsSL0P6f6mu0H7QLDC5pUHvhEBBA4TbVY8Ggb7gRUxg9T89Jf44CHdL8XbP8+YGT78fKv
 rRPS/9yTOKpROwP6jVsL3XVHQO+pRSfACSD2COu7dm/gf6JQNYAcM6laj7nZjCmxWNcbmMe037DpB
 4htXTPcb3aawRpxwvVOI/6Z2D38mPXZ0Ep09ccErkNWU3N3yg1X69qLBP1xZVGGvMgLuHFQMgswDL
 /AduUPR7BdX26fwX2g2PG2n7yuX3Ty9er5WVOPrd1R9uTSHeZolB84k685cLYkVZ9ggLNwyA6qhFb
 gd7RR/NA==;
Received: from dg by mx.treblig.org with local (Exim 4.94.2)
 (envelope-from <dg@treblig.org>)
 id 1ppbVm-005Lma-RJ; Thu, 20 Apr 2023 21:08:14 +0000
Date: Thu, 20 Apr 2023 21:08:14 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, zhanghailiang@xfusion.com, philmd@linaro.org,
 thuth@redhat.com, berrange@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com
Subject: Re: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
Message-ID: <ZEGpvqVgGDexmexI@gallifrey>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-4-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20230419225232.508121-4-vsementsov@yandex-team.ru>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/5.10.0-21-amd64 (x86_64)
X-Uptime: 21:01:47 up 32 days, 7:36, 1 user, load average: 0.03, 0.02, 0.00
User-Agent: Mutt/2.0.5 (2021-01-21)
Received-SPF: pass client-ip=46.235.229.95; envelope-from=dg@treblig.org;
 helo=mx.treblig.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Vladimir Sementsov-Ogievskiy (vsementsov@yandex-team.ru) wrote:
> We don't allow to use x-colo capability when replication is not
> configured. So, no reason to build COLO when replication is disabled,
> it's unusable in this case.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  hmp-commands.hx                |  2 ++
>  migration/colo.c               |  6 +++++
>  migration/meson.build          |  6 +++--
>  migration/migration-hmp-cmds.c |  2 ++
>  migration/migration.c          | 19 +++-----------
>  net/meson.build                |  5 +++-
>  qapi/migration.json            | 12 ++++++---
>  stubs/colo.c                   | 47 ++++++++++++++++++++++++++++++++++
>  stubs/meson.build              |  1 +
>  9 files changed, 78 insertions(+), 22 deletions(-)
>  create mode 100644 stubs/colo.c
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index bb85ee1d26..fbd0932232 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1035,6 +1035,7 @@ SRST
>    migration (or once already in postcopy).
>  ERST
>  
> +#ifdef CONFIG_REPLICATION
>      {
>          .name       = "x_colo_lost_heartbeat",
>          .args_type  = "",
> @@ -1043,6 +1044,7 @@ ERST
>                        "a failover or takeover is needed.",
>          .cmd = hmp_x_colo_lost_heartbeat,
>      },
> +#endif

We seem to be inconsistent about whether the ifdef includes the
SRST/ERST doc section; some ifdef do and some don't; and thus
it depends whether or not you want the command documented
even though it's compiled out.

I think it's probably OK, but maybe worth reconsidering:

Acked-by: Dr. David Alan Gilbert <dave@treblig.org>

>  SRST
>  ``x_colo_lost_heartbeat``
> diff --git a/migration/colo.c b/migration/colo.c
> index 0716e64689..089c491d70 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -196,6 +196,12 @@ COLOMode get_colo_mode(void)
>      }
>  }
>  
> +bool migrate_colo_enabled(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_COLO];
> +}
> +
>  void colo_do_failover(void)
>  {
>      /* Make sure VM stopped while failover happened. */
> diff --git a/migration/meson.build b/migration/meson.build
> index 0d1bb9f96e..3fccf79f12 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -13,8 +13,6 @@ softmmu_ss.add(files(
>    'block-dirty-bitmap.c',
>    'channel.c',
>    'channel-block.c',
> -  'colo-failover.c',
> -  'colo.c',
>    'exec.c',
>    'fd.c',
>    'global_state.c',
> @@ -29,6 +27,10 @@ softmmu_ss.add(files(
>    'threadinfo.c',
>  ), gnutls)
>  
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo-failover.c', 'colo.c'))
> +endif
> +
>  softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
>  if get_option('live_block_migration').allowed()
>    softmmu_ss.add(files('block.c'))
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
> index 72519ea99f..4601c48f41 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -640,6 +640,7 @@ void hmp_migrate_start_postcopy(Monitor *mon, const QDict *qdict)
>      hmp_handle_error(mon, err);
>  }
>  
> +#ifdef CONFIG_REPLICATION
>  void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
> @@ -647,6 +648,7 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
>      qmp_x_colo_lost_heartbeat(&err);
>      hmp_handle_error(mon, err);
>  }
> +#endif
>  
>  typedef struct HMPMigrationStatus {
>      QEMUTimer *timer;
> diff --git a/migration/migration.c b/migration/migration.c
> index bda4789193..2382958364 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -165,7 +165,9 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>      MIGRATION_CAPABILITY_RDMA_PIN_ALL,
>      MIGRATION_CAPABILITY_COMPRESS,
>      MIGRATION_CAPABILITY_XBZRLE,
> +#ifdef CONFIG_REPLICATION
>      MIGRATION_CAPABILITY_X_COLO,
> +#endif
>      MIGRATION_CAPABILITY_VALIDATE_UUID,
>      MIGRATION_CAPABILITY_ZERO_COPY_SEND);
>  
> @@ -1329,15 +1331,6 @@ static bool migrate_caps_check(bool *cap_list,
>      }
>  #endif
>  
> -#ifndef CONFIG_REPLICATION
> -    if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
> -        error_setg(errp, "QEMU compiled without replication module"
> -                   " can't enable COLO");
> -        error_append_hint(errp, "Please enable replication before COLO.\n");
> -        return false;
> -    }
> -#endif
> -
>      if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>          /* This check is reasonably expensive, so only when it's being
>           * set the first time, also it's only the destination that needs
> @@ -3577,12 +3570,6 @@ fail:
>                        MIGRATION_STATUS_FAILED);
>  }
>  
> -bool migrate_colo_enabled(void)
> -{
> -    MigrationState *s = migrate_get_current();
> -    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_COLO];
> -}
> -
>  typedef enum MigThrError {
>      /* No error detected */
>      MIG_THR_ERR_NONE = 0,
> @@ -4537,7 +4524,9 @@ static Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
>      DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
>                          MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
> +#ifdef CONFIG_REPLICATION
>      DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
> +#endif
>      DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
>      DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
>      DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
> diff --git a/net/meson.build b/net/meson.build
> index 87afca3e93..38d50b8c96 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -1,7 +1,6 @@
>  softmmu_ss.add(files(
>    'announce.c',
>    'checksum.c',
> -  'colo-compare.c',
>    'colo.c',
>    'dump.c',
>    'eth.c',
> @@ -19,6 +18,10 @@ softmmu_ss.add(files(
>    'util.c',
>  ))
>  
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo-compare.c'))
> +endif
> +
>  softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>  
>  if have_l2tpv3
> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..93863fa88c 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -486,7 +486,8 @@
>  { 'enum': 'MigrationCapability',
>    'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
>             'compress', 'events', 'postcopy-ram',
> -           { 'name': 'x-colo', 'features': [ 'unstable' ] },
> +           { 'name': 'x-colo', 'features': [ 'unstable' ],
> +             'if': 'CONFIG_REPLICATION' },
>             'release-ram',
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
> @@ -1409,7 +1410,8 @@
>  #
>  ##
>  { 'command': 'x-colo-lost-heartbeat',
> -  'features': [ 'unstable' ] }
> +  'features': [ 'unstable' ],
> +  'if': 'CONFIG_REPLICATION' }
>  
>  ##
>  # @migrate_cancel:
> @@ -1685,7 +1687,8 @@
>  ##
>  { 'struct': 'COLOStatus',
>    'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
> -            'reason': 'COLOExitReason' } }
> +            'reason': 'COLOExitReason' },
> +  'if': 'CONFIG_REPLICATION' }
>  
>  ##
>  # @query-colo-status:
> @@ -1702,7 +1705,8 @@
>  # Since: 3.1
>  ##
>  { 'command': 'query-colo-status',
> -  'returns': 'COLOStatus' }
> +  'returns': 'COLOStatus',
> +  'if': 'CONFIG_REPLICATION' }
>  
>  ##
>  # @migrate-recover:
> diff --git a/stubs/colo.c b/stubs/colo.c
> new file mode 100644
> index 0000000000..45c8ac0cc6
> --- /dev/null
> +++ b/stubs/colo.c
> @@ -0,0 +1,47 @@
> +#include "qemu/osdep.h"
> +#include "qemu/notify.h"
> +#include "net/colo-compare.h"
> +#include "migration/colo.h"
> +#include "migration/migration.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-migration.h"
> +
> +void colo_compare_cleanup(void)
> +{
> +    abort();
> +}
> +
> +void colo_shutdown(void)
> +{
> +    abort();
> +}
> +
> +void *colo_process_incoming_thread(void *opaque)
> +{
> +    abort();
> +}
> +
> +void colo_checkpoint_notify(void *opaque)
> +{
> +    abort();
> +}
> +
> +void migrate_start_colo_process(MigrationState *s)
> +{
> +    abort();
> +}
> +
> +bool migration_in_colo_state(void)
> +{
> +    return false;
> +}
> +
> +bool migration_incoming_in_colo_state(void)
> +{
> +    return false;
> +}
> +
> +bool migrate_colo_enabled(void)
> +{
> +    return false;
> +}
> diff --git a/stubs/meson.build b/stubs/meson.build
> index b2b5956d97..8412cad15f 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -45,6 +45,7 @@ stub_ss.add(files('target-get-monitor-def.c'))
>  stub_ss.add(files('target-monitor-defs.c'))
>  stub_ss.add(files('trace-control.c'))
>  stub_ss.add(files('uuid.c'))
> +stub_ss.add(files('colo.c'))
>  stub_ss.add(files('vmstate.c'))
>  stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
> -- 
> 2.34.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

