Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95248621979
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:33:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osRVY-0008J8-G4; Tue, 08 Nov 2022 11:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osRV0-00084p-IL; Tue, 08 Nov 2022 11:31:02 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osRUq-0003nh-0P; Tue, 08 Nov 2022 11:30:53 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 0F9FF60069;
 Tue,  8 Nov 2022 19:30:17 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 G8P39PuPaA-UFNGFlWO; Tue, 08 Nov 2022 19:30:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667925016; bh=YG+p2T7wWGlXPvH36L1AY8nnYHQiInqaTmT7FUXxEqA=;
 h=In-Reply-To:Cc:Date:References:To:From:Subject:Message-ID;
 b=to3/AD7oIpUb3IUfztmmo+uN2JmZG8qKNDs6x398TB45rZ253pqZsaK9atfXK3D4U
 duRJZM0B7moH+dZB8864LWrHtMmPtaZpJyO6cvhdT0j4+/1rCD3GeJbowZJIW+t7Yj
 xd/7SGCHKaIYw4TcKBKqe2RK0o6rIAbd7IxzD3vg=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b42cea97-5515-88f3-92fa-1c4ff178854b@yandex-team.ru>
Date: Tue, 8 Nov 2022 19:30:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-3-eesposit@redhat.com>
 <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
 <88f02d19-84d8-d1a7-4250-416fd32f1435@redhat.com>
 <711f6d68-888e-bca0-972e-a05503a039c5@yandex-team.ru>
In-Reply-To: <711f6d68-888e-bca0-972e-a05503a039c5@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

On 11/8/22 19:19, Vladimir Sementsov-Ogievskiy wrote:
> This is a lot better than our "coroutine_fn" sign, which actually do no check (and can't do). Don't you plan to swap a "coroutine_fn" noop marker with more meaningful IN_COROUTINE(); (or something like this, which just do assert(qemu_in_coroutine())) at start of the function? It would be a lot safer.


Moreover, we can introduce two macros:

IN_COROUTINE() and NOT_COROUTINE(), mark functions correspondingly and drop coroutine_fn mark. Than the picture would be very deterministic:

IN_COROUTINE - function is called only from coroutine context
NOT_COROUTINE - function is never called from coroutine context
<no mark> - function may be called from both coroutine and non-coroutine context

-- 
Best regards,
Vladimir


