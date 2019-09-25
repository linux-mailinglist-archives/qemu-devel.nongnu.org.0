Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A99ABDB7C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 11:53:24 +0200 (CEST)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD3z9-0002XA-IO
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 05:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iD3xw-00028e-Kc
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 05:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iD3xv-0001pb-Jb
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 05:52:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53150)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iD3xv-0001nF-E2
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 05:52:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A1D288D0F8;
 Wed, 25 Sep 2019 09:52:06 +0000 (UTC)
Received: from work-vm (ovpn-117-251.ams2.redhat.com [10.36.117.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A35F06092D;
 Wed, 25 Sep 2019 09:52:05 +0000 (UTC)
Date: Wed, 25 Sep 2019 10:52:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [Qemu-devel] [PATCH 0/3] migration/postcopy: unsentmap is not
 necessary
Message-ID: <20190925095203.GB21544@work-vm>
References: <20190819061843.28642-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819061843.28642-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 25 Sep 2019 09:52:06 +0000 (UTC)
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> Three patches to cleanup postcopy:
> 
> [1]: split canonicalize bitmap and discard page
> [2]: remove unsentmap since it is not necessary
> [3]: cleanup the get_queued_page_not_dirty

Queued

> 
> Wei Yang (3):
>   migration/postcopy: not necessary to do discard when canonicalizing
>     bitmap
>   migration/postcopy: unsentmap is not necessary for postcopy
>   migration: remove sent parameter in get_queued_page_not_dirty
> 
>  include/exec/ram_addr.h |  6 ---
>  migration/ram.c         | 94 +++++++----------------------------------
>  migration/trace-events  |  2 +-
>  3 files changed, 16 insertions(+), 86 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

