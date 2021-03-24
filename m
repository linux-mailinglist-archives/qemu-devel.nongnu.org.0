Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD417348308
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:41:26 +0100 (CET)
Received: from localhost ([::1]:43722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAJf-0005mX-G4
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPAEC-0001r8-My
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPAE5-0006wH-SZ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616618136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UjC//iazzbvDoO53M3QlvBotqWtQyS1DUYPAWYMM2fI=;
 b=W8KEynXb/+25MJ3H598FIxSkD69lYpx72jZ7/08YPtlUTyJGg5HPjYtl2YP+iuLTJHcT7M
 DCauXl97xhsPsvthU56ofHInS+ARskCwcDiE68QlXnNMYspoJqTeD8eSY1lIjmn1+j96u8
 6ogk/x/4oUqnRgb/Endd15rZ4qkP9co=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-nuQF9931Oy-LjQq_qinDXA-1; Wed, 24 Mar 2021 16:35:34 -0400
X-MC-Unique: nuQF9931Oy-LjQq_qinDXA-1
Received: by mail-yb1-f197.google.com with SMTP id j19so3713365ybg.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UjC//iazzbvDoO53M3QlvBotqWtQyS1DUYPAWYMM2fI=;
 b=T9mKGJ4jJNlp+kT5uIQRDZRYoYZNGq7zQNxm2g7HTWjcx+Yn9rNk1bEkmLsQIZUzgA
 Dg4eGoUYCKHDxC/jQ9wQzJjN8yi/G/YTHKdUtfGCF2OaTZYl07YmOxQ+REdGloSTP9+/
 oYb39qRkuSoLaCoQpdsBF9rwbzYfeBLegQgKJujZUZxgj1fY/7pERdWr+VXxeACSUZ1b
 pEAsP4W9dM9VGg0lnX8EnqE6TpxQgmHOxkW55btK6LxZoGYlJLMvI49Oo8B360i+R3IX
 vB/8/zfMHu0GOKuRwkbFLiaRftyylBZnCUY5Dcm4MUivEZ/av0UKYiOCdYUkByY35kvm
 kJDg==
X-Gm-Message-State: AOAM531TdEkS1bk+9N2Ot33/tT9f+k5AjeQTGfohzYEnSH3/zm7EA8T/
 5ec/p5BlicK+To+BUZIpPl/fS51kYJ6UBMiMCc9Pyly2wiunjoipz35x/VuzSm6mBiig8JxrRjz
 qmAUuFtf8whe+5dLSLRenBOh/iPoT+yk=
X-Received: by 2002:a25:2d14:: with SMTP id t20mr7154531ybt.501.1616618134004; 
 Wed, 24 Mar 2021 13:35:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKiLElek+nsnpjir/cQWZfcsJ0QnIiewCCN2XvNyL6VKbyvpnzT7kvdkKwE0icfkvjxPcGk8o2VuhqwTwRiRw=
X-Received: by 2002:a25:2d14:: with SMTP id t20mr7154505ybt.501.1616618133721; 
 Wed, 24 Mar 2021 13:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-4-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-4-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 24 Mar 2021 17:35:07 -0300
Message-ID: <CAKJDGDahSxsr7UwCtS=D97de5jDK813qXZ=UUKQyHSEQsCs_FQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] Python: add utility function for retrieving port
 redirection
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 7:16 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Slightly different versions for the same utility code are currently
> present on different locations.  This unifies them all, giving
> preference to the version from virtiofs_submounts.py, because of the
> last tweaks added to it.
>
> While at it, this adds a "qemu.utils" module to host the utility
> function and a test.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  python/qemu/utils.py                     | 35 ++++++++++++++++++++++++
>  tests/acceptance/info_usernet.py         | 29 ++++++++++++++++++++
>  tests/acceptance/linux_ssh_mips_malta.py | 16 +++++------
>  tests/acceptance/virtiofs_submounts.py   | 21 ++++----------
>  tests/vm/basevm.py                       |  7 ++---
>  5 files changed, 78 insertions(+), 30 deletions(-)
>  create mode 100644 python/qemu/utils.py
>  create mode 100644 tests/acceptance/info_usernet.py
>
> diff --git a/python/qemu/utils.py b/python/qemu/utils.py
> new file mode 100644
> index 0000000000..89a246ab30
> --- /dev/null
> +++ b/python/qemu/utils.py
> @@ -0,0 +1,35 @@
> +"""
> +QEMU utility library
> +
> +This offers miscellaneous utility functions, which may not be easily
> +distinguishable or numerous to be in their own module.
> +"""
> +
> +# Copyright (C) 2021 Red Hat Inc.
> +#
> +# Authors:
> +#  Cleber Rosa <crosa@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +
> +import re
> +from typing import Optional
> +
> +
> +def get_info_usernet_hostfwd_port(info_usernet_output: str) -> Optional[int]:
> +    """
> +    Returns the port given to the hostfwd parameter via info usernet
> +
> +    :param info_usernet_output: output generated by hmp command "info usernet"
> +    :param info_usernet_output: str
> +    :return: the port number allocated by the hostfwd option
> +    :rtype: int
> +    """
> +    for line in info_usernet_output.split('\r\n'):
> +        regex = r'TCP.HOST_FORWARD.*127\.0\.0\.1\s+(\d+)\s+10\.'
> +        match = re.search(regex, line)
> +        if match is not None:
> +            return int(match[1])
> +    return None
> diff --git a/tests/acceptance/info_usernet.py b/tests/acceptance/info_usernet.py
> new file mode 100644
> index 0000000000..9c1fd903a0
> --- /dev/null
> +++ b/tests/acceptance/info_usernet.py
> @@ -0,0 +1,29 @@
> +# Test for the hmp command "info usernet"
> +#
> +# Copyright (c) 2021 Red Hat, Inc.
> +#
> +# Author:
> +#  Cleber Rosa <crosa@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import Test
> +
> +from qemu.utils import get_info_usernet_hostfwd_port
> +
> +
> +class InfoUsernet(Test):
> +
> +    def test_hostfwd(self):
> +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22')
> +        self.vm.launch()
> +        res = self.vm.command('human-monitor-command',
> +                              command_line='info usernet')

This pattern is repeated every time a test needs to call
get_info_usernet_hostfwd_port. Do you see any downside on moving this
line inside the function and passing self.vm as an argument? This
would abstract the need to run info usernet before calling the
function.

> +        port = get_info_usernet_hostfwd_port(res)
> +        self.assertIsNotNone(port,
> +                             ('"info usernet" output content does not seem to '
> +                              'contain the redirected port'))
> +        self.assertGreater(port, 0,
> +                           ('Found a redirected port that is not greater than'
> +                            ' zero'))
> diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
> index 6dbd02d49d..052008f02d 100644
> --- a/tests/acceptance/linux_ssh_mips_malta.py
> +++ b/tests/acceptance/linux_ssh_mips_malta.py
> @@ -18,6 +18,8 @@
>  from avocado.utils import archive
>  from avocado.utils import ssh
>
> +from qemu.utils import get_info_usernet_hostfwd_port
> +
>
>  class LinuxSSH(Test):
>
> @@ -70,18 +72,14 @@ def get_kernel_info(self, endianess, wordsize):
>      def setUp(self):
>          super(LinuxSSH, self).setUp()
>
> -    def get_portfwd(self):
> +    def ssh_connect(self, username, password):
> +        self.ssh_logger = logging.getLogger('ssh')
>          res = self.vm.command('human-monitor-command',
>                                command_line='info usernet')
> -        line = res.split('\r\n')[2]
> -        port = re.split(r'.*TCP.HOST_FORWARD.*127\.0\.0\.1 (\d+)\s+10\..*',
> -                        line)[1]
> +        port = get_info_usernet_hostfwd_port(res)
> +        if not port:
> +            self.cancel("Failed to retrieve SSH port")
>          self.log.debug("sshd listening on port:" + port)
> -        return port
> -
> -    def ssh_connect(self, username, password):
> -        self.ssh_logger = logging.getLogger('ssh')
> -        port = self.get_portfwd()
>          self.ssh_session = ssh.Session(self.VM_IP, port=int(port),
>                                         user=username, password=password)
>          for i in range(10):
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index ca64b76301..57a7047342 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -9,6 +9,8 @@
>  from avocado_qemu import wait_for_console_pattern
>  from avocado.utils import ssh
>
> +from qemu.utils import get_info_usernet_hostfwd_port
> +
>
>  def run_cmd(args):
>      subp = subprocess.Popen(args,
> @@ -73,27 +75,14 @@ class VirtiofsSubmountsTest(LinuxTest):
>      :avocado: tags=accel:kvm
>      """
>
> -    def get_portfwd(self):
> -        port = None
> -
> +    def ssh_connect(self, username, keyfile):
> +        self.ssh_logger = logging.getLogger('ssh')
>          res = self.vm.command('human-monitor-command',
>                                command_line='info usernet')
> -        for line in res.split('\r\n'):
> -            match = \
> -                re.search(r'TCP.HOST_FORWARD.*127\.0\.0\.1\s+(\d+)\s+10\.',
> -                          line)
> -            if match is not None:
> -                port = int(match[1])
> -                break
> -
> +        port = get_info_usernet_hostfwd_port(res)
>          self.assertIsNotNone(port)
>          self.assertGreater(port, 0)
>          self.log.debug('sshd listening on port: %d', port)
> -        return port
> -
> -    def ssh_connect(self, username, keyfile):
> -        self.ssh_logger = logging.getLogger('ssh')
> -        port = self.get_portfwd()
>          self.ssh_session = ssh.Session('127.0.0.1', port=port,
>                                         user=username, key=keyfile)
>          for i in range(10):
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 00f1d5ca8d..75ce07df36 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -21,6 +21,7 @@
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
>  from qemu.accel import kvm_available
>  from qemu.machine import QEMUMachine
> +from qemu.utils import get_info_usernet_hostfwd_port
>  import subprocess
>  import hashlib
>  import argparse
> @@ -306,11 +307,7 @@ def boot(self, img, extra_args=[]):
>          self.console_init()
>          usernet_info = guest.qmp("human-monitor-command",
>                                   command_line="info usernet")
> -        self.ssh_port = None
> -        for l in usernet_info["return"].splitlines():
> -            fields = l.split()
> -            if "TCP[HOST_FORWARD]" in fields and "22" in fields:
> -                self.ssh_port = l.split()[3]
> +        self.ssh_port = get_info_usernet_hostfwd_port(usernet_info)
>          if not self.ssh_port:
>              raise Exception("Cannot find ssh port from 'info usernet':\n%s" % \
>                              usernet_info)
> --
> 2.25.4
>

Other than maybe a small adjustment to the
get_info_usernet_hostfwd_port function:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


