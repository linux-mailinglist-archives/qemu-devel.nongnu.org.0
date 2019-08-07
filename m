Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0785346
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 20:54:17 +0200 (CEST)
Received: from localhost ([::1]:44500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvR4i-0002gu-7i
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 14:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44213)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hvR4G-0002Gb-59
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 14:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hvR4F-0002sZ-7o
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 14:53:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hvR4F-0002me-28
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 14:53:47 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3D1F48125C;
 Wed,  7 Aug 2019 18:53:46 +0000 (UTC)
Received: from work-vm (ovpn-117-204.ams2.redhat.com [10.36.117.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B4F19C69;
 Wed,  7 Aug 2019 18:53:45 +0000 (UTC)
Date: Wed, 7 Aug 2019 19:53:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ivan Ren <renyime@gmail.com>
Message-ID: <20190807185342.GT27871@work-vm>
References: <1564464816-21804-1-git-send-email-ivanren@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564464816-21804-1-git-send-email-ivanren@tencent.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 07 Aug 2019 18:53:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/3] migration: add speed limit for
 multifd migration
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
Cc: qemu-devel@nongnu.org, richardw.yang@linux.intel.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Ivan Ren (renyime@gmail.com) wrote:
> From: Ivan Ren <ivanren@tencent.com>
> 
> Currently multifd migration has not been limited and it will consume
> the whole bandwidth of Nic. These two patches add speed limitation to
> it.

Queued

> 
> This is the v3 patches:
> 
> v3 VS v2:
> Add Reviewed info and Suggested info.
> 
> v2 VS v1:
> 1. change qemu_file_update_rate_transfer interface name
>    to qemu_file_update_transfer
> 2. add a new patch to update ram_counters for multifd sync packet
> 
> Ivan Ren (3):
>   migration: add qemu_file_update_transfer interface
>   migration: add speed limit for multifd migration
>   migration: update ram_counters for multifd sync packet
> 
>  migration/qemu-file.c |  5 +++++
>  migration/qemu-file.h |  1 +
>  migration/ram.c       | 24 ++++++++++++++----------
>  3 files changed, 20 insertions(+), 10 deletions(-)
> 
> -- 
> 2.17.2 (Apple Git-113)
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

