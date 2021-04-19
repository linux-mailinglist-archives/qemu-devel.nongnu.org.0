Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E658A36470C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:25:15 +0200 (CEST)
Received: from localhost ([::1]:50544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVly-0006P5-W5
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYVjS-0004re-Ui
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:22:42 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYVjQ-0004Q8-Ro
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:22:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id n127so6644175wmb.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wb3y094hwKiX7HNlaH2jkPQ4ZtwmhtZRsVUru0ameTQ=;
 b=T373dFZNxvUjMsbePKXG2YnLgOiuRmRUIooVJg4G3iywnP/YVH9MO3yWJG/nv8i14l
 fDMlcwTTJc/12eqy0UY4J11DiDhkBY0XXrQSz3A+/EdkIPOSH0WbLeAj1ovX0xsSTSgu
 4ybnrWxDOBWx0EaZ+GX6j5SXcNQ4AU0eMZgDNgybqPPsfgprwBf3I8TIfbYVpUsa4qkJ
 U0O08d4bXcDx9yEyrrRjdP95mCNYAJQhggbe+iZFccNdippb6EpQk1DsAvpn8Ac+7mNZ
 0EP/JUGDBsAq8SPDBba6qrlLU3PQSASeO9bfQ6ORRjKv3aw5QKhdsPovs+9EwB+SbqnV
 DOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wb3y094hwKiX7HNlaH2jkPQ4ZtwmhtZRsVUru0ameTQ=;
 b=KaLpg37nv2nl4yTo80CcnIiPawYxBK30Euj/SPJTu0Dn+VeOcnU0UWYCyFnvfykHZY
 C2T1fLy2HEtjvqBXwtQ2sRwUxcwKc5nG6M85KjqJGsaUePxAIlCL0Yv2yMkODthPTkE6
 xPFvYg+vN2vgU9K2SgVv7HBcbWbilJZ6G+b2nDaJYh/h6InPUhXGMa0sVSQKV3N1+H3Z
 RwBDLp6nvd0Y9Iq93bMhNWaLOyXgAjPcpQj1ipN+H6vXyf0xsqWUfqbflVeppW4QInWU
 mR8c9PFTe0cIMiOEwo01fY+4TFB7/6aFC5xQJ8FrP5PJnh4sbl3HQz/j0VvJSQqRyLVd
 uVYw==
X-Gm-Message-State: AOAM532VXyH0FHznO9ccRNyk1Avb8NP/auPLWXFq5u5pkGED8swBRGMn
 Jc0HBvG+h7on6e21I0i7ojs=
X-Google-Smtp-Source: ABdhPJygQQojsiYSjG/7fuargcL9ellfBlAgl8h5uBnjmbeLdZ6QkqvxIdqywsimuwq7oNqrPOcNPg==
X-Received: by 2002:a05:600c:2247:: with SMTP id
 a7mr22609337wmm.133.1618845755471; 
 Mon, 19 Apr 2021 08:22:35 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z14sm25507603wrt.54.2021.04.19.08.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 08:22:34 -0700 (PDT)
Subject: Re: [PATCH v3 04/11] Acceptance Tests: move useful ssh methods to
 base class
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210412044644.55083-1-crosa@redhat.com>
 <20210412044644.55083-5-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da84ade4-6d66-7728-7edd-3d128aa43f0f@amsat.org>
Date: Mon, 19 Apr 2021 17:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210412044644.55083-5-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/21 6:46 AM, Cleber Rosa wrote:
> Both the virtiofs submounts and the linux ssh mips malta tests
> contains useful methods related to ssh that deserve to be made
> available to other tests.  Let's move them to an auxiliary, mix-in
> class that will be used on the base LinuxTest class.
> 
> The method that helps with setting up an ssh connection will now
> support both key and password based authentication, defaulting to key
> based.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 48 ++++++++++++++++++++++-
>  tests/acceptance/linux_ssh_mips_malta.py  | 40 ++-----------------
>  tests/acceptance/virtiofs_submounts.py    | 37 -----------------
>  3 files changed, 50 insertions(+), 75 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 83b1741ec85..67f75f66e56 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py

Don't we need to update the copyright in this file?
I ask because I'm never sure how that works.... In my patches
when I move code which is in a copyrighted file, I add the same
copyright lines to the copied file.

> @@ -20,6 +20,7 @@
>  from avocado.utils import cloudinit
>  from avocado.utils import datadrainer
>  from avocado.utils import network
> +from avocado.utils import ssh
>  from avocado.utils import vmimage
>  from avocado.utils.path import find_command
>  
> @@ -43,6 +44,8 @@
>  from qemu.accel import kvm_available
>  from qemu.accel import tcg_available
>  from qemu.machine import QEMUMachine
> +from qemu.utils import get_info_usernet_hostfwd_port
> +
>  
>  def is_readable_executable_file(path):
>      return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
> @@ -253,7 +256,50 @@ def fetch_asset(self, name,
>                          cancel_on_missing=cancel_on_missing)
>  
>  
> -class LinuxTest(Test):
> +class LinuxSSHMixIn:
> +    """Contains utility methods for interacting with a guest via SSH."""
> +
> +    def ssh_connect(self, username, credential, credential_is_key=True):
> +        self.ssh_logger = logging.getLogger('ssh')
> +        res = self.vm.command('human-monitor-command',
> +                              command_line='info usernet')
> +        port = get_info_usernet_hostfwd_port(res)
> +        self.assertIsNotNone(port)
> +        self.assertGreater(port, 0)
> +        self.log.debug('sshd listening on port: %d', port)
> +        if credential_is_key:
> +            self.ssh_session = ssh.Session('127.0.0.1', port=port,
> +                                           user=username, key=credential)
> +        else:
> +            self.ssh_session = ssh.Session('127.0.0.1', port=port,
> +                                           user=username, password=credential)
> +        for i in range(10):
> +            try:
> +                self.ssh_session.connect()
> +                return
> +            except:
> +                time.sleep(4)
> +                pass
> +        self.fail('ssh connection timeout')
> +
> +    def ssh_command(self, command):
> +        self.ssh_logger.info(command)
> +        result = self.ssh_session.cmd(command)
> +        stdout_lines = [line.rstrip() for line
> +                        in result.stdout_text.splitlines()]
> +        for line in stdout_lines:
> +            self.ssh_logger.info(line)
> +        stderr_lines = [line.rstrip() for line
> +                        in result.stderr_text.splitlines()]
> +        for line in stderr_lines:
> +            self.ssh_logger.warning(line)
> +
> +        self.assertEqual(result.exit_status, 0,
> +                         f'Guest command failed: {command}')
> +        return stdout_lines, stderr_lines
> +
> +
> +class LinuxTest(Test, LinuxSSHMixIn):
>      """Facilitates having a cloud-image Linux based available.
>  
>      For tests that indend to interact with guests, this is a better choice
> diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
> index 052008f02d4..61c9079d047 100644
> --- a/tests/acceptance/linux_ssh_mips_malta.py
> +++ b/tests/acceptance/linux_ssh_mips_malta.py
> @@ -12,16 +12,14 @@
>  import time
>  
>  from avocado import skipUnless
> -from avocado_qemu import Test
> +from avocado_qemu import Test, LinuxSSHMixIn
>  from avocado_qemu import wait_for_console_pattern
>  from avocado.utils import process
>  from avocado.utils import archive
>  from avocado.utils import ssh
>  
> -from qemu.utils import get_info_usernet_hostfwd_port
>  
> -
> -class LinuxSSH(Test):
> +class LinuxSSH(Test, LinuxSSHMixIn):
>  
>      timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
>  
> @@ -72,41 +70,9 @@ def get_kernel_info(self, endianess, wordsize):
>      def setUp(self):
>          super(LinuxSSH, self).setUp()
>  
> -    def ssh_connect(self, username, password):
> -        self.ssh_logger = logging.getLogger('ssh')
> -        res = self.vm.command('human-monitor-command',
> -                              command_line='info usernet')
> -        port = get_info_usernet_hostfwd_port(res)
> -        if not port:
> -            self.cancel("Failed to retrieve SSH port")
> -        self.log.debug("sshd listening on port:" + port)
> -        self.ssh_session = ssh.Session(self.VM_IP, port=int(port),
> -                                       user=username, password=password)
> -        for i in range(10):
> -            try:
> -                self.ssh_session.connect()
> -                return
> -            except:
> -                time.sleep(4)
> -                pass
> -        self.fail("ssh connection timeout")
> -
>      def ssh_disconnect_vm(self):
>          self.ssh_session.quit()
>  
> -    def ssh_command(self, command, is_root=True):
> -        self.ssh_logger.info(command)
> -        result = self.ssh_session.cmd(command)
> -        stdout_lines = [line.rstrip() for line
> -                        in result.stdout_text.splitlines()]
> -        for line in stdout_lines:
> -            self.ssh_logger.info(line)
> -        stderr_lines = [line.rstrip() for line
> -                        in result.stderr_text.splitlines()]
> -        for line in stderr_lines:
> -            self.ssh_logger.warning(line)
> -        return stdout_lines, stderr_lines
> -
>      def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel_path):
>          image_url, image_hash = self.get_image_info(endianess)
>          image_path = self.fetch_asset(image_url, asset_hash=image_hash)
> @@ -127,7 +93,7 @@ def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel_path):
>          wait_for_console_pattern(self, console_pattern, 'Oops')
>          self.log.info('sshd ready')
>  
> -        self.ssh_connect('root', 'root')
> +        self.ssh_connect('root', 'root', False)
>  
>      def shutdown_via_ssh(self):
>          self.ssh_command('poweroff')

