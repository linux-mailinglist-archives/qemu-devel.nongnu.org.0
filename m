Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D862B1A7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 04:05:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov8io-0005XY-Ir; Tue, 15 Nov 2022 22:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ov8im-0005Vq-5V
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 22:04:16 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ov8ii-0003hz-S3
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 22:04:15 -0500
Received: by mail-io1-xd2f.google.com with SMTP id z3so12275012iof.3
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 19:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YsJh1kr4GkGfQYpuglk1ixEbzNc62T9taAij1/EU9Ic=;
 b=2EQaV5Ud/2um65++Gk7sHGtU02mpbPjrHVjcpygqbqmuH+YImETK4dtzZMsrvHafjJ
 a4GfsZYxx9/fXFmSlUdtn7SCTdHuiZ3irQwFbQ1KAcojPZxrYyaCiUgs7ynfkKQ6uMmX
 hvXnpgpvKe49umJn6LPzMgOI62a2wSDQKmtW1mj689PKAdIcz+4jTJfKHkwi3rqKi4JA
 /VKwzjvtdqyZQNmQMF9nJ5WEpTaTY/MV5JoxBEQ/I1v2amz7qjrXgVoerqSwW3s0+srH
 iaW1wlsp8rI1u8Mc46JXr1xbTMBZ1VhwJcd/2A34X388aY7X1Z03MbbSXkqCjcINRTi9
 dlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YsJh1kr4GkGfQYpuglk1ixEbzNc62T9taAij1/EU9Ic=;
 b=ZUahXAPWpzmP00rwblBaxZNciqk65gFM8xG9LWPSWvWqNfyN/4RKOHK4yhJfsN2tNo
 VRM/XUPY+yLtMBo8qCVnW3IhPmtTnTvACoPfrHzCfZRmrw8mYrUnmO+2M7wHyJcK9N0S
 EEuPjUTSLgcdhoZZCgxRgJyaNGZfJMOxyet6emtmw3fRhogpu1/tVZdvFwA6IAVWWUf1
 RIjhjFm3Z1rbubWSWmNuOH844eAr+lQOV8municmCJ3iNZ/CQEHzi/QLCQme/q7cVLPm
 PZFUlGRpFi3vHf/bX+ZtUeA1NWsj/AI0J6Z7mNQmqlWYSQWLY8XpCVTp/FfDoPQyKFY0
 YyeQ==
X-Gm-Message-State: ANoB5pnCp4F2G9/7H5zQWp59qUsEj8vxz9wU6GwGLs39obZXKm3IQBNK
 8ee+SBpu5SINuD64h+5VgeizkkL7/81LmPZZi9Y4Zw==
X-Google-Smtp-Source: AA0mqf6VIdBwUr5hRAIKxF5Lfd0S8gerIllnewez/Fekd6oC89N928HojrhikOBMepIeKMxd3s34rcSTdfBD1rPS7WQ=
X-Received: by 2002:a02:cb0d:0:b0:375:fd9e:b9d3 with SMTP id
 j13-20020a02cb0d000000b00375fd9eb9d3mr8977867jap.35.1668567851365; Tue, 15
 Nov 2022 19:04:11 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
 <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
 <CAARzgwxBu+FnM49Mg5Vq+E-VSjvPZTY+i3QP-WbD4oOLzTViPw@mail.gmail.com>
 <CAARzgwzwv3u22jaBroHPFQfCvS5ohekiqBqM6dEBX17LX=fV1g@mail.gmail.com>
 <CAARzgwxx186T2vS0vhZcMH+4A4DMhH+EVJLkYv7UunucFwT=rw@mail.gmail.com>
 <CAFn=p-bN0hPemrgS6jTgqHurP=jGKHOx2z7_qzaoPOjL=AMZNA@mail.gmail.com>
In-Reply-To: <CAFn=p-bN0hPemrgS6jTgqHurP=jGKHOx2z7_qzaoPOjL=AMZNA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 16 Nov 2022 08:34:00 +0530
Message-ID: <CAARzgwwNfoffPNkgBz46ynZFjXJCHh96sjPe37ubHTy278ngAA@mail.gmail.com>
Subject: Re: biosbits test failing on origin/master
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 12:18 AM John Snow <jsnow@redhat.com> wrote:
>
> On Tue, Nov 15, 2022 at 9:31 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Tue, Nov 15, 2022 at 3:36 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > On Tue, Nov 15, 2022 at 9:07 AM Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > > On Tue, Nov 15, 2022 at 5:13 AM John Snow <jsnow@redhat.com> wrote:
> > > > >
> > > > > On Thu, Nov 10, 2022 at 11:22 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > > > >
> > > > > > On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
> > > > > > >
> > > > > > > Hiya, on today's origin/master
> > > > > > > (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> > > > > > > check-avocado" is failing on the new biosbits test on my local
> > > > > > > development machine:
> > > > > > >
> > > > > > >  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > > > > FAIL: True is not false : The VM seems to have failed to shutdown in
> > > > > > > time (83.65 s)
> > > > > > >
> > > > > > > Is this a known issue, or should I begin to investigate it?
> > > > > >
> > > > > > In my test environment it does pass.
> > > > > >
> > > > > > $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > > > > > Fetching asset from
> > > > > > tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> > > > > > JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
> > > > > > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
> > > > > >  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > > > PASS (57.57 s)
> > > > > > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> > > > > > | CANCEL 0
> > > > > > JOB TIME   : 63.82 s
> > > > > >
> > > > > > However, I have seen that on certain slower test machines or when run
> > > > > > within a virtual machine, the test can take longer to complete and 60
> > > > > > secs may not always be enough. In those cases raising the maximum
> > > > > > completion time to 90 secs helps. Perhaps you can try this and let me
> > > > > > know if it helps:
> > > > >
> > > > > Hmm - I'm running on a fairly modern machine and not in a VM. Do you
> > > > > have an invocation to share that exists outside of the avocado
> > > > > machinery
> > > >
> > > > If you pass V=1 in the environment then it dumps the QEMU command line
> > > > that was used to run the test. You also need to comment out the line
> > > > > shutil.rmtree(self._workDir)
> > > > in tearDown() so that the iso is not cleaned up.
> > >
> > > Maybe I will send out this patch once we have figured out what is
> > > going on with your environment:
> > > https://gitlab.com/anisinha/qemu/-/commit/5e8c629fdecc7cb650e4acaad8a8fcc2b248434e
> > >
> > > I ran the test on another box sitting in my office running centos7.9
> > > and it passed as well.
> >
> > For the records,
> > I ran make check-avocado on my Ubuntu 222.04 laptop:
> > https://pastebin.com/0ZKEEQds
> > On a separate centos 7.9 box (fairly new) : https://pastebin.com/QWLGDbp4
>
> As a question: Is it necessary to implement your own timeout here?
> What's wrong with relying on Avocado's timeout?

When I wrote the test I was not aware of the avocado timeout. Hence
implemented mine. However, I kind of think that timing out from the
test itself rather than from the framework provides an opportunity to
provide more meaningful information to the user when the timeout
happens. Of Course we can improve upon the current  "FAIL: True is not
false" assertion message.

> My hunch is that you'll get greater flexibility by leaning into the
> tool suite's configuration instead of hardcoding your own...
>
> For what it's worth, I am now trying to run this test manually by doing:
>
> > time ./qemu-system-x86_64 -cdrom /var/tmp/acpi-bits-b_br0ch8.tmp/bits-2020.iso -icount auto
>
> This is not a quick test:
>
> ________________________________________________________
> Executed in   86.50 secs    fish           external
>    usr time   86.57 secs    0.00 micros   86.57 secs
>    sys time    0.30 secs  903.00 micros    0.29 secs
>
>
> This isn't the *most* cutting edge machine, but it's a Intel(R)
> Core(TM) i7-9850H CPU @ 2.60GHz with 32GB of memory and NVME storage.
> Is your machine really passing this test in under 60 seconds flat?

Yes it is both on my 3 year old lenovo laptop with 16 Gib memory:

Vendor ID:               GenuineIntel
  Model name:            Intel(R) Core(TM) i5-8365U CPU @ 1.60GHz
    CPU family:          6
    Model:               142
    Thread(s) per core:  2
    Core(s) per socket:  4
    Socket(s):           1
    Stepping:            12
    CPU max MHz:         4100.0000
    CPU min MHz:         400.0000

as well as on a desktop machine with 32 Gib of memory:

Vendor ID:             GenuineIntel
CPU family:            6
Model:                 158
Model name:            Intel(R) Core(TM) i7-9700 CPU @ 3.00GHz
Stepping:              13
CPU MHz:               799.987
CPU max MHz:           4700.0000
CPU min MHz:           800.0000
BogoMIPS:              6000.00
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              12288K
NUMA node0 CPU(s):     0-7

