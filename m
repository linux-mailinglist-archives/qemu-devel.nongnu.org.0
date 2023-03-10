Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE196B4F4B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagm4-0008GZ-3n; Fri, 10 Mar 2023 12:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pagm1-0008F1-NT; Fri, 10 Mar 2023 12:43:21 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1paglz-00086F-7m; Fri, 10 Mar 2023 12:43:21 -0500
Received: from mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c15:2905:0:640:e5fe:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 97B455FCF5;
 Fri, 10 Mar 2023 20:43:08 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b735::1:9] (unknown
 [2a02:6b8:b081:b735::1:9])
 by mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 7hiBdG0OgiE0-Ziu6dUuj; Fri, 10 Mar 2023 20:43:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1678470187; bh=Gm/45Tf512dtw8f88npzaOtUKHy++VHRPUMV/qRezD4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=b1XaxOByZth+LZ6RbjyaaMq+Lb3C7n/BkLg5ltlPaSDkv8VGihDsknK3fZ4KfQFhe
 EVco5mJvoN/yh+H2KEK9tf1EnXNolOU96ndAfUQFyzFlztHyze/2w+A8yAG5rn5RxI
 WKhJTX2IYa0bWAXKzZJXRjTiHLWILD26jOYjR5r0=
Authentication-Results: mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <5f5d4801-ce6f-157f-5e24-a54ecf34e32c@yandex-team.ru>
Date: Fri, 10 Mar 2023 20:43:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH nbd 0/4] Enable multi-conn NBD [for discussion only]
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com
References: <20230309113946.1528247-1-rjones@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230309113946.1528247-1-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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

On 09.03.23 14:39, Richard W.M. Jones wrote:
> [ Patch series also available here, along with this cover letter and the
>    script used to generate test results:
>    https://gitlab.com/rwmjones/qemu/-/commits/2023-nbd-multi-conn-v1  ]
> 
> This patch series adds multi-conn support to the NBD block driver in
> qemu.  It is only meant for discussion and testing because it has a
> number of obvious shortcomings (see "XXX" in commit messages and
> code).  If we decided this was a good idea, we can work on a better
> patch.

I looked through the results and the code, and I think that's of course a good idea!

We still need smarter integration with reconnect logic.

At least, we shouldn't make several open_timer instances..


Currently, on open() we have open-timeout. That's just a limit for the whole nbd_open() - we can do several connection attempts during this time.

Seems we should proceed with success, if we succeeded with at least one connection. Postponing additional connections to be established after open() seems good too[*].


Next, we have reconnect-delay. When connection is lost nbd-client tries to reconnect with no limit in attempts, but after reconnect-delay seconds of reconnection all in-flight requests that are waiting for connection are just failed.

When we have several connections, and one is broken, I think we shouldn't wait, but instead retry the requests on other working connections. This way we don't need several reconnect_delay_timer objects: we need only one, when all connections are lost.


Reestablishing additional connections better to do in background, not blocking in-flight requests. And that's the same as postponing additional connections after open() should work ([*]).

-- 
Best regards,
Vladimir


