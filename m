Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5EE6F0DB2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:15:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8xG-0003ti-Dv; Thu, 27 Apr 2023 17:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps8xD-0003sg-Ow; Thu, 27 Apr 2023 17:15:03 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps8x6-0005xZ-UB; Thu, 27 Apr 2023 17:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682630051; i=lukasstraub2@web.de;
 bh=y7ALjMVfHeFf4zLEhKLKWuszDMyzHFYaKGiecbLXnkU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EeEqYEIPtLHD/ebs1R7QTRnEotCSMr12BLxdsAdh1XvUFlRQ70jEzej1cLTGv46Eg
 9Z6vDaVtUlNU/Cnqd1iiG7g3yZpS54TVup6Jd1qN2aed1NVd2s6S08uv4iOvW4pXv9
 piwfHY6j/hI/+6dMiy6A2W1hwKlAssU2mdlgoAqEU7Gf606cNJBwf8gNHsy+7D0J/3
 WndY+JFijH0f23Cb1bobOSy4aIiiyvTiiaCNMxlr4PBD8CX2vusIvn1OL+NHs+FSvt
 wp9iHFrgJDWB0ThpBiL/8IJwUuMpaVTCXN02g4RnW6FwCmv50Yhvu51jBPPBg7M7TK
 vgOcE8gpVOw6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.107]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzkSZ-1qEE6N3o0X-00vZHb; Thu, 27
 Apr 2023 23:14:11 +0200
Date: Thu, 27 Apr 2023 23:13:42 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, zhanghailiang@xfusion.com, philmd@linaro.org,
 thuth@redhat.com, berrange@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com
Subject: Re: [PATCH v3 3/4] build: move COLO under CONFIG_REPLICATION
Message-ID: <20230427211342.304402d7@gecko.fritz.box>
In-Reply-To: <20230427202946.1007276-4-vsementsov@yandex-team.ru>
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-4-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mImUStzWjkXcuClyw=DjZ+v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:HKW+NlSAZJv+DzZXRjPW6JD122VrtvyWQ4xcWp2w1fyJNU2bGcL
 XPYFmbRvKYENdycf37wHbAjX7sTvC0nprW/tGxITnIhHL38fAI5yz6WzT+qUzcO0ZOkMIuc
 +Add7iW6HtxUIk3XFHALT8nsPN1BqcQSGucmw9oFxcUO5CYjtgivz+8cK/LoT1onmz42EDy
 MFWSoH56a/Qian+osaqkA==
UI-OutboundReport: notjunk:1;M01:P0:T6sUIV8PUWM=;tZgp+QtlWpkTh2RAEZYnKlZEwVz
 Qs5EOBa/ELgGgilK6c7mPE8IxQkcPnTk0hCuzntEYalkFyV9t08K7Zwf6WQrr//cCKb4xcS2i
 ZrPavGalqgHEtE+V9D8B7zKkgRwVMNQjsHw/B/xgDEKmZpGKAzH9QR/ipivSnDNOATXFqComV
 l9dDUtXVWxa92xqeQ/jse770Nf0XDHWkxwnw5QVCOK27CnpqpfgR4ZCCO1kgvIGP9po8Rd300
 ukhujLrBvYcb/vHCssVEm0GF1d6nAkdimpHcVCsnVVxUu05jX5Bwko2g7zQ2/bNX14fUnzVB5
 VqfuR0oi7UnYY0X7tIkXcbpg57yfkvpTvK4mZgw54NEGLbpg1Wg2WuPmhFTYr+qKRnfM+2bGQ
 PeJbvJHbW46L0M7TbAfelcZzLexnyasut1JLPxtXMtxzMNkMVIXmxBg81uYny3iJkD4bHLGpl
 iOLL8OoNvYySgQpuaw2bMCf9pN/2x223Deml8wiHeDPz8a59h9HNbRg7eotVyIxhAExhHE+GI
 DOXs+BnjFN+zQMg1/2hwRwDAbyRss2/QU8BnQUqesiMPc9r7uxRU/gSFufif5B2BbVR0QFih+
 djst6Mlvddk3fVkeAKcTgTHL/yiUexIyZ5w8D5uL24f8DzaxwmQJB5ZGp0NrLlzCQ31oNAuiW
 usUk5P7dSGCg+SpGM5CIUctRFhghn4ETkvvqHUVBG82M0zJik3C6D5W/vSMN0VM9XtZCX6rWA
 24CJHSU4oHiu/7dCpM9nA/YD/OsIMPXIaJOigZ67SBI4JRYYuVzSG7UHf2T8HWGsRkSVYwJr+
 95iyKq9HQs6geVgbCw0TYcr7PmX76Lz1t3n/SoWq65Lq90h6951+LAYbIpZp7guH1Nr7XK1wl
 fJALyBVC0UaDgcUWazY/ANKWpr7WlBx3U/rnA3T1Ok5qVQU8HQ4/T3hwawHET4/uzBOWyUXhs
 9nFGnkR8v8TNFSR5V/mOGnout7g=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/mImUStzWjkXcuClyw=DjZ+v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Apr 2023 23:29:45 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:

> We don't allow to use x-colo capability when replication is not
> configured. So, no reason to build COLO when replication is disabled,
> it's unusable in this case.
>=20
> Note also that the check in migrate_caps_check() is not the only
> restriction: some functions in migration/colo.c will just abort if
> called with not defined CONFIG_REPLICATION, for example:
>=20
>     migration_iteration_finish()
>        case MIGRATION_STATUS_COLO:
>            migrate_start_colo_process()
>                colo_process_checkpoint()
>                    abort()
>=20
> It could probably make sense to have possibility to enable COLO without
> REPLICATION, but this requires deeper audit of colo & replication code,
> which may be done later if needed.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  hmp-commands.hx                |  2 ++
>  migration/colo.c               | 28 -------------------------
>  migration/meson.build          |  6 ++++--
>  migration/migration-hmp-cmds.c |  2 ++
>  migration/options.c            | 17 ++++++++--------
>  qapi/migration.json            | 12 +++++++----
>  stubs/colo.c                   | 37 ++++++++++++++++++++++++++++++++++
>  stubs/meson.build              |  1 +
>  8 files changed, 62 insertions(+), 43 deletions(-)
>  create mode 100644 stubs/colo.c
>=20
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index bb85ee1d26..fbd0932232 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1035,6 +1035,7 @@ SRST
>    migration (or once already in postcopy).
>  ERST
> =20
> +#ifdef CONFIG_REPLICATION
>      {
>          .name       =3D "x_colo_lost_heartbeat",
>          .args_type  =3D "",
> @@ -1043,6 +1044,7 @@ ERST
>                        "a failover or takeover is needed.",
>          .cmd =3D hmp_x_colo_lost_heartbeat,
>      },
> +#endif
> =20
>  SRST
>  ``x_colo_lost_heartbeat``
> diff --git a/migration/colo.c b/migration/colo.c
> index 07bfa21fea..e4af47eeeb 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -26,9 +26,7 @@
>  #include "qemu/rcu.h"
>  #include "migration/failover.h"
>  #include "migration/ram.h"
> -#ifdef CONFIG_REPLICATION
>  #include "block/replication.h"
> -#endif
>  #include "net/colo-compare.h"
>  #include "net/colo.h"
>  #include "block/block.h"
> @@ -68,7 +66,6 @@ static bool colo_runstate_is_stopped(void)
>  static void secondary_vm_do_failover(void)
>  {
>  /* COLO needs enable block-replication */
> -#ifdef CONFIG_REPLICATION
>      int old_state;
>      MigrationIncomingState *mis =3D migration_incoming_get_current();
>      Error *local_err =3D NULL;
> @@ -133,14 +130,10 @@ static void secondary_vm_do_failover(void)
>      if (mis->migration_incoming_co) {
>          qemu_coroutine_enter(mis->migration_incoming_co);
>      }
> -#else
> -    abort();
> -#endif
>  }
> =20
>  static void primary_vm_do_failover(void)
>  {
> -#ifdef CONFIG_REPLICATION
>      MigrationState *s =3D migrate_get_current();
>      int old_state;
>      Error *local_err =3D NULL;
> @@ -181,9 +174,6 @@ static void primary_vm_do_failover(void)
> =20
>      /* Notify COLO thread that failover work is finished */
>      qemu_sem_post(&s->colo_exit_sem);
> -#else
> -    abort();
> -#endif
>  }
> =20
>  COLOMode get_colo_mode(void)
> @@ -217,7 +207,6 @@ void colo_do_failover(void)
>      }
>  }
> =20
> -#ifdef CONFIG_REPLICATION
>  void qmp_xen_set_replication(bool enable, bool primary,
>                               bool has_failover, bool failover,
>                               Error **errp)
> @@ -271,7 +260,6 @@ void qmp_xen_colo_do_checkpoint(Error **errp)
>      /* Notify all filters of all NIC to do checkpoint */
>      colo_notify_filters_event(COLO_EVENT_CHECKPOINT, errp);
>  }
> -#endif
> =20
>  COLOStatus *qmp_query_colo_status(Error **errp)
>  {
> @@ -435,15 +423,11 @@ static int colo_do_checkpoint_transaction(Migration=
State *s,
>      }
>      qemu_mutex_lock_iothread();
> =20
> -#ifdef CONFIG_REPLICATION
>      replication_do_checkpoint_all(&local_err);
>      if (local_err) {
>          qemu_mutex_unlock_iothread();
>          goto out;
>      }
> -#else
> -        abort();
> -#endif
> =20
>      colo_send_message(s->to_dst_file, COLO_MESSAGE_VMSTATE_SEND, &local_=
err);
>      if (local_err) {
> @@ -561,15 +545,11 @@ static void colo_process_checkpoint(MigrationState =
*s)
>      object_unref(OBJECT(bioc));
> =20
>      qemu_mutex_lock_iothread();
> -#ifdef CONFIG_REPLICATION
>      replication_start_all(REPLICATION_MODE_PRIMARY, &local_err);
>      if (local_err) {
>          qemu_mutex_unlock_iothread();
>          goto out;
>      }
> -#else
> -        abort();
> -#endif
> =20
>      vm_start();
>      qemu_mutex_unlock_iothread();
> @@ -748,7 +728,6 @@ static void colo_incoming_process_checkpoint(Migratio=
nIncomingState *mis,
>          return;
>      }
> =20
> -#ifdef CONFIG_REPLICATION
>      replication_get_error_all(&local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -765,9 +744,6 @@ static void colo_incoming_process_checkpoint(Migratio=
nIncomingState *mis,
>          qemu_mutex_unlock_iothread();
>          return;
>      }
> -#else
> -    abort();
> -#endif
>      /* Notify all filters of all NIC to do checkpoint */
>      colo_notify_filters_event(COLO_EVENT_CHECKPOINT, &local_err);
> =20
> @@ -874,15 +850,11 @@ void *colo_process_incoming_thread(void *opaque)
>      object_unref(OBJECT(bioc));
> =20
>      qemu_mutex_lock_iothread();
> -#ifdef CONFIG_REPLICATION
>      replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
>      if (local_err) {
>          qemu_mutex_unlock_iothread();
>          goto out;
>      }
> -#else
> -        abort();
> -#endif
>      vm_start();
>      qemu_mutex_unlock_iothread();
>      trace_colo_vm_state_change("stop", "run");
> diff --git a/migration/meson.build b/migration/meson.build
> index 480ff6854a..9c6a8e65d3 100644
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
> @@ -30,6 +28,10 @@ softmmu_ss.add(files(
>    'threadinfo.c',
>  ), gnutls)
> =20
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo-failover.c', 'colo.c'))
> +endif
> +
>  softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
>  if get_option('live_block_migration').allowed()
>    softmmu_ss.add(files('block.c'))
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmd=
s.c
> index 4e9f00e7dc..9885d7c9f7 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -643,6 +643,7 @@ void hmp_migrate_start_postcopy(Monitor *mon, const Q=
Dict *qdict)
>      hmp_handle_error(mon, err);
>  }
> =20
> +#ifdef CONFIG_REPLICATION
>  void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
>  {
>      Error *err =3D NULL;
> @@ -650,6 +651,7 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon, const QD=
ict *qdict)
>      qmp_x_colo_lost_heartbeat(&err);
>      hmp_handle_error(mon, err);
>  }
> +#endif
> =20
>  typedef struct HMPMigrationStatus {
>      QEMUTimer *timer;
> diff --git a/migration/options.c b/migration/options.c
> index 912cbadddb..eef2bd0f16 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -171,7 +171,9 @@ Property migration_properties[] =3D {
>      DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_=
RAM),
>      DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
>                          MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
> +#ifdef CONFIG_REPLICATION
>      DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
> +#endif
>      DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RA=
M),
>      DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
>      DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PAT=
H),
> @@ -209,9 +211,13 @@ bool migrate_block(void)
> =20
>  bool migrate_colo(void)
>  {
> +#ifdef CONFIG_REPLICATION
>      MigrationState *s =3D migrate_get_current();
> =20
>      return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
> +#else
> +    return false;
> +#endif
>  }
> =20
>  bool migrate_compress(void)
> @@ -401,7 +407,9 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_sna=
pshot,
>      MIGRATION_CAPABILITY_RDMA_PIN_ALL,
>      MIGRATION_CAPABILITY_COMPRESS,
>      MIGRATION_CAPABILITY_XBZRLE,
> +#ifdef CONFIG_REPLICATION
>      MIGRATION_CAPABILITY_X_COLO,
> +#endif
>      MIGRATION_CAPABILITY_VALIDATE_UUID,
>      MIGRATION_CAPABILITY_ZERO_COPY_SEND);
> =20
> @@ -428,15 +436,6 @@ bool migrate_caps_check(bool *old_caps, bool *new_ca=
ps, Error **errp)
>      }
>  #endif
> =20
> -#ifndef CONFIG_REPLICATION
> -    if (new_caps[MIGRATION_CAPABILITY_X_COLO]) {
> -        error_setg(errp, "QEMU compiled without replication module"
> -                   " can't enable COLO");
> -        error_append_hint(errp, "Please enable replication before COLO.\=
n");
> -        return false;
> -    }
> -#endif
> -
>      if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>          /* This check is reasonably expensive, so only when it's being
>           * set the first time, also it's only the destination that needs
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 2c35b7b9cf..5cb095f7b3 100644
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
> @@ -1381,7 +1382,8 @@
>  #
>  ##
>  { 'command': 'x-colo-lost-heartbeat',
> -  'features': [ 'unstable' ] }
> +  'features': [ 'unstable' ],
> +  'if': 'CONFIG_REPLICATION' }
> =20
>  ##
>  # @migrate_cancel:
> @@ -1657,7 +1659,8 @@
>  ##
>  { 'struct': 'COLOStatus',
>    'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
> -            'reason': 'COLOExitReason' } }
> +            'reason': 'COLOExitReason' },
> +  'if': 'CONFIG_REPLICATION' }
> =20
>  ##
>  # @query-colo-status:
> @@ -1674,7 +1677,8 @@
>  # Since: 3.1
>  ##
>  { 'command': 'query-colo-status',
> -  'returns': 'COLOStatus' }
> +  'returns': 'COLOStatus',
> +  'if': 'CONFIG_REPLICATION' }
> =20
>  ##
>  # @migrate-recover:
> diff --git a/stubs/colo.c b/stubs/colo.c
> new file mode 100644
> index 0000000000..f306ab45d6
> --- /dev/null
> +++ b/stubs/colo.c
> @@ -0,0 +1,37 @@
> +#include "qemu/osdep.h"
> +#include "qemu/notify.h"
> +#include "net/colo-compare.h"
> +#include "migration/colo.h"
> +#include "migration/migration.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-migration.h"
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



--=20


--Sig_/mImUStzWjkXcuClyw=DjZ+v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRK5YsACgkQNasLKJxd
slg1lg//WJU7z9qwgOTcZPy7bqkXeO7I9rrYv8l7fh5kEQ5zyNwz/fjGOh5n+T48
AAhkas2vb6JmuIFGvsq7cLDF8zGKEEi4g6kySwiKbs4sfO5VaQ/acJ6BoBM1IYMo
hOView1tDsWBVV8LJQ0rtx/HWaR2nRM1w2TvTJLB5zjP3DAf6hD0ilkJIRBqcVlm
0xyASl0Lbd3XZS45FatvPpD2gnM+UgAyg5zRDS+bs3vrevomqLMbUpQ8t7adm+3w
wKQ4EQUpBPA9sBcu0UHM5Q9FEwcCwv/FUj0z+AR24vvpKEXdPul4zlaHwMn2ynk1
WEaJ8aTs1FMSmVwDCzfwSoQIb+w+VbuvDpBjjqDyqIaZ2wv+kRUPF0jZPuBRBLzC
JfURJFFsyalygBmjyDbfgoxvWl79M7DOm+UnWLCGElzRpfyZkgYd5OaggdHEesM6
RvdrAHzOShzoPOLRVXZV0oqLnakrLnCWTuBi96MO1uQAa/Qq+DfaoGF9dC0xzGLV
jN/XHPPPnH6pkswnTMGRySNBa4UEMihQUlmnrS5M6xF3ou9s85SJTD97iKhTqMZl
pA4itw8KZDKWrhfMWq4QT6aha72QUZFkN8DavR2XLJ8pKwth9kDYEUYWZZ9/qxhb
NoHXIByE2OZTgx4ehLUVnBbwOckX0+JbiOUr3OdIxdJZeBah+YE=
=i8Zk
-----END PGP SIGNATURE-----

--Sig_/mImUStzWjkXcuClyw=DjZ+v--

