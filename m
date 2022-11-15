Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD160629547
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 11:07:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ousqV-00088f-IQ; Tue, 15 Nov 2022 05:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ousqK-00084q-G4
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:07:08 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ousqI-0006By-Kn
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:07:00 -0500
Received: by mail-io1-xd2e.google.com with SMTP id e189so10297778iof.1
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 02:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ik8UX9elKP5xdLDxMAFMNvYzYTqfIf538Ox8MCm+rKU=;
 b=Mzjy6YCA95LCq+iWEhpWLl6Qtri4JzQYaCYYIbzOaB836JNqCvxGOkmf7ah4uHJd0Y
 miMa+69HIRSiH2pMbrF5SQ9zF3fAXv4f2K5t8IQC5XurtYqCcIOAl8aqfwbTYdxDWbNq
 /qDu8wIaqtiOlcXprN7jBUs19FmpauhgRsad0rXKdh/zw0TEKnnoa+kJ68TElw5oFC4c
 tXYysAcuvd0C5lmt125PtH5QHjk2oVcehd1GDhtdlFbGX1OkEAAX6g4DlfSLuGjr7EzK
 IDq/r1Qbsz5zLlbM+0w8SYE9Vb/c7iT023QzgJiXOkotXrx8aY79W1+jystaoaT7zJQr
 BrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ik8UX9elKP5xdLDxMAFMNvYzYTqfIf538Ox8MCm+rKU=;
 b=PCs2oIiHQnznXCU2ta6bV/wJcSzVXArXgXb/Sr9I6EHXppMcZw00Pd8X/EZCPO8ru4
 R1s4fVLXmaugeJ/0UaVIHhfhKRqAGznqsbmaC9J6w9BwW0zPaCdld9WyudBA8EAA45l6
 J0MOEUsthcDLJBlDdmmJBHShse84iy6hFlCYDjQitstnnBN3BJADSL+Mtd37irxDvvFy
 KkFeKMAbEFK/1PmiyKDU40kpXcPvnKfQ4HedPW22x0O6GYvqaWY8P3YOb6PV0wJp+Dkz
 5HsJHTu5ZSuFsmJ1/EXhFKWi6asOwQp/JMOBzPA8K64MweYIkSZgVFsnd9sglrMafd1R
 lc8Q==
X-Gm-Message-State: ANoB5pnvYVvrNDxM+YALmQWWbhA20F1Hz2MTBHX1J3+pSdcb8H14bkcc
 /0svxMiKc/non89kfvHYYHj0a8KurzId4+sHvK3qTg==
X-Google-Smtp-Source: AA0mqf5Zh047liNfmquOQSynIGGGF/YKHJTutXE/TVZNVFFDIBT7QoyoFns4xB2LlrVi8VM6aW/3ORMBxA00AkJp5kc=
X-Received: by 2002:a5d:9a12:0:b0:6dd:e590:6628 with SMTP id
 s18-20020a5d9a12000000b006dde5906628mr6516831iol.3.1668506816817; Tue, 15 Nov
 2022 02:06:56 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
 <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
 <CAARzgwxBu+FnM49Mg5Vq+E-VSjvPZTY+i3QP-WbD4oOLzTViPw@mail.gmail.com>
In-Reply-To: <CAARzgwxBu+FnM49Mg5Vq+E-VSjvPZTY+i3QP-WbD4oOLzTViPw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 15 Nov 2022 15:36:45 +0530
Message-ID: <CAARzgwzwv3u22jaBroHPFQfCvS5ohekiqBqM6dEBX17LX=fV1g@mail.gmail.com>
Subject: Re: biosbits test failing on origin/master
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 15, 2022 at 9:07 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, Nov 15, 2022 at 5:13 AM John Snow <jsnow@redhat.com> wrote:
> >
> > On Thu, Nov 10, 2022 at 11:22 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
> > > >
> > > > Hiya, on today's origin/master
> > > > (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> > > > check-avocado" is failing on the new biosbits test on my local
> > > > development machine:
> > > >
> > > >  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > FAIL: True is not false : The VM seems to have failed to shutdown in
> > > > time (83.65 s)
> > > >
> > > > Is this a known issue, or should I begin to investigate it?
> > >
> > > In my test environment it does pass.
> > >
> > > $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > > Fetching asset from
> > > tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> > > JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
> > > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
> > >  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > PASS (57.57 s)
> > > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> > > | CANCEL 0
> > > JOB TIME   : 63.82 s
> > >
> > > However, I have seen that on certain slower test machines or when run
> > > within a virtual machine, the test can take longer to complete and 60
> > > secs may not always be enough. In those cases raising the maximum
> > > completion time to 90 secs helps. Perhaps you can try this and let me
> > > know if it helps:
> >
> > Hmm - I'm running on a fairly modern machine and not in a VM. Do you
> > have an invocation to share that exists outside of the avocado
> > machinery
>
> If you pass V=1 in the environment then it dumps the QEMU command line
> that was used to run the test. You also need to comment out the line
> > shutil.rmtree(self._workDir)
> in tearDown() so that the iso is not cleaned up.

Maybe I will send out this patch once we have figured out what is
going on with your environment:
https://gitlab.com/anisinha/qemu/-/commit/5e8c629fdecc7cb650e4acaad8a8fcc2b248434e

I ran the test on another box sitting in my office running centos7.9
and it passed as well.

