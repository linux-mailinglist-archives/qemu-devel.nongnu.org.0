Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E878853
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 11:26:04 +0200 (CEST)
Received: from localhost ([::1]:50678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs1ut-0005c0-70
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 05:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57401)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hs1u6-0005CP-Gk
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hs1u5-0000RQ-L7
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:25:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57230)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hs1u5-0000Qf-GJ
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:25:13 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 87923368E3
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 09:25:11 +0000 (UTC)
Received: from work-vm (ovpn-117-222.ams2.redhat.com [10.36.117.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40FF21000329;
 Mon, 29 Jul 2019 09:25:04 +0000 (UTC)
Date: Mon, 29 Jul 2019 10:25:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190729092502.GA2756@work-vm>
References: <20190726083322.13637-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726083322.13637-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 29 Jul 2019 09:25:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/3] virtiofsd: add FUSE_INIT map_alignment
 field
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> The client must know the server's alignment constraints for FUSE_SETUPMAPPING
> and FUSE_REMOVEMAPPING.  This is necessary because mmap(2)/munmap(2) have
> alignment constraints and the guest may have a different page size from the
> host.  The new FUSE_INIT map_alignment field communicates this information to
> the client.

OK, merged into my local world.

DAve

> Stefan Hajnoczi (3):
>   virtiofsd: sync up fuse.h Linux 5.1 header
>   virtiofsd: add map_alignment to fuse_kernel.h
>   virtiofsd: implement FUSE_INIT map_alignment field
> 
>  contrib/virtiofsd/fuse_kernel.h   | 56 +++++++++++++++++++++----------
>  contrib/virtiofsd/fuse_lowlevel.c |  8 +++++
>  2 files changed, 47 insertions(+), 17 deletions(-)
> 
> -- 
> 2.21.0
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

