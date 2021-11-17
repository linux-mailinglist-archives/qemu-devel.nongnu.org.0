Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371A454A48
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:48:01 +0100 (CET)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNAF-0007wy-Ia
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:47:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnN8l-0006jx-Pq
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:46:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnN8h-0000Kx-0J
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637163980;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cn2/Kd/LXaRKxCYbKibQHi0WDjrid1X91aULAertQNg=;
 b=ds2mxgdJ+UHd2Ypycem1/ijJxecq6Th/vSOPU9gTCf7VuHlqxfdFsBA0l5Sj7aTdocMdz9
 1QGgM9Y8CVc888J7CQodxp32lnmoNYvNiS4BcNfrVpeC6pNocbWc8cf5aeZJ/OyoJPjYSM
 vn1fz2RQEETgUh9H8FF87Vw0ES2iUqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-e6YxyVi9NBuRcDUsgmdLNw-1; Wed, 17 Nov 2021 10:46:16 -0500
X-MC-Unique: e6YxyVi9NBuRcDUsgmdLNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79D71100CCC0;
 Wed, 17 Nov 2021 15:46:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9675760C4A;
 Wed, 17 Nov 2021 15:46:12 +0000 (UTC)
Date: Wed, 17 Nov 2021 15:46:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 2/2] iotests/149: Skip on unsupported ciphers
Message-ID: <YZUjwQ8BzU+fIPUC@redhat.com>
References: <20211117151707.52549-1-hreitz@redhat.com>
 <20211117151707.52549-3-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211117151707.52549-3-hreitz@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 04:17:07PM +0100, Hanna Reitz wrote:
> Whenever qemu-img or qemu-io report that some cipher is unsupported,
> skip the whole test, because that is probably because qemu has been
> configured with the gnutls crypto backend.
> 
> We could taylor the algorithm list to what gnutls supports, but this is
> a test that is run rather rarely anyway (because it requires
> password-less sudo), and so it seems better and easier to skip it.  When
> this test is intentionally run to check LUKS compatibility, it seems
> better not to limit the algorithms but keep the list extensive.

I'd really like to figure out a way to be able to partially run
this test. When I have hit problems in the past, I needed to
run specific tests, but then the expected output always contains
everything.  I've thought of a few options

 - Split it into many stanadlone tests - eg
     tests/qemu-iotests/tests/luks-host-$ALG

 - Split only the expected output eg
 
     149-$SUBTEST

  and have a way to indicate which of expected output files
  we need to concatenate for the set of subtests that we
  run.

 - Introduce some template syntax in expected output
   tha can be used to munge the output.

 - Stop comparing expected output entirely and just
   then this into a normal python unit test.

 - Insert your idea here ?

> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/149 | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


