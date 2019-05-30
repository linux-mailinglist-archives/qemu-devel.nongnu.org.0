Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A662F74D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 07:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWE2X-0007Ok-ID
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 01:55:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dovgaluk@ispras.ru>) id 1hWE1O-00077A-Ow
	for qemu-devel@nongnu.org; Thu, 30 May 2019 01:54:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dovgaluk@ispras.ru>) id 1hWE1N-0003CP-Tj
	for qemu-devel@nongnu.org; Thu, 30 May 2019 01:54:38 -0400
Received: from mail.ispras.ru ([83.149.199.45]:48834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dovgaluk@ispras.ru>) id 1hWE1N-0003AT-MU
	for qemu-devel@nongnu.org; Thu, 30 May 2019 01:54:37 -0400
Received: from PASHAISP (unknown [85.142.117.226])
	by mail.ispras.ru (Postfix) with ESMTPSA id B8328540081;
	Thu, 30 May 2019 08:54:34 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Peter Xu'" <peterx@redhat.com>
References: <003a01d51611$6251a2b0$26f4e810$@ru> <20190530005243.GA28587@xz-x1>
In-Reply-To: <20190530005243.GA28587@xz-x1>
Date: Thu, 30 May 2019 08:54:38 +0300
Message-ID: <000901d516ac$2b1a7d80$814f7880$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdUWggc4ukGM/8TIT7mPEKR3TuoRLAAKfQwQ
Content-Language: ru
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
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

> From: Peter Xu [mailto:peterx@redhat.com]
> On Wed, May 29, 2019 at 02:26:39PM +0300, Pavel Dovgalyuk wrote:
> > Hello!
> >
> >
> >
> > I found this while debugging the inconsistent saved/restored state of the virtual machine.
> >
> >
> >
> > i386 (32 bit) emulation uses this register (in wrmsr and in MMU fault processing).
> 
> Sorry if this question is elementary, but... why would a 32bit guest
> use IA32_EFER?  From SDM I only see 4 bits defined in this MSR (SCE,
> LME, LMA, NXE) but is there any of them that should be set in a 32bit
> guest?

Ubuntu server 16.04 (32 bit) sets NXE while booting.
NXE affects the MMU fault processing and exception generation.

Pavel Dovgalyuk


