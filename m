Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB7B0B87
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 11:36:43 +0200 (CEST)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8LWs-0003Uo-3A
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 05:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8LPJ-0005rD-Mw
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 05:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8LPI-0005Je-QH
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 05:28:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40256)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8LPG-0005IT-FK; Thu, 12 Sep 2019 05:28:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C69A3307D925;
 Thu, 12 Sep 2019 09:28:49 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-179.ams2.redhat.com [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52F94600C4;
 Thu, 12 Sep 2019 09:28:45 +0000 (UTC)
Date: Thu, 12 Sep 2019 11:28:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Message-ID: <20190912092844.GE5383@linux.fritz.box>
References: <20190911151626.6823-1-berto@igalia.com>
 <b3bd3fa6-e700-b5d1-0339-8670cd79026e@redhat.com>
 <w51mufa9dt4.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w51mufa9dt4.fsf@maestria.local.igalia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 12 Sep 2019 09:28:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] qcow2: Stop overwriting
 compressed clusters one by one
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.09.2019 um 09:25 hat Alberto Garcia geschrieben:
> On Thu 12 Sep 2019 01:33:05 AM CEST, John Snow <jsnow@redhat.com> wrote:
> >> This restriction comes from commit 095a9c58ce12afeeb90c2 from 2018.
> >
> > You accidentally typed a reasonably modern date. It's from *2008*!
> 
> Oh my, and I reviewed the message 3 times ... if this one gets committed
> please correct the date.

It was actually one of the very first QEMU patches I reviewed. :-)

Thanks, fixed the year and applied to the block branch.

Kevin

