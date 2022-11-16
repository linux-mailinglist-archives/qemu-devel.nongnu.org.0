Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1262CADC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 21:30:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovP1v-00009c-2f; Wed, 16 Nov 2022 15:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovP1t-00009U-2Y
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 15:29:05 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovP1q-0001UV-0T
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 15:29:04 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id CA5575ECFD;
 Wed, 16 Nov 2022 23:28:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8128::1:3] (unknown
 [2a02:6b8:b081:8128::1:3])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 PMM5zWY3Gb-SgOu1ZM7; Wed, 16 Nov 2022 23:28:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668630523; bh=nab0pVxUo67w3n1irRFEZTeAEAGbk1KRO9KaRPZ/ciY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=j2/sA8dK4qjLX/tCziTidP9m8JU0hpRt9qyzmYJvX+U461w9xDnddwi8YgnpJSex+
 XlHAWw04Bvvqeh4dHWsMAGDMTCLVOwyY/ZpW0SHtrpqWR6WHe2mjUh5YE6/2yBdrzQ
 tTflrhJ46dZW0VnGQ9QLGPfbEdK33/ciPmxELmbw=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <268d8f44-8483-9644-81c2-87f07ce3c022@yandex-team.ru>
Date: Wed, 16 Nov 2022 23:28:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] qapi: introduce DEVICE_POWER_ON for SHPC hotplug
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, eduardo@habkost.net, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 den-plotnikov@yandex-team.ru
References: <20221116161234.44206-1-vsementsov@yandex-team.ru>
 <20221116161234.44206-3-vsementsov@yandex-team.ru>
 <20221116112313-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221116112313-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/16/22 19:26, Michael S. Tsirkin wrote:
> On Wed, Nov 16, 2022 at 07:12:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all! That's an RFC patch.
>>
>> The problem is that SHPC protocol says that power-led is blinking for 5
>> seconds before actual turning-on the device. If we call device-del
>> during this time the attention button press is ignored and we never get
>> DEVICE_DELETED event, which is unexpected for the user.
>>
>> I suggest add a pair for DEVICE_DELETED: DEVICE_POWER_ON. So user
>> should wait for DEVICE_POWER_ON after device-add before making any
>> other operations with the device (incluing device-del).
>>
>> What I'm unsure is what about other types of hotplug - PCIE and
>> ACPI.. Do they suffer from similar problems?
> I didn't yet look at this patchset deeply (we are in freeze anyway)
> but PCIE is substancially same as SHPC.
> 
> Take a look at Gerd's "improve native hotplug for pcie root ports"
> same kind of approach probably works for SHPC.

Looking at it. Yes, I think this approach is OK, thanks for the link.

I doubt now that we really need new event. Instead I can update SHPC to return an error when trying to unplug with blinking power indicator (like 81124b3c7a5dae "pcie: add power indicator blink check").

-- 
Best regards,
Vladimir


