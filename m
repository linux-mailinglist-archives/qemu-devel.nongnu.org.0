Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8356EA74
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 20:06:08 +0200 (CEST)
Received: from localhost ([::1]:47426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoXGh-0004nx-RI
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 14:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32901)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hoXGV-0004K8-QZ
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 14:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hoXGT-0002KJ-KS
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 14:05:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36138)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hoXGS-0002Gr-6G
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 14:05:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 47AED30BAC4D;
 Fri, 19 Jul 2019 18:05:48 +0000 (UTC)
Received: from work-vm (ovpn-117-245.ams2.redhat.com [10.36.117.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A82062667;
 Fri, 19 Jul 2019 18:05:47 +0000 (UTC)
Date: Fri, 19 Jul 2019 19:05:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190719180544.GL3000@work-vm>
References: <20190402003106.17614-1-richardw.yang@linux.intel.com>
 <20190611082520.GA11125@richard> <87zhmottba.fsf@trasno.org>
 <20190717011459.GB14233@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717011459.GB14233@richard>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 19 Jul 2019 18:05:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: remove unused field bytes_xfer
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> On Tue, Jun 11, 2019 at 10:33:29AM +0200, Juan Quintela wrote:
> >Wei Yang <richardw.yang@linux.intel.com> wrote:
> >> On Tue, Apr 02, 2019 at 08:31:06AM +0800, Wei Yang wrote:
> >>>MigrationState->bytes_xfer is only set to 0 in migrate_init().
> >>>
> >>>Remove this unnecessary field.
> >>>
> >>>Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> >>
> >> Hi, David
> >
> >Hi
> >
> >I am on duty this week, will get it.
> >
> 
> Hi, Juan
> 
> Sounds we lost this one and the one above this :-)
> 

We're in freeze at the moment; we'll pick it up as soon
as it opens up again; I've got quite a list of your clean-up patches!

Dave

> -- 
> Wei Yang
> Help you, Help me
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

