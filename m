Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D1415A08
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 10:29:33 +0200 (CEST)
Received: from localhost ([::1]:53784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTK6m-0002Qp-Og
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 04:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTK5G-0001cg-Hy
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:27:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTK5C-0001sp-Db
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632385673;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=n0m1RsQoo8SKZmNW+p9mbX7w401zkFRpoE7OtZyQvnQ=;
 b=QnLgcs1DKhoKdD4Zij7AqK+XJch+TsWDcGKEx10mF+aG1WXyt3UCFMMmmNF4Vl9ic3LkJb
 gobtWtm0hQsyumQ54+D64O/LcczzMYt8bHIidMmNVclA0wykVqX/oemE+MFbe7wxITv5h/
 Vk2UszwVlrHwp4Hjf9vUNzKtFYIiOJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-MsoWbyPWONytKRx-UCy0EQ-1; Thu, 23 Sep 2021 04:27:52 -0400
X-MC-Unique: MsoWbyPWONytKRx-UCy0EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33775362F8;
 Thu, 23 Sep 2021 08:27:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE7D12C9D5;
 Thu, 23 Sep 2021 08:27:24 +0000 (UTC)
Date: Thu, 23 Sep 2021 09:27:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [PATCH 1/2] docs/devel/testing: add instruction to run a single
 acceptance test
Message-ID: <YUw6akmum97xkT14@redhat.com>
References: <20210922190324.190227-1-willianr@redhat.com>
 <20210922190324.190227-2-willianr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210922190324.190227-2-willianr@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 04:03:23PM -0300, Willian Rampazzo wrote:
> Add instructions to the Acceptance tests section about running a
> single test file or a test within the test file.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  docs/devel/testing.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 4a0abbf23d..b03df34f7b 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -740,6 +740,20 @@ may be invoked by running:
>  
>    tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
>  
> +It is also possible to run tests from a single file or a single test
> +within a test file. To run tests from a single file within the build
> +tree, use:
> +
> + .. code::
> +
> +  tests/venv/bin/avocado run tests/acceptance/$TESTFILE

Before running this users may well need to run

   make check-venv

we can't assume they have previously done "make check-acceptance"
as they're possibly just reproducing a failure from gitlab
CI locally, not running the whole suite.

> +
> +To run a single test within a test file, use:
> +
> + .. code::
> +
> +  tests/venv/bin/avocado run tests/acceptance/$TESTFILE:$TESTCLASS.$TESTNAME
> +

Valid test names are visible in the output from any previous execution
of avocado, and can also be queried using

  tests/venv/bin/avocado list tests/acceptance

>  Manual Installation
>  -------------------
>  
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


