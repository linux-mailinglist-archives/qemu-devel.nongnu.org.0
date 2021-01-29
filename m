Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E3308BD3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:47:08 +0100 (CET)
Received: from localhost ([::1]:52856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XrP-00063F-Na
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5XOu-0001ZL-Uj
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:17:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5XOr-0001Cy-C7
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3NxHYfMUbpECwuHwxAGd0LqasxBmgFJGIZqLSWokleA=;
 b=bsc+VfHn00WsA5lPCJ+T7PmEUFjt8ymISqGtxSDUpoORU9rvOj+2LSz80H4n2p3H29/dtJ
 PWf6e1ZwaaBIjyQZtTW1JZPIzSoHAA1Kxac++OUkJWxPcqOPg8Rjx3Nruw+sgiMIpuHqin
 YYTmWMYlb2XMjbiF+pAltIVkQFRz3w8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-l2TlIK2cNx2EfcJO5vhcww-1; Fri, 29 Jan 2021 12:17:32 -0500
X-MC-Unique: l2TlIK2cNx2EfcJO5vhcww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A5611800D41;
 Fri, 29 Jan 2021 17:17:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-198.ams2.redhat.com [10.36.114.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DDF719725;
 Fri, 29 Jan 2021 17:17:30 +0000 (UTC)
Date: Fri, 29 Jan 2021 18:17:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/2] block: Fix iotests to respect configured Python binary
Message-ID: <20210129171728.GJ10888@merkur.fritz.box>
References: <20210129145240.34104-1-kwolf@redhat.com>
 <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.01.2021 um 17:13 hat Peter Maydell geschrieben:
> On Fri, 29 Jan 2021 at 14:52, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit 5101d00d2f1138a73344dc4833587f76d7a5fa5c:
> >
> >   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-01-29 10:10:43 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to 4cea90be62f4f15a63e1a8f7d5d0958f79fdf290:
> >
> >   tests/Makefile.include: export PYTHON for check-block.sh (2021-01-29 12:32:36 +0100)
> >
> > ----------------------------------------------------------------
> > Block layer patches:
> >
> > - Fix iotests to respect configured Python binary
> >
> > ----------------------------------------------------------------
> 
> This is definitely better so I'm going to apply it, but it seems
> to reveal a pile of iotest failures on FreeBSD:
> [...]
> Failures: 030 040 041 127 256

Hm... I did run 'make check-block' on a FreeBSD VM before sending the
pull request, but it turns out I ran it on the wrong branch. *sigh*

After rerunning it with the right one (and manually so that I get all
tests, not just those in 'make check-block'), however, while I'm seeing
some failures, my list of failing cases and your list are completely
disjoint:

    Failures: 115 125 145 182 286 298 300 migrate-bitmaps-postcopy-test
    migrate-bitmaps-test

All of these are test cases that are not run during 'make check-block',
so I would assume that they were already broken before.

So there seems to be something more specific to the environment that
made your test cases fail than just FreeBSD.

> though the entire build goes on to succeed (which is probably
> a test framework bug somewhere...)

This is not good, and it can easily be reproduced on Linux by simply
changing the reference output of a test so that it fails. 'check'
doesn't seem to return the right exit code any more.

Kevin


