Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E86E8CFC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:41:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPq0-0002uY-T7; Thu, 20 Apr 2023 04:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppPpq-0002t9-I5; Thu, 20 Apr 2023 04:40:10 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppPpk-0002jo-SZ; Thu, 20 Apr 2023 04:40:10 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 3A84A5FB3A;
 Thu, 20 Apr 2023 11:39:53 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58f::1:1d] (unknown
 [2a02:6b8:b081:b58f::1:1d])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id pdZnAs05YCg0-GXdguPac; Thu, 20 Apr 2023 11:39:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681979992; bh=x9awoZeF5tDTT9O9ofcU72hL82VevGc6u7niovWkH0g=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=yrqYaaiAQ9n+uvZzpp8D/z9rDWNYXEho+nv6nnvK45TQXzbaX01ePzkEvrL8rzGb3
 rQgJonpZVD3bpGMF3sZBhs30VZ0g4EMb1MUfrtZPkOwSaHP+rwtuBAAVF47WHw7NtI
 2bLP38g5BtYLFu8kV4AnIlXX+FfTZc3QlMoYq+rk=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e0d68786-e2db-2b3d-b470-da0b99a5aaaf@yandex-team.ru>
Date: Thu, 20 Apr 2023 11:39:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/4] COLO: improve build options
Content-Language: en-US
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, zhanghailiang@xfusion.com, philmd@linaro.org,
 thuth@redhat.com, berrange@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230420083304.24d7ecd4@gecko.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230420083304.24d7ecd4@gecko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 20.04.23 11:33, Lukas Straub wrote:
> On Thu, 20 Apr 2023 01:52:28 +0300
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> 
>> Hi all!
>>
>> COLO substem seems to be useless when CONFIG_REPLICATION is unset, as we
>> simply don't allow to set x-colo capability in this case. So, let's not
>> compile in unreachable code and interface we cannot use when
>> CONFIG_REPLICATION is unset.
>>
>> Also, provide personal configure option for COLO Proxy subsystem.
>>
>> v1 was
>> [PATCH] replication: compile out some staff when replication is not configured
>> Supersedes: <20230411145112.497785-1-vsementsov@yandex-team.ru>
> 
> Hey,
> This series is a good idea, and looks fine to me. Maybe you can remove
> the #ifdef CONFIG_REPLICATION/#ifndef CONFIG_REPLICATION from
> migration/colo.c too while you are at it.
> 

Oh, right, will do in v3. Thanks!

-- 
Best regards,
Vladimir


