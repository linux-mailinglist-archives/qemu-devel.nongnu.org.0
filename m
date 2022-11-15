Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48562629C2A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:33:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwyL-0002TB-0R; Tue, 15 Nov 2022 09:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ouwyI-0002S8-RG
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:31:30 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ouwyH-00064g-0e
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:31:30 -0500
Received: by mail-il1-x12b.google.com with SMTP id g7so5811581ile.0
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 06:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mVtgAXdEexxao5DTmVVX4sY0jKz0apBa2nR//2nEquw=;
 b=KgFHXtiRkXZmi0/Ukg9xlu7rjAjKFa339eGwrfp3NhaYmr/4sM3zNmSw08nRbfQ+jl
 A0h5iAk/YQVRPyQ9br+Fa7LcPdRvsGPp1cWv6NJs2rBcdt9qOAGuWysz75d0iOa5XDbL
 QKxK/jBouEGGZuOk8zDM35obaYUfjJf2JOFa4a9+2UnBzknVQQnwsXw5oEiYm4ZNe/NP
 Dbo7jXUcnIT4dSpeuPCIAnVjaYmh0BGdXhYGdbgYt0giQOq8EgiQaEJPmKAQrPmeQd9d
 6hNU1UP2qzSCEZS05D87A+p0Bec2I/KnmqQDmkPEV4elBlvGhJrNyrsxsLbgKGPVbs+B
 FEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mVtgAXdEexxao5DTmVVX4sY0jKz0apBa2nR//2nEquw=;
 b=PW8wI987cYjsTTwX0WgM/bq8Ezu63tM2dvqQvANllTqv7sS0ZoI3tpe+DlqMRSzNEk
 mMoxFdza2QRbeVddddS6DojsEZ5MI69krB6cz9IeNrTAUWLMsigyl97XbB6Q0rR58Y/o
 AUNbzFAX01g2ThUgrHUvKhn3rmHAVCI4Eq0+Kuiev/lBbTzn6EZLGhYhY8bpUqtWO2UJ
 dVm5zFhNdZnxbWb898maRxag55IxL0z7zW8XkFasotU16zPB3zEtMn6WC6iZ6cX3B6KP
 kXdiovLtkqQCGhCZXBeoCX3negIdbJX/rsRSO09YWGo6Md+lP6gvFBTfRSJJ2DW/7rWJ
 fYag==
X-Gm-Message-State: ANoB5pnMiTzZp3t3Liu1VZnqFGQOB5hc+YcIiTt+YYlRn2Fm5iA6lqXq
 uOARe8VIy2EcTi3r2GMEh2rEoLX1R1HbRfHpVjM11bBScqjZmWsvAhg=
X-Google-Smtp-Source: AA0mqf7FOR2dzKtpTASXMHMbhCJcZ7w+zKMzJpnI4DCXnuCJAX2IY1YRSl9PpdYimLHdsle9NCP/bIn1Fys9dJfv9Zg=
X-Received: by 2002:a92:ddc3:0:b0:302:3521:41e1 with SMTP id
 d3-20020a92ddc3000000b00302352141e1mr8517871ilr.54.1668522687587; Tue, 15 Nov
 2022 06:31:27 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
 <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
 <CAARzgwxBu+FnM49Mg5Vq+E-VSjvPZTY+i3QP-WbD4oOLzTViPw@mail.gmail.com>
 <CAARzgwzwv3u22jaBroHPFQfCvS5ohekiqBqM6dEBX17LX=fV1g@mail.gmail.com>
In-Reply-To: <CAARzgwzwv3u22jaBroHPFQfCvS5ohekiqBqM6dEBX17LX=fV1g@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 15 Nov 2022 20:01:16 +0530
Message-ID: <CAARzgwxx186T2vS0vhZcMH+4A4DMhH+EVJLkYv7UunucFwT=rw@mail.gmail.com>
Subject: Re: biosbits test failing on origin/master
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 15, 2022 at 3:36 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, Nov 15, 2022 at 9:07 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Tue, Nov 15, 2022 at 5:13 AM John Snow <jsnow@redhat.com> wrote:
> > >
> > > On Thu, Nov 10, 2022 at 11:22 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > > On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
> > > > >
> > > > > Hiya, on today's origin/master
> > > > > (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> > > > > check-avocado" is failing on the new biosbits test on my local
> > > > > development machine:
> > > > >
> > > > >  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > > FAIL: True is not false : The VM seems to have failed to shutdown in
> > > > > time (83.65 s)
> > > > >
> > > > > Is this a known issue, or should I begin to investigate it?
> > > >
> > > > In my test environment it does pass.
> > > >
> > > > $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > > > Fetching asset from
> > > > tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> > > > JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
> > > > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
> > > >  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > PASS (57.57 s)
> > > > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> > > > | CANCEL 0
> > > > JOB TIME   : 63.82 s
> > > >
> > > > However, I have seen that on certain slower test machines or when run
> > > > within a virtual machine, the test can take longer to complete and 60
> > > > secs may not always be enough. In those cases raising the maximum
> > > > completion time to 90 secs helps. Perhaps you can try this and let me
> > > > know if it helps:
> > >
> > > Hmm - I'm running on a fairly modern machine and not in a VM. Do you
> > > have an invocation to share that exists outside of the avocado
> > > machinery
> >
> > If you pass V=1 in the environment then it dumps the QEMU command line
> > that was used to run the test. You also need to comment out the line
> > > shutil.rmtree(self._workDir)
> > in tearDown() so that the iso is not cleaned up.
>
> Maybe I will send out this patch once we have figured out what is
> going on with your environment:
> https://gitlab.com/anisinha/qemu/-/commit/5e8c629fdecc7cb650e4acaad8a8fcc2b248434e
>
> I ran the test on another box sitting in my office running centos7.9
> and it passed as well.

For the records,
I ran make check-avocado on my Ubuntu 222.04 laptop:
https://pastebin.com/0ZKEEQds
On a separate centos 7.9 box (fairly new) : https://pastebin.com/QWLGDbp4

