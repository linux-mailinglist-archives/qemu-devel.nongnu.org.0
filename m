Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B55D4412
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 17:24:16 +0200 (CEST)
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIwm7-00074C-MF
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 11:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iIwlA-0006ZR-T7
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:23:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iIwl9-0004TO-LF
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:23:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35476)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iIwl9-0004T7-Fa; Fri, 11 Oct 2019 11:23:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 707D4302C080;
 Fri, 11 Oct 2019 15:23:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA46E5F7F2;
 Fri, 11 Oct 2019 15:23:11 +0000 (UTC)
Date: Fri, 11 Oct 2019 17:23:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] eliminate remaining places that abuse
 memory_region_allocate_system_memory()
Message-ID: <20191011172310.19fc5d93@redhat.com>
In-Reply-To: <20191010193503.097548e4@Igors-MacBook-Pro>
References: <20191008113318.7012-1-imammedo@redhat.com>
 <20191010193503.097548e4@Igors-MacBook-Pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 11 Oct 2019 15:23:14 +0000 (UTC)
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, deller@gmx.de,
 mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, hpoussin@reactos.org,
 rth@twiddle.net, atar4qemu@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Oct 2019 19:35:03 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

Forgot to actually CC Eduardo,

> On Tue,  8 Oct 2019 07:33:15 -0400
> Igor Mammedov <imammedo@redhat.com> wrote:
...
> Eduardo,
> 
> This patches are fixing various machines across tree, so series does not belong
> to any particular arch specific tree, can you merge it via generic machine tree?


> > 
> > 
> > Igor Mammedov (3):
> >   sparc64: use memory_region_allocate_system_memory() only for '-m'
> >     specified RAM
> >   ppc: rs6000_mc: drop usage of memory_region_allocate_system_memory()
> >   hppa: drop usage of memory_region_allocate_system_memory() for ROM
> > 
> >  hw/hppa/machine.c    |  5 ++---
> >  hw/ppc/rs6000_mc.c   | 15 ++++++++++-----
> >  hw/sparc64/niagara.c | 25 +++++++++++++------------
> >  3 files changed, 25 insertions(+), 20 deletions(-)
> >   
> 
> 


