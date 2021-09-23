Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30A6415B37
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:44:09 +0200 (CEST)
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLGy-0002Fv-SZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTLFV-0000ic-CV
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTLFS-0006Ul-3o
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632390152;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ajCJY2tOvUmeNL3C9V6aXK98JfcWE52AZQls8JdWr4=;
 b=P2vBuvpoFfbTUDvI0juH00/i9wKKBfBTUVeutjzzVFn0D6auENgDHy0r+c2/Rv0a/j8BSO
 hNKzvm4eZcHbiiBhgZwlMazqs0CA00Jo58lYR5jyH7AtWmPJy3PBAOnqa+b4kbmwPdgNFE
 bfMMg/BrCJSbcKJBmovAVc1M7RECY+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-y7EbVwZlMT2UKBhRsnJ2DA-1; Thu, 23 Sep 2021 05:42:29 -0400
X-MC-Unique: y7EbVwZlMT2UKBhRsnJ2DA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9719C824FA6;
 Thu, 23 Sep 2021 09:42:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF18A6060F;
 Thu, 23 Sep 2021 09:42:26 +0000 (UTC)
Date: Thu, 23 Sep 2021 10:42:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] tests/Makefile: add TESTFILES option to make
 check-acceptance
Message-ID: <YUxMAJiCW+llt5ml@redhat.com>
References: <20210922190324.190227-1-willianr@redhat.com>
 <20210922190324.190227-3-willianr@redhat.com>
 <1fba1ffa-559b-7c5b-24e0-817f4b855fc5@redhat.com>
 <CAKJDGDbu_DeP25QtvQcM6C0Kt+tXE-7caZaoGL0rcJObZgprKg@mail.gmail.com>
 <2235e846-cfd6-6c67-1e03-dd1ecc38d198@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2235e846-cfd6-6c67-1e03-dd1ecc38d198@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 11:34:18AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/22/21 21:46, Willian Rampazzo wrote:
> > On Wed, Sep 22, 2021 at 4:08 PM Philippe Mathieu-Daudé
> > <philmd@redhat.com> wrote:
> > > 
> > > On 9/22/21 21:03, Willian Rampazzo wrote:
> > > > Add the possibility of running all the tests from a single file, or
> > > > multiple files, running a single test within a file or multiple tests
> > > > within multiple files using `make check-acceptance` and the TESTFILES
> > > > environment variable.
> > > > 
> > > > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > > > ---
> > > >    docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
> > > >    tests/Makefile.include |  5 ++++-
> > > >    2 files changed, 31 insertions(+), 1 deletion(-)
> > > 
> > > > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > > > index 6e16c05f10..82d7ef7a20 100644
> > > > --- a/tests/Makefile.include
> > > > +++ b/tests/Makefile.include
> > > > @@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
> > > >    TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
> > > >    TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
> > > >    TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
> > > > +ifndef TESTFILES
> > > > +     TESTFILES=tests/acceptance
> > > > +endif
> > > >    # Controls the output generated by Avocado when running tests.
> > > >    # Any number of command separated loggers are accepted.  For more
> > > >    # information please refer to "avocado --help".
> > > > @@ -130,7 +133,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> > > >                --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
> > > >                --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
> > > >                $(AVOCADO_TAGS) \
> > > > -            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
> > > > +            $(if $(GITLAB_CI),,--failfast) $(TESTFILES), \
> > > 
> > > Since this is Avocado specific, maybe call the variable
> > > AVOCADO_TESTFILES (similar to AVOCADO_TAGS)?
> > 
> > I don't see a problem with changing that to AVOCADO_TESTFILES. I was
> > trying to make things shorter and easy to remember. If the too-long
> > variable name is not a problem, I can change that.
> 
> This is the generic tests/Makefile, so $TESTFILES might be confusing,
> which is why I prefer the explicit AVOCADO_ prefix (AVOCADO_SHOW,
> AVOCADO_TAGS).

IIUC, this is not actually just test files - it is test files plus the
test names. So better just  $(AVOCADO_TESTS)


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


