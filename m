Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC9218A7A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 15:22:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOj0M-0000XQ-Lb
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 09:22:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hOiys-0008U0-0h
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hOiyr-0000Uj-3p
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:21:02 -0400
Received: from 11.mo6.mail-out.ovh.net ([188.165.38.119]:56301)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hOiyq-0000Sg-US
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:21:01 -0400
Received: from player791.ha.ovh.net (unknown [10.108.54.209])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id EF56A1BE579
	for <qemu-devel@nongnu.org>; Thu,  9 May 2019 15:20:57 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player791.ha.ovh.net (Postfix) with ESMTPSA id 43F44576DD3F;
	Thu,  9 May 2019 13:20:55 +0000 (UTC)
Date: Thu, 9 May 2019 15:20:54 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190509152054.05d024b6@bahia.lan>
In-Reply-To: <a5f65374-a683-1a0f-76c0-fe0e2150b6de@redhat.com>
References: <155721868351.451636.16735088470797960209.stgit@bahia.lan>
	<155721868932.451636.17837774103334071645.stgit@bahia.lan>
	<a5f65374-a683-1a0f-76c0-fe0e2150b6de@redhat.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2970405432636315954
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.38.119
Subject: Re: [Qemu-devel] [PATCH 1/6] fsdev: Drop unused extern declaration
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

On Tue, 7 May 2019 12:15:16 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 07/05/2019 10.44, Greg Kurz wrote:
> > This is a leftover of the handle backend, removed in QEMU 4.0.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  fsdev/qemu-fsdev.h |    1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/fsdev/qemu-fsdev.h b/fsdev/qemu-fsdev.h
> > index d9716b414492..844159d1e1ff 100644
> > --- a/fsdev/qemu-fsdev.h
> > +++ b/fsdev/qemu-fsdev.h
> > @@ -41,7 +41,6 @@ typedef struct FsDriverListEntry {
> >  int qemu_fsdev_add(QemuOpts *opts, Error **errp);
> >  FsDriverEntry *get_fsdev_fsentry(char *id);
> >  extern FileOperations local_ops;
> > -extern FileOperations handle_ops;
> >  extern FileOperations synth_ops;
> >  extern FileOperations proxy_ops;
> >  #endif
> >   
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Applied to https://github.com/gkurz/qemu/commits/9p-next 

Cheers,

--
Greg

