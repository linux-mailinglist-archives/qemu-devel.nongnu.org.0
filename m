Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A045338F2CD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:17:22 +0200 (CEST)
Received: from localhost ([::1]:37720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llF8j-0005uL-M0
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llF6b-0004Md-2j
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llF6X-0000eA-76
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621880103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8nwiVj36rgHM9Q8fo7ERT6bwlOpGGZnqqgXG8wnM1ic=;
 b=SX7OW1KKY0NH1dBlKYDGRGEaXOPXyUp6qqlcHZFgY2pkb0gsq7rjvIU3Pl9nAtnBTzm5E3
 oc8GPzmD7/PHA2H0CVelp77gRR6jtj+Kk0gEE0vh7ad0KC6luCLbBjdUwpM5/WnDc0elsm
 ZKIIfXfW94oOvvLPtM8SvLFeG+vxvSo=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-psfuUpQIMLeX0SzAErIA7w-1; Mon, 24 May 2021 14:15:01 -0400
X-MC-Unique: psfuUpQIMLeX0SzAErIA7w-1
Received: by mail-ua1-f71.google.com with SMTP id
 r26-20020ab058da0000b02901e9245a03f1so12075147uac.9
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8nwiVj36rgHM9Q8fo7ERT6bwlOpGGZnqqgXG8wnM1ic=;
 b=pN05E/OfBbFgFIxwp/UPNNjsE33W7OTJLH44B6XcSbZGEyxUJquo4rZ9A2L2OC+KgJ
 6S3E0w3P/kib403NmsAuu1GBi303CZ8zqgvEFtb9XdUtU2ZJYf8fo8Q1LioZAJfh+I7A
 qMqQtU5gLwRPc4hcoHAH5Y7Ee7fmOFBV9YsV/25mM287Y8GhQOhK7LOQ+/q2y677A3Xh
 TmvQkQnvSZxHMqO0+8CFWPJ1B887fhkTrPDaW/uiZ5iZfhVezVoNGq8LOZ8Q9DpPCdLN
 vYREZpwbzvym5qWbIXVAH46qilxmc8K5o/Rpa70NF1uHumhhzhE70QxOohzL9Das9KlY
 bAHA==
X-Gm-Message-State: AOAM531o1XuXu462yEJEmXL59vO6YLBuxX9eFYZGiKYQSPXqcY97SzMu
 2Ue9UCNV0Ee4Q3YP4Y3E+fcl/9nt1otP7aEyAOAAJBrJWQiZrQkNnpyWasKcsw5llYCeigH+z8O
 nxVkDviNDYgQQNe7lOewwrwrnBDIpGdI=
X-Received: by 2002:a05:6102:14c:: with SMTP id
 a12mr3088543vsr.39.1621880100853; 
 Mon, 24 May 2021 11:15:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiqOOKlkuAS5ss5D/brlCkIyh6HunrEdn0EFDtwA+FBgentB0IXGH4MoteXWf8aB4qcnhvyBHjrnpCt7Ox7p4=
X-Received: by 2002:a05:6102:14c:: with SMTP id
 a12mr3088517vsr.39.1621880100580; 
 Mon, 24 May 2021 11:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210503224326.206208-1-wainersm@redhat.com>
 <20210503224326.206208-2-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-2-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 15:14:34 -0300
Message-ID: <CAKJDGDYgSd90b-9VnMeN9cwCZ68-kdoA=2DBoVjgCTmdpXSX_Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] tests/acceptance: Introduce the ConsoleMixIn class
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Wainer,

On Mon, May 3, 2021 at 7:43 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> This created the ConsoleMixIn class to wrap the methods related with console
> interaction with the guest that currently are loose in the avocado_qemu
> package. It should be used as a mixin on the test classes.
>
> At this point only the interrupt_interactive_console_until_pattern() was moved
> to ConsoleMixIn. This method is only used in boot_linux_console.py tests, so
> there was needed to adapt them.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 52 +++++++++++------------
>  tests/acceptance/boot_linux_console.py    | 10 ++---
>  2 files changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 83b1741ec8..6f4e0edfa3 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -101,32 +101,6 @@ def _console_interaction(test, success_message, failure_message,
>                      (failure_message, success_message)
>              test.fail(fail)
>
> -def interrupt_interactive_console_until_pattern(test, success_message,
> -                                                failure_message=None,
> -                                                interrupt_string='\r'):
> -    """
> -    Keep sending a string to interrupt a console prompt, while logging the
> -    console output. Typical use case is to break a boot loader prompt, such:
> -
> -        Press a key within 5 seconds to interrupt boot process.
> -        5
> -        4
> -        3
> -        2
> -        1
> -        Booting default image...
> -
> -    :param test: an Avocado test containing a VM that will have its console
> -                 read and probed for a success or failure message
> -    :type test: :class:`avocado_qemu.Test`
> -    :param success_message: if this message appears, test succeeds
> -    :param failure_message: if this message appears, test fails
> -    :param interrupt_string: a string to send to the console before trying
> -                             to read a new line
> -    """
> -    _console_interaction(test, success_message, failure_message,
> -                         interrupt_string, True)
> -
>  def wait_for_console_pattern(test, success_message, failure_message=None,
>                               vm=None):
>      """
> @@ -168,6 +142,32 @@ def exec_command_and_wait_for_pattern(test, command,
>      """
>      _console_interaction(test, success_message, failure_message, command + '\r')
>
> +class ConsoleMixIn():
> +    """Contains utilities for interacting with a guest via Console."""
> +
> +    def interrupt_interactive_console_until_pattern(self, success_message,
> +                                                    failure_message=None,
> +                                                    interrupt_string='\r'):
> +        """
> +        Keep sending a string to interrupt a console prompt, while logging the
> +        console output. Typical use case is to break a boot loader prompt, such:
> +
> +            Press a key within 5 seconds to interrupt boot process.
> +            5
> +            4
> +            3
> +            2
> +            1
> +            Booting default image...
> +
> +        :param success_message: if this message appears, test succeeds
> +        :param failure_message: if this message appears, test fails
> +        :param interrupt_string: a string to send to the console before trying
> +                                to read a new line
> +        """
> +        _console_interaction(self, success_message, failure_message,
> +                         interrupt_string, True)
> +
>  class Test(avocado.Test):
>      def _get_unique_tag_val(self, tag_name):
>          """
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 1ca32ecf25..10317b232b 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -17,7 +17,7 @@
>  from avocado import skipUnless
>  from avocado_qemu import Test
>  from avocado_qemu import exec_command_and_wait_for_pattern
> -from avocado_qemu import interrupt_interactive_console_until_pattern
> +from avocado_qemu import ConsoleMixIn
>  from avocado_qemu import wait_for_console_pattern
>  from avocado.utils import process
>  from avocado.utils import archive
> @@ -45,7 +45,7 @@ def image_pow2ceil_expand(path):
>              with open(path, 'ab+') as fd:
>                  fd.truncate(size_aligned)
>
> -class LinuxKernelTest(Test):
> +class LinuxKernelTest(Test, ConsoleMixIn):

The Python class hierarchy is defined from right to left. This would
not cause a problem now but can result in unexpected behavior in the
future. In this case, my suggestion is to switch the order here and
make the Test class the last.

>      KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
>
>      def wait_for_console_pattern(self, success_message, vm=None):
> @@ -626,8 +626,8 @@ def test_arm_quanta_gsj(self):
>          self.wait_for_console_pattern('>Device: Poleg BMC NPCM730')
>          self.wait_for_console_pattern('>Skip DDR init.')
>          self.wait_for_console_pattern('U-Boot ')
> -        interrupt_interactive_console_until_pattern(
> -                self, 'Hit any key to stop autoboot:', 'U-Boot>')
> +        self.interrupt_interactive_console_until_pattern(
> +                'Hit any key to stop autoboot:', 'U-Boot>')
>          exec_command_and_wait_for_pattern(
>                  self, "setenv bootargs ${bootargs} " + kernel_command_line,
>                  'U-Boot>')
> @@ -879,7 +879,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
>                           '-no-reboot')
>          self.vm.launch()
>          wait_for_console_pattern(self, 'U-Boot 2020.01+dfsg-1')
> -        interrupt_interactive_console_until_pattern(self,
> +        self.interrupt_interactive_console_until_pattern(
>                                         'Hit any key to stop autoboot:',
>                                         'switch to partitions #0, OK')
>
> --
> 2.29.2
>


