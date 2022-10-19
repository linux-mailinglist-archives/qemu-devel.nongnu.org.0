Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F478604D62
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:28:01 +0200 (CEST)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBvD-00042k-U0
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olBUo-0003su-5W
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olBUj-0001CO-C4
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666195236;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyUoR+b1ZIVT7FnkSekWjcQGVX4ig+MEv6xdFobhmB4=;
 b=I5NKrxODHAlPr7jzCsD4dFE1h+ac/P3Qj+hmQbS5VFQJPUl/6YhvM3EG1+zCfcMWhnd52Q
 gaRp/+Iynn83ANF+7QZbvS54vaod74OYK+5j+JiPz7LJtczqBWQ4YEXTBYebo7OXmz0Jt9
 J3VH5VROF+HMy1TN4bIOfA0ggIMpRL0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-SjYG4TTtMYuKMGU4mHsaEQ-1; Wed, 19 Oct 2022 12:00:32 -0400
X-MC-Unique: SjYG4TTtMYuKMGU4mHsaEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03EDA811E67;
 Wed, 19 Oct 2022 16:00:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9F82C15BA5;
 Wed, 19 Oct 2022 16:00:27 +0000 (UTC)
Date: Wed, 19 Oct 2022 17:00:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 03/10] acpi/tests/avocado/bits: disable acpi PSS tests
 that are failing in biosbits
Message-ID: <Y1AfGHwLlZw6tn/5@redhat.com>
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-4-ani@anisinha.ca>
 <877d0vbzji.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877d0vbzji.fsf@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 19, 2022 at 04:30:57PM +0100, Alex Bennée wrote:
> 
> Ani Sinha <ani@anisinha.ca> writes:
> 
> > PSS tests in acpi test suite seems to be failing in biosbits. This is because
> > the test is unable to find PSS support in QEMU bios. Let us disable
> > them for now so that make check does not fail. We can fix the tests and
> > re-enable them later.
> >
> > Example failure:
> >
> > ---- ACPI _PSS (Pstate) table conformance tests ----
> > [assert] _PSS must exist FAIL
> >   \_SB_.CPUS.C000
> >   No _PSS exists
> > Summary: 1 passed, 1 failed
> > ---- ACPI _PSS (Pstate) runtime tests ----
> > [assert] _PSS must exist FAIL
> >   \_SB_.CPUS.C000
> >   No _PSS exists
> > Summary: 0 passed, 1 failed
> >
> > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Maydell Peter <peter.maydell@linaro.org>
> > Cc: John Snow <jsnow@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Alex Bennée <alex.bennee@linaro.org>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Michael Tsirkin <mst@redhat.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/avocado/acpi-bits/bits-tests/testacpi.py2 | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> > index 18dc818d62..f818a9cce6 100644
> > --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> > +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> > @@ -40,8 +40,8 @@ import time
> >  
> >  def register_tests():
> >      testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Processor objects", test_mat, submenu="ACPI Tests")
> > -    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
> > -    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
> > +#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
> > +#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
> >      testsuite.add_test("ACPI DSDT (Differentiated System Description Table)", test_dsdt, submenu="ACPI Tests")
> >      testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", test_facp, submenu="ACPI Tests")
> >      testsuite.add_test("ACPI HPET (High Precision Event Timer Table)", test_hpet, submenu="ACPI Tests")
> 
> I think this breaks bisection so should probably be included in the
> commit that add the test with a comment in the commit message.

IIUC, this is all unreachable code until Patch 08 adds the avocado
test providing the entry point, so bisect ought to be safe.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


