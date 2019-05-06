Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95661445C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 08:08:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNWnc-000617-2L
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 02:08:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hNWmW-0005ef-Oi
	for qemu-devel@nongnu.org; Mon, 06 May 2019 02:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hNWmV-0007yu-Sl
	for qemu-devel@nongnu.org; Mon, 06 May 2019 02:07:20 -0400
Received: from 9.mo68.mail-out.ovh.net ([46.105.78.111]:51308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hNWmV-0007wh-MI
	for qemu-devel@nongnu.org; Mon, 06 May 2019 02:07:19 -0400
Received: from player695.ha.ovh.net (unknown [10.108.57.53])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 43B95123564
	for <qemu-devel@nongnu.org>; Mon,  6 May 2019 08:07:17 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player695.ha.ovh.net (Postfix) with ESMTPSA id 3B7E0551B8EF;
	Mon,  6 May 2019 06:07:14 +0000 (UTC)
Date: Mon, 6 May 2019 08:07:12 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190506080712.2fc846d0@bahia.lan>
In-Reply-To: <3189f4fe-d712-5903-8c42-97d72ddb4131@redhat.com>
References: <20190505144527.27926-1-thuth@redhat.com>
	<20190505203208.684776c0@bahia.lan>
	<3189f4fe-d712-5903-8c42-97d72ddb4131@redhat.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14921551468032137522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrjeeigddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.78.111
Subject: Re: [Qemu-devel] [PATCH] virtfs: Add missing "id" parameter in
 documentation
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 May 2019 05:49:40 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 05/05/2019 20.32, Greg Kurz wrote:
> > Hi Thomas,
> > 
> > Thanks for the janitoring :)
> > 
> > On Sun,  5 May 2019 16:45:27 +0200
> > Thomas Huth <thuth@redhat.com> wrote:
> >   
> >> ... and remove the square brackets from "path" and "security_model",
> >> since these parameters are not optional.
> >>  
> > 
> > Well this is only true when fsdriver == local, but the other fs drivers,
> > ie. proxy and synth, don't need it at all.  
> 
> Ok, then this is wrong in the output of "--help" instead.
> 

Yeah, I've taken a look and both the usage and the man page need
fixing...

> > Each driver has its own set of
> > options actually. This should better be described with separate lines IMHO.
> > 
> > Also, it should be stated that "id" relates to the fs backend, ie. it
> > belongs to the -fsdev "id" space, not to the device that gets exposed
> > to the guest.  
> 
> Hmm, maybe it would be better if you do this patch, since you've
> definitely got way more knowledge here than I do... Otherwise, I can
> have a try, but it might take a while till I get back to this...
> 

Sure, I'll do that.

>  Thomas

Cheers,

--
Greg

