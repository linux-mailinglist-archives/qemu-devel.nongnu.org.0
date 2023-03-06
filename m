Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C6A6AC38C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:41:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZC1O-0007nQ-6V; Mon, 06 Mar 2023 09:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pZC1M-0007mY-Fa; Mon, 06 Mar 2023 09:41:00 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pZC1J-0007Gm-95; Mon, 06 Mar 2023 09:41:00 -0500
Received: from mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c0d:3786:0:640:7c97:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id B39B35FDDB;
 Mon,  6 Mar 2023 17:40:42 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b71c::1:25] (unknown
 [2a02:6b8:b081:b71c::1:25])
 by mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id geboE10Oka60-EWjtdtF4; Mon, 06 Mar 2023 17:40:42 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net;
 dkim=pass
Message-ID: <cff356c5-b3a7-130b-e4b9-837fca47be79@yandex-team.ru>
Date: Mon, 6 Mar 2023 17:40:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/43] migration: Pass migrate_caps_check() the old and
 new caps
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
 <20230302163410.11399-3-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230302163410.11399-3-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 02.03.23 19:33, Juan Quintela wrote:
> We used to pass the old capabilities array and the new
> capabilities as a list.
> 
> Signed-off-by: Juan Quintela<quintela@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


