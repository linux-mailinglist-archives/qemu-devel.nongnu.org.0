Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ADF45C631
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:03:01 +0100 (CET)
Received: from localhost ([::1]:48630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsrT-0007G5-PS
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:02:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpscA-0007KW-8k
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpsc7-0004v6-KZ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637761626;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxEh2PvMDdqnHOyX1OgD/np7OyFM71Jon6Nu8zWjigA=;
 b=PKFu/g6O6l97L3rnIoI3oZTDFf+P5hhUYG6otcYvbnW9urZg/3V3VmzhZWQ/1QMxGAm9Dk
 G3q3Hvz+X3qVCFsql8tfXAfB/p5J7T34FqJXsThauOs60WecTWYCV1cHIikhYvUjk0BTvE
 VKpuJeUXwMXg2IcxoEJ9pYUB/h80c+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-123-JRhovzRoPWCKnxr7IUGSaA-1; Wed, 24 Nov 2021 08:47:03 -0500
X-MC-Unique: JRhovzRoPWCKnxr7IUGSaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18EF915726;
 Wed, 24 Nov 2021 13:47:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3849E1017CE5;
 Wed, 24 Nov 2021 13:46:39 +0000 (UTC)
Date: Wed, 24 Nov 2021 13:46:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 05/18] ci: explicitly skip I/O tests on alpine
Message-ID: <YZ5CPNSZ1YPfCXLT@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-6-berrange@redhat.com>
 <fb749701-0dee-8ae6-da2d-f7ed2c09004f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fb749701-0dee-8ae6-da2d-f7ed2c09004f@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 02:36:59PM +0100, Thomas Huth wrote:
> On 24/11/2021 14.01, Daniel P. Berrangé wrote:
> > The block I/O tests don't work on Alpine because their alternative libc
> > impl emits different strings for errnos, which breaks the expected
> > output matching. e.g.
> > 
> > === IO: pattern 102
> >   wrote 512/512 bytes at offset 512
> >   512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> > -qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
> > +qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: I/O error
> >   4
> >   Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
> >   Formatting 'TEST_DIR/t.IMGFMT.2', fmt=IMGFMT size=0
> > 
> > Currently the I/O tests are skipped as a side effect of the Alpine image
> > containing a minimal busybox 'sed' binary, rather than GNU Sed. This is
> > a fragile assumption that will be invalidated when the dockerfile is
> > changed to be autogenerated from a standardized package list that
> > includes GNU Sed.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   .gitlab-ci.d/buildtest.yml | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> > index 71d0f407ad..e1fe37e563 100644
> > --- a/.gitlab-ci.d/buildtest.yml
> > +++ b/.gitlab-ci.d/buildtest.yml
> > @@ -24,7 +24,7 @@ check-system-alpine:
> >         artifacts: true
> >     variables:
> >       IMAGE: alpine
> > -    MAKE_CHECK_ARGS: check
> > +    MAKE_CHECK_ARGS: check-unit check-qtest
> 
> Hmm, that's just a work-around ... what if some user wants to run "make
> check" on an Alpine installation that has the real GNU sed installed? ... I
> think this rather requires some fixing in the iotests instead - or maybe the
> related tests should simply not be in the "auto" group anymore?

Of course, the I/o tests should be fixed, but that's a big job that on
one has volunteered for.

Taking the tests in question out of the "auto" group would be very
detrimental for test coverage on other platforms. There are many
affected tests so that is not desirable.

As explained above, the CI job is already skipping the I/O tests today
as a side effect of only having Busybox sed. This change just makes
that explicit in the CI config so it is clear that we're missing this
coverage and won't accidentally break when GNU Sed appears in the
dockerfile.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


