Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18906A2882
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 22:58:12 +0200 (CEST)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3RUg-0002Zk-OR
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 16:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i3RTn-00028H-7B
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 16:57:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i3RTk-0006sq-1Z
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 16:57:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46412)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i3RTj-0006py-QW
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 16:57:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CB2D5368CF;
 Thu, 29 Aug 2019 20:57:10 +0000 (UTC)
Received: from localhost (ovpn-116-109.gru2.redhat.com [10.97.116.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FBE6100194E;
 Thu, 29 Aug 2019 20:57:10 +0000 (UTC)
Date: Thu, 29 Aug 2019 14:55:37 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Message-ID: <20190829175537.GB3694@habkost.net>
References: <1564760158-27536-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564760158-27536-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 29 Aug 2019 20:57:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] tests/acceptance: Update MIPS Malta
 ssh test
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
Cc: crosa@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 amarkovic@wavecomp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 02, 2019 at 05:35:56PM +0200, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> This little series improves linux_ssh_mips_malta.py, both in the sense
> of code organization and in the sense of quantity of executed tests.

Thanks!  I'm queueing it on python-next.  The changes suggested
by others can be implemented as follow up patches.


> 
> Aleksandar Markovic (2):
>   tests/acceptance: Refactor and improve reporting in
>     linux_ssh_mips_malta.py
>   tests/acceptance: Add new test cases in linux_ssh_mips_malta.py
> 
>  tests/acceptance/linux_ssh_mips_malta.py | 81 ++++++++++++++++++++++++++------
>  1 file changed, 66 insertions(+), 15 deletions(-)
> 
> -- 
> 2.7.4
> 
> 

-- 
Eduardo

