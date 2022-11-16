Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD262B662
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 10:23:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovEbo-00013y-O2; Wed, 16 Nov 2022 04:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovEbl-00011X-EI
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 04:21:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovEbi-0006Ce-BB
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 04:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668590481;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PqqErVAWGJhqPHOBLdAQTR87njb7sdwmUYWQym7RASY=;
 b=P/NqJVt6wM7tAo/7kTDCRLGoBCEtGMR9z2NUIk0sMV1qkNOHSsg/sPj4hRT/naif4RR9Gd
 mSazEWqcYJSE5XJUkurVziY1e19VOSbvXJFS7mBQR0LTwt3v7hL9H8yud+OPRZWLEr0Fuq
 wf8ofDnMt+QPunmwCDAZ7Rg/zgXyPuY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-ZCSvmiyrOieCiaHp0L8mJA-1; Wed, 16 Nov 2022 04:21:20 -0500
X-MC-Unique: ZCSvmiyrOieCiaHp0L8mJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA3FD101A54E;
 Wed, 16 Nov 2022 09:21:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC38440C2086;
 Wed, 16 Nov 2022 09:21:18 +0000 (UTC)
Date: Wed, 16 Nov 2022 09:21:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: biosbits test failing on origin/master
Message-ID: <Y3SripoOz5sh0o/Z@redhat.com>
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
 <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
 <CAARzgwxBu+FnM49Mg5Vq+E-VSjvPZTY+i3QP-WbD4oOLzTViPw@mail.gmail.com>
 <CAARzgwzwv3u22jaBroHPFQfCvS5ohekiqBqM6dEBX17LX=fV1g@mail.gmail.com>
 <CAARzgwxx186T2vS0vhZcMH+4A4DMhH+EVJLkYv7UunucFwT=rw@mail.gmail.com>
 <CAFn=p-bN0hPemrgS6jTgqHurP=jGKHOx2z7_qzaoPOjL=AMZNA@mail.gmail.com>
 <CAARzgwwNfoffPNkgBz46ynZFjXJCHh96sjPe37ubHTy278ngAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAARzgwwNfoffPNkgBz46ynZFjXJCHh96sjPe37ubHTy278ngAA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 08:34:00AM +0530, Ani Sinha wrote:
> On Wed, Nov 16, 2022 at 12:18 AM John Snow <jsnow@redhat.com> wrote:
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
> 
> When I wrote the test I was not aware of the avocado timeout. Hence
> implemented mine. However, I kind of think that timing out from the
> test itself rather than from the framework provides an opportunity to
> provide more meaningful information to the user when the timeout
> happens. Of Course we can improve upon the current  "FAIL: True is not
> false" assertion message.
> 
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
> 
> Yes it is both on my 3 year old lenovo laptop with 16 Gib memory:

Note gitlab.com public CI shared runners are *very* small VM instances.

IIUC, currently we can expect the runner to have as little as 1 vCPU,
and 3.75 GB of RAM.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


