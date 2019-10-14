Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E73D5F46
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 11:48:28 +0200 (CEST)
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJwxm-0008Ll-Ox
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 05:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iJwwY-0007Uv-I0
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 05:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iJwwW-0007hI-PO
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 05:47:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38410)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iJwwT-0007bA-Oy; Mon, 14 Oct 2019 05:47:06 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 05D71307D848;
 Mon, 14 Oct 2019 09:47:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F28D41001B23;
 Mon, 14 Oct 2019 09:47:03 +0000 (UTC)
Date: Mon, 14 Oct 2019 11:47:02 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 4/4] qemu-nbd: Support help options for --object
Message-ID: <20191014094702.GB7173@localhost.localdomain>
References: <20191011205551.32149-1-kwolf@redhat.com>
 <20191011205551.32149-5-kwolf@redhat.com>
 <8b1b33d0-eb17-1e1d-1731-37870d1f3ac5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b1b33d0-eb17-1e1d-1731-37870d1f3ac5@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 14 Oct 2019 09:47:05 +0000 (UTC)
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.10.2019 um 23:39 hat Eric Blake geschrieben:
> On 10/11/19 3:55 PM, Kevin Wolf wrote:
> > Instead of parsing help options as normal object properties and
> > returning an error, provide the same help functionality as the system
> > emulator in qemu-nbd, too.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> Missing a change in qemu-nbd.texi for man page coverage.

Hm... Both qemu-img and qemu-nbd manpages refer to qemu(1) for the
details. I wouldn't mind copying the text for '-object help' from there
anyway, but unfortunately it doesn't even exist. :-)

So this looks like a separate patch that fixes it for qemu, too.

> But the patch is a strict improvement, so even if we have to add a
> followup patch for documentation, I'm okay with:
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> This patch touches NBD, but I'm assuming it's easier to take the series
> through your tree.

Yes, thanks.

Kevin

