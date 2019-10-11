Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89CD4155
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 15:33:11 +0200 (CEST)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIv2c-0000Bl-MX
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 09:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iIv1p-0008Du-2E
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iIv1o-0003vz-0u
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:32:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40712)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iIv1n-0003vl-Rq
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:32:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0D9D810C0515;
 Fri, 11 Oct 2019 13:32:19 +0000 (UTC)
Received: from work-vm (ovpn-117-210.ams2.redhat.com [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 168765D9CA;
 Fri, 11 Oct 2019 13:32:17 +0000 (UTC)
Date: Fri, 11 Oct 2019 14:32:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 0/4] migration: trivial cleanup and refine
Message-ID: <20191011133215.GE18007@work-vm>
References: <20191005220517.24029-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005220517.24029-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Fri, 11 Oct 2019 13:32:19 +0000 (UTC)
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
> This patch set contains several cleanup and refine for migration.
> 
>     simplify some calculation
>     reuse the result
>     fix typo in comment
>     provide error message when failed

2,3,4 queued

> 
> Wei Yang (4):
>   migration/ram: only possible bit set in invalid_flags is
>     RAM_SAVE_FLAG_COMPRESS_PAGE
>   migration/postcopy: fix typo in mark_postcopy_blocktime_begin's
>     comment
>   migration: pass in_postcopy instead of check state again
>   migration: report SaveStateEntry id and name on failure
> 
>  migration/migration.c    | 3 +--
>  migration/postcopy-ram.c | 8 +++++---
>  migration/ram.c          | 5 +----
>  migration/savevm.c       | 2 ++
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

