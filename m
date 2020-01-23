Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70414708C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 19:15:21 +0100 (CET)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuh0h-0001cQ-7m
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 13:15:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iuf3z-00053d-Ph
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:10:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iuf3y-0003ee-Ij
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:10:35 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23960
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iuf3y-0003cx-F0
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579795833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTgItTv7UGD6tSmGOR9yEXAcfQlgIpGH/IvlMaFQ9XY=;
 b=bsHbJfuQ6CqESEk7I7ZMuRfsDeYx3vTBie1ZsuLpesZvsdLsdJMZe+ewSL3oFuctwsrZAM
 P14cfXNWYSChfVp833SPzH8bC3h04hz6PH1HtjX/zjyxxBEaVBP6UqOxxJPDpsp2ErVSic
 /+6FpucWA3CUgz+mSIBckD3Vpo7U0tw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-4yyKca2WMuiBTTz0OVMtZw-1; Thu, 23 Jan 2020 11:10:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8886E477;
 Thu, 23 Jan 2020 16:10:29 +0000 (UTC)
Received: from work-vm (ovpn-116-110.ams2.redhat.com [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24A155C1BB;
 Thu, 23 Jan 2020 16:10:25 +0000 (UTC)
Date: Thu, 23 Jan 2020 16:10:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 000/111] virtiofs queue
Message-ID: <20200123161023.GC2732@work-vm>
References: <20200123115841.138849-1-dgilbert@redhat.com>
 <CAFEAcA_7T2Yu8fXv7XycSSN=8xoi8aciR5NMh76o8LQxNU6rDw@mail.gmail.com>
 <20200123153052.GA2732@work-vm>
 <CAFEAcA8ufZTy=T_iixbHMN6a7GZxxRkod6y_1Vu_vbsoioDV=g@mail.gmail.com>
 <20200123160202.GB2732@work-vm>
 <CAFEAcA_GqmeuYZO-SWAiMxjn6LOSpE2y8dJ2N6tvVprYWHZeOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_GqmeuYZO-SWAiMxjn6LOSpE2y8dJ2N6tvVprYWHZeOQ@mail.gmail.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 4yyKca2WMuiBTTz0OVMtZw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 23 Jan 2020 at 16:02, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > I think the case would be better if the
> > > doc you were adding was the virtiofsd manpage, which doesn't
> > > seem to exist yet).
> >
> > Yes it does, see 'virtiofsd: add man page' (patch 0094),
> > tools/virtiofsd/virtiofsd.texi
>=20
> I would really like to enforce "no new texi documentation".
> Otherwise it ends up on my todo list to have to do the
> conversion to rST later, and there's already enough
> texi that needs converting :-(

OK, then drop the man page for now and we'll do the rst conversion.

Dave

> thanks
> -- PMM
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


