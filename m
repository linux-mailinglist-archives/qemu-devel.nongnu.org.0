Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31E462591E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRuk-0003p9-RT; Fri, 11 Nov 2022 06:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otRuj-0003o9-B3
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:09:37 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otRuh-0007Mc-Co
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:09:37 -0500
Received: by mail-io1-xd2c.google.com with SMTP id z3so3342175iof.3
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UNuSEadWnQJ5rGFfoaQV7TBooqeeRMX+k8NteiB0mqQ=;
 b=GPJFVTFppXxl84ev//oLvdZl5wUGz20oVRnwS/+fuPWIpnTjp/EBY7nWvqKFhpQiSL
 zqxHhl+oqAUbYEezR27hr825k4FtfhwBDfkttim/iPH7BYBYSsmn4DOmzKx/Ipy/A6+v
 pqowvcv/ZtSmborgUyavY7JbgGuwsQ/bjlYUyjdZxqkY/zXla09Zw3NEBrUWiqWUFNK+
 fpn0YvvpXY2P2GDNWP0cqOrlXg5bEfTI82e7+Cp3jHYITRTET1ihdoGYVY3QXw4BJYjp
 /Rjl39yNB+AI/tGbVyx2D82VCdZvXq9CI7BKFtwNN/x/PrIdWuQdmvYEb2gl0hv+QXXO
 gdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNuSEadWnQJ5rGFfoaQV7TBooqeeRMX+k8NteiB0mqQ=;
 b=fC1dUxkAtyU8Y+5Y7pHMw+S2NOziHEMGQ90q++bh/FsHFlZr0OXpiDcAhC3y337lKJ
 3MicfeohUnmS4X9BmEdHQ1JJQowC12SzXo13T8OgvMNPHBCuWc/xBSp+5ss5+OoJNR0I
 MIXmqfzAo9PlKwRA/6xMO/2Zk7j8bBl2bnf/Xk92ZaPk9KF0k5vAIXjBpT2sXeUmRGes
 0AmLusUr/3u9YK+d9dHElAqBlVyLxGzKT3FlUWbAKruNIQym+mgCmfRKQFLx5WJppvcv
 agywIwTRRl/qMNRem2/UtuDPhWCZc8WJTVWQwJoHCmMAadH0amrWNCii3YhWCLRbtMU2
 bzIg==
X-Gm-Message-State: ANoB5pmZR8dNNTxeJWpMlaMF6TyyMjYqqeqUzXGs98H1EjJTWeLixUly
 dY7/k2XGvsPv5Tfu9MoTFf5TKNWguTOpsz2tfLTXPA==
X-Google-Smtp-Source: AA0mqf57GtEswpd3MmWH3AQntkYCoKSpQ99OCFT3WJ2ygB3Zb0QogyQUDjgMpTZS7UWM6sQ7eEg2Fbwm/VpcB54cyw8=
X-Received: by 2002:a02:54ca:0:b0:375:7f39:51d9 with SMTP id
 t193-20020a0254ca000000b003757f3951d9mr499289jaa.174.1668164973645; Fri, 11
 Nov 2022 03:09:33 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
In-Reply-To: <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 11 Nov 2022 16:39:22 +0530
Message-ID: <CAARzgwxwxk17n4e3e1WAug4CacoX5cjRPSc9YBXpcYQM8ZV9QA@mail.gmail.com>
Subject: Re: biosbits test failing on origin/master
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2c.google.com
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

On Fri, Nov 11, 2022 at 9:52 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
> >
> > Hiya, on today's origin/master
> > (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> > check-avocado" is failing on the new biosbits test on my local
> > development machine:
> >
> >  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > FAIL: True is not false : The VM seems to have failed to shutdown in
> > time (83.65 s)
> >
> > Is this a known issue, or should I begin to investigate it?
>
> In my test environment it does pass.
>
> $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> Fetching asset from
> tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
>  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> PASS (57.57 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> | CANCEL 0
> JOB TIME   : 63.82 s
>
> However, I have seen that on certain slower test machines or when run
> within a virtual machine, the test can take longer to complete and 60
> secs may not always be enough.

Here is an interesting data point. I re-ran on a Centos 8 VM running
on Ubuntu bare metal. Just like the Ubuntu bare metal, it passed fine.
Next, I tried to run it on a Centos 7.9.2009 VM running on the same
Ubuntu bare metal. I was able to reproduce this consistently. So I did
some digging, gdb into qemu and it looked like the VM was just slow
but not stuck. So I timed the QEMU command line that was being used in
the test using the same iso that was being generated by the test. Here
it is:

# time ./qemu-system-x86_64 -display none -vga none -chardev
file,path=/var/tmp/debugcon-log.txt,id=debugcon -device
isa-debugcon,iobase=0x403,chardev=debugcon -cdrom
/var/tmp/acpi-bits-oogd8wp9.tmp/bits-2020.iso

real 2m34.052s
user 2m33.858s
sys 0m0.467s

On bare metal Ubuntu, I see this:

$ time ./qemu-system-x86_64 -display none -vga none -chardev
file,path=/var/tmp/debugcon-log.txt,id=debugcon -device
isa-debugcon,iobase=0x403,chardev=debugcon -cdrom ~/temp/bits-2020.iso

real 1m15.318s
user 1m15.136s
sys 0m0.345s

With "-icount auto" added in the command line,  both bare metal and VM
environments were slower. However, we need this command line for some
latency tests.

avocado framework has a 2 min timeout for any test. This would
definitely time out even without my internal timeout check. I verified
that the test indeed passed by looking into the debug con logs pushed
out by the test framework. If the system is just slow/overloaded I am
not sure what we can do.

In those cases raising the maximum
> completion time to 90 secs helps. Perhaps you can try this and let me
> know if it helps:

Maybe I will make the timeout 90 secs and hope that this will be enough.

>
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 8745a58a76..b11fe39350 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
>          self._vm.launch()
>          # biosbits has been configured to run all the specified test suites
>          # in batch mode and then automatically initiate a vm shutdown.
> -        # sleep for maximum of one minute
> -        max_sleep_time = time.monotonic() + 60
> +        # sleep for a maximum of one and half minutes to accommodate
> running this
> +        # even on slower machines.
> +        max_sleep_time = time.monotonic() + 90
>          while self._vm.is_running() and time.monotonic() < max_sleep_time:
>              time.sleep(1)

