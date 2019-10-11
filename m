Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABFAD426E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 16:11:22 +0200 (CEST)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIvdY-0006Jw-Uj
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 10:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40456)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iIvR4-0007wW-Bj
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iIvR3-0000RS-7w
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:58:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49713)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iIvR3-0000QT-2F
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:58:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4FA6B801670;
 Fri, 11 Oct 2019 13:58:24 +0000 (UTC)
Received: from work-vm (ovpn-117-210.ams2.redhat.com [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 770E460BF4;
 Fri, 11 Oct 2019 13:58:23 +0000 (UTC)
Date: Fri, 11 Oct 2019 14:58:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 0/3] migration/postcopy: replace have_listen_thread check
 with PostcopyState check
Message-ID: <20191011135821.GF18007@work-vm>
References: <20191006000249.29926-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006000249.29926-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 11 Oct 2019 13:58:24 +0000 (UTC)
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> have_listen_thread is used to be a indication of whether postcopy thread is
> running. Since we use PostcopyState to record state and the postcopy thread
> only runs when postcopy_is_running(), we can leverage the PostcopyState to
> replace the meaning of have_listen_thread.
> 
> To do so, two preparation cleanup is included.

1,2 queued (2 with fixup for original postcopy_state_set)

> 
> Wei Yang (3):
>   migration/postcopy: mis->have_listen_thread check will never be
>     touched
>   migration/postcopy: postpone setting PostcopyState to END
>   migration/postcopy: replace have_listen_thread check with
>     PostcopyState check
> 
>  migration/migration.h    |  1 -
>  migration/postcopy-ram.c |  2 --
>  migration/ram.c          |  2 +-
>  migration/ram.h          |  1 +
>  migration/savevm.c       | 11 +++--------
>  5 files changed, 5 insertions(+), 12 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

