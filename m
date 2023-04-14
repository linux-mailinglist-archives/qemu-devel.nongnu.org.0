Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28C6E1FCD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 11:51:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnG5D-0007Ay-OP; Fri, 14 Apr 2023 05:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pnG57-00079x-6l; Fri, 14 Apr 2023 05:51:04 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pnG4z-0003dL-J8; Fri, 14 Apr 2023 05:51:00 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 348955F0BB;
 Fri, 14 Apr 2023 12:50:37 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b73e::1:5] (unknown
 [2a02:6b8:b081:b73e::1:5])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id YoUXkE0OqSw0-SubQhSbl; Fri, 14 Apr 2023 12:50:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681465836; bh=mG93+UTy4Aj+zCQEh5ow0zANcch9mbwsh5q7zMJurzA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Zqt8XJ8ToEZDxSB4E5rBwdlK/UBzamv5uBGQBWfD3LDiDPSrmYczXOE0ST84CNPRv
 Ctz/jP0DxEPibLu/e0PO8y8zOATXp83lU9KNB8jci9HJ7oVWNn3SzsHWHvzWVezbuF
 p4/9/zwIbnFA7sdV5R1k0Ws9owPkaQTA7hLj34x4=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7f743d75-5474-6c87-439f-5513675fae1f@yandex-team.ru>
Date: Fri, 14 Apr 2023 12:50:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] replication: compile out some staff when replication is
 not configured
Content-Language: en-US
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
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <MWHPR11MB0031A6CAE72D321F342205F09B999@MWHPR11MB0031.namprd11.prod.outlook.com>
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

On 14.04.23 04:24, Zhang, Chen wrote:
>> So, if I want to have an option to disable all COLO modules, do you mean it
>> should be additional --disable-colo option? Or better keep one option --
>> disable-replication (and, maybe just rename to to --disable-colo)?
> I think keep the option --disable-replication is enough.
> Generally speaking, these three modules do not belong to COLO, It has been decoupled at the time of design.
> Instead, COLO is formed when these three modules are used in combination.

But it's not enough to me, I want to have a possibility to not build the subsystem I don't need.

-- 
Best regards,
Vladimir


