Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92035F9C39
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:47:54 +0200 (CEST)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohpO5-00054u-QC
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohpDd-0002vS-1t
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:37:05 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohpDb-00051o-9V
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:37:04 -0400
Received: by mail-io1-xd30.google.com with SMTP id l127so8001047iof.12
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 02:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwqepVVF0jWWwYeQ+uVu49W7roCyC+ha/qeeL11j2u0=;
 b=5udDV1qUn5ft2dPdLonWpgT5N+40CpmpSJmtzzxOE9eRcKlUTrjK7pKQSQFYXbVsRZ
 ZWrK93qJr1Nd4HKuhMSiThVpqPlbMyWJJP94sKQC2xH2+D77NiNLjfXNIqX+mJejK/5x
 LluETn0GVunAQOVSLQ5vsXZ+eY8Vo2i0ebR7n351XxQ0w5XglYnzKvUn5B2Z6hHOPvsK
 AIvL13BcWxVtJYtmTLiv88BSAG9rN4ruSmoFY0Jg4I+tXSIXKTjgXllM6xPY64Fl2dfp
 KkSPBeMZirP6kkonOHcitYyHb/cjTzFfE0w9fFjGhdfZvRs94yfgWdrxU88VRSbBEK3f
 qTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwqepVVF0jWWwYeQ+uVu49W7roCyC+ha/qeeL11j2u0=;
 b=4kgsFGaN4kEndlkew76P6b18ClPz3BC8dCEu0CH7vnrGNlEioHSnVQVa3zH9yQ46vD
 9UO1rrWREGT342N97STRK6K+KHOACaVk9W7uFfteqlWcRgrma4ThnjnYJacVDH1cS4iN
 ptUK4g8fzJQ1LFMiSWUcI1dwO5Yf8YDDvWa+PCEpSAVlJfGPU4hGXb5ROfuL8L4qhg7C
 QM4Pnkfyrj3pXCDQEYe5SGoyV8AhEzBzDnaO7QLnj/1ZOq071O0xIeRvYQ+956NQeKKW
 ZcbMiwHd5PfXtXKqUGabV/lA8yVfb7Q8L3P3M4uj1aQ57fkYiQcRgBdnt7oP5PCg6dFg
 YBqQ==
X-Gm-Message-State: ACrzQf3buVB5mVieQu86Fi/bV3CgnJ9/Ns33tQivFevzmYB3VQ6OtxS0
 w8OruINL6oU+ClkDd6aiZsm09YyDVfnpIAjRzMpU2g==
X-Google-Smtp-Source: AMsMyM7KtxSJRMNpmemx4g7xP6ZyPkhgLJVz0Ytvdl2y62rtK1tT5oNub2fcOnKRhXR0uu0EGgQfrUKfmUqvmBO+TiU=
X-Received: by 2002:a05:6638:2491:b0:35a:53dd:f98e with SMTP id
 x17-20020a056638249100b0035a53ddf98emr9468718jat.261.1665394621815; Mon, 10
 Oct 2022 02:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221010075439.4146972-1-ani@anisinha.ca>
 <CAARzgwwKthMvty72SkG_zt9rpuAek-PMS3+aK9dUKS_e50EDxA@mail.gmail.com>
 <Y0PjyANuojwEypoc@redhat.com>
In-Reply-To: <Y0PjyANuojwEypoc@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 10 Oct 2022 15:06:50 +0530
Message-ID: <CAARzgwzCoMC2NX7Oxg9aoZPNKv0sg9FOB_V1SG_uZcJhs+2Kzg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Igor M <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd30.google.com
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

On Mon, Oct 10, 2022 at 2:50 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Oct 10, 2022 at 01:43:21PM +0530, Ani Sinha wrote:
> > On Mon, Oct 10, 2022 at 1:24 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > Please see the README file added in patch 10 for more details.
> > > Sample runs are as follows:
> > >
> > > $ ./tests/venv/bin/avocado run -t acpi tests/avocado --tap -
> > > ERROR:  Missing parentheses in call to 'print'. Did you mean print(..=
.)? (smbios.py, line 92)
> > > ERROR:  Missing parentheses in call to 'print'. Did you mean print(..=
.)? (smilatency.py, line 47)
> > > ERROR:  Missing parentheses in call to 'print'. Did you mean print(..=
.)? (testacpi.py, line 158)
> >
> > None of the above files are avocado tests or avocado related python
> > scripts. They are run from within bits in a python 2.7 environment. I
> > could not find a mechanism to exclude a directory from avocado tests.
> > I also do not think making those scripts python 3 compliant is a good
> > use of my time since upgrading bits to use python 3 would be a major
> > task unrelated to QEMU testing.
>
> In one of the later patches copy_test_scripts()  copies the files
> into the guest image IIUC.
>
> If you rename them in git, to be .py2  then presumably avocado
> wont try to load them, and then in copy_test_scripts you can
> give them the normal .py extension for the guest.  The .py2
> extension will also make it more obvious to maintainers that
> these are different from the rest of the python coded we have.

I did a quick test and this approach seems to work.

 ./tests/venv/bin/avocado run -t acpi tests/avocado --tap -
1..1
ok 1 tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits

