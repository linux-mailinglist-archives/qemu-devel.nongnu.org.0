Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5298219BBFA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 08:49:19 +0200 (CEST)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJtfC-00022U-DY
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 02:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jJteA-0001W5-7A
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 02:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jJte8-0002au-DZ
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 02:48:13 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:15845)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>)
 id 1jJte4-0002TW-Ke; Thu, 02 Apr 2020 02:48:08 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 185794595C;
 Thu,  2 Apr 2020 08:48:04 +0200 (CEST)
Date: Thu, 2 Apr 2020 08:48:02 +0200 (CEST)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <1734473710.7.1585810082148@webmail.proxmox.com>
In-Reply-To: <20200401184431.GD27663@linux.fritz.box>
References: <20200331125804.GE7030@linux.fritz.box>
 <303038276.59.1585665152860@webmail.proxmox.com>
 <787d7517-bf56-72c7-d197-2313a864e05f@virtuozzo.com>
 <713436887.61.1585668262838@webmail.proxmox.com>
 <20200331153719.GI7030@linux.fritz.box>
 <518198448.62.1585671498399@webmail.proxmox.com>
 <20200401103748.GA4680@linux.fritz.box>
 <997901084.0.1585755465486@webmail.proxmox.com>
 <20200401181256.GB27663@linux.fritz.box>
 <1403939459.52.1585765681569@webmail.proxmox.com>
 <20200401184431.GD27663@linux.fritz.box>
Subject: Re: bdrv_drained_begin deadlock with io-threads
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev23
X-Originating-Client: open-xchange-appsuite
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Reply-To: Dietmar Maurer <dietmar@proxmox.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Sergio Lopez <slp@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > But, IMHO the commit is not the reason for (my) bug - It just makes
> > it easier to trigger... I can see (my) bug sometimes with 4.1.1, although
> > I have no easy way to reproduce it reliable.
> > 
> > Also, Stefan sent some patches to the list to fix some of the problems.
> > 
> > https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg00022.html
> > 
> > Does that fix your problem?
> 
> It seems to fix it, yes. Now I don't get any hangs any more. (Also, I
> guess this means that this day was essentially wasted because I worked
> on a problem that already has a fix... *sigh*)

It is not wasted, because we now know that you can't reproduce the bug we observe here. 

We are hunting those AIO bugs for about three weeks now, and it looks we still have
not found all of them ...

Also, it would we great if somebody reviews the patches from Stefan. It would be great to
get them in before 5.0.0.


