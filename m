Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA60444E91
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 06:58:43 +0100 (CET)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miVlr-0003Yp-4K
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 01:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miViI-0001ge-S4
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 01:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miViA-0005I0-Ph
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 01:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636005293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KewWAxyAQW7/TSTI0roiw3to8K6ut46pwd5IH2EnqM=;
 b=Mku9DN/kiHP6dfr6azRQwHEXFzWqxzdVubAMzMcWhcdENW02KSVTRtYUjOaxRFVUSnCF/F
 T8MmlaJnzSo4u0nTk2USK1KZRgGkdce4ukrUFQZ++to3TTWpKLnEJl6Ugv8jJiJ1UQzTwl
 +zgT9byAnLwegnRQDQIWkTWU9Cb9j+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-t5FLpgMQNI6oGN68a_Gaiw-1; Thu, 04 Nov 2021 01:54:48 -0400
X-MC-Unique: t5FLpgMQNI6oGN68a_Gaiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 278F719200C3;
 Thu,  4 Nov 2021 05:54:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C0B51002391;
 Thu,  4 Nov 2021 05:54:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A2EB111380A7; Thu,  4 Nov 2021 06:54:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 0/3] qapi & doc: deprecate drive-backup
References: <20211103132912.1977438-1-vsementsov@virtuozzo.com>
Date: Thu, 04 Nov 2021 06:54:42 +0100
In-Reply-To: <20211103132912.1977438-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 3 Nov 2021 14:29:09 +0100")
Message-ID: <87a6ikh3dp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, kchamart@redhat.com, libvir-list@redhat.com,
 jsnow@redhat.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 wencongyang2@huawei.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Hi all!
>
> See 03 commit message for details. 01-02 are preparation docs update.
>
> v3: wording fix-ups and improvements suggested by Kashyap
> v2: add a lot of documentation changes
> v1 was "[PATCH] qapi: deprecate drive-backup"
>
>
> Note, that this series lack deprecating drive-backup transaction action.
> That's done by Markus in 05 patch of
> "[PATCH v4 0/5] qapi: Add feature flags to enum members"
> So, the most effective would be to take these series together.

Works for me.  To make it easier for the maintainer who merges this,
I'll respin this series so it includes my patch.

Thanks!


