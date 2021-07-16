Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F073CB8BA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 16:33:00 +0200 (CEST)
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Otf-0002D5-4V
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 10:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m4Osj-0001Vo-8K
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m4Osf-0007j3-34
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626445915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1DCs0/Brf8tltpqdJUJlgMpBEloYxuYZMJMa2uZpXG0=;
 b=JPuEPb5NETde432pyEQfhEQsAlla24Gu3aSi1eRlPdwLNDcfzq1MgT4yhEC9gPxxKqZFNt
 t76pjKFVvkvVNk+BAYv+OK2VGyeIepp7YbovkxdHm2+aSEJr6keU3lBHm/aLcqUCRZno1d
 LxS/J4hwT+ZWIrJLzRTuuxolfkgKLJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-uUUx280ONsi6GeRjDuCEKg-1; Fri, 16 Jul 2021 10:31:53 -0400
X-MC-Unique: uUUx280ONsi6GeRjDuCEKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63A109F933;
 Fri, 16 Jul 2021 14:31:52 +0000 (UTC)
Received: from redhat.com (ovpn-113-8.ams2.redhat.com [10.36.113.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55E495C1A3;
 Fri, 16 Jul 2021 14:31:51 +0000 (UTC)
Date: Fri, 16 Jul 2021 16:31:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
Message-ID: <YPGYVeuzp3lj2yJk@redhat.com>
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <CAFEAcA9PSZaHkV-qL9jvXX_MFKwYJJTSQ4FjQJfwyRi7GvJvWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9PSZaHkV-qL9jvXX_MFKwYJJTSQ4FjQJfwyRi7GvJvWg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.07.2021 um 17:53 hat Peter Maydell geschrieben:
> On Sat, 10 Jul 2021 at 14:30, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > I've noticed recently that intermittently 'make check' will hang on
> > my aarch32 test system (really an aarch64 box with an aarch32 chroot).
> >
> > I think from grep that this must be the vhost-user-blk test.
> 
> I've also now seen this on qemu-system-i386 guest x86-64 Linux host:

Your two stack traces look very different to me, the common thing is
just that one process requests something and the other seems to have
ignored it and is just idle.

In the first stack trace, it was the qtest sending the very first
command ('endianness') over the qtest socket and QEMU seemed to ignore
it. In the second stack trace, it is the vhost-user-blk realize() code
in QEMU sending a request to the export in qemu-storage-daemon and never
getting an answer.

If this is the same bug, it looks to me as if it's something with the
event notification in the main loop? Can we check if there would
actually be an event pending in the apparently idle process if ppoll()
returned?

Kevin


