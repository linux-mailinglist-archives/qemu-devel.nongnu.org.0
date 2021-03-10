Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456333387C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:16:16 +0100 (CET)
Received: from localhost ([::1]:37376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuwx-0003Tb-7h
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJuvo-0002jR-Dm
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJuvk-0006dS-BD
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615367698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQ6PnQ4wmpAkCwzsShd7+L9pHFFuFfKaNXG9MenDQMA=;
 b=Q567SAbADM3+dY9+SKOp/hZQJsYQfd6s02My3bKCr1qU2bmNI40GA+x038QCybr7K9eAgV
 zh9vqgz5pzXbcnZ0/uJQ7oloy0zvR0zEDprQQAeqv2wnCZGVqm5nR+rWy7twTTvcDwr1m2
 ZdSBdc1HvnJvI1qJIyijUGaAPSlkpn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-0ir5G6u9NHuUsSxQ5HUHnw-1; Wed, 10 Mar 2021 04:14:55 -0500
X-MC-Unique: 0ir5G6u9NHuUsSxQ5HUHnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FF941084C83;
 Wed, 10 Mar 2021 09:14:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46C896062F;
 Wed, 10 Mar 2021 09:14:46 +0000 (UTC)
Subject: Re: [PATCH v2] tests/acceptance: Add bFLT loader linux-user test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214194524.768660-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f3d3ab84-3008-b90c-1b9d-c282429496da@redhat.com>
Date: Wed, 10 Mar 2021 10:14:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210214194524.768660-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/02/2021 20.45, Philippe Mathieu-Daudé wrote:
> Add a very quick test that runs a busybox binary in bFLT format:
> 
>    $ avocado --show=app run -t linux_user tests/acceptance/load_bflt.py
>    JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
>    JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
>     (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
>    RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>    JOB TIME   : 0.54 s
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <20210214175912.732946-1-f4bug@amsat.org>
>    tests/acceptance: Extract QemuBaseTest from Test
>    tests/acceptance: Make pick_default_qemu_bin() more generic
>    tests/acceptance: Introduce QemuUserTest base class
> ---
>   tests/acceptance/load_bflt.py | 51 +++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
>   create mode 100644 tests/acceptance/load_bflt.py
> 
> diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.py
> new file mode 100644
> index 00000000000..4b7796d0775
> --- /dev/null
> +++ b/tests/acceptance/load_bflt.py
> @@ -0,0 +1,51 @@
> +# Test the bFLT format
> +#
> +# Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import bz2
> +import subprocess
> +
> +from avocado_qemu import QemuUserTest
> +
> +
> +class LoadBFLT(QemuUserTest):
> +
> +    def extract_cpio(self, cpio_path):
> +        """
> +        Extracts a cpio archive into the test workdir
> +
> +        :param cpio_path: path to the cpio archive
> +        """
> +        cwd = os.getcwd()
> +        os.chdir(self.workdir)
> +        with bz2.open(cpio_path, 'rb') as archive_cpio:
> +            subprocess.run(['cpio', '-i'], input=archive_cpio.read(),
> +                           stderr=subprocess.DEVNULL)
> +        os.chdir(cwd)
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')

Can we assume that cpio is always available? Otherwise this needs a 
skipUnless check for has_cmd('cpio' ...).

  Thomas


> +    def test_stm32(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=linux_user
> +        :avocado: tags=quick
> +        """
> +        # See https://elinux.org/STM32#User_Space
> +        rootfs_url = ('https://elinux.org/images/5/51/'
> +                      'Stm32_mini_rootfs.cpio.bz2')
> +        rootfs_hash = '9f065e6ba40cce7411ba757f924f30fcc57951e6'
> +        rootfs_path_bz2 = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
> +        busybox_path = self.workdir + "/bin/busybox"
> +
> +        self.extract_cpio(rootfs_path_bz2)
> +
> +        res = self.run(busybox_path)
> +        ver = 'BusyBox v1.24.0.git (2015-02-03 22:17:13 CET) multi-call binary.'
> +        self.assertIn(ver, res.stdout_text)
> +
> +        res = self.run(busybox_path, ['uname', '-a'])
> +        unm = 'armv7l GNU/Linux'
> +        self.assertIn(unm, res.stdout_text)
> 


