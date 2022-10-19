Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8DB6040BF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:14:49 +0200 (CEST)
Received: from localhost ([::1]:57550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol663-0001vS-IN
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol646-0000Ne-F5
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:12:46 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:38783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol640-0000X4-UZ
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:12:46 -0400
Received: by mail-il1-x12b.google.com with SMTP id u10so8905637ilm.5
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 03:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BpFN851ytiOsGfzPZRmC/ZGdj/Qi8qqDAbUlEzJiz84=;
 b=uGwx8fAEKuUomoMIpbGYvMBBoNLvKmac5SwA88glFGrBE0izqefv80PehUSMSrcVP2
 W0CmFjazIodLX0n1I+rFMNxcnxUzZeNAId1oAEBqDJEEVc6v1178z3MFjuUmxd6wancF
 Q/zPp18thfH4+Enc518hZFFIJqhJhKnTRPMRAMgB+8aZ92sICN7ghe+PLyFzA+/2KHgK
 FkyfpEUk7jdnbQyllzFIgHOg5RC7+FO+CgxVseZyIGl4eP2VmtF0DWC9lC4LU9Dub2hu
 j5dDGlbuZIYETpNC8RGEFtbFXiRYrqvvQQOUKHwRi+7J5iGtnZN8bfHeI4f7Ekl4F2vN
 JrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BpFN851ytiOsGfzPZRmC/ZGdj/Qi8qqDAbUlEzJiz84=;
 b=GUmmAErGfE3BG9ML+BZQV84Z8N0Q6wuglrpE6WsBVeqwkydbYyKub+QdqCX4D8vDFi
 EwgNW0Ee6X/8i1QHu2NVIk2phT5EhilovGIx5++PDghsBVx3SfRp+zKCp8H9N/vhU5sS
 sqVlW7scwYRORYEYeOW5F9lnMa123Ny2LikcvtUiwlv5uEAH/1Sepln3EC8910pIhCf3
 JpCoYwQo/iv+7OQnV4RoZ3cyW3oAkIVdCrNo8zaSMcvYcITeihH5rbyrANugKoNP8eu4
 dkireuZolAvWXG6/MMGpdyi28PpnprLnqiLJhXjFIY9YyUu0a0Q0ZVZtpcNZm9jce6kX
 JXDw==
X-Gm-Message-State: ACrzQf2d5Hr32JXoXHQU1kHw41pQ2Nod7/NUgwRAtP6bJCZRNa7933ay
 yQBzCgcdPm3PhaK9vJrYLXNEXCH3yefSN6CBNME1sA==
X-Google-Smtp-Source: AMsMyM6qDe523UfpYgz6sriDLCpBk9pLv4HYvZ8LpRby6iUm69QwwguWejo91RCzqeD6TDHctauHYXcwN07DugI+/Uc=
X-Received: by 2002:a05:6e02:174d:b0:2fa:1b65:106e with SMTP id
 y13-20020a056e02174d00b002fa1b65106emr5480035ill.63.1666174357799; Wed, 19
 Oct 2022 03:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-9-ani@anisinha.ca>
 <CAARzgwz6DwgfOcyq9fFitu7SKUfx6xz_WUiYj8pkP0wmeT=UZQ@mail.gmail.com>
 <CAARzgwyRwh-fYuUTNjOgoRzjf4UZbAVCxJvSGzf4b-2jmqq=cQ@mail.gmail.com>
 <297ffc66-9d0a-37c7-f700-cea17ecd5707@linaro.org>
In-Reply-To: <297ffc66-9d0a-37c7-f700-cea17ecd5707@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 19 Oct 2022 15:42:26 +0530
Message-ID: <CAARzgwxqVYmv7fNWVxjN8F=jXgDYSK4GSePTtrXSmR6Q55PPNA@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] acpi/tests/avocado/bits: add acpi and smbios
 avocado tests that uses biosbits
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12b.google.com
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

On Wed, Oct 19, 2022 at 3:05 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> >>> +    List,
> >>> +    Optional,
> >>> +    Sequence,
> >>> +)
> >>> +from qemu.machine import QEMUMachine
> >>> +from avocado import skipIf
> >>> +from avocado_qemu import QemuBaseTest
>
> >>> +@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> >>> +class AcpiBitsTest(QemuBaseTest): #pylint: disable=3Dtoo-many-instan=
ce-attributes
> >>> +    """
> >>> +    ACPI and SMBIOS tests using biosbits.
> >
> >   <snip>
> >
> >>> +
> >>> +    def setUp(self): # pylint: disable=3Darguments-differ
> >>> +        super().setUp('qemu-system-')
> >>> +
> >>> +        if shutil.which('xorriso') is None:
> >>> +            logging.error('xorriso is required to run this test.')
> >>> +            self.skipTest("xorriso is not installed. Please install =
it.")
> >>
> >> This would result in output like this when xorriso is not found:
> >>
> >> $ which xorriso
> >> /usr/bin/which: no xorriso in
> >> (/home/anisinha/.local/bin:/home/anisinha/bin:/usr/share/Modules/bin:/=
usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin)
> >> [anisinha@centos8 build]$ ./tests/venv/bin/avocado run -t acpi tests/a=
vocado
> >> Fetching asset from
> >> tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> >> JOB ID     : 95aba043201755ed888ef7d1598402c555118df4
> >> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-19T02.27-9=
5aba04/job.log
> >>   (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> >> ERROR: xorriso is not installed. Please install it. (0.00 s)
>
> If an optional tool is missing, the test should be SKIPped, this is not
> an ERROR.

Yes will fix in v6.

>
> >> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> >> | CANCEL 0
> >> JOB TIME   : 0.61 s
> >>
> >>
> >
> > skipIf() was not working for me, hence I had to resort to this. I got
> > skipIf() working now so in v6 I will remove the above hunk and add the
> > conditional as @skipIf decorator.
> >
> > For the records,
> >> @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> > does not work for me.
> >> @skipIf(os.getenv('GITLAB_CI') is not None, 'Running on GitLab')
> > works.
> > A quick grep indicates that the former is used all over the place!
>
> Because @skipIf works (at least as a class decorator).
>
> Maybe something is missing on your side? Look at the
> tesseract_available() example:

Yeah never mind. None type is correctly getting converted to boolean.


>
> $ git grep tesseract_available
> tests/avocado/machine_m68k_nextcube.py:14:from tesseract_utils import
> tesseract_available, tesseract_ocr
> tests/avocado/machine_m68k_nextcube.py:58:
> @skipUnless(tesseract_available(3), 'tesseract v3 OCR tool not available'=
)
> tests/avocado/machine_m68k_nextcube.py:70:
> @skipUnless(tesseract_available(4), 'tesseract v4 OCR tool not available'=
)
> tests/avocado/tesseract_utils.py:14:def
> tesseract_available(expected_version):
>
> > $ grep GITLAB_CI *
> > grep: acpi-bits: Is a directory
> > acpi-bits.py:@skipIf(os.getenv('GITLAB_CI') is not None, 'Running on Gi=
tLab')
> > grep: avocado_qemu: Is a directory
> > boot_linux.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> > intel_iommu.py:@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> > linux_initrd.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab'=
)
> > machine_aspeed.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLa=
b')
> > machine_aspeed.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLa=
b')
> > machine_mips_malta.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on G=
itLab')
> > machine_mips_malta.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on G=
itLab')
> > machine_rx_gdbsim.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on Gi=
tLab')
> > machine_rx_gdbsim.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on Gi=
tLab')
> [...]

