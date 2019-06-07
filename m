Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D43C392BA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 19:03:28 +0200 (CEST)
Received: from localhost ([::1]:49622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZIFt-0006wQ-0H
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 13:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53525)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hZGzq-0003bM-Gt
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:41:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hZGxv-0003Au-Pz
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:39:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43965)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hZGxo-0002vx-54; Fri, 07 Jun 2019 11:39:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9642F30BC572;
 Fri,  7 Jun 2019 15:39:23 +0000 (UTC)
Received: from work-vm (ovpn-116-24.ams2.redhat.com [10.36.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68FC95C238;
 Fri,  7 Jun 2019 15:39:22 +0000 (UTC)
Date: Fri, 7 Jun 2019 16:39:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20190607153919.GK2631@work-vm>
References: <20190607135430.22149-1-kwolf@redhat.com>
 <20190607135430.22149-2-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607135430.22149-2-kwolf@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 07 Jun 2019 15:39:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 01/10] monitor: Remove unused password
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kevin Wolf (kwolf@redhat.com) wrote:
> Commit 788cf9f8c removed the code for password prompting from the
> monitor. Since then, the Monitor fields password_completion_cb and
> password_opaque have been unused. Remove them.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

A shame, I love the idea of password completion.  123<tab>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

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
>  
> -- 
> 2.20.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

