Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C20632B863
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:55:45 +0100 (CET)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRya-0006Pv-0y
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHRwB-00059T-T3
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHRwA-00026S-GA
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614779593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UOH1KU1D0p4n+BoSd0Eu5zAzURwFa3uoQncaMw7Q4Ok=;
 b=Mx6Z8FNO8pYjlst2PDLtjJwG0VKXo3vIhmB8ND36mDQ5KJWh/O0+zxRN6koNXhIomqZ4Hm
 nMrH9Wo8OCaY/bCvia883UF2XBO+hhZMqkpGVLVJ1/NprvTN8MW9ukQUeGHLaatHzjZkaN
 ZfMPyw+trymTbH7f5LpvTOeO9sq0TU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-bFsuMLLXM9auya2pBC2jdg-1; Wed, 03 Mar 2021 08:53:12 -0500
X-MC-Unique: bFsuMLLXM9auya2pBC2jdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11AE91936B67;
 Wed,  3 Mar 2021 13:53:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D202F60BFA;
 Wed,  3 Mar 2021 13:53:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6E0C5113860F; Wed,  3 Mar 2021 14:53:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH v2] qtest: delete superfluous inclusions of qtest.h
References: <20210226081414.205946-1-kuhn.chenqun@huawei.com>
Date: Wed, 03 Mar 2021 14:53:09 +0100
In-Reply-To: <20210226081414.205946-1-kuhn.chenqun@huawei.com> (Chen Qun's
 message of "Fri, 26 Feb 2021 16:14:14 +0800")
Message-ID: <87pn0gibsq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: qemu-trivial@nongnu.org, lvivier@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Chen Qun <kuhn.chenqun@huawei.com> writes:

> There are 23 files that include the "sysemu/qtest.h",
> but they do not use any qtest functions.
>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Acked-by: Markus Armbruster <armbru@redhat.com>


