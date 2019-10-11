Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421CCD4287
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 16:16:00 +0200 (CEST)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIvi2-0003g5-Gc
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 10:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40827)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iIvTM-0002PC-Vq
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 10:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iIvTK-0001pl-Te
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 10:00:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60322)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iIvTK-0001pI-Nf
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 10:00:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBB8520E8;
 Fri, 11 Oct 2019 14:00:45 +0000 (UTC)
Received: from work-vm (ovpn-117-210.ams2.redhat.com [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F94960BE1;
 Fri, 11 Oct 2019 14:00:42 +0000 (UTC)
Date: Fri, 11 Oct 2019 15:00:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v2 0/2] migration/postcopy: cleanup related to postcopy
Message-ID: <20191011140039.GG18007@work-vm>
References: <20191010011316.31363-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010011316.31363-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Fri, 11 Oct 2019 14:00:45 +0000 (UTC)
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
Cc: qemu-devel@nongnu.org, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> Refine a function name and handle on corner case related to PostcopyState.
> 
> v2:
>    * remove one unnecessary patch
>    * simplify corner case handling
> 
> Wei Yang (2):
>   migration/postcopy: rename postcopy_ram_enable_notify to
>     postcopy_ram_incoming_setup
>   migration/postcopy: check PostcopyState before setting to
>     POSTCOPY_INCOMING_RUNNING
> 
>  migration/postcopy-ram.c | 4 ++--
>  migration/postcopy-ram.h | 2 +-
>  migration/savevm.c       | 5 +++--
>  3 files changed, 6 insertions(+), 5 deletions(-)

Queued

> 
> -- 
> 2.17.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

