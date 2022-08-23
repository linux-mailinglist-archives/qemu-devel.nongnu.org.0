Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E9A59E7C3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 18:44:17 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQX0i-0007XI-Cc
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 12:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQWxA-0002z9-4d; Tue, 23 Aug 2022 12:40:36 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:54050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQWx6-0003so-Fx; Tue, 23 Aug 2022 12:40:34 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 860472E1EC3;
 Tue, 23 Aug 2022 19:40:20 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 UDpAXJZwhA-eIQKGZAC; Tue, 23 Aug 2022 19:40:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661272819; bh=jYdswBudSC+SHBQyPt0KqcARw0oIltYzUmZe7JLsrqk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=EgnAxCN92jgxMJJOwgRmmnMSviG070LM8hB3opP7vQROcgiCcYhWxnZBewVU8sofg
 M1iwJEeeNvRbT/9f3zIXKvdVR3qdm/U7UIBSUqj5LAYHCReO9jCqA9Hnf1F7cHlPeS
 xcyfHd+H8mizdXSP9z96gNDbT7rWfvlLJICXzNTw=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <65b13df5-ef17-9576-f949-059f244cd95e@yandex-team.ru>
Date: Tue, 23 Aug 2022 19:40:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] block: pass OnOffAuto instead of bool to
 block_acct_setup()
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220823095719.105387-1-den@openvz.org>
 <20220823095719.105387-2-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220823095719.105387-2-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/22 12:57, Denis V. Lunev wrote:
> We would have one more place for block_acct_setup() calling, which should
> not corrupt original value.
> 
> Signed-off-by: Denis V. Lunev<den@openvz.org>
> CC: Peter Krempa<pkrempa@redhat.com>
> CC: Markus Armbruster<armbru@redhat.com>
> CC: John Snow<jsnow@redhat.com>
> CC: Kevin Wolf<kwolf@redhat.com>
> CC: Hanna Reitz<hreitz@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

