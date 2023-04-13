Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507356E088D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 10:05:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmrvU-0000pu-M0; Thu, 13 Apr 2023 04:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pmrvP-0000p5-Ey; Thu, 13 Apr 2023 04:03:23 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pmrvM-0002Gh-6C; Thu, 13 Apr 2023 04:03:23 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:47ac:0:640:70fa:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 9B1F85F489;
 Thu, 13 Apr 2023 11:03:08 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b431::1:d] (unknown
 [2a02:6b8:b081:b431::1:d])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 53ST650Ok8c0-Qa1v2W3a; Thu, 13 Apr 2023 11:03:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681372987; bh=YN8gyv/FTxR5djE8I8nbEHCLFxVroT9Y+ayvxcUqXMM=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=OZxWGJRiy6Ngv+01FADRCQSnNPaqrO+G25cDIxp5uVS5vKjfMkqsizzM+M6+k/Jlp
 xDuH/5S4GV/ofMuRqIpyy8uEHKQyi1RB35pEmpvzib5nT87qic9VDKMtR7H4xnfRXI
 0F37+uRsQWJUsKYObrzq0xOs7lq6BDR6Gi5TmtmA=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d3079b1e-f110-dd0c-9061-16140bc6f6ae@yandex-team.ru>
Date: Thu, 13 Apr 2023 11:03:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] replication: compile out some staff when replication is
 not configured
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 quintela@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 zhanghailiang@xfusion.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 den-plotnikov@yandex-team.ru
References: <20230411145112.497785-1-vsementsov@yandex-team.ru>
Content-Language: en-US
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <20230411145112.497785-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Just a few minor nits

On 4/11/23 5:51 PM, Vladimir Sementsov-Ogievskiy wrote:
> Don't compile-in replication-related files when replication is disabled
> in config.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
> 
> Hi all!
> 
> I'm unsure, should it be actually separate
> --disable-colo / --enable-colo options or it's really used only together
> with replication staff.. So, I decided to start with simpler variant.

You probably meant 'stuff' and not 'staff' in the commit message and 
here as well?

> 
>   block/meson.build     |  2 +-
>   migration/meson.build |  6 ++++--
>   net/meson.build       |  8 ++++----
>   qapi/migration.json   |  6 ++++--
>   stubs/colo.c          | 46 +++++++++++++++++++++++++++++++++++++++++++
>   stubs/meson.build     |  1 +
>   6 files changed, 60 insertions(+), 9 deletions(-)
>   create mode 100644 stubs/colo.c
> 
> diff --git a/block/meson.build b/block/meson.build
> index 382bec0e7d..b9a72e219b 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -84,7 +84,7 @@ block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c')
>   block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
>   block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
>   block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c'))
> -if not get_option('replication').disabled()
> +if get_option('replication').allowed()
>     block_ss.add(files('replication.c'))
>   endif
>   block_ss.add(when: libaio, if_true: files('linux-aio.c'))
> diff --git a/migration/meson.build b/migration/meson.build
> index 0d1bb9f96e..8180eaea7b 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -13,8 +13,6 @@ softmmu_ss.add(files(
>     'block-dirty-bitmap.c',
>     'channel.c',
>     'channel-block.c',
> -  'colo-failover.c',
> -  'colo.c',
>     'exec.c',
>     'fd.c',
>     'global_state.c',
> @@ -29,6 +27,10 @@ softmmu_ss.add(files(
>     'threadinfo.c',
>   ), gnutls)
>   
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo.c', 'colo-failover.c'))
> +endif
> +
>   softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
>   if get_option('live_block_migration').allowed()
>     softmmu_ss.add(files('block.c'))
> diff --git a/net/meson.build b/net/meson.build
> index 87afca3e93..634ab71cc6 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -1,13 +1,9 @@
>   softmmu_ss.add(files(
>     'announce.c',
>     'checksum.c',
> -  'colo-compare.c',
> -  'colo.c',
>     'dump.c',
>     'eth.c',
>     'filter-buffer.c',
> -  'filter-mirror.c',
> -  'filter-rewriter.c',
>     'filter.c',
>     'hub.c',
>     'net-hmp-cmds.c',
> @@ -19,6 +15,10 @@ softmmu_ss.add(files(
>     'util.c',
>   ))
>   
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo-compare.c', 'colo.c', 'filter-rewriter.c', 'filter-mirror.c'))
> +endif
> +
>   softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>   
>   if have_l2tpv3
> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..5b81e09369 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1685,7 +1685,8 @@
>   ##
>   { 'struct': 'COLOStatus',
>     'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
> -            'reason': 'COLOExitReason' } }
> +            'reason': 'COLOExitReason' },
> +  'if': 'CONFIG_REPLICATION' }
>   
>   ##
>   # @query-colo-status:
> @@ -1702,7 +1703,8 @@
>   # Since: 3.1
>   ##
>   { 'command': 'query-colo-status',
> -  'returns': 'COLOStatus' }
> +  'returns': 'COLOStatus',
> +  'if': 'CONFIG_REPLICATION' }
>   
>   ##
>   # @migrate-recover:
> diff --git a/stubs/colo.c b/stubs/colo.c
> new file mode 100644
> index 0000000000..5a02540baa
> --- /dev/null
> +++ b/stubs/colo.c
> @@ -0,0 +1,46 @@
> +#include "qemu/osdep.h"
> +#include "qemu/notify.h"
> +#include "net/colo-compare.h"
> +#include "migration/colo.h"
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
> +void qmp_x_colo_lost_heartbeat(Error **errp)
> +{
> +    error_setg(errp, "COLO support is not built in");

Maybe 'built-in' with a dash for consistency with usb-dev-stub?

> +}
> diff --git a/stubs/meson.build b/stubs/meson.build
> index b2b5956d97..8412cad15f 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -45,6 +45,7 @@ stub_ss.add(files('target-get-monitor-def.c'))
>   stub_ss.add(files('target-monitor-defs.c'))
>   stub_ss.add(files('trace-control.c'))
>   stub_ss.add(files('uuid.c'))
> +stub_ss.add(files('colo.c'))
>   stub_ss.add(files('vmstate.c'))
>   stub_ss.add(files('vm-stop.c'))
>   stub_ss.add(files('win32-kbd-hook.c'))

