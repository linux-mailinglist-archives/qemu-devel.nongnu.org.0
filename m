Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83231D3C9D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 11:45:33 +0200 (CEST)
Received: from localhost ([::1]:47966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIrUK-000693-Ek
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 05:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iIrTE-0005Yy-R7
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iIrTD-0005JA-Aw
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:44:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36126)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iIrTD-0005IU-5l
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:44:23 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6488289AC2;
 Fri, 11 Oct 2019 09:44:18 +0000 (UTC)
Received: from redhat.com (ovpn-117-120.ams2.redhat.com [10.36.117.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D991860BE1;
 Fri, 11 Oct 2019 09:44:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 1/4] migration/multifd: fix a typo in comment of
 multifd_recv_unfill_packet()
In-Reply-To: <20191011085050.17622-2-richardw.yang@linux.intel.com> (Wei
 Yang's message of "Fri, 11 Oct 2019 16:50:47 +0800")
References: <20191011085050.17622-1-richardw.yang@linux.intel.com>
 <20191011085050.17622-2-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Fri, 11 Oct 2019 11:44:15 +0200
Message-ID: <875zkvy5u8.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 11 Oct 2019 09:44:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Reply-To: quintela@redhat.com
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 22423f08cd..cf30171f44 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -838,7 +838,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>  
>      packet->pages_alloc = be32_to_cpu(packet->pages_alloc);
>      /*
> -     * If we recevied a packet that is 100 times bigger than expected
> +     * If we received a packet that is 100 times bigger than expected
>       * just stop migration.  It is a magic number.
>       */
>      if (packet->pages_alloc > pages_max * 100) {

Reviewed-by: Juan Quintela <quintela@redhat.com>

