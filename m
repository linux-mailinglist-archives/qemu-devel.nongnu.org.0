Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3A4DBA0C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 22:20:16 +0100 (CET)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUb43-000182-78
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 17:20:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUb2g-0008TT-L8
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:18:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUb2f-0006Gn-0b
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647465526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g6FF+3gRgMF3fWjGbRI/4lBdgy64zXkPkiR6imEQKDI=;
 b=Zuhg6i/EC6VIWlZB0D+SC/C5YNg8m6wgwcP5nybpTp8njSPFf4p6+A5DgJ7D3BNutGH5mT
 Co3eCzA/vuZwzg3yEbOdxjNSoc5rcDaTRhRLuiH2zrS4spdRxkny6x98Ja3eRvKlJK/voN
 VKJ2Ay3KGGTwJZvwExxm5UWeVAdFYlU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-bjJhs6WAMbCz8ZigwEOtug-1; Wed, 16 Mar 2022 17:18:43 -0400
X-MC-Unique: bjJhs6WAMbCz8ZigwEOtug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4AD91C05EBD;
 Wed, 16 Mar 2022 21:18:42 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 166DC41136E2;
 Wed, 16 Mar 2022 21:18:42 +0000 (UTC)
Date: Wed, 16 Mar 2022 16:18:40 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH v2 1/3] qapi: rename BlockDirtyBitmapMergeSource to
 BlockDirtyBitmapOrStr
Message-ID: <20220316211840.cq7m3ji4m2y6drgi@redhat.com>
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
 <20220314213226.362217-2-v.sementsov-og@mail.ru>
MIME-Version: 1.0
In-Reply-To: <20220314213226.362217-2-v.sementsov-og@mail.ru>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 hreitz@redhat.com, v.sementsov-og@ya.ru, yuriy.vasiliev@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 12:32:24AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Rename the type to be reused. Old name is "what is it for". To be
> natively reused for other needs, let's name it exactly "what is it".
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> ---
>  block/monitor/bitmap-qmp-cmds.c        | 6 +++---
>  include/block/block_int-global-state.h | 2 +-
>  qapi/block-core.json                   | 6 +++---
>  qemu-img.c                             | 8 ++++----
>  4 files changed, 11 insertions(+), 11 deletions(-)

The type name does not affect QAPI interface stability, so this is safe.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


