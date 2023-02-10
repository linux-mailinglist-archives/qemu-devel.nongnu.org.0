Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D922169203F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQToy-0006Ix-14; Fri, 10 Feb 2023 08:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQTov-0006IW-UI
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:52:09 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQTou-0001sW-2e
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:52:09 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id F140D60BF2;
 Fri, 10 Feb 2023 16:52:00 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1310::1:f] (unknown
 [2a02:6b8:b081:1310::1:f])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wpfeqE0OZa61-Opclv9QI; Fri, 10 Feb 2023 16:51:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676037119; bh=GDZEvm4dZCtJdceiUQ4jr96rDH5wM/N7jwwFFxBV8us=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=SNeg5fUb2GJ9l4N5OXwMXzLJQhojE4WqDAIiZwymavpHyeq0uyZxHD/yOZWwJmE+c
 0hcYFydGs91xKMJsl9ILg4cYcbeXNbjQt+XZOIeTNF+lHNeWl+UC+WaS9O8FzQ37er
 hVQq7s+qAmXutEfkckJvZIU4d3PH9U0afql+/peE=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d71a7f2a-797b-8f2a-3f9f-ee5209774ec6@yandex-team.ru>
Date: Fri, 10 Feb 2023 16:51:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 15/15] qapi: introduce query-hotplug command
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-16-vsementsov@yandex-team.ru>
 <87k00pvnki.fsf@pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87k00pvnki.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 10.02.23 13:09, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
> 
>> Add a command that returns same information like HOTPLUG_STATE event.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> Events and queries commonly come paired: management applications want
> the event so they don't have to poll, and they want the query so they
> can resynchronize after a disconnect.  Adding an event without a query
> should make reviewers ask why no query.
> 
> You add the event in PATCH 13, and the query now.  I'd add them both in
> a single patch.  Matter of taste.  If you keep them separate, please
> have the first patch mention the second will follow shortly, to help
> reviewers.
> 

OK. Thanks for reviewing!

-- 
Best regards,
Vladimir


