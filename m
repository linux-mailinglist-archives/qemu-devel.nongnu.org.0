Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8A55F8C2E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 18:09:02 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohYrN-0004sr-0l
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 12:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohYoz-0003Ui-Tm
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 12:06:33 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohYox-0000W8-Gg
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 12:06:33 -0400
Received: by mail-io1-xd2f.google.com with SMTP id y4so2322678iof.3
 for <qemu-devel@nongnu.org>; Sun, 09 Oct 2022 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NIUpRM5wVPMkTHveQO4slLYviefzw9an6jIJingM6uY=;
 b=3z4oCIAiMj3uDfhjq/lHR2TBeuSQcVP84A1jHuMmC4iCfclQZN8hY9wFibxAAqDaIr
 v5HTdctcwIhL2+Y40Pm9G6wrvWVdu5z+hK5il5eQH2eQ1wjXZfNVyldCfQdud/a7W7GC
 Hrk7d0CesPnW8HVLUzjhKEuzpwAxOrSRBhgZjM0lfxFSKhUqNCnUqt3nW2NpZV2EuOt3
 JZOPcB+AaZ3bJ/BPVePr5O/VdFxliMx0z6rxYCs8LHHRDokMRyM6iaC4p4FvixeF4I1q
 SEdarogWPXlIsV6i5oIAKJnCC2UMhF9jnjGeKBylfMaqlYZpafiwnBahzfFpMq9uCw4e
 mVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NIUpRM5wVPMkTHveQO4slLYviefzw9an6jIJingM6uY=;
 b=OzgF6/nTB+jic00Et4v6Q2GlIbJNQVNRbs0XQPZQshovrcDbXHKsSl2Smu8rGHHl0G
 fvXCbg6Ta0HGxsTjQ7v9v5Ro1aUvFSDt1M+5SyMQs6wCLgq6ujsUucdgz0bCTexEV9+7
 SwyxJD8/y1DKpquOdaKzcnLEoaRyi8FKWCY6Kpgcy4KAoYT9sOoI2A9vo6gpTK5z5ueH
 6tmFSAN+2W11G6X1Gls0Eul8gHLUZEvE/CRiI+HlNKUz4civZZi4iyThBisj4E48or9m
 zKaAlpeBi8Q3np0a4RGUCGHwxt9jTUv5+mxHeVuaXrygDxj5F8B15sI1kmoOLmw3s12R
 1nEA==
X-Gm-Message-State: ACrzQf1KXnPy7mFuPa2pK2mHCBE9WDqc5MSKzW6M9Do6KW5opf1/THzQ
 5mkDW+GI+7UpzyULyD9xx2+ezj2j7Z+39hpzq4sYFg==
X-Google-Smtp-Source: AMsMyM5Zv4qRs6pSprVIDhiJenAZtjZAveKcofEs25FtKSj7I/a4VeZldPvnbje+6n7CUSxwWjeQexkCMOJlTcGiDrQ=
X-Received: by 2002:a05:6638:2491:b0:35a:53dd:f98e with SMTP id
 x17-20020a056638249100b0035a53ddf98emr7746841jat.261.1665331590064; Sun, 09
 Oct 2022 09:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
 <20220927175440-mutt-send-email-mst@kernel.org> <YzPyasEmJcKLJNvX@redhat.com>
 <6850c0d0-b578-9239-406e-e6c379cff3df@redhat.com>
In-Reply-To: <6850c0d0-b578-9239-406e-e6c379cff3df@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sun, 9 Oct 2022 21:36:18 +0530
Message-ID: <CAARzgwzv+iiyD9M=ZEcdp0rsKErvcxed9hhRvffJo1fYTf8wHg@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
 "Maydell, Peter" <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, 
 "Mammedov, Igor" <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2f.google.com
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

On Wed, Sep 28, 2022 at 1:14 PM Thomas Huth <thuth@redhat.com> wrote:
>
<snip>

> >
> > Do not do any of this stuff, it is irrelevant to QEMU's needs.
> > A developer using Avocado with QEMU does nothing more than:
> >
> >      make check-avocado
>
> Right. And if you want to run individual tests, you can also do it like this:
>
>      make check-venv   # Only for the first time
>      ./tests/venv/bin/avocado run tests/avocado/boot_linux.py
>
> Or run tests via tags (very convenient for maintainers):
>
>     ./tests/venv/bin/avocado run -t arch:s390x tests/avocado/

yeah this seems to work!

$ ./tests/venv/bin/avocado run -t acpi tests/avocado
ERROR:  Missing parentheses in call to 'print'. Did you mean
print(...)? (smbios.py, line 92)
ERROR:  Missing parentheses in call to 'print'. Did you mean
print(...)? (smilatency.py, line 47)
ERROR:  Missing parentheses in call to 'print'. Did you mean
print(...)? (testacpi.py, line 158)
Fetching asset from
tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
JOB ID     : 328a83d7d0ea628ea8054f16fe2065826d4481e9
JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-09T21.31-328a83d/job.log
 (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
PASS (37.15 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
| CANCEL 0
JOB TIME   : 43.39 s

$ ./tests/venv/bin/avocado run -t acpi tests/avocado --tap -
ERROR:  Missing parentheses in call to 'print'. Did you mean
print(...)? (smbios.py, line 92)
ERROR:  Missing parentheses in call to 'print'. Did you mean
print(...)? (smilatency.py, line 47)
ERROR:  Missing parentheses in call to 'print'. Did you mean
print(...)? (testacpi.py, line 158)
1..1
ok 1 tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits

