Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E933B255
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:15:59 +0100 (CET)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLm8c-0003Ds-Jy
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLm1x-0006lF-4C
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:09:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLm1u-0001Uy-Lg
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615810141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yl9KYG9rduDKq6Jd3M9d7X7us+PtfCvYWlc0G0+IEEM=;
 b=ZiAUwxsPoCzy0g3QmzrbZg/Ju9rDy/5KYAhCK7atUbkZxnsl4oi7/W9H0wGh+ASr5AXKnV
 mofOEXwPdaA8nS/1x5J1rQDZfCgCCp1oFIL7+6yTaoiYuCnm1LnlipXK7b3WF/5GnIGQ7l
 SfwB7wokdzyK9jElQB+NQepGFBFVJLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-mb7ZA_-qMhuuR0ZuxeFlaA-1; Mon, 15 Mar 2021 08:08:59 -0400
X-MC-Unique: mb7ZA_-qMhuuR0ZuxeFlaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9FE118460E3;
 Mon, 15 Mar 2021 12:08:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-128.ams2.redhat.com [10.36.115.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12CDC19809;
 Mon, 15 Mar 2021 12:08:57 +0000 (UTC)
Date: Mon, 15 Mar 2021 13:08:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/38] Block layer patches and object-add QAPIfication
Message-ID: <YE9OWLsICQe/UyKy@merkur.fritz.box>
References: <20210311144811.313451-1-kwolf@redhat.com>
 <CAFEAcA-RkqptbD6Cie_iMr9RgXT-B0mCVcyTwh6NV41EfX+N1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-RkqptbD6Cie_iMr9RgXT-B0mCVcyTwh6NV41EfX+N1g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.03.2021 um 19:56 hat Peter Maydell geschrieben:
> On Thu, 11 Mar 2021 at 14:48, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit d689ecad073e0289afa8ca863e45879d719e5c21:
> >
> >   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-03-10 20:11:33 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to 4756658df7d5104b36ee2f40f30f2d0f10225a53:
> >
> >   qom: Add user_creatable_parse_str() (2021-03-11 13:13:49 +0100)
> >
> > ----------------------------------------------------------------
> > Block layer patches and object-add QAPIfication
> >
> > - QAPIfy object-add and --object for tools
> > - Add vhost-user-blk-test
> > - stream: Fail gracefully if permission is denied
> > - storage-daemon: Fix crash on quit when job is still running
> > - curl: Fix use after free
> > - Fix image creation option defaults that exist in both the format and
> >   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
> >   default was incorrectly applied to the rbd layer)
> >
> 
> This generates new warnings in 'make check':
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> G_TEST_SRCDIR=/home/petmay01/linaro/qemu-for-merges/tests G_TEST
> _BUILDDIR=/home/petmay01/linaro/qemu-for-merges/build/all/tests
> tests/test-char --tap -k
> warning: The alias 'tty' is deprecated, use 'serial' instead

Hm, okay. I guess this means we can't test that a deprecated option
still works. I'll remove the test and resend.

Kevin


