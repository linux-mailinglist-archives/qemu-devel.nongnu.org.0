Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47872E9E3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 02:54:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW9KX-0006gr-P6
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 20:54:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hW9JV-0006OE-0c
	for qemu-devel@nongnu.org; Wed, 29 May 2019 20:53:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hW9JU-0004rx-7C
	for qemu-devel@nongnu.org; Wed, 29 May 2019 20:53:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hW9JU-0004rI-22
	for qemu-devel@nongnu.org; Wed, 29 May 2019 20:53:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 357E13086246;
	Thu, 30 May 2019 00:52:58 +0000 (UTC)
Received: from xz-x1 (ovpn-12-21.pek2.redhat.com [10.72.12.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6705460C75;
	Thu, 30 May 2019 00:52:55 +0000 (UTC)
Date: Thu, 30 May 2019 08:52:43 +0800
From: Peter Xu <peterx@redhat.com>
To: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Message-ID: <20190530005243.GA28587@xz-x1>
References: <003a01d51611$6251a2b0$26f4e810$@ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <003a01d51611$6251a2b0$26f4e810$@ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 30 May 2019 00:52:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] i386: EFER vs 32-bit CPU
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
Cc: ehabkost@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
	qemu-devel@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 29, 2019 at 02:26:39PM +0300, Pavel Dovgalyuk wrote:
> Hello!
> 
>  
> 
> I found this while debugging the inconsistent saved/restored state of the virtual machine.
> 
>  
> 
> i386 (32 bit) emulation uses this register (in wrmsr and in MMU fault processing).

Sorry if this question is elementary, but... why would a 32bit guest
use IA32_EFER?  From SDM I only see 4 bits defined in this MSR (SCE,
LME, LMA, NXE) but is there any of them that should be set in a 32bit
guest?

Regards,

-- 
Peter Xu

