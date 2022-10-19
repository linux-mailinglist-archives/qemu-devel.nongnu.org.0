Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533416039DB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 08:38:57 +0200 (CEST)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol2jA-0002LO-DW
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 02:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol2XF-0005e9-ON
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 02:26:39 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:35338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol2XB-000890-M7
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 02:26:37 -0400
Received: by mail-io1-xd36.google.com with SMTP id e15so13689275iof.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 23:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S3qvOg1WYOIVg2YacJp0E6rUZSF7fCST3KK5TWMf+WE=;
 b=KOaV7MgWCtAuYWURUKvmyNtLMLcx9NCasRPl3okCkj61mheNy5LTJrA9Oo7Mic36q1
 0D1MiI64OLSXOPkmaGhGm/9OYE3ZFYTTg7On9WdR0Oh+/MCQkW76P39ohTZvYQDwuZCt
 bNdCONXMO7ctqSMJeZva5Tz3dN2q97//H7tniwD+NY+xJNeX+BGKGFWpQnwZuVPwV+q4
 kmuofj2wHIIzp3Lh81NNm0xCfPsGCuwG/SQsG8gK62VySUtuDaCxzRCI3Hk18Kq+/4K6
 vGcqG+LjpNBHUSikb1xNXnXYJdK4jD9p7ZlGiRUgJYFXzxSWHY0z6uI6dmT+bJ7IEgrT
 9KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S3qvOg1WYOIVg2YacJp0E6rUZSF7fCST3KK5TWMf+WE=;
 b=s0qzTN60uwpL31GUBXYJJnNc637XzmruYSLEcoch9eE0FC26B38RN+D/3FFeMLp4ID
 Hiecbpshza//ZQbifE0WN3c2qMxnmLxGv2LhUbZvMSWrD59bhqNkGWt6qhzH1ZTjuWmn
 jPvCM6i07xpWo2eVlglOZgH/04F4lCIF39t1UouI2pj7wlbEpUb0OAjZbue07tKTILj7
 YGHGx/rnqs3KQvstt02e3zo0Uj1smrboh9KTynT18sgrC63DLsCs+Tbt1SVqXkeFxpmq
 kA+XvCp/af7UnYGNFzMt8Km3W+UObUhtHdWVlHztJivYIQdMZqW6pzlS6ta/w26wKfoR
 fMgg==
X-Gm-Message-State: ACrzQf3COkcYIrQa3wn+SuM5RD5K+F+ANGlUkFxOAosasMQkb20XWQgI
 bs8UvBTPR1TSP+aUvr/IxQQUEe6Euy8YxN2Szpb0Jg==
X-Google-Smtp-Source: AMsMyM6DxcEU076r87ahjBrUch5H700U8NFT9zizqha2T7wCWUZo7Jf53/e85YBPHVmLC8UVSXd210JEVK+vsfCoGBA=
X-Received: by 2002:a02:cc55:0:b0:364:ef:c546 with SMTP id
 i21-20020a02cc55000000b0036400efc546mr4534805jaq.265.1666160790728; 
 Tue, 18 Oct 2022 23:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221014173508.222823-1-ani@anisinha.ca>
 <875yghcfnq.fsf@linaro.org>
 <CAARzgww2sDAYonM61N1OYvGeWCQRrr6NKY1YezpeJXiej_gNHQ@mail.gmail.com>
 <b8ceab73-bca8-e2c0-daac-e72d0e4e48d2@redhat.com>
In-Reply-To: <b8ceab73-bca8-e2c0-daac-e72d0e4e48d2@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 19 Oct 2022 11:56:19 +0530
Message-ID: <CAARzgwzYCH6LkimBwc5Psv+s+U_W7oQaO5KvVPTVtUPzi-1Qaw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu Devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd36.google.com
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

On Wed, Oct 19, 2022 at 11:52 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 18/10/2022 17.34, Ani Sinha wrote:
> > On Tue, Oct 18, 2022 at 9:01 PM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >>
> >>
> >> Ani Sinha <ani@anisinha.ca> writes:
> >>
> >>> Please see the README file in patch 9 for more details.
> >>> Sample runs are as follows:
> >>>
> >>> Passed tests:
> >>>
> >>> $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> >>> Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi=
_smbios_bits
> >>> JOB ID     : e95c7413e996bfb59389839e5ca5105464ef098f
> >>> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.15-=
e95c741/job.log
> >>>   (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits=
: PASS (33.08 s)
> >>> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT =
0 | CANCEL 0
> >>> JOB TIME   : 39.18 s
> >>
> >> Hmm something went wrong:
> >>
> >>    =E2=9E=9C  ./tests/venv/bin/avocado run -t acpi tests/avocado
> >>    Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_ac=
pi_smbios_bits
> >>    JOB ID     : 08b6d26bf52a22ccbe1908b14d5b7b27f76ad7fa
> >>    JOB LOG    : /home/alex/avocado/job-results/job-2022-10-18T16.29-08=
b6d26/job.log
> >>     (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bit=
s: ERROR: Error while generating the bits iso. Pass V=3D1 in the environmen=
t to get more details. Command '[
> >>    '/var/tmp/acpi-bits-yy4mfxrz.tmp/grub-inst-x86_64-efi/bin/grub-mkre=
scue', '-o', '/var/tmp/acpi-bits-yy4mfxrz.tmp/bits-2020.iso', '/var/tmp/acp=
i-bits-yy4mfxrz.t... (7.21 s)
> >>    RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUP=
T 0 | CANCEL 0
> >>    JOB TIME   : 7.79 s
> >>
> >> have we added another binary dependency?
> >
> > Try with V=3D1 , Maybe you do not have xorriso? If that is the case, yo=
u
> > need to install it in your test environment.
>
> If a tool is missing, the test should be SKIP and not ERROR, I think?

Yes check v5. I have added the skip.

