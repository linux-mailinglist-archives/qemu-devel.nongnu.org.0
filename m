Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54E2CFC3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 21:49:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVi5s-0007PW-RY
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 15:49:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hVhuV-0006i5-3g
	for qemu-devel@nongnu.org; Tue, 28 May 2019 15:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hVhuU-0006Ze-8J
	for qemu-devel@nongnu.org; Tue, 28 May 2019 15:37:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hVhuU-0006Ng-15
	for qemu-devel@nongnu.org; Tue, 28 May 2019 15:37:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AD309F758;
	Tue, 28 May 2019 19:37:09 +0000 (UTC)
Received: from localhost (ovpn-116-11.gru2.redhat.com [10.97.116.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8E011972A;
	Tue, 28 May 2019 19:37:06 +0000 (UTC)
Date: Tue, 28 May 2019 16:37:04 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190528193704.GH22103@habkost.net>
References: <87woihi1wl.fsf@dusky.pond.sub.org>
	<20190524185344.GJ10764@habkost.net>
	<87r28k1g4q.fsf@dusky.pond.sub.org>
	<e5372760-7599-3155-44f7-dc704c9cbaa5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5372760-7599-3155-44f7-dc704c9cbaa5@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 28 May 2019 19:37:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] qapi/misc.json is too big,
 let's bite off a few chunks
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
Cc: qemu-devel@nongnu.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 27, 2019 at 12:03:50PM +0200, Paolo Bonzini wrote:
> On 27/05/19 10:00, Markus Armbruster wrote:
> > As long as we don't have an active QOM maintainer[*], the benefit is
> > low.
> > 
> > 
> > [*] We need one.  I'm not volunteering.
> 
> I think Daniel, Eduardo and I could count as de facto maintainer.  I
> guess I could maintain it if I get two partners in crime as reviewers.

Well, I guess this is just what we have been already doing
becoming official.  You can count me in.

-- 
Eduardo

