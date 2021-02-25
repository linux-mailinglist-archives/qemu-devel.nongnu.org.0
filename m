Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B256324C71
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:10:04 +0100 (CET)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCep-0001QM-FY
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFCdd-0000mI-Ae
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:08:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFCdV-0002II-2P
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614244117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rizPlqyQsfbUxS7LeN1iSz3JbJ3181xF5/Gab0E2ULM=;
 b=Fy/Lq/7aZgsQY5FfWsvIfr7O8CHpNwo7LOMf0S/pcTqy7B5+BwZ1JMzhM9tgDrfxoNnM+J
 aHrq+tZ1njyQC/X003/wm6c+zscbcc/8PBmAb1wEy72bKhY0ZkxQWbr77hVfnu1reT1z9t
 SQKDfhCFBh5Z7h/SoGXys2bfXfLL384=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-Rq4u4ix3PDKK27GUhF6Plg-1; Thu, 25 Feb 2021 04:08:32 -0500
X-MC-Unique: Rq4u4ix3PDKK27GUhF6Plg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CC95AFA85;
 Thu, 25 Feb 2021 09:08:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B44062467;
 Thu, 25 Feb 2021 09:08:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0112E113860F; Thu, 25 Feb 2021 10:08:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH] qtest: delete redundant qtest.h header files
References: <20210225055251.192104-1-kuhn.chenqun@huawei.com>
Date: Thu, 25 Feb 2021 10:08:29 +0100
In-Reply-To: <20210225055251.192104-1-kuhn.chenqun@huawei.com> (Chen Qun's
 message of "Thu, 25 Feb 2021 13:52:51 +0800")
Message-ID: <87h7m0v7jm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Chen Qun <kuhn.chenqun@huawei.com> writes:

> There are 23 files that include the "sysemu/qtest.h",
> but they do not use any qtest functions.
>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

The subject sounds as if you were deleting file include/sysemu/qtest.h,
which would be wrong.  You're actually deleting inclusions.  Suggest to
say

    qtest: delete superfluous inclusions of qtest.h

or

    delete superfluous #include "sysemu/qtest.h"

Perhaps the maintainer merging your patch can do that for you.


