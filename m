Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3036064DA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:43:35 +0200 (CEST)
Received: from localhost ([::1]:57908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXhm-0000c0-6l
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:43:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXhi-0004fm-Vv
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olUoy-000619-NF
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olUot-0000ZY-LB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666269522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ycEBbpz6T8Uh57Kk/BtTpz5gzwwTOHYamhHNB83CuLI=;
 b=A2aeAEaiWrVlwCtA9zZInHGI97IAJyTbgxBM8kKN+BNdkahH7tK8zCiSBQ8G5WLOvQGb9e
 HEgmZl/b2rDiAH4YEx9yBxOFSsnwljMSoQ4YgZEr4dhjkwuP4SOZ5jBOC7vvHXH5JwNbr0
 kVi5kosmvnp2cuVpF79IdvFP4MSeE6o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-Ka6PFEQWP42fvLDRuyxCbQ-1; Thu, 20 Oct 2022 08:38:41 -0400
X-MC-Unique: Ka6PFEQWP42fvLDRuyxCbQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k34-20020a05600c1ca200b003c706e17799so2155317wms.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ycEBbpz6T8Uh57Kk/BtTpz5gzwwTOHYamhHNB83CuLI=;
 b=oKLVqgNLeSeWuIanjj953/B6C4Mr4J+YbGsv2SRlUT51tJ5ICr9fmLUdFi5QAJ2xzk
 88BhohTA3jsSoqS58J8ElkLQRFnxE0ENjAQg0aTkssLd5BmBGRqPZq0I6iWGg5jE6Cn4
 ecqpjlCC/lqvvF8trIh2CWtb0VpL3rq4eInwn00JZxiJUl7mtI1CxnYVBfPBdhKJ3fzI
 19itMv6ylfv1GSpLYC/nq/PKkKhXZX/jahB8LOkLhfTkxQGX8RkymtnvmG0EFV2s4aOp
 B1ya5J7YgxmAiIbNLXP8Y0+3pMeAfJRKy3T9a5kvgLdcsxu9r2+0bK18mxUc69USvS+Q
 n2cQ==
X-Gm-Message-State: ACrzQf0ZQiAEfYXMk8ipTWmbgK/n0Bmiy4mb6+2s3RLSsy4Nxq85E97Y
 wPu2HeWOiJdIcZf/WNyp3kEgHmDnUzONGovR0zM99j3Yei+HCCJXdwfqGu2gxH655W2Mk6bBwKv
 WHHVwcKeWRptYDnI=
X-Received: by 2002:adf:e192:0:b0:232:3648:776d with SMTP id
 az18-20020adfe192000000b002323648776dmr8691576wrb.698.1666269520679; 
 Thu, 20 Oct 2022 05:38:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7EJWw6TmhS+AwG6ZO3lN5c1ui3lSb+h41/pEmj7L2ewEV0501TFPWBvPxoC86w7EfEVzltHg==
X-Received: by 2002:adf:e192:0:b0:232:3648:776d with SMTP id
 az18-20020adfe192000000b002323648776dmr8691555wrb.698.1666269520374; 
 Thu, 20 Oct 2022 05:38:40 -0700 (PDT)
Received: from redhat.com ([2.54.191.184]) by smtp.gmail.com with ESMTPSA id
 j28-20020a5d6e5c000000b0022cd27bc8c1sm19918342wrz.9.2022.10.20.05.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:38:39 -0700 (PDT)
Date: Thu, 20 Oct 2022 08:38:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu Devel <qemu-devel@nongnu.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <20221020083810-mutt-send-email-mst@kernel.org>
References: <20221020123506.26363-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221020123506.26363-1-ani@anisinha.ca>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:
> Please see the rst doc file in patch 9 for more details.
> Sample runs are as follows:
> 
> Passed tests:
> 
> $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> JOB ID     : e95c7413e996bfb59389839e5ca5105464ef098f
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.15-e95c741/job.log
>  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PASS (33.08 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 39.18 s
> 
> 
> $ ./tests/venv/bin/avocado run ./tests/avocado/acpi-bits.py 
> Fetching asset from ./tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> JOB ID     : c6e588594bceb2c5fdbdf45095559c58e4030f9c
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.13-c6e5885/job.log
>  (1/1) ./tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PASS (32.29 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 39.27 s
> 
> When PSS tests are enabled:
> 
> $ git diff
> diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> index f818a9cce6..18dc818d62 100644
> --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> @@ -40,8 +40,8 @@ import time
>  
>  def register_tests():
>      testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Processor objects", test_mat, submenu="ACPI Tests")
> -#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
> -#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
> +    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
> +    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
>      testsuite.add_test("ACPI DSDT (Differentiated System Description Table)", test_dsdt, submenu="ACPI Tests")
>      testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", test_facp, submenu="ACPI Tests")
>      testsuite.add_test("ACPI HPET (High Precision Event Timer Table)", test_hpet, submenu="ACPI Tests")
> 
> $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> JOB ID     : 16a8b8c7f8dc87c4b84f8a2f95135bb63464a71e
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T22.43-16a8b8c/job.log
>  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: FAIL: '1' != '0'\n- 1\n+ 0\n : Some bits tests seems to have failed. Please check the test logs for more info. (33.01 s)
> RESULTS    : PASS 0 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 39.17 s
> 
> 
> Changelog:
> v6:
>   - skip test when dependencies (xorriso for example) are not installed.
>   - skip test when run on a platform other than x86_64.

Hmm why is that btw?

>   - move README as an rst file under docs/devel.
>   - updated tags.
> v5:
>   - fixed bits so that grub-mkrescue is built as a static binary.
>   - updated the test so that it points to the new bits artifact.
>   - V=1 now spits out more meaningful information on failure.
>   - added a check to see if xorriso is installed. If not, the test skips with
>     a meaningful message instructing the user to install it.
>   - fixed README by removing references to stale instructions and adding
>     updated instructions.
>   - tags updated.
> v4:
>   - renamed the bits test files as .py2.
>   - fixed a bug with missing log file parsing. dump bits logs automatically
>     for test failures (no need to re-run with V=1).
>   - fixed issues with README file and enhanced it.
>   - cosmetic comment updates.
> v3:
>   - converted the existing test to avocado tests as per the popular
>     recommendation. Added appropriate tags.
>   - artifact download URL modified based on gitlab-CI URL.
> 
>   For biosbits repo:
>   - moved to a gitlab repo with me being the maintainer.
>   - added .gitlab-ci.yml file to generate the artifacts.
> v2:
>  - a new class of python based tests introduced that is separate from avocado
>    tests or qtests. Can be run by using "make check-pytest".
>  - acpi biosbits tests are the first tests to use pytest environment.
>  - bios bits tests now download the bits binary archives from a remote
>    repository if they are not found locally. The test skips if download
>    fails.
>  - A new environment variable is introduced that can be passed by the tester
>    to specify the location of the bits archives locally. test skips if the
>    bits binaries are not found in that location.
>  - if pip install of python module fails for whatever reaoson, the test skips.
>  - misc code fixes including spell check of the README doc. README has been
>    updated as well.
>  - addition of SPDX license headers to bits test files.
>  - update MAINTAINERS to reflect the new pytest test class.
> 
> For biosbits repo:
>  - added Dockerfile and build script. Made bios bits build on gcc 11.
>    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
>    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
>    The build script generates the zip archive and tarball used by the test.
> 
> v1: initial patchset. uses qtest to implement the bios bits tests.
> 
> Cc: Qemu Devel <qemu-devel@nongnu.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> 
> Ani Sinha (10):
>   acpi/tests/avocado/bits: initial commit of test scripts that are run
>     by biosbits
>   acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
>     tests
>   acpi/tests/avocado/bits: disable acpi PSS tests that are failing in
>     biosbits
>   acpi/tests/avocado/bits: add smilatency test suite from bits in order
>     to disable it
>   acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
>     smilatency tests
>   acpi/tests/avocado/bits: disable smilatency test since it does not
>     pass everytime
>   acpi/tests/avocado/bits: add biosbits config file for running bios
>     tests
>   acpi/tests/avocado/bits: add acpi and smbios avocado tests that uses
>     biosbits
>   acpi/tests/avocado/bits/doc: add a doc file to describe the acpi bits
>     test
>   MAINTAINERS: add myself as the maintainer for acpi biosbits avocado
>     tests
> 
>  MAINTAINERS                                   |    6 +
>  docs/devel/acpi-bits.rst                      |  148 +
>  tests/avocado/acpi-bits.py                    |  389 +++
>  .../acpi-bits/bits-config/bits-cfg.txt        |   18 +
>  tests/avocado/acpi-bits/bits-tests/smbios.py2 | 2434 +++++++++++++++++
>  .../acpi-bits/bits-tests/smilatency.py2       |  107 +
>  .../avocado/acpi-bits/bits-tests/testacpi.py2 |  287 ++
>  .../acpi-bits/bits-tests/testcpuid.py2        |   87 +
>  8 files changed, 3476 insertions(+)
>  create mode 100644 docs/devel/acpi-bits.rst
>  create mode 100644 tests/avocado/acpi-bits.py
>  create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/smilatency.py2
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> 
> -- 
> 2.34.1


