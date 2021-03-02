Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C9D32A14B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:47:08 +0100 (CET)
Received: from localhost ([::1]:60264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5Mh-00079D-HR
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lH5Ks-0006KE-55
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lH5Kq-0003yk-M5
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614692712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bKEwB1CmfF22iX+IqxueG5DUHDthWRPwedJQFcZB8BA=;
 b=IhwkAb9o3EVU21wmzVD+n+FKRw7wknC5SkHL9TbX9VzMTC/33QZmbq8yrpSq5gmi062sB2
 IGMsgPIyex4rLMeNA7q9khb0broyEfvu7nPIUbOILYjM0jfcZb+l/wCnSf0sBrlu15sGRc
 hggKYwhJBcMhU61KsSzU4l8UND15nvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-u7naIcKhM4-fYkDNhskqtA-1; Tue, 02 Mar 2021 08:45:08 -0500
X-MC-Unique: u7naIcKhM4-fYkDNhskqtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41AD2C297;
 Tue,  2 Mar 2021 13:45:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A001210013C1;
 Tue,  2 Mar 2021 13:45:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 36193113860F; Tue,  2 Mar 2021 14:45:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andrey Shinkevich via <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 1/5] monitor: change function obsolete name in comments
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606484146-913540-2-git-send-email-andrey.shinkevich@virtuozzo.com>
Date: Tue, 02 Mar 2021 14:45:04 +0100
In-Reply-To: <1606484146-913540-2-git-send-email-andrey.shinkevich@virtuozzo.com>
 (Andrey Shinkevich via's message of "Fri, 27 Nov 2020 16:35:42 +0300")
Message-ID: <87mtvlllen.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org, den@openvz.org,
 mdroth@linux.vnet.ibm.com, mreitz@redhat.com, pbonzini@redhat.com,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrey Shinkevich via <qemu-devel@nongnu.org> writes:

> The function name monitor_qmp_bh_dispatcher() has been changed to
> monitor_qmp_dispatcher_co() since the commit 9ce44e2c. Let's amend the
> comments.
>
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> ---
>  monitor/qmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index b42f8c6..7169366 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -80,7 +80,7 @@ static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
>      qemu_mutex_lock(&mon->qmp_queue_lock);
>  
>      /*
> -     * Same condition as in monitor_qmp_bh_dispatcher(), but before
> +     * Same condition as in monitor_qmp_dispatcher_co(), but before
>       * removing an element from the queue (hence no `- 1`).
>       * Also, the queue should not be empty either, otherwise the
>       * monitor hasn't been suspended yet (or was already resumed).
> @@ -343,7 +343,7 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
>  
>      /*
>       * Suspend the monitor when we can't queue more requests after
> -     * this one.  Dequeuing in monitor_qmp_bh_dispatcher() or
> +     * this one.  Dequeuing in monitor_qmp_dispatcher_co() or
>       * monitor_qmp_cleanup_queue_and_resume() will resume it.
>       * Note that when OOB is disabled, we queue at most one command,
>       * for backward compatibility.

The same change has since made it to master as commit 395a95080a "qmp:
Fix up comments after commit 9ce44e2ce2".  I should have picked your
patch instead, but I wasn't aware of it then, because I had put your
series in my review queue without looking closely.

It's been stuck in my queue for way too long.  Reviewing non-trivial
monitor patches is slow and exhausting work for me, and other,
non-monitor patches have kept crowding out your work.  My apologies!


