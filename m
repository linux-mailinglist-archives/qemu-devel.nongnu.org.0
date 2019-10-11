Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDB5D412A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 15:30:06 +0200 (CEST)
Received: from localhost ([::1]:50138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIuzd-0007Kk-9K
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 09:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iIuyi-0006w3-Ez
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:29:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iIuyh-0002bO-EH
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:29:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51786)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iIuyh-0002b0-8v
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:29:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6D0BC81F31;
 Fri, 11 Oct 2019 13:29:06 +0000 (UTC)
Received: from work-vm (ovpn-117-210.ams2.redhat.com [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A23A10018FF;
 Fri, 11 Oct 2019 13:29:05 +0000 (UTC)
Date: Fri, 11 Oct 2019 14:29:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 0/2] migration/postcopy: map tmp and large zero page in
 setup stage
Message-ID: <20191011132903.GD18007@work-vm>
References: <20191005135021.21721-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005135021.21721-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 11 Oct 2019 13:29:06 +0000 (UTC)
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
> Currently we map these page when we want to use it, while this may be a
> little late.
> 
> To make the code consistency, these two patches move the map into
> postcopy_ram_incoming_setup.

Queued

> 
> Wei Yang (2):
>   migration/postcopy: allocate tmp_page in setup stage
>   migration/postcopy: map large zero page in
>     postcopy_ram_incoming_setup()
> 
>  migration/postcopy-ram.c | 74 +++++++++++++++-------------------------
>  migration/postcopy-ram.h |  7 ----
>  migration/ram.c          |  2 +-
>  3 files changed, 28 insertions(+), 55 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

