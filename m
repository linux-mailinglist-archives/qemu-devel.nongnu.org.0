Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1404028140
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 17:32:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTpht-0001WW-LW
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 11:32:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTpZu-0003b9-24
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:24:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTpZt-0007Gw-6g
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:24:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hTpZt-0007GR-1S; Thu, 23 May 2019 11:24:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 569DF51145;
	Thu, 23 May 2019 15:24:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 248ED7BE78;
	Thu, 23 May 2019 15:24:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AAA881138648; Thu, 23 May 2019 17:24:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yuval Shaia <yuval.shaia@oracle.com>
References: <20190505105112.22691-1-yuval.shaia@oracle.com>
Date: Thu, 23 May 2019 17:24:18 +0200
In-Reply-To: <20190505105112.22691-1-yuval.shaia@oracle.com> (Yuval Shaia's
	message of "Sun, 5 May 2019 13:51:12 +0300")
Message-ID: <871s0pjisd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 23 May 2019 15:24:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/rdma: Delete unused headers inclusion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks stuck.  Let's try qemu-trivial.

Yuval Shaia <yuval.shaia@oracle.com> writes:

> This is a trivial cleanup patch.
>
> Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
> ---
>  hw/rdma/rdma_backend.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
> index d1660b6474..05f6b03221 100644
> --- a/hw/rdma/rdma_backend.c
> +++ b/hw/rdma/rdma_backend.c
> @@ -14,16 +14,9 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "sysemu/sysemu.h"
> -#include "qapi/error.h"
> -#include "qapi/qmp/qlist.h"
> -#include "qapi/qmp/qnum.h"
>  #include "qapi/qapi-events-rdma.h"
>  
>  #include <infiniband/verbs.h>
> -#include <infiniband/umad_types.h>
> -#include <infiniband/umad.h>
> -#include <rdma/rdma_user_cm.h>
>  
>  #include "contrib/rdmacm-mux/rdmacm-mux.h"
>  #include "trace.h"

