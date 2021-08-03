Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AEC3DF052
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:31:45 +0200 (CEST)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvSK-0008V3-N9
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mAvQm-0006wI-Uu
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:30:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mAvQl-0004jB-Di
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628001006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8PwsxxdfORomDSSz+O1zuAM9hrn+w56IKDttKwMV0LQ=;
 b=QgFNioPkB5qsBCADOnjO0q4DtS7j6Uf1RUBactcEaskBqjcpzSrQR3xe5HfbkLMWAX7n1B
 EUi+wSOHF/LyhCOTK4ildfH9465bNGFlWkIcROK0SBVoKbeWrliNvjdUnXmhgWySI7MJ5v
 Om4pFxXIY5SZ1qWxASx2HX3eF8ijCoY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-lyPHj8iOMmuJRQCIUqImgg-1; Tue, 03 Aug 2021 10:30:05 -0400
X-MC-Unique: lyPHj8iOMmuJRQCIUqImgg-1
Received: by mail-ed1-f69.google.com with SMTP id
 s8-20020a0564020148b02903948b71f25cso10528770edu.4
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 07:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8PwsxxdfORomDSSz+O1zuAM9hrn+w56IKDttKwMV0LQ=;
 b=HoK4Lxpx7fghgSYkMbQhKZSBxUeY7Oc1gBE60njWuTrVc3cZUao9yEXr19XMEQ/z8a
 4L3SsPH81v+dkv/sHtZ+pX7tRBA+Cp6nfsEkwbM2Y8sthIpQSZtnJ7gsqaNIWnllvZk6
 oOPus0AcE9HwwRFP9btH9C7au434eB8w9YeU6K9VTypUmnAtNwLuJS+VDbCF6ajQ3bQM
 s44wubrE/pAk4dkOnR+a+l244QmbNakFmKsnj2VKrfHTpWpRPWFujk7V1073SmpCeU6P
 8J9U3vVowmaU/jVcT32SP1w4huOMQbdEB0HAooNJi+VP9vKpdzD6DyxapJ4V77iZltf/
 TONg==
X-Gm-Message-State: AOAM530mG5zFEyvJ7gDG5MlwIR3gvKYay/711IGKHmbUPUvFywXlJxGF
 o4uYhN4SIPHtwYdMsKgwTjk+CQed2PiaWSFwU9uxU5IVlYbHI5+N9NrFmqu9fz0Cffb60cSIkpd
 HPJCVpNJzrTRO+ZKTji2ZSdYbf1f9k4w=
X-Received: by 2002:a05:6402:22ac:: with SMTP id
 cx12mr26249094edb.254.1628001004355; 
 Tue, 03 Aug 2021 07:30:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCY/5A48IZKI0Nq+sTHnwbAW5LftSgmqbJIyPTa7Iglv772VKCUbuD4ClmL1XF7kQ116nbZSbxqEe6bDK6U3c=
X-Received: by 2002:a05:6402:22ac:: with SMTP id
 cx12mr26249058edb.254.1628001004054; 
 Tue, 03 Aug 2021 07:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_g8F26bV6wHFRUt7TSZMjt8hs6Pip8kHw=s4-WXy_AXg@mail.gmail.com>
 <CA+bd_6KanUEpDxVv4-T1mxvFMeCsG7XGXv9t06-b-AL3UxK0-w@mail.gmail.com>
 <CAFEAcA_c=ipCiN8bHn+EK92BqvDbWpzdC5kfs321O5ZGR6jSrw@mail.gmail.com>
In-Reply-To: <CAFEAcA_c=ipCiN8bHn+EK92BqvDbWpzdC5kfs321O5ZGR6jSrw@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 3 Aug 2021 10:29:53 -0400
Message-ID: <CA+bd_6KE6NVt=9CmVHD46tW5E3vZweZKpVkggsgxOOB2S=LMwg@mail.gmail.com>
Subject: Re: 'make check-acceptance' eats lots of disk space and never cleans
 it up
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 3, 2021 at 9:47 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 3 Aug 2021 at 13:58, Cleber Rosa <crosa@redhat.com> wrote:
> >
> > On Tue, Aug 3, 2021 at 8:43 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > It looks like 'make check-acceptance' creates directories in
> > > build/clang/tests/results which are huge and which it never
> > > cleans up. For example one of my build directories (configured
> > > just for arm targets) has over 350 'job-[timestamp]' directories,
> > > many of which are 2.5GB or more in size.
> > >
> >
> > Every "job-[timestamp]" directory is the result of an "avocado run"
> > invocation, that is, one "make check-acceptance" command.
> >
> > > I assume most of this is artefacts (disk images etc) needed to
> > > rerun the tests. That's useful to keep around so you can manually
> > > run a test. However, we should be sharing this between runs, not
> > > creating a fresh copy for every time check-acceptance is
> > > run, surely ?
> > >
> >
> > They contain results and files needed for debugging the results of
> > tests, not artefacts needed to re-run them.  Everything that is
> > shareable is in the "~/avocado/data/caches" directory.
>
> This doesn't in practice seem to be the case. Picking a subdirectory
> at random:
>
> ./build/clang/tests/results/job-2021-07-30T11.20-63bd0a6/test-results/tmp_dir4_a3m36o/091-tests_acceptance_machine_sparc64_sun4u.py_Sun4uMachine.test_sparc64_sun4u/day23
>
> This contains (among other things) a vmlinux file which I assume is
> the one we run on the guest. It looks to me like this is a directory
> where we unzipped/untarred a downloaded file with the guest image.
>
> And another:
>
> ./build/clang/tests/results/job-2021-07-30T11.20-63bd0a6/test-results/tmp_dirwowk1bzp/026-tests_acceptance_boot_linux_console.py_BootLinuxConsole.test_arm_cubieboard_initrd/
>
> This seems to contain a rootfilesystem for some test or other,
> with a boot/, lib/, usr/, etc.
>
> These all look like artefacts to me, in the sense that they're
> the same every time.
>
> I notice that all these have 'tmp_dir*' directories in the paths. Is the
> problem just that we're failing to clean up a tempdir in some situations?
>

These are all directories meant to be temporary (the name gives it
away) and meant to be cleaned up.  You actually found a bug in the
"avocado_qemu.Test" class that is *not* calling the base
"avocado.Test" class tearDown().  It's a trivial one liner fix:

---

diff --git a/tests/acceptance/avocado_qemu/__init__.py
b/tests/acceptance/avocado_qemu/__init__.py
index 2c4fef3e14..1e807e2e55 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -276,6 +276,7 @@ def tearDown(self):
        for vm in self._vms.values():
            vm.shutdown()
        self._sd = None
+        super(Test, self).tearDown()

    def fetch_asset(self, name,
                    asset_hash=None, algorithm=None,

---

> thanks
> -- PMM
>

Thanks a lot for spotting that, I'll send a fix to the ML right away.

Best regards,
- Cleber.


