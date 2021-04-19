Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56A364720
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:28:24 +0200 (CEST)
Received: from localhost ([::1]:33412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVp1-0002iW-Ts
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYVmu-0000U9-RB
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYVmr-00069U-Ba
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618845968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OdwDyJFft2Qjb9mlqyGleCwSUx1B64FyymjwHVx3e8=;
 b=CHnc+pYi0b/KKW4hKT4IaOTdoKn7Zrf9DOL78YMXBNXFcErs8nEGsxelzLTGa27FQJvcCS
 GMygQHrZYIj22I3gKZphmJCVLB2i46348dTZ49c98T/1koJ5UBsBhaKHR66Se6wqGAjazu
 wNU97vMRRRisHq2Vut7XSgAgE/FanDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-Qp-MVoVBM7O2gvrHRF273g-1; Mon, 19 Apr 2021 11:25:59 -0400
X-MC-Unique: Qp-MVoVBM7O2gvrHRF273g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F9918189DB;
 Mon, 19 Apr 2021 15:25:58 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-102.gru2.redhat.com
 [10.97.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9D241002EE6;
 Mon, 19 Apr 2021 15:25:47 +0000 (UTC)
Subject: Re: [PATCH 2/3] Acceptance Tests: move definition of distro checksums
 to the framework
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210414221457.1653745-1-crosa@redhat.com>
 <20210414221457.1653745-3-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <bc2b4167-4f4a-3c21-0283-3bf8b32a63b2@redhat.com>
Date: Mon, 19 Apr 2021 12:25:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210414221457.1653745-3-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 4/14/21 7:14 PM, Cleber Rosa wrote:
> Instead of having, by default, the checksum in the tests, and the
> definition of tests in the framework, let's keep them together.
>
> A central definition for distributions is available, and it should
> allow other known distros to be added more easily.
>
> No behavior change is expected here, and tests can still define
> a distro_checksum value if for some reason they want to override
> the known distribution information.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 34 +++++++++++++++++++++--
>   tests/acceptance/boot_linux.py            |  8 ------
>   2 files changed, 32 insertions(+), 10 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index aae1e5bbc9..97093614d9 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -299,6 +299,30 @@ def ssh_command(self, command):
>           return stdout_lines, stderr_lines
>   
>   
> +#: A collection of known distros and their respective image checksum
> +KNOWN_DISTROS = {

Do you plan to expand that mapping to record values other than 
checksums? Otherwise it could be named KNOWN_DISTROS_CHECKSUMS.

> +    'fedora': {
> +        '31': {
> +            'x86_64':
> +            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
> +            'aarch64':
> +            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
> +            'ppc64':
> +            {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
> +            's390x':
> +            {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
> +            }
> +        }
> +    }
> +
> +
> +def get_known_distro_checksum(distro, distro_version, arch):
> +    try:
> +        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('checksum')
> +    except AttributeError:
> +        return None
> +
> +

Currently we have a few loose methods on avocado_qemu/__init__.py, and 
I'm about to send a series to wrap them in a mixin class. This series 
will introduce more loose code on the file; so would you consider moving 
KNOWN_DISTROS and get_known_distro_checksum() to the LinuxTest class, 
and possibly making the latest a class method?

>   class LinuxTest(Test, LinuxSSHMixIn):
>       """Facilitates having a cloud-image Linux based available.
>   
> @@ -348,14 +372,20 @@ def download_boot(self):
>           vmimage.QEMU_IMG = qemu_img
>   
>           self.log.info('Downloading/preparing boot image')
> +        distro = 'fedora'
> +        distro_version = '31'
> +        known_distro_checksum = get_known_distro_checksum(distro,
> +                                                          distro_version,
> +                                                          self.arch)
> +        distro_checksum = self.distro_checksum or known_distro_checksum


distro_checksum may be None. In this case vmimage.get() will silently 
skip the check? I suggest to log a warn message.


>           # Fedora 31 only provides ppc64le images
>           image_arch = self.arch
>           if image_arch == 'ppc64':
>               image_arch = 'ppc64le'
>           try:
>               boot = vmimage.get(
> -                'fedora', arch=image_arch, version='31',
> -                checksum=self.distro_checksum,
> +                distro, arch=image_arch, version=distro_version,
> +                checksum=distro_checksum,
>                   algorithm='sha256',
>                   cache_dir=self.cache_dirs[0],
>                   snapshot_dir=self.workdir)
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> index c7bc3a589e..9e618c6daa 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -20,8 +20,6 @@ class BootLinuxX8664(LinuxTest):
>       :avocado: tags=arch:x86_64
>       """
>   
> -    distro_checksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
> -
>       def test_pc_i440fx_tcg(self):
>           """
>           :avocado: tags=machine:pc
> @@ -66,8 +64,6 @@ class BootLinuxAarch64(LinuxTest):
>       :avocado: tags=machine:gic-version=2
>       """
>   
> -    distro_checksum = '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'
> -
>       def add_common_args(self):
>           self.vm.add_args('-bios',
>                            os.path.join(BUILD_DIR, 'pc-bios',
> @@ -119,8 +115,6 @@ class BootLinuxPPC64(LinuxTest):
>       :avocado: tags=arch:ppc64
>       """
>   
> -    distro_checksum = '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'
> -
>       def test_pseries_tcg(self):
>           """
>           :avocado: tags=machine:pseries
> @@ -136,8 +130,6 @@ class BootLinuxS390X(LinuxTest):
>       :avocado: tags=arch:s390x
>       """
>   
> -    distro_checksum = '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'
> -
>       @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>       def test_s390_ccw_virtio_tcg(self):
>           """


