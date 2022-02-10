Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBAB4B14A8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:55:50 +0100 (CET)
Received: from localhost ([::1]:36470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDfZ-0001xm-7f
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:55:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIBfM-00063L-CW
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:47:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIBfL-0002j4-0o
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644508046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Nt9yA+bQVIc7VkOZ+E2uz9hnROKO5HJCz0zi5U+1sc=;
 b=iabbnlud8iX0uMnSTrxQ6sLRbg7HLjo5lUrZEAx4IZCQK3t33p6uK6nqO+5C5gWFGpJnl0
 wJuA7KNe/xurZeTQH4+YULnv73bWwNDGP/ys4PGycD1Ck0JMwUisMXjIYMAHgGmJcH8Amc
 ImaCEVHvXt2ZkN/RiuVq4+aXAEhMNaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-levqhk23OrqP1EkQX2ezwg-1; Thu, 10 Feb 2022 10:47:23 -0500
X-MC-Unique: levqhk23OrqP1EkQX2ezwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 136638465FE;
 Thu, 10 Feb 2022 15:47:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B965105C88E;
 Thu, 10 Feb 2022 15:46:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8A6A521E6A00; Thu, 10 Feb 2022 16:46:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 0/3] qapi/ui: change vnc addresses
References: <20220210141457.539582-1-vsementsov@virtuozzo.com>
Date: Thu, 10 Feb 2022 16:46:09 +0100
In-Reply-To: <20220210141457.539582-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 10 Feb 2022 15:14:54 +0100")
Message-ID: <87pmnubu7y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: berrange@redhat.com, bleal@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, crosa@redhat.com,
 marcandre.lureau@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I figure there's no real need for more review from me.  But if you'd
like me to review, let me know.

Gerd, should this go through your tree?


