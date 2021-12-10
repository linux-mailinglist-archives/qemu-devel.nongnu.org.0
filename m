Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720DA4705A2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 17:27:36 +0100 (CET)
Received: from localhost ([::1]:40804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvikB-00026X-Ap
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 11:27:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvij6-00015v-BQ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:26:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mviiz-0005eM-By
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639153580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ea9c/72VN5fuyH42g1GN8aCYtL1wMJMZ5DqbyO13qcc=;
 b=I3Z6B5JhPXP7XwfjV1vSuX9RqwfOY0u1yhUhVDDOgs/zT3noEf11XcP258u7XSxc2diLvd
 OVa0WJfDUtAVpzmhSyCG19EPA5RlN44mvUn0Nvvbi4E4l3PyuPgMexFTS34g5RK+ZDfOBK
 vIcRqLC6mHkFXijsmIypcaJ16c8p69A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-AasPIe9oNTKlpXUS-aEwlA-1; Fri, 10 Dec 2021 11:26:19 -0500
X-MC-Unique: AasPIe9oNTKlpXUS-aEwlA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03D2885B664;
 Fri, 10 Dec 2021 16:26:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B385781EB;
 Fri, 10 Dec 2021 16:26:11 +0000 (UTC)
Date: Fri, 10 Dec 2021 17:26:10 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 3/3] iotests: check: multiprocessing support
Message-ID: <YbN/ojNCdKRxhXW5@redhat.com>
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-4-vsementsov@virtuozzo.com>
 <YbNl6BA0shsS6TX1@redhat.com>
 <a1b79536-8715-1bf2-729c-2aae4345050b@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <a1b79536-8715-1bf2-729c-2aae4345050b@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: den@openvz.org, hreitz@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.12.2021 um 15:46 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 10.12.2021 17:36, Kevin Wolf wrote:
> > Am 03.12.2021 um 13:22 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > Add -j <JOBS> parameter, to run tests in several jobs simultaneously.
> > > For realization - simply utilize multiprocessing.Pool class.
> > > 
> > > Notes:
> > > 
> > > 1. Of course, tests can't run simultaneously in same TEST_DIR. So,
> > >     use subdirectories TEST_DIR/testname/ and SOCK_DIR/testname/
> > >     instead of simply TEST_DIR and SOCK_DIR
> > > 
> > > 2. multiprocessing.Pool.starmap function doesn't support passing
> > >     context managers, so we can't simply pass "self". Happily, we need
> > >     self only for read-only access, and it just works if it is defined
> > >     in global space. So, add a temporary link TestRunner.shared_self
> > >     during run_tests().
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > 
> > Just wondering, is it worth even supporting the mp=false case or can we
> > simplify the code a bit by always going through multiprocessing and
> > using nice directory names even if only one process is spawned?
> > 
> > Maybe John's observation that directory names get longer might be a
> > reason not to do that by default. Any other reasons you're aware of?
> 
> I just wanted to keep the behavior without a new option unchanged, to
> not deal with possible CI failures on "make check": who know what
> multiprocessing brings together with performance.

So basically just err on the side of caution. Makes sense.

Kevin


