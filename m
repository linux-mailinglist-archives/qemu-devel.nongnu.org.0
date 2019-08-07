Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B885209
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 19:26:51 +0200 (CEST)
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvPi6-00031s-Ui
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 13:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54405)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hvPh6-0002IT-1O
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hvPh5-0008Ij-20
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:25:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56712)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hvPh4-0008GS-Oe
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:25:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6ED0B765A4;
 Wed,  7 Aug 2019 17:25:45 +0000 (UTC)
Received: from work-vm (ovpn-117-204.ams2.redhat.com [10.36.117.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9154327061;
 Wed,  7 Aug 2019 17:25:44 +0000 (UTC)
Date: Wed, 7 Aug 2019 18:25:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190807172542.GE27871@work-vm>
References: <20190710050814.31344-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710050814.31344-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 07 Aug 2019 17:25:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] migration/postcopy: cleanup function
 postcopy_chunk_hostpages_pass
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
> Here are two trivial function cleanup.

Queued

> BTW, I didn't test them since TPS == HPS. How could I setup a guest with
> TPS != HPS?
> 
> Wei Yang (2):
>   migration/postcopy: reduce one operation to calculate fixup_start_addr
>   migration/postcopy: do_fixup is true when host_offset is non-zero
> 
>  migration/ram.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

