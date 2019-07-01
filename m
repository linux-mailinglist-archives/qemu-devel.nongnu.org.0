Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321041C81
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 08:46:54 +0200 (CEST)
Received: from localhost ([::1]:57072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hax25-0001jg-9h
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 02:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38944)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hawyo-0000Ub-Ng
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 02:43:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hawyn-00067O-Kh
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 02:43:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48400)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hawyi-00064h-In; Wed, 12 Jun 2019 02:43:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 356ECC028353;
 Wed, 12 Jun 2019 06:43:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 027277BE7F;
 Wed, 12 Jun 2019 06:43:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C9A8B1138648; Wed, 12 Jun 2019 08:43:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190611134043.9524-1-kwolf@redhat.com>
 <20190611134043.9524-2-kwolf@redhat.com>
Date: Wed, 12 Jun 2019 08:43:18 +0200
In-Reply-To: <20190611134043.9524-2-kwolf@redhat.com> (Kevin Wolf's message of
 "Tue, 11 Jun 2019 15:40:33 +0200")
Message-ID: <878su75mnt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 12 Jun 2019 06:43:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 01/11] monitor: Remove unused password
 prompting fields
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Commit 788cf9f8c removed the code for password prompting from the
> monitor. Since then, the Monitor fields password_completion_cb and
> password_opaque have been unused. Remove them.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  monitor.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/monitor.c b/monitor.c
> index 6428eb3b7e..70ce9e8a77 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -220,8 +220,6 @@ struct Monitor {
>  
>      MonitorQMP qmp;
>      gchar *mon_cpu_path;
> -    BlockCompletionFunc *password_completion_cb;
> -    void *password_opaque;
>      mon_cmd_t *cmd_table;
>      QTAILQ_ENTRY(Monitor) entry;

Reviewed-by: Markus Armbruster <armbru@redhat.com>

