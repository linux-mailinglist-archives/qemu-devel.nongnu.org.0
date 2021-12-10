Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992904702FB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:38:06 +0100 (CET)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvh2D-0007CK-6a
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:38:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvh0q-0006Mt-D5
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:36:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvh0n-0003u2-E3
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639146996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uC3MXLH7scmBL6dg6c68jkHMGi+1eVbykGLiNYJOa7E=;
 b=hcM9H0CgbemzV/ysIWYzPc0pRFSq6Pj5F57G8n5+D7lTjvaRIEovfL0w0DLBuAXFTOcxJC
 tKApFQ7W9A0PAV7yzXFelQf+6kwuOY00qGvwwSI8+uszvJW3Sd3qqshrjMAKB2aN9yhB63
 TVb+HlHRLkPnnu91n1EjRDvpXgaAMNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-jLtRa5OkPcuQKVdRbovefQ-1; Fri, 10 Dec 2021 09:36:34 -0500
X-MC-Unique: jLtRa5OkPcuQKVdRbovefQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C33110168D1;
 Fri, 10 Dec 2021 14:36:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B16D5F911;
 Fri, 10 Dec 2021 14:36:26 +0000 (UTC)
Date: Fri, 10 Dec 2021 15:36:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 3/3] iotests: check: multiprocessing support
Message-ID: <YbNl6BA0shsS6TX1@redhat.com>
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211203122223.2780098-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 03.12.2021 um 13:22 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add -j <JOBS> parameter, to run tests in several jobs simultaneously.
> For realization - simply utilize multiprocessing.Pool class.
> 
> Notes:
> 
> 1. Of course, tests can't run simultaneously in same TEST_DIR. So,
>    use subdirectories TEST_DIR/testname/ and SOCK_DIR/testname/
>    instead of simply TEST_DIR and SOCK_DIR
> 
> 2. multiprocessing.Pool.starmap function doesn't support passing
>    context managers, so we can't simply pass "self". Happily, we need
>    self only for read-only access, and it just works if it is defined
>    in global space. So, add a temporary link TestRunner.shared_self
>    during run_tests().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Just wondering, is it worth even supporting the mp=false case or can we
simplify the code a bit by always going through multiprocessing and
using nice directory names even if only one process is spawned?

Maybe John's observation that directory names get longer might be a
reason not to do that by default. Any other reasons you're aware of?

Kevin


