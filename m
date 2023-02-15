Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD6A6982B9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:54:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLyd-0003nd-Jp; Wed, 15 Feb 2023 12:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSLyb-0003lP-Bn; Wed, 15 Feb 2023 12:53:53 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSLyW-0006Cx-Cv; Wed, 15 Feb 2023 12:53:52 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 2BA0160D17;
 Wed, 15 Feb 2023 20:53:30 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4bf::1:2e] (unknown
 [2a02:6b8:b081:b4bf::1:2e])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Tro8i90QeW21-mtJcVc4B; Wed, 15 Feb 2023 20:53:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676483609; bh=w1IbkzkPboULvHxDwOvffceX1yg44Q8knlbXSZHA7Ps=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=B/5aL302LmmiZ/RxdEUuQTseGPmOT82i7HSJYA2l24AGwEg6lUG8jftgzUwBSB0Ml
 3AvbZXLuO7uo7ZHJhE+1EZUb3QEd6tnUSGgaeJnyaVnJCpFlgkKaSNTleiKcSBEdd8
 4O7OK3N2MGUTYhahSJ2uhzR87VT9Yce4Rl8HxIn0=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <6b46bb8a-cbdd-b2d9-e542-a28d598d0140@yandex-team.ru>
Date: Wed, 15 Feb 2023 20:53:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/3] migration: Rename res_{postcopy,precopy}_only
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Fam Zheng
 <fam@euphon.net>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
References: <20230215170345.6220-1-quintela@redhat.com>
 <20230215170345.6220-4-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230215170345.6220-4-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 15.02.23 20:03, Juan Quintela wrote:
> Once that res_compatible is removed, they don't make sense anymore.
> We remove the _only preffix.  And to make things clearer we rename
> them to must_precopy and can_postcopy.
> 
> Signed-off-by: Juan Quintela<quintela@redhat.com>

Ideally headers of trace events (trace_vfio_state_pending, trace_migrate_pending_estimate, trace_migrate_pending_exact)
should be changed correspondingly.

with or without:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


-- 
Best regards,
Vladimir


