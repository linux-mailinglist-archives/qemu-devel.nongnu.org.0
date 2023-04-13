Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12D6E0F26
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 15:49:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmxIg-0004zj-Ad; Thu, 13 Apr 2023 09:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pmxIe-0004z4-08; Thu, 13 Apr 2023 09:47:44 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pmxIa-00029C-Pd; Thu, 13 Apr 2023 09:47:43 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:47ac:0:640:70fa:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id A9AF75E785;
 Thu, 13 Apr 2023 16:47:28 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b73e::1:5] (unknown
 [2a02:6b8:b081:b73e::1:5])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id QlX0170OiCg0-1pq9U6Rr; Thu, 13 Apr 2023 16:47:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681393647; bh=CILOWpjr+ZpYWQqpAgZAWj23uAwe8Usi8IXn9qlMZdI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ZNLzqG2SkPJtBakkYP5n243ZQaHMwOO5Owo45VJVOkS1D+KZOESj+3T2A9LGL7xZ7
 SLn6zedS21QWxShxq3H3wbmPwms5nSvJTJXP9w4npBeCR5cOEto9HG5qAmd2A8HKVL
 a0FpswN+fQAI0QvSYO+3Isv8utuduHjMQOtpKc1E=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e7e7e3c6-c4f5-aa9c-c4ee-f3f28555b81b@yandex-team.ru>
Date: Thu, 13 Apr 2023 16:47:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] replication: compile out some staff when replication is
 not configured
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "hreitz@redhat.com" <hreitz@redhat.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "Zhang, Hailiang" <zhanghailiang@xfusion.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>,
 "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>,
 "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>
References: <20230411145112.497785-1-vsementsov@yandex-team.ru>
 <MWHPR11MB003181F7E37662CE2F22C17F9B989@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <MWHPR11MB003181F7E37662CE2F22C17F9B989@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 13.04.23 12:52, Zhang, Chen wrote:
> 
> 
>> -----Original Message-----
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Sent: Tuesday, April 11, 2023 10:51 PM
>> To: qemu-devel@nongnu.org
>> Cc: qemu-block@nongnu.org; pbonzini@redhat.com; armbru@redhat.com;
>> eblake@redhat.com; jasowang@redhat.com; dgilbert@redhat.com;
>> quintela@redhat.com; hreitz@redhat.com; kwolf@redhat.com; Zhang,
>> Hailiang <zhanghailiang@xfusion.com>; Zhang, Chen
>> <chen.zhang@intel.com>; lizhijian@fujitsu.com;
>> wencongyang2@huawei.com; xiechanglong.d@gmail.com; den-
>> plotnikov@yandex-team.ru; Vladimir Sementsov-Ogievskiy
>> <vsementsov@yandex-team.ru>
>> Subject: [PATCH] replication: compile out some staff when replication is not
>> configured
>>
>> Don't compile-in replication-related files when replication is disabled in
>> config.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>
>> Hi all!
>>
>> I'm unsure, should it be actually separate --disable-colo / --enable-colo
>> options or it's really used only together with replication staff.. So, I decided
>> to start with simpler variant.
>>
> 
> For replication, I think there's nothing wrong with the idea.
> But not so for COLO.  COLO project consists of three independent parts: Replication, migration, net-proxy.
> Each one have ability to run alone for other proposals. For example we can just run filter-mirror/redirector for networking
> Analysis/debugs. Although the best practice of COLO is to make the three modules work together, in fact, we can also
> use only some modules of COLO for other usage scenarios. Like COLO migration + net-proxy for shared disk, etc...
> So I think no need to disable all COLO related modules when replication is not configured.
> For details:
> https://wiki.qemu.org/Features/COLO
> 

So, if I want to have an option to disable all COLO modules, do you mean it should be additional --disable-colo option? Or better keep one option --disable-replication (and, maybe just rename to to --disable-colo)?

> Thanks
> Chen
> 
>>
>>   block/meson.build     |  2 +-
>>   migration/meson.build |  6 ++++--
>>   net/meson.build       |  8 ++++----
>>   qapi/migration.json   |  6 ++++--
>>   stubs/colo.c          | 46 +++++++++++++++++++++++++++++++++++++++++++
>>   stubs/meson.build     |  1 +
>>   6 files changed, 60 insertions(+), 9 deletions(-)  create mode 100644
>> stubs/colo.c
>>
>> diff --git a/block/meson.build b/block/meson.build index
>> 382bec0e7d..b9a72e219b 100644
>> --- a/block/meson.build
>> +++ b/block/meson.build
>> @@ -84,7 +84,7 @@ block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-
>> win32.c', 'win32-aio.c')
>>   block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
>>   block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
>>   block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c')) -if not
>> get_option('replication').disabled()
>> +if get_option('replication').allowed()
>>     block_ss.add(files('replication.c'))
>>   endif
>>   block_ss.add(when: libaio, if_true: files('linux-aio.c')) diff --git
>> a/migration/meson.build b/migration/meson.build index
>> 0d1bb9f96e..8180eaea7b 100644
>> --- a/migration/meson.build
>> +++ b/migration/meson.build
>> @@ -13,8 +13,6 @@ softmmu_ss.add(files(
>>     'block-dirty-bitmap.c',
>>     'channel.c',
>>     'channel-block.c',
>> -  'colo-failover.c',
>> -  'colo.c',
>>     'exec.c',
>>     'fd.c',
>>     'global_state.c',
>> @@ -29,6 +27,10 @@ softmmu_ss.add(files(
>>     'threadinfo.c',
>>   ), gnutls)
>>
>> +if get_option('replication').allowed()
>> +  softmmu_ss.add(files('colo.c', 'colo-failover.c')) endif
>> +
>>   softmmu_ss.add(when: rdma, if_true: files('rdma.c'))  if
>> get_option('live_block_migration').allowed()
>>     softmmu_ss.add(files('block.c'))
>> diff --git a/net/meson.build b/net/meson.build index
>> 87afca3e93..634ab71cc6 100644
>> --- a/net/meson.build
>> +++ b/net/meson.build
>> @@ -1,13 +1,9 @@
>>   softmmu_ss.add(files(
>>     'announce.c',
>>     'checksum.c',
>> -  'colo-compare.c',
>> -  'colo.c',
>>     'dump.c',
>>     'eth.c',
>>     'filter-buffer.c',
>> -  'filter-mirror.c',
>> -  'filter-rewriter.c',
>>     'filter.c',
>>     'hub.c',
>>     'net-hmp-cmds.c',
>> @@ -19,6 +15,10 @@ softmmu_ss.add(files(
>>     'util.c',
>>   ))
>>
>> +if get_option('replication').allowed()
>> +  softmmu_ss.add(files('colo-compare.c', 'colo.c', 'filter-rewriter.c',
>> +'filter-mirror.c')) endif
>> +
>>   softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>>
>>   if have_l2tpv3
>> diff --git a/qapi/migration.json b/qapi/migration.json index
>> c84fa10e86..5b81e09369 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1685,7 +1685,8 @@
>>   ##
>>   { 'struct': 'COLOStatus',
>>     'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
>> -            'reason': 'COLOExitReason' } }
>> +            'reason': 'COLOExitReason' },
>> +  'if': 'CONFIG_REPLICATION' }
>>
>>   ##
>>   # @query-colo-status:
>> @@ -1702,7 +1703,8 @@
>>   # Since: 3.1
>>   ##
>>   { 'command': 'query-colo-status',
>> -  'returns': 'COLOStatus' }
>> +  'returns': 'COLOStatus',
>> +  'if': 'CONFIG_REPLICATION' }
>>
>>   ##
>>   # @migrate-recover:
>> diff --git a/stubs/colo.c b/stubs/colo.c new file mode 100644 index
>> 0000000000..5a02540baa
>> --- /dev/null
>> +++ b/stubs/colo.c
>> @@ -0,0 +1,46 @@
>> +#include "qemu/osdep.h"
>> +#include "qemu/notify.h"
>> +#include "net/colo-compare.h"
>> +#include "migration/colo.h"
>> +#include "qapi/error.h"
>> +#include "qapi/qapi-commands-migration.h"
>> +
>> +void colo_compare_cleanup(void)
>> +{
>> +    abort();
>> +}
>> +
>> +void colo_shutdown(void)
>> +{
>> +    abort();
>> +}
>> +
>> +void *colo_process_incoming_thread(void *opaque) {
>> +    abort();
>> +}
>> +
>> +void colo_checkpoint_notify(void *opaque) {
>> +    abort();
>> +}
>> +
>> +void migrate_start_colo_process(MigrationState *s) {
>> +    abort();
>> +}
>> +
>> +bool migration_in_colo_state(void)
>> +{
>> +    return false;
>> +}
>> +
>> +bool migration_incoming_in_colo_state(void)
>> +{
>> +    return false;
>> +}
>> +
>> +void qmp_x_colo_lost_heartbeat(Error **errp) {
>> +    error_setg(errp, "COLO support is not built in"); }
>> diff --git a/stubs/meson.build b/stubs/meson.build index
>> b2b5956d97..8412cad15f 100644
>> --- a/stubs/meson.build
>> +++ b/stubs/meson.build
>> @@ -45,6 +45,7 @@ stub_ss.add(files('target-get-monitor-def.c'))
>>   stub_ss.add(files('target-monitor-defs.c'))
>>   stub_ss.add(files('trace-control.c'))
>>   stub_ss.add(files('uuid.c'))
>> +stub_ss.add(files('colo.c'))
>>   stub_ss.add(files('vmstate.c'))
>>   stub_ss.add(files('vm-stop.c'))
>>   stub_ss.add(files('win32-kbd-hook.c'))
>> --
>> 2.34.1
> 

-- 
Best regards,
Vladimir


