Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4862969F788
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:17:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqrQ-0006yg-Ej; Wed, 22 Feb 2023 10:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUqrO-0006yJ-LI
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUqrF-0000ZI-AN
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677078992;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2dXGeMYgMlkF+ye79JfN2mPyXy2RA5JhzSHb9/ODXY=;
 b=XZ2I9m6JhXWs5t8P68KltP+Ba0pTFBzjzRlLejkYR7xrx4XJqPXGQeSENbWveLwmubf2ZW
 JXoOtd5ErV3UvqbrR3qFJcYE8ye4VNz5nIHonB4b3hDcF6xYZVk74K+4+BgkywtqarhG+b
 5jTop5AsW+Yl4OyJ4zkN4PeXzea+8tE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-4WynR-RDN5SnV8Gy72M6og-1; Wed, 22 Feb 2023 10:16:27 -0500
X-MC-Unique: 4WynR-RDN5SnV8Gy72M6og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CB0A100F908;
 Wed, 22 Feb 2023 15:16:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 696DCC15BA0;
 Wed, 22 Feb 2023 15:16:25 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:16:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org,
 thuth@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH 09/10] Python: Drop support for Python 3.6
Message-ID: <Y/Yxx3Awi9q6LRNg@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-10-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222143752.466090-10-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 03:37:51PM +0100, Paolo Bonzini wrote:
> Python 3.6 was EOL 2021-12-31. Newer versions of upstream libraries have
> begun dropping support for this version and it is becoming more
> cumbersome to support. Avocado-framework and qemu.qmp each have their
> own reasons for wanting to drop Python 3.6, but won't until QEMU does.
> 
> Versions of Python available in our supported build platforms as of today,
> with optional versions available in parentheses:
> 
> openSUSE Leap 15.4: 3.6.15 (3.9.10, 3.10.2)
> CentOS Stream 8:    3.6.8  (3.8.13, 3.9.16)
> CentOS Stream 9:    3.9.13
> Fedora 36:          3.10
> Fedora 37:          3.11
> Debian 11:          3.9.2
> Alpine 3.14, 3.15:  3.9.16
> Alpine 3.16, 3.17:  3.10.10
> Ubuntu 20.04 LTS:   3.8.10
> Ubuntu 22.04 LTS:   3.10.4
> NetBSD 9.3:         3.9.13*
> FreeBSD 12.4:       3.9.16
> FreeBSD 13.1:       3.9.16
> OpenBSD 7.2:        3.9.16
> 
> Note: Our VM tests install 3.7 specifically for freebsd and netbsd; the
> default for "python" or "python3" in FreeBSD is 3.9.16. NetBSD does not
> appear to have a default meta-package, but offers several options, the
> lowest of which is 3.7.15. "python39" appears to be a pre-requisite to
> one of the other packages we request in tests/vm/netbsd.
> 
> Since it is safe to under our supported platform policy, bump our
> minimum supported version of Python to 3.7.

Your updated support policy doc patch could be included in
this series perhaps.

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure                |  8 ++++----
>  python/Makefile          | 10 +++++-----
>  python/setup.cfg         |  7 +++----
>  python/tests/minreqs.txt |  2 +-
>  scripts/qapi/mypy.ini    |  2 +-
>  5 files changed, 14 insertions(+), 15 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


