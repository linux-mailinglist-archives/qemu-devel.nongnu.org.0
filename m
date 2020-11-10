Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF952AD615
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:22:17 +0100 (CET)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSfA-0003xx-Iz
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcSdt-0003WI-QM
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:20:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcSds-0002Oi-4d
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605010855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wADnehut2sVY/Ry26jVxrF3oKOuCuo+bFQuHS18mmo=;
 b=ih10QWvosAhg1YAY7choVPU7MYe5ljRvXmBTGJfzHd5wwWxKSbFNdtw40xX2O+FdYcDUem
 1MC5EttEq6AvuPY3c+xLuEvj6ZfC6EYTvHXMLDBmvWuJmxj5q8F14/uuW4f+NbE/OhhLpx
 Y6DEXIJgTjy8bPfA/epytfCovKmTR6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-8oqGyUp5NzSOhdcAfLyQzw-1; Tue, 10 Nov 2020 07:20:51 -0500
X-MC-Unique: 8oqGyUp5NzSOhdcAfLyQzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39DAA1009E3E;
 Tue, 10 Nov 2020 12:20:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5F65CC26;
 Tue, 10 Nov 2020 12:20:40 +0000 (UTC)
Subject: Re: [PATCH-for-5.2 v3] tests/acceptance: Disable Spartan-3A DSP 1800A
 test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201109091719.2449141-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b673886d-b4f1-ba8a-e831-d548a2895ae1@redhat.com>
Date: Tue, 10 Nov 2020 13:20:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201109091719.2449141-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/2020 10.17, Philippe Mathieu-Daudé wrote:
> This test is regularly failing on CI:
> 
>    (05/34) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_microblaze_s3adsp1800:
>   Linux version 4.11.3 (thuth@thuth.remote.csb) (gcc version 6.4.0 (Buildroot 2018.05.2) ) #5 Tue Dec 11 11:56:23 CET 2018
>   ...
>   Freeing unused kernel memory: 1444K
>   This architecture does not have kernel memory protection.
>   [nothing happens here]
>   Runner error occurred: Timeout reached (90.91 s)
> 
> This is a regression. Until someone figure out the problem,
> disable the test to keep CI pipeline useful.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3: Simply disable with @skip
> ---
>  tests/acceptance/boot_linux_console.py | 2 ++
>  tests/acceptance/replay_kernel.py      | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 8f433a67f84..cc6ec0f8c15 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -13,6 +13,7 @@
>  import gzip
>  import shutil
>  
> +from avocado import skip
>  from avocado import skipUnless
>  from avocado_qemu import Test
>  from avocado_qemu import exec_command_and_wait_for_pattern
> @@ -1025,6 +1026,7 @@ def test_m68k_mcf5208evb(self):
>          tar_hash = 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
>          self.do_test_advcal_2018('07', tar_hash, 'sanity-clause.elf')
>  
> +    @skip("Test currently broken") # Console stuck as of 5.2-rc1
>      def test_microblaze_s3adsp1800(self):
>          """
>          :avocado: tags=arch:microblaze
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
> index 00c228382bd..772633b01da 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -14,6 +14,7 @@
>  import logging
>  import time
>  
> +from avocado import skip
>  from avocado import skipIf
>  from avocado import skipUnless
>  from avocado_qemu import wait_for_console_pattern
> @@ -280,6 +281,7 @@ def test_m68k_mcf5208evb(self):
>          file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
>          self.do_test_advcal_2018(file_path, 'sanity-clause.elf')
>  
> +    @skip("Test currently broken") # Console stuck as of 5.2-rc1
>      def test_microblaze_s3adsp1800(self):
>          """
>          :avocado: tags=arch:microblaze
> 

Acked-by: Thomas Huth <thuth@redhat.com>

FWIW, I tried to bisect this issue today to see where it broke, but if I run
the test often enough, I even got failures with QEMU v5.0 already, so it's
likely not a new issue after all:

make check-venv
for ((i=0;i<500;i++)); do echo $i ; \
 AVOCADO_ALLOW_UNTRUSTED_CODE=1 tests/venv/bin/avocado run \
 tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_microblaze_s3adsp1800 \
 || break ; sleep 0.1 ; \
done


