Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D9718A7D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 15:23:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOj1V-0001OP-Fo
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 09:23:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hOizW-0000Rb-9i
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hOizV-0000vu-A6
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:21:42 -0400
Received: from 20.mo3.mail-out.ovh.net ([178.33.47.94]:45952)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hOizV-0000sl-2x
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:21:41 -0400
Received: from player772.ha.ovh.net (unknown [10.108.35.90])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 7A28820A132
	for <qemu-devel@nongnu.org>; Thu,  9 May 2019 15:21:37 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 97E0B58D661F;
	Thu,  9 May 2019 13:21:34 +0000 (UTC)
Date: Thu, 9 May 2019 15:21:32 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190509152132.2104490f@bahia.lan>
In-Reply-To: <856d5954-7198-2b72-df90-12de16813761@redhat.com>
References: <155721868351.451636.16735088470797960209.stgit@bahia.lan>
	<155721870044.451636.8272207759150286399.stgit@bahia.lan>
	<856d5954-7198-2b72-df90-12de16813761@redhat.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2981664429618272562
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.47.94
Subject: Re: [Qemu-devel] [PATCH 3/6] fsdev: Move some types definition to
 qemu-fsdev.c
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 May 2019 10:28:03 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 07/05/2019 10.45, Greg Kurz wrote:
> > It would make sense for these types to be defined in a header file if
> > we had an API for fsdrivers to register themselves. In practice, we
> > only have three of them and it is very unlikely we add new ones since
> > the future of file sharing between host and guest is the upcoming
> > virtio-fs.
> > 
> > Move the types to qemu-fsdev.c instead since they are only used there.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  fsdev/qemu-fsdev.c |   23 +++++++++++++++++++++++
> >  fsdev/qemu-fsdev.h |   24 ------------------------
> >  2 files changed, 23 insertions(+), 24 deletions(-)  
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Applied to https://github.com/gkurz/qemu/commits/9p-next 

Cheers,

--
Greg

