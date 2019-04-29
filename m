Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23326DF52
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 11:22:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL2Us-0004uX-8B
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 05:22:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hL2SK-0003Mq-NZ
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:20:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hL2SJ-0001Ct-Nx
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:20:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hL2SH-0001Bb-6y; Mon, 29 Apr 2019 05:20:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EEE359464;
	Mon, 29 Apr 2019 09:20:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-63.ams2.redhat.com
	[10.36.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7354317DD1;
	Mon, 29 Apr 2019 09:20:07 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:20:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190429092005.GB8492@localhost.localdomain>
References: <20190413152037.6817-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190413152037.6817-1-mreitz@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 29 Apr 2019 09:20:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-next 0/2] qemu-img: Make create hint at
 protocol options
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.04.2019 um 17:20 hat Max Reitz geschrieben:
> https://bugzilla.redhat.com/show_bug.cgi?id=1698863 reports that while
> "qemu-img create -f raw" supports the "preallocation" option, it is not
> listed under "-o help".
> 
> It turns out it is, but only if you specify a target filename.  Users
> may not realize this, but a note should help.

Thanks, applied to the block branch.

Kevin

