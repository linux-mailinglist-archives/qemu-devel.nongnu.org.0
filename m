Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EAD2F9C2D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:08:22 +0100 (CET)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RSP-0005Ft-Nt
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1RKB-0000SU-5Y
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:59:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1RK7-0006a8-HZ
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610963986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DpcY3437a8PVy6geJVwRKEsBgaB9qPlibQZk+0ZJ0lI=;
 b=QFH4tZ4qAIbvkZhjZOpwxag3gVtRiqRl5e3f4CGM+Ay2JP1Eupyc32LVK6f/2mndF5e8+U
 YoFS5Yy41iDjh3RJMgyTMAdlZkdbzpezhNxuVosWZb9p2JtCw3hY7DB/pV7gtezA8wSLR4
 0T0PFBSNg6dv+Ppspv1yCpdnoA2hIxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-_Qihui0VNguXjfjFJf-nOQ-1; Mon, 18 Jan 2021 04:59:43 -0500
X-MC-Unique: _Qihui0VNguXjfjFJf-nOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76E7C180A0A8;
 Mon, 18 Jan 2021 09:59:42 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 070676267E;
 Mon, 18 Jan 2021 09:59:40 +0000 (UTC)
Date: Mon, 18 Jan 2021 10:59:39 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
Message-ID: <20210118095939.GA11555@merkur.fritz.box>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210115111827.GB5429@merkur.fritz.box>
 <6fbbcc18-3f14-bcd6-05a2-a40e0352710d@virtuozzo.com>
 <20210115124555.GC5429@merkur.fritz.box>
 <41e62d69-30f1-eb86-6cc3-cdd052aadb26@virtuozzo.com>
 <20210115132019.GD5429@merkur.fritz.box>
 <7e520790-bc1e-739e-3822-ca78799f5a3f@virtuozzo.com>
 <c52d0f46-116f-5f28-a15f-0bc128fca7eb@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <c52d0f46-116f-5f28-a15f-0bc128fca7eb@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.01.2021 um 12:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 15.01.2021 16:30, Vladimir Sementsov-Ogievskiy wrote:
> > 15.01.2021 16:20, Kevin Wolf wrote:
> > > Am 15.01.2021 um 14:10 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > 15.01.2021 15:45, Kevin Wolf wrote:
> > > > > Am 15.01.2021 um 13:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > > > 15.01.2021 14:18, Kevin Wolf wrote:
> > > > > > > Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > > > > > Add TestEnv class, which will handle test environment in a new python
> > > > > > > > iotests running framework.
> > > > > > > > 
> > > > > > > > Difference with current ./check interface:
> > > > > > > > - -v (verbose) option dropped, as it is unused
> > > > > > > > 
> > > > > > > > - -xdiff option is dropped, until somebody complains that it is needed
> > > > > > > > - same for -n option
> > > > > > > > 
> > > > > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > > > > > > ---
> > > > > > > >     tests/qemu-iotests/testenv.py | 328 ++++++++++++++++++++++++++++++++++
> > > > > > > >     1 file changed, 328 insertions(+)
> > > > > > > >     create mode 100755 tests/qemu-iotests/testenv.py
> > > > > > > > 
> > > > 
> > > > [..]
> > > > 
> > > > > > > > +    def init_binaries(self):
> > > > > > > > +        """Init binary path variables:
> > > > > > > > +             PYTHON (for bash tests)
> > > > > > > > +             QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
> > > > > > > > +             SOCKET_SCM_HELPER
> > > > > > > > +        """
> > > > > > > > +        self.python = '/usr/bin/python3 -B'
> > > > > > > 
> > > > > > > This doesn't look right, we need to respect the Python binary set in
> > > > > > > configure (which I think we get from common.env)
> > > > > > 
> > > > > > Oh, I missed the change. Then I should just drop this self.python.
> > > > > 
> > > > > Do we still get the value from elsewhere or do we need to manually parse
> > > > > common.env?
> > > > 
> > > > Hmm.. Good question. We have either parse common.env, and still create self.python variable.
> > > > 
> > > > Or drop it, and include common.env directly to bash tests. For this we'll need to export
> > > > 
> > > > BUILD_IOTESTS, and do
> > > >   . $BUILD_IOTESTS/common.env
> > > > 
> > > > in common.rc..
> > > 
> > > check uses it, too, for running Python test cases.
> > > 
> > 
> > But new check (written in python) doesn't.. Should I keep bash check, which will have only one line to call check.py with help of PYTHON?
> > 
> > 
> 
> Or finally, may be just drop it? Can we just use system python for
> tests, now when we are already in a python3 world?

You can only assume the Python 3 (or more specifically 3.6+) world if
you are using the Python interpreter that was passed to configure. This
will commonly be the same thing as the first python3 in PATH, but it
doesn't have to be.

So your solution of just using the same interpreter as for check might
be okay as long as we make sure that 'make check' calls check with the
configured Python interpreter instead of relying on the shebang line.

Kevin


