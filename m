Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D4735DF5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 15:31:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYW18-0008Fk-Ge
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 09:31:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYVzz-0007kV-5l
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYVzx-0004z1-26
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:30:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57632)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hYVzw-0004XW-T7
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:30:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4884430C31A0;
	Wed,  5 Jun 2019 13:30:14 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB0D318AD0;
	Wed,  5 Jun 2019 13:30:12 +0000 (UTC)
Date: Wed, 5 Jun 2019 10:30:11 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
Message-ID: <20190605133011.GL22416@habkost.net>
References: <155913371654.8429.1659082639780315242.stgit@pasha-Precision-3630-Tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155913371654.8429.1659082639780315242.stgit@pasha-Precision-3630-Tower>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 05 Jun 2019 13:30:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] target/i386: save EFER for 32-bit targets
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
Cc: pbonzini@redhat.com, dovgaluk@ispras.ru, qemu-devel@nongnu.org,
	pavel.dovgaluk@ispras.ru, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 29, 2019 at 03:41:56PM +0300, Pavel Dovgalyuk wrote:
> i386 (32 bit) emulation uses EFER in wrmsr and in MMU fault
> processing.
> But it does not included in VMState, because "efer" field is disabled with
> #ifdef TARGET_X86_64
> 
> This patch adds a section for 32-bit targets which saves EFER when
> it's value is non-zero.
> 
> Signed-off-by: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>

Queued, thanks!

-- 
Eduardo

