Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCBD1D49E1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 11:42:41 +0200 (CEST)
Received: from localhost ([::1]:39484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZWrY-0007GI-KR
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 05:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jZWqj-0006TD-Hj
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:41:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:33588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jZWqi-00030J-Jz
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:41:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 048E8B112;
 Fri, 15 May 2020 09:41:49 +0000 (UTC)
Subject: Re: [PATCH 2/2] tests/vm: Remove flex/bison packages
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200515083124.5536-1-philmd@redhat.com>
 <20200515083124.5536-3-philmd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <37196f3d-1251-6b6b-2bc8-741c8ec999ba@suse.de>
Date: Fri, 15 May 2020 11:41:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200515083124.5536-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:48:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/20 10:31 AM, Philippe Mathieu-Daudé wrote:
> QEMU does use flex/bison packages.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/vm/fedora      | 1 -
>  tests/vm/freebsd     | 1 -
>  tests/vm/netbsd      | 1 -
>  tests/vm/ubuntu.i386 | 2 +-
>  4 files changed, 1 insertion(+), 4 deletions(-)


Hi, does openbsd need a correction as well? Or is it needed there?

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 0b705f4945..13e7f9a6d5 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -35,7 +35,6 @@ class OpenBSDVM(basevm.BaseVM):
         "bash",
         "gmake",
         "gsed",
-        "bison",
 
         # libs: usb
         "libusb1",

Ciao,

Claudio


> 
> diff --git a/tests/vm/fedora b/tests/vm/fedora
> index bd9c6cf295..a9195670f4 100755
> --- a/tests/vm/fedora
> +++ b/tests/vm/fedora
> @@ -32,7 +32,6 @@ class FedoraVM(basevm.BaseVM):
>      pkgs = [
>          # tools
>          'git-core',
> -        'flex', 'bison',
>          'gcc', 'binutils', 'make',
>  
>          # perl
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 298967fe9c..f87db2b126 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -38,7 +38,6 @@ class FreeBSDVM(basevm.BaseVM):
>          "bash",
>          "gmake",
>          "gsed",
> -        "flex", "bison",
>  
>          # libs: crypto
>          "gnutls",
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index b10c9d429d..cdac502dad 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -36,7 +36,6 @@ class NetBSDVM(basevm.BaseVM):
>          "bash",
>          "gmake",
>          "gsed",
> -        "flex", "bison",
>  
>          # libs: crypto
>          "gnutls",
> diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
> index 1570775335..24527cc78c 100755
> --- a/tests/vm/ubuntu.i386
> +++ b/tests/vm/ubuntu.i386
> @@ -52,7 +52,7 @@ class UbuntuX86VM(basevm.BaseVM):
>          self.ssh_root_check("sed -ie s/^#\ deb-src/deb-src/g /etc/apt/sources.list")
>          self.ssh_root_check("apt-get update")
>          self.ssh_root_check("apt-get build-dep -y qemu")
> -        self.ssh_root_check("apt-get install -y libfdt-dev flex bison language-pack-en")
> +        self.ssh_root_check("apt-get install -y libfdt-dev language-pack-en")
>          self.ssh_root("poweroff")
>          self.wait()
>          os.rename(img_tmp, img)
> 


