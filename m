Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A23C7635
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 20:07:41 +0200 (CEST)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Mom-0005Zg-Dh
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 14:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3MnN-0004AB-6r
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3MnL-0007Az-HB
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626199571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rQgchPwxyr4aI2AHoUcFkfnK5B7pbHsAXoNeBRT13BU=;
 b=BcmhN5vSUwbt0UHxxiALNtAFfyB3NKvF0FnsyUt/O9BOwOrYbe6U8K67mQzZqIc2z6BsfD
 XX/PosFT8uFtE7uI0sPc7bgSwVkCgRLFDoH42oNUV2pz0vwYqLCBHLIiuY/zk/o8SGCtKf
 j2dwl3lJTBNzmuhJfgltQk+kXi3lP78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-9aXqGimDPZ-apUAVQ7ERNA-1; Tue, 13 Jul 2021 14:06:05 -0400
X-MC-Unique: 9aXqGimDPZ-apUAVQ7ERNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB4739126D;
 Tue, 13 Jul 2021 18:06:04 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C15219C44;
 Tue, 13 Jul 2021 18:06:00 +0000 (UTC)
References: <20210604180945.9330-1-cfontana@suse.de>
 <20210604180945.9330-2-cfontana@suse.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v1 1/2] tests/acceptance: move pkg extraction to
 avocado_qemu/
In-reply-to: <20210604180945.9330-2-cfontana@suse.de>
Date: Tue, 13 Jul 2021 14:05:59 -0400
Message-ID: <87sg0iytq0.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana writes:

> currently these utility functions are present only in boot_linux_console.py,
> but they are useful in general, not just for linux.
>
> In order to reuse them for a firmware test with OVMF, make these functions
> general utility functions inside avocado_qemu/ , from where we will
> punctually import them.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  tests/acceptance/avocado_qemu/__init__.py |  38 ++++++++
>  tests/acceptance/boot_linux_console.py    | 104 +++++++---------------
>  tests/acceptance/boot_xen.py              |   7 +-
>  tests/acceptance/replay_kernel.py         |  23 ++---
>  tests/acceptance/tcg_plugins.py           |   5 +-
>  5 files changed, 91 insertions(+), 86 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 83b1741ec8..f625eb1ab7 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -21,6 +21,7 @@
>  from avocado.utils import datadrainer
>  from avocado.utils import network
>  from avocado.utils import vmimage
> +from avocado.utils import process

It's also missing:

   from avocado.utils import archive

Because it's used...

>  from avocado.utils.path import find_command
>  
>  
> @@ -140,6 +141,43 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
>      """
>      _console_interaction(test, success_message, failure_message, None, vm=vm)
>  
> +def extract_from_deb(test, deb, path):
> +    """
> +    Extracts a file from a deb package into the test workdir
> +
> +    :param deb: path to the deb archive
> +    :param path: path within the deb archive of the file to be extracted
> +    :returns: path of the extracted file
> +    """
> +    cwd = os.getcwd()
> +    os.chdir(test.workdir)
> +    file_path = process.run("ar t %s" % deb).stdout_text.split()[2]
> +    process.run("ar x %s %s" % (deb, file_path))
> +    archive.extract(file_path, test.workdir)

... here.

Also there are some missing changes for other tests using
extract_from_(deb|rpm), such as:

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 55ce7a5870..1caea29d27 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -92,7 +92,7 @@ def test_mips_malta(self):
                    'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
         deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = extract_from_deb(deb_path,
+        kernel_path = extract_from_deb(self, deb_path,
                                        '/boot/vmlinux-2.6.32-5-4kc-malta')
 
         self.vm.set_console()

I've seen the same or similar problems for other tests:

   tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips_malta: ERROR: extract_from_deb() missing 1 required positional argument: 'path' (0.03 s)
   tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_malta: ERROR: extract_from_deb() missing 1 required positional argument: 'path' (0.03 s)
   tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e: ERROR: extract_from_deb() missing 1 required positional argument: 'path' (0.03 s)
   tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips_malta_cpio: ERROR: extract_from_deb() missing 1 required positional argument: 'path' (0.03 s)
   tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd:
   ERROR: 'BootLinuxConsole' object has no attribute 'extract_from_deb'
   (0.03 s)


Having said that, since Avocado 89.0[1] there is a new API[2] that
should be able to handle both deb and rpm extractions.

I'll try to post a suggestion based on that API here... unless you beat
me to it. :)

Thanks,
- Cleber.

[1] - https://avocado-framework.readthedocs.io/en/89.0/releases/89_0.html#utility-apis
[2] - https://avocado-framework.readthedocs.io/en/89.0/api/utils/avocado.utils.software_manager.html#avocado.utils.software_manager.SoftwareManager.extract_from_package


