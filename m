Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CDC6F0DC9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:32:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps9CY-0008Ry-HO; Thu, 27 Apr 2023 17:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps9CR-0008RW-T7; Thu, 27 Apr 2023 17:30:49 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps9CN-0000do-Ap; Thu, 27 Apr 2023 17:30:46 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2E7C1609B7;
 Fri, 28 Apr 2023 00:30:31 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b438::1:2b] (unknown
 [2a02:6b8:b081:b438::1:2b])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TUQqZ30OkqM0-ObrrxPui; Fri, 28 Apr 2023 00:30:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682631030; bh=hd7JI6i378RvSEw2c4opEvYGg2VD0UzsSr6tg7DECdM=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=dptXeRqc4Vz8ZgHn5yh3R0RAno0xykjsW1CIitv9+YVd5dUYkDHBD3WFfjkHMrpnq
 fJdjJHyd2IhrJKzqIF1NpIAq3vAMsuffJ8eICd181XLYrLnNTp+QH5MJ8txxr8Vzg+
 sWG39pFrnRs0joHKhbYiBfU1cp5NiLy8vi9xpz9g=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a3800d55-a232-dd3b-4c01-c4263d56a2f2@yandex-team.ru>
Date: Fri, 28 Apr 2023 00:30:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/4] configure: add --disable-colo-proxy option
Content-Language: en-US
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, zhanghailiang@xfusion.com, philmd@linaro.org,
 thuth@redhat.com, berrange@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-5-vsementsov@yandex-team.ru>
 <20230427211856.54dd2997@gecko.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230427211856.54dd2997@gecko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 28.04.23 00:18, Lukas Straub wrote:
> On Thu, 27 Apr 2023 23:29:46 +0300
> Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>  wrote:
> 
>> Add option to not build filter-mirror, filter-rewriter and
>> colo-compare when they are not needed.
>>
>> There could be more agile configuration, for example add separate
>> options for each filter, but that may be done in future on demand. The
>> aim of this patch is to make possible to disable the whole COLO Proxy
>> subsystem.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>> ---
>>   meson_options.txt             |  2 ++
>>   net/meson.build               | 14 ++++++++++----
>>   scripts/meson-buildoptions.sh |  3 +++
>>   stubs/colo-compare.c          |  7 +++++++
>>   stubs/meson.build             |  1 +
>>   5 files changed, 23 insertions(+), 4 deletions(-)
>>   create mode 100644 stubs/colo-compare.c
>>
>> diff --git a/meson_options.txt b/meson_options.txt
>> index 2471dd02da..b59e7ae342 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -289,6 +289,8 @@ option('live_block_migration', type: 'feature', value: 'auto',
>>          description: 'block migration in the main migration stream')
>>   option('replication', type: 'feature', value: 'auto',
>>          description: 'replication support')
>> +option('colo_proxy', type: 'feature', value: 'auto',
>> +       description: 'colo-proxy support')
>>   option('bochs', type: 'feature', value: 'auto',
>>          description: 'bochs image format support')
>>   option('cloop', type: 'feature', value: 'auto',
>> diff --git a/net/meson.build b/net/meson.build
>> index 87afca3e93..4cfc850c69 100644
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
>> @@ -19,6 +15,16 @@ softmmu_ss.add(files(
>>     'util.c',
>>   ))
>>   
>> +if get_option('replication').allowed() or \
>> +    get_option('colo_proxy').allowed()
>> +  softmmu_ss.add(files('colo-compare.c'))
>> +  softmmu_ss.add(files('colo.c'))
>> +endif
>> +
>> +if get_option('colo_proxy').allowed()
>> +  softmmu_ss.add(files('filter-mirror.c', 'filter-rewriter.c'))
>> +endif
>> +
> The last discussion didn't really come to a conclusion, but I still
> think that 'filter-mirror.c' (which also contains filter-redirect)
> should be left unchanged.
> 

OK for me, I'll wait a bit for more comments and resend with

  @@ -22,7 +22,7 @@ if get_option('replication').allowed() or \
   endif
   
   if get_option('colo_proxy').allowed()
  -  softmmu_ss.add(files('filter-mirror.c', 'filter-rewriter.c'))
  +  softmmu_ss.add(files('filter-rewriter.c'))
   endif
   
   softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))


applied here, if no other strong opinion.

-- 
Best regards,
Vladimir


