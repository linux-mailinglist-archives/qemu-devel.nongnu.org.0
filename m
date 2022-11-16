Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6260762B1AA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 04:08:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov8m8-0006qj-I4; Tue, 15 Nov 2022 22:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ov8m6-0006qb-Gd
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 22:07:42 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ov8m3-0004Ly-NC
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 22:07:42 -0500
Received: by mail-io1-xd2f.google.com with SMTP id r81so12307138iod.2
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 19:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P47E2x2GP4153RoxhbTLgqR1HLxslN4a6ChkXJoB4d8=;
 b=AnkIj6dJoK7aLJFZvXrnJUupgvErRq3pCJzldYDqDNL/oxp14ks3bHN7YBRrBAiS6S
 jut4jiOXKWH3Alcz2nqefTrpDmygsBmZFpP4DSEDMJA2X2/RrBIbg9k/rWjocapGouGC
 P5YmQJYv2Vi0kBfzoPs8uEiEemnMemwkng3t2BYrMzZLu0xCpWDic3Nvhx/zhNLbJDq6
 K24tI+aUZ97lwsbpSAtsv2uS4aJnf663kRdzvHAO9o6g+J4njkZPHX0pSB4Do1QvSWLy
 qFYornu1swR/jMa6WjDvPLrDpPgihqEED5oAeRHCH3wtZlV+czyLrM7MXheqUl/wvfU7
 Hq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P47E2x2GP4153RoxhbTLgqR1HLxslN4a6ChkXJoB4d8=;
 b=V5ByeJnjz5z0cJwubZnhbbQMG5exSX3fp0NoL0FAChXhziyliK5W0FZrwlJbSgFNwm
 trqYu36FaQuxmVApjhJ6Tn1LDMerMtmJWz+eFjIIpXHmzgb98j9zW4bO1O7syidMcKxZ
 aS3n/+7y0QYno7LDQbV//+uQ0jqZta9n/8XlrVPYFPqh1LmhQszRK8IHqJJ/n0BRz8Ky
 RZ5LAtZ5zYcH6Qb5p9wXWT/ZICI1a+CaDXBFgSJuwI/6YxciqksFVJNKeaOmpKzTlfNh
 j7BjJPupk8OWObGxYF6DxcwZdU1cMUs/2gln4aNPgfvajHBvO2Tkkjc8Sz4aO8IqgSeY
 EMpg==
X-Gm-Message-State: ANoB5pkE+FtTceke29Yf8NPFWPR9iDgxYNKsTbfJOpART92nOuaXYfRf
 G6PKt/9ZcaYkW6ezC0fGsWRJedfKdvWE08eRUvSKZQ==
X-Google-Smtp-Source: AA0mqf7TxT/gzc+lc2raoLw393wNSP0HNU3A3WsDqVo4RFWukcFibRSvbVNNlPF0T+ftmt6k25UuGkKsG+/e8j5+QJI=
X-Received: by 2002:a02:7421:0:b0:375:1b97:812a with SMTP id
 o33-20020a027421000000b003751b97812amr9201713jac.168.1668568058260; Tue, 15
 Nov 2022 19:07:38 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
 <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
 <CAARzgwxBu+FnM49Mg5Vq+E-VSjvPZTY+i3QP-WbD4oOLzTViPw@mail.gmail.com>
 <CAARzgwzwv3u22jaBroHPFQfCvS5ohekiqBqM6dEBX17LX=fV1g@mail.gmail.com>
 <CAARzgwxx186T2vS0vhZcMH+4A4DMhH+EVJLkYv7UunucFwT=rw@mail.gmail.com>
 <CAFn=p-bN0hPemrgS6jTgqHurP=jGKHOx2z7_qzaoPOjL=AMZNA@mail.gmail.com>
 <CAFn=p-ZZxO+Cot0WC_zt+g9G2VYTm+Wbj=HZO9aWYjUHs8VcPA@mail.gmail.com>
In-Reply-To: <CAFn=p-ZZxO+Cot0WC_zt+g9G2VYTm+Wbj=HZO9aWYjUHs8VcPA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 16 Nov 2022 08:37:26 +0530
Message-ID: <CAARzgwwErzi_rJVkwyXa1J3az6=gOrZP+YGq46Ti9Vap-=sn0A@mail.gmail.com>
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

On Wed, Nov 16, 2022 at 3:22 AM John Snow <jsnow@redhat.com> wrote:
>
> On Tue, Nov 15, 2022 at 1:47 PM John Snow <jsnow@redhat.com> wrote:
> >
> > On Tue, Nov 15, 2022 at 9:31 AM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > On Tue, Nov 15, 2022 at 3:36 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > > On Tue, Nov 15, 2022 at 9:07 AM Ani Sinha <ani@anisinha.ca> wrote:
> > > > >
> > > > > On Tue, Nov 15, 2022 at 5:13 AM John Snow <jsnow@redhat.com> wrote:
> > > > > >
> > > > > > On Thu, Nov 10, 2022 at 11:22 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > > > > >
> > > > > > > On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
> > > > > > > >
> > > > > > > > Hiya, on today's origin/master
> > > > > > > > (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> > > > > > > > check-avocado" is failing on the new biosbits test on my local
> > > > > > > > development machine:
> > > > > > > >
> > > > > > > >  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > > > > > FAIL: True is not false : The VM seems to have failed to shutdown in
> > > > > > > > time (83.65 s)
> > > > > > > >
> > > > > > > > Is this a known issue, or should I begin to investigate it?
> > > > > > >
> > > > > > > In my test environment it does pass.
> > > > > > >
> > > > > > > $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > > > > > > Fetching asset from
> > > > > > > tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> > > > > > > JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
> > > > > > > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
> > > > > > >  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > > > > PASS (57.57 s)
> > > > > > > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> > > > > > > | CANCEL 0
> > > > > > > JOB TIME   : 63.82 s
> > > > > > >
> > > > > > > However, I have seen that on certain slower test machines or when run
> > > > > > > within a virtual machine, the test can take longer to complete and 60
> > > > > > > secs may not always be enough. In those cases raising the maximum
> > > > > > > completion time to 90 secs helps. Perhaps you can try this and let me
> > > > > > > know if it helps:
> > > > > >
> > > > > > Hmm - I'm running on a fairly modern machine and not in a VM. Do you
> > > > > > have an invocation to share that exists outside of the avocado
> > > > > > machinery
> > > > >
> > > > > If you pass V=1 in the environment then it dumps the QEMU command line
> > > > > that was used to run the test. You also need to comment out the line
> > > > > > shutil.rmtree(self._workDir)
> > > > > in tearDown() so that the iso is not cleaned up.
> > > >
> > > > Maybe I will send out this patch once we have figured out what is
> > > > going on with your environment:
> > > > https://gitlab.com/anisinha/qemu/-/commit/5e8c629fdecc7cb650e4acaad8a8fcc2b248434e
> > > >
> > > > I ran the test on another box sitting in my office running centos7.9
> > > > and it passed as well.
> > >
> > > For the records,
> > > I ran make check-avocado on my Ubuntu 222.04 laptop:
> > > https://pastebin.com/0ZKEEQds
> > > On a separate centos 7.9 box (fairly new) : https://pastebin.com/QWLGDbp4
> >
> > As a question: Is it necessary to implement your own timeout here?
> > What's wrong with relying on Avocado's timeout?
> > My hunch is that you'll get greater flexibility by leaning into the
> > tool suite's configuration instead of hardcoding your own...
> >
> > For what it's worth, I am now trying to run this test manually by doing:
> >
> > > time ./qemu-system-x86_64 -cdrom /var/tmp/acpi-bits-b_br0ch8.tmp/bits-2020.iso -icount auto
> >
> > This is not a quick test:
> >
> > ________________________________________________________
> > Executed in   86.50 secs    fish           external
> >    usr time   86.57 secs    0.00 micros   86.57 secs
> >    sys time    0.30 secs  903.00 micros    0.29 secs
> >
> >
> > This isn't the *most* cutting edge machine, but it's a Intel(R)
> > Core(TM) i7-9850H CPU @ 2.60GHz with 32GB of memory and NVME storage.
> > Is your machine really passing this test in under 60 seconds flat?
> >
>
> FWIW, I sent a patch to just disable the test-specific timeout. I
> figure you had a good reason for putting it there, but I suppose
> you'll tell me tomorrow what that reason was :)

We need to wait until the VM terminates. The reason for providing the
timeout was that
(a) I figure it is a bad idea to wait indefinitely in case the VM gets
wedged or stuck.
(b) I was not aware of the framework level timeout mechanism.

I am ok if we want to get rid of the internal timeout. However, we
need to wait for the VM to terminate.

>
> I couldn't get the test to finish in under 60 seconds on this machine,
> but I did manage to get it to finish in under 60 on my ... 16 core AMD
> 5950X. Just needed some very heavy firepower, I guess!
>
> --js
>

