Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA696E8469
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 00:13:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppG24-0000lP-FP; Wed, 19 Apr 2023 18:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppG22-0000lB-1o; Wed, 19 Apr 2023 18:12:06 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppG1z-00058F-7j; Wed, 19 Apr 2023 18:12:05 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id A9A4B5FAFC;
 Thu, 20 Apr 2023 01:11:52 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b583::1:16] (unknown
 [2a02:6b8:b081:b583::1:16])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id oBmTUm05JmI0-CGDBUpXC; Thu, 20 Apr 2023 01:11:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681942311; bh=KEO+dOQv0MKcDGQ91XCwC5NLdZVYPBZcAlQyjn0x5dE=;
 h=In-Reply-To:Cc:Date:References:To:From:Subject:Message-ID;
 b=F7P72Ch+Ly+nM84rdpQ7bavfTvRK61K/gvkW9h71kCKOs9FkKB563ce7AlNPcopNc
 JjuBCV8SOQr5908wC6vibgRqq/y+hj7Mbx/GMzhFFfiB3eqzW38X3gSaRRk4gobjUp
 kc7q8zMIvpKpCDeCnmo2bEVncOc8ryCxiI41b1e8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a436a337-a708-8db4-7b3a-d55d2930f042@yandex-team.ru>
Date: Thu, 20 Apr 2023 01:11:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] replication: compile out some staff when replication is
 not configured
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
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
 <e7e7e3c6-c4f5-aa9c-c4ee-f3f28555b81b@yandex-team.ru>
 <MWHPR11MB0031A6CAE72D321F342205F09B999@MWHPR11MB0031.namprd11.prod.outlook.com>
 <7f743d75-5474-6c87-439f-5513675fae1f@yandex-team.ru>
 <MWHPR11MB0031431DF411113A4B6D6AF99B9F9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <fa4499d9-b8eb-2a5e-1903-d73252373777@yandex-team.ru>
In-Reply-To: <fa4499d9-b8eb-2a5e-1903-d73252373777@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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

On 17.04.23 20:19, Vladimir Sementsov-Ogievskiy wrote:
> On 16.04.23 21:44, Zhang, Chen wrote:
>>
>>
>>> -----Original Message-----
>>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> Sent: Friday, April 14, 2023 5:51 PM
>>> To: Zhang, Chen <chen.zhang@intel.com>; qemu-devel@nongnu.org
>>> Cc: qemu-block@nongnu.org; pbonzini@redhat.com; armbru@redhat.com;
>>> eblake@redhat.com; jasowang@redhat.com; dgilbert@redhat.com;
>>> quintela@redhat.com; hreitz@redhat.com; kwolf@redhat.com; Zhang,
>>> Hailiang <zhanghailiang@xfusion.com>; lizhijian@fujitsu.com;
>>> wencongyang2@huawei.com; xiechanglong.d@gmail.com; den-
>>> plotnikov@yandex-team.ru
>>> Subject: Re: [PATCH] replication: compile out some staff when replication is
>>> not configured
>>>
>>> On 14.04.23 04:24, Zhang, Chen wrote:
>>>>> So, if I want to have an option to disable all COLO modules, do you
>>>>> mean it should be additional --disable-colo option? Or better keep
>>>>> one option -- disable-replication (and, maybe just rename to to --disable-
>>> colo)?
>>>> I think keep the option --disable-replication is enough.
>>>> Generally speaking, these three modules do not belong to COLO, It has
>>> been decoupled at the time of design.
>>>> Instead, COLO is formed when these three modules are used in
>>> combination.
>>>
>>> But it's not enough to me, I want to have a possibility to not build the
>>> subsystem I don't need.
>>
>> As I said, COLO not a specific subsystem, It is a usage of three general subsystems.
>> Let's back to this patch, it try to not build block replication when not configured. It's OK.
>> Although COLO may be the only user of replication,  but can't assume all the COLO used subsystem
>> not needed, even have a --disable-colo. For example in this patch disabled the net/filter-mirror/redirector....
>> Qemu network filter is a general framework with many submodules: filter-buffer/replay/mirror/rewriter.....
>> Logically speaking, It is completely irrelevant with COLO.
>>
> 
> OK, understand now, thanks for explanation!
> 
> 

Hmm, OK, filters are separate.

But what's the sense in COLO subsystem when replication is disabled?

We have an explicit check in migration.c in migrate_caps_check():

#ifndef CONFIG_REPLICATION
     if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
         error_setg(errp, "QEMU compiled without replication module"
                    " can't enable COLO");
         error_append_hint(errp, "Please enable replication before COLO.\n");
         return false;
     }
#endif


So, x-colo capability - an entry point to COLO can't be used anyway. So, no reason to build it in?

-- 
Best regards,
Vladimir


