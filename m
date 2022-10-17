Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40644600B9F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:55:03 +0200 (CEST)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMpq-00047L-4h
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okMbF-0003oh-Dd
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:39:59 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:37800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okMbC-0004o3-Kb
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:39:57 -0400
Received: by mail-io1-xd2e.google.com with SMTP id o65so8579570iof.4
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+KSY/hWcdR1oKNobjt+y1zg5CMh7/TKuwAHN9PHh/o=;
 b=bqoyIelbkm1oWaOAZIK1L9kAaQ25xgHb0mseXE0ESS8/ENQi9lVauUpRuQsHyfR4kt
 MBOUKMzEW2tmX6qiLvpZLxVtO90gKLWqdXDaF78BGmOckrd/lVGnpH2zuvAMFJuBpvWD
 zdVEy1G/c0NVrbjqw/0z0mq7WVIUPaU0z5U8lgS7qaTJNy6JfJccd4pA8tT4iFe84HRh
 O7JgEmb4p99JOV4SCP45Usr4HIZFvgyeFrdnhyKSDsIX+VmXPL4Q5Bv/wX6T1sHDuyaw
 PMVyzpHQ6Fzodim7JOpFWQCbqXa2LJrEQnWy9unXAfip2VR9rYAKGL4x5KkSJcPUkh5X
 dTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+KSY/hWcdR1oKNobjt+y1zg5CMh7/TKuwAHN9PHh/o=;
 b=OLcsr4Swul5exgwcMcuECT4kKYLxsk6eV5g/i6OSES9Zjuwaj+EL00GH4dSyqELCQ6
 HshJMi1MIh0U/O+11gxWHbNwTnjFW64uRhyNgShuIM7QeQz73PPOYUTrkOKzw7Z7/V4M
 F5WBM9x7UwqD+URTzNHMzchchseOUtPwnvNEQ0NXfXLtscKTNFN8ZdK5gGnq3VKKwc6h
 rKrhu9SZM0qq5uC/j5sfGbLBI7c1I/xgBCk1ibEYuK+x1xSjxWwS2nr98yuLyew9XIO2
 pIGOszfkZIrzBdCBRn8pm4IGBahJMaVglBz9DTPurUhq84hcx5LtE2lO2KdA/mKyYj6v
 J3ZQ==
X-Gm-Message-State: ACrzQf2IpSl9db3ZGni/q+HFYIEtgoeRt3o3FoviELt+zBe+aeHxc7gB
 wjy7+k3Kosl8HfultuBjxhQvrfnjhmw+DxlGBk/8yg==
X-Google-Smtp-Source: AMsMyM6OVLaif8jpN78F9IMfOsAx2QNoeGmEfRNezWDWlOLcwtkhvw+sdVdqBST0rzlVSdf4KVuxFp3a5I9OVa0Rjtk=
X-Received: by 2002:a6b:8f91:0:b0:6bb:ee69:2ffe with SMTP id
 r139-20020a6b8f91000000b006bbee692ffemr4151567iod.34.1665999591447; Mon, 17
 Oct 2022 02:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221014173508.222823-1-ani@anisinha.ca>
 <20221014173508.222823-10-ani@anisinha.ca>
In-Reply-To: <20221014173508.222823-10-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 17 Oct 2022 15:09:40 +0530
Message-ID: <CAARzgwz9-DCwz6G2eNRDB0d9iatpvr8m2yb9Uw4++0N64NLL0g@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] acpi/tests/avocado/bits: add a README file to
 describe the test
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 14, 2022 at 11:06 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> Add a README file that describes the purpose of the various test files an=
d gives
> guidance to developers on where and how to make changes.
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
>  tests/avocado/acpi-bits/README | 128 +++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 tests/avocado/acpi-bits/README
>
> diff --git a/tests/avocado/acpi-bits/README b/tests/avocado/acpi-bits/REA=
DME
> new file mode 100644
> index 0000000000..6950d8d7db
> --- /dev/null
> +++ b/tests/avocado/acpi-bits/README
> @@ -0,0 +1,128 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +ACPI/SMBIOS AVOCADO TESTS USING BIOSBITS
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Biosbits is a software written by Josh Triplett that can be downloaded
> +from https://biosbits.org/. The github codebase can be found here:
> +https://github.com/biosbits/bits/tree/master. It is a software that exec=
utes
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
> +This directory contains tests written in python using avocado framework =
that
> +exercizes the QEMU bios components using biosbits and reports test failu=
res.
> +For QEMU, we maintain a fork of bios bits in gitlab along with all the
> +dependent submodules:
> +https://gitlab.com/qemu-project/biosbits-bits
> +This fork contains numerous fixes, a newer acpica and changes specific t=
o
> +running this avocado QEMU tests using bits. The author of this document
> +is the sole maintainer of the QEMU fork of bios bits repo.
> +
> +Under the directory tests/avocado/, acpi-bits.py is a QEMU avocado test =
that
> +drives all this.
> +
> +A brief description of the various test files follows.
> +
> +Under tests/avocado/ as the root we have:
> +
> +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits
> +=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-config
> +=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 bits-cfg.txt
> +=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-tests
> +=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smbios.py2
> +=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smilatency.py2
> +=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 testacpi.py2
> +=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 testcpuid.py2
> +=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 README
> +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits.py
> +
> +tests/avocado:
> + - acpi-bits.py: This is the main python avocado test script that genera=
tes a
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
> +     - V=3D1 : This enables verbose mode for the test. It dumps the enti=
re log
> +       from bios bits and also more details in case failure happens. It =
is
> +       useful for debugging the test failures or tests themselves.
> +
> +   In order to run this test, please perform the following steps:
> +   from the QEMU build directory:
> +
> +   $ make check-venv (needed only the first time to create the venv)
> +   $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> +
> +   The above will run all acpi avocado tests including this one.
> +   In order to run the individual test, perform:
> +
> +   $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py --tap -
> +
> +   The above will produce output in tap format. You can omit "--tap -" i=
n the
> +   end and it will produce more output like the following:
> +
> +   $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
> +     Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_ac=
pi_smbios_bits
> +     JOB ID     : eab225724da7b64c012c65705dc2fa14ab1defef
> +     JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T17.5=
8-eab2257/job.log
> +     (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits=
: PASS (33.09 s)
> +     RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUP=
T 0 | CANCEL 0
> +     JOB TIME   : 39.22 s
> +
> +   You can inspect the log file for more information about the run or in=
 order
> +   to diagnoze issues. If you pass V=3D1 in the environment, more diagno=
stic logs
> +   would be found in the test log.
> +
> +tests/avocado/acpi-bits:
> + - README: This text file.
> +
> +tests/avocado/acpi-bits/bits-config:
> +   This location contains biosbits config files that determine how the s=
oftware
> +   runs the tests.
> + - bits-config.txt: this is the biosbits config file that determines wha=
t tests
> +   or actions are performed by bits. The description of the config optio=
ns are
> +   provided in the file itself.
> +
> +tests/avocado/acpi-bits/bits-tests:
> +   This directory contains biosbits python based tests that are run from=
 within
> +   the biosbits environment in the spawned VM. New additions of test cas=
es can
> +   be made in the appropriate test file. For example, new acpi tests can=
 go
> +   into testacpi.py and one would call testsuite.add_test() to register =
the new
> +   test so that it gets executed as a part of the ACPI tests.
> +   It might be occasionally necessary to disable some subtests or add a =
new
> +   test that belongs to a test suite not already present in this directo=
ry. To
> +   do this, please extract the bits source from the zip file mentioned a=
bove.

I will update this in V5. No zip file reference needed.

> +   Copy the test suite/script that needs modification (addition of new t=
ests
> +   or disabling them) from boot/python location of the extracted directo=
ry
> +   into this directory.

This also needs updating. Will do in v5.

> +
> +   step (a): copy unmodified test script to this directory.
> +
> +   step (b): perform modifications to the test.
> +   Commit (a) and (b) in separate commits so that the original test scri=
pt
> +   and the changes we have made are separated and clear.
> +
> +   The test framework will then use your modified test script to run the=
 test.
> +   No further changes would be needed. Please check the logs to make sur=
e that
> +   appropriate changes have taken effect.
> +
> +   The tests have an extension .py2 in order to indicate that
> +   (a) they are python2.7 based scripts and not python 3 scripts.
> +   (b) they are run from within the bios bits VM and is not subjected to=
 QEMU
> +       build/test python script maintainance and dependency resolutions.
> +   (c) They need not be loaded by avocado framework when running tests.
> +
> +
> +Author: Ani Sinha <ani@anisinha.ca>
> +
> +References:
> +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867=
/original/bits.pdf
> +(b) https://www.youtube.com/watch?v=3D36QIepyUuhg
> --
> 2.34.1
>

