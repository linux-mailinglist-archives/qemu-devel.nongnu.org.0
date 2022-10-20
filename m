Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01907606726
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:38:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZUO-0000DR-Eg
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:37:54 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZUO-000054-BS
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZU7-0006HJ-TY
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:37:35 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZU5-0007fw-2p
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:37:35 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bk15so53757wrb.13
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 10:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUgwkpMMb3PBsXYqB3yLzJb78m92EXT1K6Glc5ZVviQ=;
 b=xGthTBLbgnASAdLdLC2dtR6hezpDLqZ4v8kSed64coRAhyuUaqLwwRyb4abvmKghcr
 fQb3WbwthQLRah6AB81oszEvs+M2nSiBUJ1iMwRGhyEyQNqWfmZcQ4Gz8wsbKXHP87zv
 h1Ly7mDeZhiSOIm3h7lRRggOHryUj6bDIR6TLnqtzHGFpSb7q/qFMSQBS5/OyBnXqT/t
 3vUr8Xt/+5wvxtDxbpm88sysLY9GbcCXu1C0x/t1RWag12JCRn3C1PEb/pCIsNYLF+4W
 b93sQ6LTZhHjBgccx99TCHiQWYhw5rwy71p5LGcxkUgMLTv1WLNOkV1MAEY4vzIjry+0
 8cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FUgwkpMMb3PBsXYqB3yLzJb78m92EXT1K6Glc5ZVviQ=;
 b=oiMDOYGI2bSeSZT5QJePLBFS3bdhdg/b2hV9sEjInCMlg6bFWJv8msIzR8/9w2kc3u
 IFKJKkdrfnf5tKo4nsq36Aghl01z0FWCaUij12TaThGdesiyEq2IP2+ycwBakZIWoAoM
 khyNdyDe/XUIS9PYpIsvwCamQZ/lS3WhHcJri9uqua6E18Ex83Ak6aVHRFFIvRvJCGZv
 /8l6zrsYVdW5EjfvfdDdchQsdR5nR5B4ib1JzjzhBQTsfYRTS8lkCuYY/9KLiqhcdNFZ
 JvSrovHMxMh4cxlrtRa6/Nx5B/mhflf2vPKnNEzJU5ZratbisqrzJ0oNK569y2axtVt+
 Fgjg==
X-Gm-Message-State: ACrzQf3yPOPXWpNOhZbRqXt5RlvTCJb3CMsRQxM/2nFhPVwUFxf2uCmd
 Q3q8LJqGmlhn70M2cByJSg16wA==
X-Google-Smtp-Source: AMsMyM7H1Uknr8n2SeIUBFQZmKVFVgdEBrlPrgwXFwHa0v1HKlOOJhuX7tbE/T2rAouYLJSN+tlbuw==
X-Received: by 2002:a5d:5109:0:b0:22f:ed4:65da with SMTP id
 s9-20020a5d5109000000b0022f0ed465damr9080685wrt.688.1666287451376; 
 Thu, 20 Oct 2022 10:37:31 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p63-20020a1c2942000000b003c6c5a5a651sm186638wmp.28.2022.10.20.10.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 10:37:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61E531FFB7;
 Thu, 20 Oct 2022 18:37:30 +0100 (BST)
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020123506.26363-10-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 09/10] acpi/tests/avocado/bits/doc: add a doc file to
 describe the acpi bits test
Date: Thu, 20 Oct 2022 18:08:33 +0100
In-reply-to: <20221020123506.26363-10-ani@anisinha.ca>
Message-ID: <875yge8kh1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Ani Sinha <ani@anisinha.ca> writes:

> A doc file is added under docs/devel that describes the purpose of the va=
rious
> test files and gives guidance to developers on where and how to make chan=
ges.
>
> Cc: Daniel P. Berrange" <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  docs/devel/acpi-bits.rst | 148 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 docs/devel/acpi-bits.rst

You will also need to add it to the index-build.rst:

    testing
+   acpi-bits
    qtest

Other wise the build will complains.

>
> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> new file mode 100644
> index 0000000000..06d50b76d9
> --- /dev/null
> +++ b/docs/devel/acpi-bits.rst
> @@ -0,0 +1,148 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +ACPI/SMBIOS AVOCADO TESTS USING BIOSBITS

No need to use all caps here.

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Biosbits is a software written by Josh Triplett that can be downloaded
> +from https://biosbits.org/. The github codebase can be found here:
> +https://github.com/biosbits/bits/tree/master.

`here <https://github.com/biosbits/bits/tree/master>`__.


> It is a software that executes
> +the bios components such as acpi and smbios tables directly through acpi=
ca
> +bios interpreter (a freely available C based library written by Intel,
> +downloadable from https://acpica.org/ and is included with biosbits) wit=
hout an
> +operating system getting involved in between.
> +There are several advantages to directly testing the bios in a real phys=
ical
> +machine or VM as opposed to indirectly discovering bios issues through t=
he
> +operating system. For one thing, the OSes tend to hide bios problems fro=
m the
> +end user. The other is that we have more control of what we wanted to te=
st
> +and how by directly using acpica interpreter on top of the bios on a run=
ning
> +system. More details on the inspiration for developing biosbits and its =
real
> +life uses can be found in (a) and (b).

[#a]_ and [#b]_ for proper footnotes

> +This directory contains tests written in python using avocado framework =
that
> +exercizes the QEMU bios components using biosbits and reports test
> failures.

exercises

> +For QEMU, we maintain a fork of bios bits in gitlab along with all the
> +dependent submodules:
> +https://gitlab.com/qemu-project/biosbits-bits
> +This fork contains numerous fixes, a newer acpica and changes specific to
> +running this avocado QEMU tests using bits. The author of this document
> +is the sole maintainer of the QEMU fork of bios bits repo.
> +
> +Under the directory ``tests/avocado/``, ``acpi-bits.py`` is a QEMU avoca=
do
> +test that drives all this.
> +
> +A brief description of the various test files follows.
> +
> +Under ``tests/avocado/`` as the root we have:
> +
> +::
> +
> +   =E2=94=9C=E2=94=80=E2=94=80 acpi-bits
> +   =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-config
> +   =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 bits-cfg.txt
> +   =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-tests
> +   =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smbios.py2
> +   =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smilatency.py2
> +   =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 testacpi.py2
> +   =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 testcpuid.py2
> +   =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 README
> +   =E2=94=9C=E2=94=80=E2=94=80 acpi-bits.py
> +
> +* ``tests/avocado``:
> +
> +   ``acpi-bits.py``:
> +   This is the main python avocado test script that generates a
> +   biosbits iso. It then spawns a QEMU VM with it, collects the log and =
reports
> +   test failures. This is the script one would be interested in if they =
wanted
> +   to add or change some component of the log parsing, add a new command=
 line
> +   to alter how QEMU is spawned etc. Test writers typically would not ne=
ed to
> +   modify this script unless they wanted to enhance or change the log pa=
rsing
> +   for their tests. Following environment variables are used in this tes=
t:
> +
> +   **V=3D1** : This enables verbose mode for the test. It dumps the enti=
re log
> +   from bios bits and also more details in case failure happens. It is
> +   useful for debugging the test failures or tests themselves.

As there is only one environment variable you could just describe it
inline, e.g.:

   Test writers typically would not need to modify this script unless
   they wanted to enhance or change the log parsing for their tests. To
   enable debugging you can set the ``V=3D1`` environment variable. This
   will cause the test to dump the entire log from bios bits and also
   more details in case failure happens.

> +
> +   In order to run this test, please perform the following steps from th=
e QEMU
> +   build directory:
> +   ::
> +
> +     $ make check-venv (needed only the first time to create the venv)
> +     $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> +
> +   The above will run all acpi avocado tests including this one.
> +   In order to run the individual tests, perform the following:
> +   ::
> +
> +     $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py --tap -
> +
> +   The above will produce output in tap format. You can omit "--tap -" i=
n the
> +   end and it will produce output like the following:
> +   ::
> +
> +      $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
> +      Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_a=
cpi_smbios_bits
> +      JOB ID     : eab225724da7b64c012c65705dc2fa14ab1defef
> +      JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T17.=
58-eab2257/job.log
> +      (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bit=
s: PASS (33.09 s)
> +      RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRU=
PT 0 | CANCEL 0
> +      JOB TIME   : 39.22 s
> +
> +   You can inspect the log file for more information about the run or in=
 order
> +   to diagnoze issues. If you pass V=3D1 in the environment, more diagno=
stic logs
> +   would be found in the test log.
> +
> +* ``tests/avocado/acpi-bits/bits-config``:
> +
> +   This location contains biosbits configuration files that determine ho=
w the
> +   software runs the tests.
> +
> +   ``bits-config.txt``:
> +   This is the biosbits config file that determines what tests
> +   or actions are performed by bits. The description of the config optio=
ns are
> +   provided in the file itself.
> +
> +* ``tests/avocado/acpi-bits/bits-tests``:
> +
> +   This directory contains biosbits python based tests that are run from=
 within
> +   the biosbits environment in the spawned VM. New additions of test cas=
es can
> +   be made in the appropriate test file. For example, new acpi tests can=
 go
> +   into testacpi.py2 and one would call testsuite.add_test() to register=
 the new
> +   test so that it gets executed as a part of the ACPI tests.
> +   It might be occasionally necessary to disable some subtests or add a =
new
> +   test that belongs to a test suite not already present in this directo=
ry. To
> +   do this, please clone the bits source from
> +   https://gitlab.com/qemu-project/biosbits-bits/-/tree/qemu-bits.
> +   Note that this is the "qemu-bits" branch and not the "bits" branch of=
 the
> +   repository. "qemu-bits" is the branch where we have made all the QEMU
> +   specific enhancements and we must use the source from this branch onl=
y.
> +   Copy the test suite/script that needs modification (addition of new t=
ests
> +   or disabling them) from python directory into this directory. For
> +   example, in order to change cpuid related tests, copy the following
> +   file into this directory and rename it with .py2 extension:
> +   https://gitlab.com/qemu-project/biosbits-bits/-/blob/qemu-bits/python=
/testcpuid.py
> +   Then make your additions and changes here. Therefore, the steps are:
> +
> +       (a) Copy unmodified test script to this directory from bits sourc=
e.
> +       (b) Add a SPDX license header.
> +       (c) Perform modifications to the test.

Maybe unordered lists would be better here

> +
> +   Commits (a), (b) and (c) should go under separate commits so that the=
 original
> +   test script and the changes we have made are separated and clear.
> +
> +   The test framework will then use your modified test script to run the=
 test.
> +   No further changes would be needed. Please check the logs to make sur=
e that
> +   appropriate changes have taken effect.
> +
> +   The tests have an extension .py2 in order to indicate that:
> +
> +   (a) They are python2.7 based scripts and not python 3 scripts.
> +   (b) They are run from within the bios bits VM and is not subjected to=
 QEMU
> +       build/test python script maintainance and dependency resolutions.
> +   (c) They need not be loaded by avocado framework when running tests.
> +
> +
> +Author: Ani Sinha <ani@anisinha.ca>
> +
> +References:
> +-----------
> +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867=
/original/bits.pdf
> +(b) https://www.youtube.com/watch?v=3D36QIepyUuhg
> +

and then:

.. [#a] https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/86=
7/original/bits.pdf
.. [#b] https://www.youtube.com/watch?v=3D36QIepyUuhg


--=20
Alex Benn=C3=A9e

