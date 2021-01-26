Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CFD3042B9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:39:03 +0100 (CET)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4QQn-0005Vh-LX
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4QOp-00046o-Ag
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4QOj-0007A8-WE
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611675410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J+UedeY/kNwnsli+f1UGmci0eYio1CU5nvMROC+24eg=;
 b=hHjqHvkrZDZ0winGAfwysuLH0+MI5vi+/G73Mq0y/hhKON0VRBYxXLRg8KW+acg3yRIe7k
 7iXrACXkGDu8aqO0dD2ziT6Ma7oQ2YF7/l2L9xxrqFbAkOjow6HtPc4oWPhD0TukykOTOC
 0uFOKejjXbVJ0z23dTfgyqFv1rIjqBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-HjYFMXKiOSSAomkuSi0Fig-1; Tue, 26 Jan 2021 10:36:48 -0500
X-MC-Unique: HjYFMXKiOSSAomkuSi0Fig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1846801AAC;
 Tue, 26 Jan 2021 15:36:40 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4731160636;
 Tue, 26 Jan 2021 15:36:39 +0000 (UTC)
Date: Tue, 26 Jan 2021 16:36:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v9 0/6] Rework iotests/check
Message-ID: <20210126153637.GI4385@merkur.fritz.box>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210126125301.GE4385@merkur.fritz.box>
 <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
 <20210126150750.GH4385@merkur.fritz.box>
 <5bb6d3fd-2a2c-91a4-f12a-5e195627a7fb@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <5bb6d3fd-2a2c-91a4-f12a-5e195627a7fb@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.01.2021 um 16:15 hat Vladimir Sementsov-Ogievskiy geschrieben:
> OK, thanks for handling it!

You're welcome.

Only problem now: Max sent a conflicting pull request that touches
'group'. He suggested that we could split the deletion of 'group' from
the 'check' rewrite and merge it only later when nobody touches 'group'
any more (because it's unused).

The other option is that I wait a bit or speculatively merge his tree
(with a lot more patches) before doing my pull request in the hope that
it doesn't fail.

> When will we move to python 3.7?

I seem to remember that 3.6 is used by more or less all of the current
enterprise distributions, so I'm afraid it will be a while.

Kevin


