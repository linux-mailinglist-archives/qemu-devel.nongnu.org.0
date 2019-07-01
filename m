Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A066018A7B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 15:23:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOj18-00016E-PB
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 09:23:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hOizC-0000Dt-VU
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:21:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hOizB-0000iv-SD
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:21:22 -0400
Received: from 17.mo6.mail-out.ovh.net ([46.105.36.150]:34002)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hOizB-0000hw-Kr
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:21:21 -0400
Received: from player763.ha.ovh.net (unknown [10.109.146.211])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 9D1BA1BEBEA
	for <qemu-devel@nongnu.org>; Thu,  9 May 2019 15:21:19 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player763.ha.ovh.net (Postfix) with ESMTPSA id 588D2593F189;
	Thu,  9 May 2019 13:21:15 +0000 (UTC)
Date: Thu, 9 May 2019 15:21:14 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190509152114.2e86df32@bahia.lan>
In-Reply-To: <17369369-07a5-43e9-af96-f0d83a86d47d@redhat.com>
References: <155721868351.451636.16735088470797960209.stgit@bahia.lan>
	<155721869488.451636.17943384710743134351.stgit@bahia.lan>
	<17369369-07a5-43e9-af96-f0d83a86d47d@redhat.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2976597881109649714
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.150
Subject: Re: [Qemu-devel] [PATCH 2/6] fsdev: Drop unused opaque field
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

On Tue, 7 May 2019 12:24:42 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 07/05/2019 10.44, Greg Kurz wrote:
> > This was introduced along with -fsdev but it never got used.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  fsdev/file-op-9p.h |    1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> > index 3fa062b39f1b..c757c8099f54 100644
> > --- a/fsdev/file-op-9p.h
> > +++ b/fsdev/file-op-9p.h
> > @@ -147,7 +147,6 @@ struct FileOperations
> >      int (*renameat)(FsContext *ctx, V9fsPath *olddir, const char *old_name,
> >                      V9fsPath *newdir, const char *new_name);
> >      int (*unlinkat)(FsContext *ctx, V9fsPath *dir, const char *name, int flags);
> > -    void *opaque;
> >  };
> >  
> >  #endif
> >   
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>


Applied to https://github.com/gkurz/qemu/commits/9p-next 

Cheers,

--
Greg

