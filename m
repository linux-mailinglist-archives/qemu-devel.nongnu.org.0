Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7650364716
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:27:01 +0200 (CEST)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVng-0000ia-TF
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lYVlY-00079O-R0
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lYVlO-0005IE-Ia
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618845875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9K3h/GTugAx8CghYlFwHClFPBHN2GnzYbaIthaFvjs=;
 b=HnHmIDSsllU/7FgkzffOx8eHLaaLoQP0Fzj1GEfegJ8DXIIVtiMiYFvj9Q2dHpblyFViqp
 doGrEF3fZOekk+uOvb4mGdTnht5eFIUFerap4BvOL9lcsXxLIV8OXgONliYp1mSzAp4zZO
 PyW4dDgI5X9OOLhnGjeF9hH3Enx5+Gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-YYRKeG-MMMa74ep2qG6_7w-1; Mon, 19 Apr 2021 11:24:32 -0400
X-MC-Unique: YYRKeG-MMMa74ep2qG6_7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFBEC1006C80;
 Mon, 19 Apr 2021 15:24:31 +0000 (UTC)
Received: from [10.36.113.132] (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F345060C5C;
 Mon, 19 Apr 2021 15:24:24 +0000 (UTC)
Subject: Re: [PATCH 1/3] Acceptance Tests: rename attribute holding the distro
 image checksum
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210414221457.1653745-1-crosa@redhat.com>
 <20210414221457.1653745-2-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7ba40366-d242-444e-3378-6b5acf06fcea@redhat.com>
Date: Mon, 19 Apr 2021 17:24:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210414221457.1653745-2-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 4/15/21 12:14 AM, Cleber Rosa wrote:
> This renames the attribute that holds the checksum for the image Linux
> distribution image used.
> 
> The current name of the attribute is not very descriptive.  Also, in
> preparation for making the distribution used configurable, which will
user configurable
> add distro related parameters, attributes and tags, let's make the
> naming of those more uniform.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  tests/acceptance/avocado_qemu/__init__.py | 4 ++--
>  tests/acceptance/boot_linux.py            | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 1062a851b9..aae1e5bbc9 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -307,7 +307,7 @@ class LinuxTest(Test, LinuxSSHMixIn):
>      """
>  
>      timeout = 900
> -    chksum = None
> +    distro_checksum = None
>      username = 'root'
>      password = 'password'
>  
> @@ -355,7 +355,7 @@ def download_boot(self):
>          try:
>              boot = vmimage.get(
>                  'fedora', arch=image_arch, version='31',
> -                checksum=self.chksum,
> +                checksum=self.distro_checksum,
>                  algorithm='sha256',
>                  cache_dir=self.cache_dirs[0],
>                  snapshot_dir=self.workdir)
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> index 314370fd1f..c7bc3a589e 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -20,7 +20,7 @@ class BootLinuxX8664(LinuxTest):
>      :avocado: tags=arch:x86_64
>      """
>  
> -    chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
> +    distro_checksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
>  
>      def test_pc_i440fx_tcg(self):
>          """
> @@ -66,7 +66,7 @@ class BootLinuxAarch64(LinuxTest):
>      :avocado: tags=machine:gic-version=2
>      """
>  
> -    chksum = '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'
> +    distro_checksum = '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'
>  
>      def add_common_args(self):
>          self.vm.add_args('-bios',
> @@ -119,7 +119,7 @@ class BootLinuxPPC64(LinuxTest):
>      :avocado: tags=arch:ppc64
>      """
>  
> -    chksum = '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'
> +    distro_checksum = '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'
>  
>      def test_pseries_tcg(self):
>          """
> @@ -136,7 +136,7 @@ class BootLinuxS390X(LinuxTest):
>      :avocado: tags=arch:s390x
>      """
>  
> -    chksum = '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'
> +    distro_checksum = '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'
>  
>      @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>      def test_s390_ccw_virtio_tcg(self):
> 


