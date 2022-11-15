Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9366290E3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 04:40:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oummU-0005FN-J8; Mon, 14 Nov 2022 22:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oummR-0005F1-KY
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 22:38:35 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oummP-00072Y-1d
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 22:38:35 -0500
Received: by mail-il1-x12c.google.com with SMTP id l6so6802768ilq.3
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 19:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=coYXnd2+ZH0rdRIKYFfyki1UeIvgAh5cE61HpYlO2Z8=;
 b=F1C7bg2VlF30VQsv5Ufcr3/HIpXJh2RXH2tiU0+qur0WBNpWi6A5tQgmzjRPh0HdZj
 WY+1wPbLge/FtxO6pjXiPmLnC2qs31ED43rtYwMp+Vj/1QNpQGQISSGEXpb+q37sjbwz
 E+igAqIkg6RR2zuZkRivxqpyfXMPqFG2u2jB4ZD6Nv+MGGKMLuelJoRATC3l9jPrlD95
 EmRSyOvQ4E9ABezynoHfBqIAXCa1K6v2njTt7sf7puCDdEpCXHNwVRdmBlRyOOejJPa9
 EkGAcMqbDwuIKKVWL1vCjcZqc/0r2bYjItXmtU/xR54DNjCa1WWEr1U6Zmzs3GPUa9Dh
 2Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=coYXnd2+ZH0rdRIKYFfyki1UeIvgAh5cE61HpYlO2Z8=;
 b=sIlRnuaKE7Xg/gw8sYOFooUAxPbWkcPgVfTHFPQgBXArbSDuW8e7am7IUI52In5ng6
 7mCSMzQA7J1kMfE24g/kcagLuDXx3b5jV5JT5zJY3xfs9HXzR9o3r6rYcAVqj7O+hdhQ
 156DbGoT/Yx20RHuClVCUF1YhXl/MqeKeGDO0T1QPdoPXGY/He9gxaYyfBeIzAU8KkH2
 L/wDxf8/zFs07xMDCtyR3prfk2ZGQFLNvhGG5VWG9yx+vkvXkDda6AVs/xoCwJCyTWKv
 Tbe6+e3XSd0by5vkHvvu6Um6jRQvmQFD7ZyhtvPHJS9ll5Fkh2cfzXUPAFITtP1ygi3r
 Yfxg==
X-Gm-Message-State: ANoB5pnY6HxiLWbWVK5yjhcOuVI8ZMF2R8nDBq6kLvveNzNPeZ8g7uBu
 18IWR7o22C9HbQLlMI1Haa970YTrz6yr01v5Ld5Zfw==
X-Google-Smtp-Source: AA0mqf558hW/E9AQ7Jkh9XFmftLwYbZIJDLJ2HuN5cHxyjEQdi/UrlKF5OhHOynk2lhvbviofwEBXx0cV6SU61Z7KR0=
X-Received: by 2002:a92:ddc3:0:b0:302:3521:41e1 with SMTP id
 d3-20020a92ddc3000000b00302352141e1mr7519139ilr.54.1668483491064; Mon, 14 Nov
 2022 19:38:11 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
 <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
In-Reply-To: <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 15 Nov 2022 09:07:59 +0530
Message-ID: <CAARzgwxBu+FnM49Mg5Vq+E-VSjvPZTY+i3QP-WbD4oOLzTViPw@mail.gmail.com>
Subject: Re: biosbits test failing on origin/master
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12c.google.com
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

On Tue, Nov 15, 2022 at 5:13 AM John Snow <jsnow@redhat.com> wrote:
>
> On Thu, Nov 10, 2022 at 11:22 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
> > >
> > > Hiya, on today's origin/master
> > > (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> > > check-avocado" is failing on the new biosbits test on my local
> > > development machine:
> > >
> > >  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > FAIL: True is not false : The VM seems to have failed to shutdown in
> > > time (83.65 s)
> > >
> > > Is this a known issue, or should I begin to investigate it?
> >
> > In my test environment it does pass.
> >
> > $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > Fetching asset from
> > tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> > JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
> > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
> >  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > PASS (57.57 s)
> > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> > | CANCEL 0
> > JOB TIME   : 63.82 s
> >
> > However, I have seen that on certain slower test machines or when run
> > within a virtual machine, the test can take longer to complete and 60
> > secs may not always be enough. In those cases raising the maximum
> > completion time to 90 secs helps. Perhaps you can try this and let me
> > know if it helps:
>
> Hmm - I'm running on a fairly modern machine and not in a VM. Do you
> have an invocation to share that exists outside of the avocado
> machinery

If you pass V=1 in the environment then it dumps the QEMU command line
that was used to run the test. You also need to comment out the line
> shutil.rmtree(self._workDir)
in tearDown() so that the iso is not cleaned up.

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index a67d30d583..2060e3b84f 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -357,7 +357,7 @@ def tearDown(self):
         if self._vm:
             self.assertFalse(not self._vm.is_running)
         self.logger.info('removing the work directory %s', self._workDir)
-        shutil.rmtree(self._workDir)
+        # shutil.rmtree(self._workDir)
         super().tearDown()

     def test_acpi_smbios_bits(self):

while you are at it, it might makes sense to check the vnc for the VM
to see what it is doing.

 where I could test this individually and see how long it
> might take to complete if I just let it run? I am worried that it's
> getting wedged instead of just taking a long time, but it's hard to
> tell.
>
> --js
>
> >
> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> > index 8745a58a76..b11fe39350 100644
> > --- a/tests/avocado/acpi-bits.py
> > +++ b/tests/avocado/acpi-bits.py
> > @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
> >          self._vm.launch()
> >          # biosbits has been configured to run all the specified test suites
> >          # in batch mode and then automatically initiate a vm shutdown.
> > -        # sleep for maximum of one minute
> > -        max_sleep_time = time.monotonic() + 60
> > +        # sleep for a maximum of one and half minutes to accommodate
> > running this
> > +        # even on slower machines.
> > +        max_sleep_time = time.monotonic() + 90
> >          while self._vm.is_running() and time.monotonic() < max_sleep_time:
> >              time.sleep(1)
> >
>

