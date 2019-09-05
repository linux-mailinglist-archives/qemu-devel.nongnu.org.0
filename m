Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D350A9F93
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 12:24:35 +0200 (CEST)
Received: from localhost ([::1]:44313 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5owM-00053u-JS
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 06:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i5ovF-0004II-7r
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i5ovE-0007q3-3w
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:23:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i5ovD-0007pf-V6
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:23:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9929B3D962
 for <qemu-devel@nongnu.org>; Thu,  5 Sep 2019 10:23:22 +0000 (UTC)
Received: from work-vm (ovpn-117-197.ams2.redhat.com [10.36.117.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB481001281;
 Thu,  5 Sep 2019 10:23:14 +0000 (UTC)
Date: Thu, 5 Sep 2019 11:23:11 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190905102311.GI2700@work-vm>
References: <20190905082947.6633-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905082947.6633-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 05 Sep 2019 10:23:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Virtio-fs] [PATCH RESEND 0/2] virtiofsd: use
 "fuse_log.h" APIs instead of <err.h>
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
> warn(3), warnx(3), err(3), and errx(3) print to stderr even when the --syslog
> option was given.  In this case messages to stderr are likely to be lost and
> this makes troubleshooting hard.  Use "fuse_log.h" APIs instead of <err.h>.
> 
> Stefan Hajnoczi (2):
>   virtiofsd: replace warn(3) and warnx(3) with fuse_warning()
>   virtiofsd: replace err(3) and errx(3) with fuse_err()
> 
>  contrib/virtiofsd/passthrough_ll.c | 143 ++++++++++++++++++-----------
>  contrib/virtiofsd/seccomp.c        |  15 ++-
>  2 files changed, 99 insertions(+), 59 deletions(-)

Thanks, I've added these to my world; although I'll probably squash them
down heavily into the original commits.

Dave

> -- 
> 2.21.0
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

