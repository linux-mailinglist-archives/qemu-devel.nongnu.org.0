Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01519C65
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 13:18:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP3Xz-0007se-Ly
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 07:18:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <S.E.Harris@kent.ac.uk>) id 1hP3W3-0006y1-EE
	for qemu-devel@nongnu.org; Fri, 10 May 2019 07:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <S.E.Harris@kent.ac.uk>) id 1hP3W2-0001EW-6T
	for qemu-devel@nongnu.org; Fri, 10 May 2019 07:16:39 -0400
Received: from mx4.kent.ac.uk ([129.12.21.35]:54593)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <S.E.Harris@kent.ac.uk>)
	id 1hP3W2-0001Bg-0B
	for qemu-devel@nongnu.org; Fri, 10 May 2019 07:16:38 -0400
Received: from edue0c6.kent.ac.uk ([129.12.224.198] helo=cadance)
	by mx4.kent.ac.uk with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91)
	(envelope-from <S.E.Harris@kent.ac.uk>)
	id 1hP3Vy-000EzI-HF; Fri, 10 May 2019 12:16:34 +0100
Date: Fri, 10 May 2019 12:17:32 +0100
From: Sarah Harris <S.E.Harris@kent.ac.uk>
To: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190510121732.de0aa4075bcf6962a7414054@kent.ac.uk>
In-Reply-To: <CAK4993h0yCqpjBFzPy7GHt3kbSK43nLD6EXh4WFd_STHu15DTA@mail.gmail.com>
References: <20190504083638.13380-1-S.E.Harris@kent.ac.uk>
	<20190504083638.13380-9-S.E.Harris@kent.ac.uk>
	<c05b4876-c55e-fd82-46d0-83be1b128cee@linaro.org>
	<CAK4993h0yCqpjBFzPy7GHt3kbSK43nLD6EXh4WFd_STHu15DTA@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 129.12.21.35
Subject: Re: [Qemu-devel] [PATCH v1 8/8] target/avr: Register AVR support
 with the rest of QEMU, the build system, and the MAINTAINERS file
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
Cc: E.J.C.Robbins@kent.ac.uk, Sarah Harris <S.E.Harris@kent.ac.uk>,
	Michael Rolnik <mrolnik@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, A.M.King@kent.ac.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

Having discussed with my colleagues, we don't have the resources to maintain this.
If you wanted to take up Michael's offer then I'm happy to respond to queries and provide minor fixes.
Otherwise, we will make our repository publicly available in the near future for anyone who wants to use it.

Kind regards,
Sarah Harris

On Sun, 5 May 2019 09:10:00 -0700
Michael Rolnik <mrolnik@gmail.com> wrote:

> Hi Richard.
> 
> I can maintain it
> 
> Sent from my cell phone, please ignore typos
> 
> On Sun, May 5, 2019, 8:57 AM Richard Henderson <richard.henderson@linaro.org>
> wrote:
> 
> > On 5/4/19 1:36 AM, Sarah Harris wrote:
> > > Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
> > ...
> > >
> > > +AVR
> > > +M: Michael Rolnik <mrolnik@gmail.com>
> > > +S: Odd Fixes
> > > +F: target-avr/
> > > +F: hw/avr/
> > > +
> >
> > This is not how things work.  Michael wasn't up to maintaining the code 2
> > years
> > ago; that's why it was never committed.
> >
> > You would need to maintain this yourself, and for more than "Odd Fixes".
> >
> >
> > r~
> >

