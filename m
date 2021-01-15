Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81562F7CB1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:32:31 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PDK-0007Pc-RD
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l0P1n-0005zk-H2
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:20:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l0P1l-0002lf-Sj
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5RoNv5ZJX97Ue4M4MyFt1No/8gLFSrot54XAFAWti4=;
 b=bEHJnZl9M0cOcMBe+brvmREeDH34t/DJrGgIlaLtMLESoUvckQxJcL2WYhuuKeV9VW+6uC
 wMDkZyb1kT39QLp3O08+H09LsaGuFQrJfeA2Xh08TfPnm3mE01q1iNMuKbRZiC31Dyf1FM
 RvWfD/hu/EEGIzcrae8hVJ0geGLgUK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-YZz96hz0MFSN0N5VWK-G-g-1; Fri, 15 Jan 2021 08:20:24 -0500
X-MC-Unique: YZz96hz0MFSN0N5VWK-G-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EF2D107ACF8;
 Fri, 15 Jan 2021 13:20:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0238B71D55;
 Fri, 15 Jan 2021 13:20:20 +0000 (UTC)
Date: Fri, 15 Jan 2021 14:20:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
Message-ID: <20210115132019.GD5429@merkur.fritz.box>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210115111827.GB5429@merkur.fritz.box>
 <6fbbcc18-3f14-bcd6-05a2-a40e0352710d@virtuozzo.com>
 <20210115124555.GC5429@merkur.fritz.box>
 <41e62d69-30f1-eb86-6cc3-cdd052aadb26@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <41e62d69-30f1-eb86-6cc3-cdd052aadb26@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 15.01.2021 um 14:10 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 15.01.2021 15:45, Kevin Wolf wrote:
> > Am 15.01.2021 um 13:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > 15.01.2021 14:18, Kevin Wolf wrote:
> > > > Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > > Add TestEnv class, which will handle test environment in a new python
> > > > > iotests running framework.
> > > > > 
> > > > > Difference with current ./check interface:
> > > > > - -v (verbose) option dropped, as it is unused
> > > > > 
> > > > > - -xdiff option is dropped, until somebody complains that it is needed
> > > > > - same for -n option
> > > > > 
> > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > > > ---
> > > > >    tests/qemu-iotests/testenv.py | 328 ++++++++++++++++++++++++++++++++++
> > > > >    1 file changed, 328 insertions(+)
> > > > >    create mode 100755 tests/qemu-iotests/testenv.py
> > > > > 
> 
> [..]
> 
> > > > > +    def init_binaries(self):
> > > > > +        """Init binary path variables:
> > > > > +             PYTHON (for bash tests)
> > > > > +             QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
> > > > > +             SOCKET_SCM_HELPER
> > > > > +        """
> > > > > +        self.python = '/usr/bin/python3 -B'
> > > > 
> > > > This doesn't look right, we need to respect the Python binary set in
> > > > configure (which I think we get from common.env)
> > > 
> > > Oh, I missed the change. Then I should just drop this self.python.
> > 
> > Do we still get the value from elsewhere or do we need to manually parse
> > common.env?
> 
> Hmm.. Good question. We have either parse common.env, and still create self.python variable.
> 
> Or drop it, and include common.env directly to bash tests. For this we'll need to export
> 
> BUILD_IOTESTS, and do
>  . $BUILD_IOTESTS/common.env
> 
> in common.rc..

check uses it, too, for running Python test cases.

Kevin


