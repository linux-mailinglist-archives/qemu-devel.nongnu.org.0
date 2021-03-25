Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC884349AA7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:49:08 +0100 (CET)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVyd-00034d-RJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lPVvx-00026F-DG
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:46:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lPVvu-0002lE-EB
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616701577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZiETzeRmZ6dPsxszQsUp31pNWO3jyXaJU+lpJiLB84=;
 b=WgW7qiuH7CN5dL7I6HDzBaCRbU11BsI6ctG/3C0NVSnVnwToqNMJn4rpodNbWUh1tEgQ6h
 ugWovVUuINl+8yYpKyYqBshu67vrBgvsqy0Wd5ozmaKAJkqpTIkaeZKJpp1TERU0eXjN55
 MLWv6dr8Ayb8sstYxqET1CRakRMrnyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-KgWT7DNlP-ihaPt7b880DA-1; Thu, 25 Mar 2021 15:46:15 -0400
X-MC-Unique: KgWT7DNlP-ihaPt7b880DA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED54183DD20;
 Thu, 25 Mar 2021 19:46:13 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-73.gru2.redhat.com
 [10.97.116.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCAB160D11;
 Thu, 25 Mar 2021 19:45:54 +0000 (UTC)
Subject: Re: [PATCH v2 00/10] Acceptance Test: introduce base class for Linux
 based tests
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <05118984-4a12-6cc5-ab84-a3a4953b535c@redhat.com>
Date: Thu, 25 Mar 2021 16:45:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/23/21 7:15 PM, Cleber Rosa wrote:
> This introduces a base class for tests that need to interact with a
> Linux guest.  It generalizes the "boot_linux.py" code, already been
> used by the "virtiofs_submounts.py" and also SSH related code being
> used by that and "linux_ssh_mips_malta.py".

I ran the linux_ssh_mips_malta.py tests, they all passed:

(11/34) 
tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta32eb_kernel3_2_0: 
PASS (64.41 s)
(12/34) 
tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta32el_kernel3_2_0: 
PASS (63.43 s)
(13/34) 
tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta64eb_kernel3_2_0: 
PASS (63.76 s)
(14/34) 
tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta64el_kernel3_2_0: 
PASS (62.52 s)

Then I tried the virtiofs_submounts.py tests, it finishes with error. 
Something like that fixes it:

diff --git a/tests/acceptance/virtiofs_submounts.py 
b/tests/acceptance/virtiofs_submounts.py
index d77ee35674..21ad7d792e 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -195,7 +195,7 @@ def setUp(self):

          self.run(('ssh-keygen', '-N', '', '-t', 'ed25519', '-f', 
self.ssh_key))

-        pubkey = open(self.ssh_key + '.pub').read()
+        pubkey = self.ssh_key + '.pub'

          super(VirtiofsSubmountsTest, self).setUp(pubkey)


>
> While at it, a number of fixes on hopeful improvements to those tests
> were added.
>
> Changes from v1:
>
> * Majority of v1 patches have been merged.
>
> * New patches:
>    - Acceptance Tests: make username/password configurable
>    - Acceptance Tests: set up SSH connection by default after boot for LinuxTest
>    - tests/acceptance/virtiofs_submounts.py: remove launch_vm()
>
> * Allowed for the configuration of the network device type (defaulting
>    to virtio-net) [Phil]
>
> * Fix module name typo (s/qemu.util/qemu.utils/) in the commit message
>    [John]
>
> * Tests based on LinuxTest will have the SSH connection already prepared
>
> Cleber Rosa (10):
>    tests/acceptance/virtiofs_submounts.py: add missing accel tag
>    tests/acceptance/virtiofs_submounts.py: evaluate string not length
>    Python: add utility function for retrieving port redirection
>    Acceptance Tests: move useful ssh methods to base class
>    Acceptance Tests: add port redirection for ssh by default
>    Acceptance Tests: make username/password configurable
>    Acceptance Tests: set up SSH connection by default after boot for
>      LinuxTest
>    tests/acceptance/virtiofs_submounts.py: remove launch_vm()
>    Acceptance Tests: add basic documentation on LinuxTest base class
>    Acceptance Tests: introduce CPU hotplug test
>
>   docs/devel/testing.rst                    | 25 ++++++++
>   python/qemu/utils.py                      | 35 ++++++++++++
>   tests/acceptance/avocado_qemu/__init__.py | 63 +++++++++++++++++++--
>   tests/acceptance/hotplug_cpu.py           | 37 ++++++++++++
>   tests/acceptance/info_usernet.py          | 29 ++++++++++
>   tests/acceptance/linux_ssh_mips_malta.py  | 44 ++-------------
>   tests/acceptance/virtiofs_submounts.py    | 69 +++--------------------
>   tests/vm/basevm.py                        |  7 +--
>   8 files changed, 198 insertions(+), 111 deletions(-)
>   create mode 100644 python/qemu/utils.py
>   create mode 100644 tests/acceptance/hotplug_cpu.py
>   create mode 100644 tests/acceptance/info_usernet.py
>


