Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C6A2535
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 20:29:27 +0200 (CEST)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3PAi-0005v6-F4
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 14:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i3P9T-0005MZ-Iu
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 14:28:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i3P9N-0006zC-Ca
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 14:28:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52546)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i3P9N-0006xI-4i
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 14:28:01 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E956C89AC4
 for <qemu-devel@nongnu.org>; Thu, 29 Aug 2019 18:27:58 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id w11so2518794wru.17
 for <qemu-devel@nongnu.org>; Thu, 29 Aug 2019 11:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dLbqMQT4VGtBHhcY6djUV9rrwjoSCLY8udMo4z905lc=;
 b=Ps5oiZSNs59GAikAMemy3NPTKZ9PEWYHST33O7XWz1iBlE3S5y6hm0Sit5tNhIkN+J
 vEt2B7+UiYzsy2/iLJBZ4SnGO379BUUmObis7xFwNxhUrqyDa9cO/o8x7E8Kfoq9Vz9m
 0Ye5Zhf/rUESILA7oWcpixIfWdOa3CFWbveX7jDtdBErqZgudNBewDzLpXFlKssvjif4
 YTQE9bfNDJXKNwqc2B/abFCVd+q4x+u454ALD164StYPLLywTaje2QKmWdfBMW3uhc/4
 3F4xIiCVvHMTR6OjcTwVklUcyJ3aYdAt82boejFNe1sRsmY2j7Tl7c2J015Ml0p/RfLs
 6IFA==
X-Gm-Message-State: APjAAAVZhW5rzD1EIkn7gpi2Oz40qeLj4l0nrrkfwpqZSdg+BsiC5qu4
 Fr408y3YctsMEDGDRqLuvGakUiaL5pqPmSbAH4aqFdGlsI2m7vNwWuobfcq1d4yF0NpFV7OcEsQ
 5OkgbUj68F5nomUg=
X-Received: by 2002:a7b:c935:: with SMTP id h21mr12777065wml.35.1567103277046; 
 Thu, 29 Aug 2019 11:27:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx67Shxy6QXSku8wS3aZB65tM/xZ55JqmBGUyv9RxvNiQU0nUdxXJjhbWEncQItQn/L9lGk3Q==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr12777026wml.35.1567103276668; 
 Thu, 29 Aug 2019 11:27:56 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id g65sm6030697wma.21.2019.08.29.11.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 11:27:55 -0700 (PDT)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20190820235243.26092-1-jsnow@redhat.com>
 <20190820235243.26092-2-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <5c7555f2-fba0-29fc-8bcd-bc68e5b42c63@redhat.com>
Date: Thu, 29 Aug 2019 20:27:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190820235243.26092-2-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 1/4] iotests: add script_initialize
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/19 1:52 AM, John Snow wrote:
> Like script_main, but doesn't require a single point of entry.
> Replace all existing initialization sections with this drop-in replacement.
> 
> This brings debug support to all existing script-style iotests.
> 
> Note: supported_oses=['linux'] was omitted, as it is a default argument.
> ---
>  tests/qemu-iotests/149        |  3 +-
>  tests/qemu-iotests/194        |  3 +-
>  tests/qemu-iotests/202        |  3 +-
>  tests/qemu-iotests/203        |  3 +-
>  tests/qemu-iotests/206        |  2 +-
>  tests/qemu-iotests/207        |  2 +-
>  tests/qemu-iotests/208        |  2 +-
>  tests/qemu-iotests/209        |  2 +-
>  tests/qemu-iotests/210        |  2 +-
>  tests/qemu-iotests/211        |  2 +-
>  tests/qemu-iotests/212        |  2 +-
>  tests/qemu-iotests/213        |  2 +-
>  tests/qemu-iotests/216        |  3 +-
>  tests/qemu-iotests/218        |  2 +-
>  tests/qemu-iotests/219        |  2 +-
>  tests/qemu-iotests/222        |  5 ++-
>  tests/qemu-iotests/224        |  3 +-
>  tests/qemu-iotests/228        |  3 +-
>  tests/qemu-iotests/234        |  3 +-
>  tests/qemu-iotests/235        |  4 +--
>  tests/qemu-iotests/236        |  2 +-
>  tests/qemu-iotests/237        |  2 +-
>  tests/qemu-iotests/238        |  2 ++
>  tests/qemu-iotests/242        |  2 +-
>  tests/qemu-iotests/246        |  2 +-
>  tests/qemu-iotests/248        |  2 +-
>  tests/qemu-iotests/254        |  2 +-
>  tests/qemu-iotests/255        |  2 +-
>  tests/qemu-iotests/256        |  2 +-
>  tests/qemu-iotests/262        |  3 +-
>  tests/qemu-iotests/iotests.py | 58 +++++++++++++++++++++++------------
>  31 files changed, 71 insertions(+), 61 deletions(-)
> 
> diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
> index 4f363f295f..9fa97966c5 100755
> --- a/tests/qemu-iotests/149
> +++ b/tests/qemu-iotests/149
> @@ -383,8 +383,7 @@ def test_once(config, qemu_img=False):
>  
>  
>  # Obviously we only work with the luks image format
> -iotests.verify_image_format(supported_fmts=['luks'])
> -iotests.verify_platform()
> +iotests.script_initialize(supported_fmts=['luks'])
>  
>  # We need sudo in order to run cryptsetup to create
>  # dm-crypt devices. This is safe to use on any
> diff --git a/tests/qemu-iotests/194 b/tests/qemu-iotests/194
> index d746ab1e21..c8aeb6d0e4 100755
> --- a/tests/qemu-iotests/194
> +++ b/tests/qemu-iotests/194
> @@ -21,8 +21,7 @@
>  
>  import iotests
>  
> -iotests.verify_image_format(supported_fmts=['qcow2', 'qed', 'raw'])
> -iotests.verify_platform(['linux'])
> +iotests.script_initialize(supported_fmts=['qcow2', 'qed', 'raw'])
>  
>  with iotests.FilePath('source.img') as source_img_path, \
>       iotests.FilePath('dest.img') as dest_img_path, \
> diff --git a/tests/qemu-iotests/202 b/tests/qemu-iotests/202
> index 581ca34d79..1271ac9459 100755
> --- a/tests/qemu-iotests/202
> +++ b/tests/qemu-iotests/202
> @@ -24,8 +24,7 @@
>  
>  import iotests
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> -iotests.verify_platform(['linux'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  with iotests.FilePath('disk0.img') as disk0_img_path, \
>       iotests.FilePath('disk1.img') as disk1_img_path, \
> diff --git a/tests/qemu-iotests/203 b/tests/qemu-iotests/203
> index 4874a1a0d8..c40fe231ea 100755
> --- a/tests/qemu-iotests/203
> +++ b/tests/qemu-iotests/203
> @@ -24,8 +24,7 @@
>  
>  import iotests
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> -iotests.verify_platform(['linux'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  with iotests.FilePath('disk0.img') as disk0_img_path, \
>       iotests.FilePath('disk1.img') as disk1_img_path, \
> diff --git a/tests/qemu-iotests/206 b/tests/qemu-iotests/206
> index 5bb738bf23..23ff2f624b 100755
> --- a/tests/qemu-iotests/206
> +++ b/tests/qemu-iotests/206
> @@ -23,7 +23,7 @@
>  import iotests
>  from iotests import imgfmt
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  def blockdev_create(vm, options):
>      result = vm.qmp_log('blockdev-create',
> diff --git a/tests/qemu-iotests/207 b/tests/qemu-iotests/207
> index ec8c1d06f0..ab9e3b6747 100755
> --- a/tests/qemu-iotests/207
> +++ b/tests/qemu-iotests/207
> @@ -24,7 +24,7 @@ import iotests
>  import subprocess
>  import re
>  
> -iotests.verify_image_format(supported_fmts=['raw'])
> +iotests.script_initialize(supported_fmts=['raw'])
>  iotests.verify_protocol(supported=['ssh'])
>  
>  def filter_hash(qmsg):
> diff --git a/tests/qemu-iotests/208 b/tests/qemu-iotests/208
> index 1e202388dc..dfce6f9fe4 100755
> --- a/tests/qemu-iotests/208
> +++ b/tests/qemu-iotests/208
> @@ -22,7 +22,7 @@
>  
>  import iotests
>  
> -iotests.verify_image_format(supported_fmts=['generic'])
> +iotests.script_initialize(supported_fmts=['generic'])
>  
>  with iotests.FilePath('disk.img') as disk_img_path, \
>       iotests.FilePath('disk-snapshot.img') as disk_snapshot_img_path, \
> diff --git a/tests/qemu-iotests/209 b/tests/qemu-iotests/209
> index 259e991ec6..a77f884166 100755
> --- a/tests/qemu-iotests/209
> +++ b/tests/qemu-iotests/209
> @@ -22,7 +22,7 @@ import iotests
>  from iotests import qemu_img_create, qemu_io, qemu_img_verbose, qemu_nbd, \
>                      file_path
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  disk, nbd_sock = file_path('disk', 'nbd-sock')
>  nbd_uri = 'nbd+unix:///exp?socket=' + nbd_sock
> diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
> index 565e3b7b9b..5a7013cd34 100755
> --- a/tests/qemu-iotests/210
> +++ b/tests/qemu-iotests/210
> @@ -23,7 +23,7 @@
>  import iotests
>  from iotests import imgfmt
>  
> -iotests.verify_image_format(supported_fmts=['luks'])
> +iotests.script_initialize(supported_fmts=['luks'])
>  iotests.verify_protocol(supported=['file'])
>  
>  def blockdev_create(vm, options):
> diff --git a/tests/qemu-iotests/211 b/tests/qemu-iotests/211
> index 6afc894f76..4d6aac497f 100755
> --- a/tests/qemu-iotests/211
> +++ b/tests/qemu-iotests/211
> @@ -23,7 +23,7 @@
>  import iotests
>  from iotests import imgfmt
>  
> -iotests.verify_image_format(supported_fmts=['vdi'])
> +iotests.script_initialize(supported_fmts=['vdi'])
>  iotests.verify_protocol(supported=['file'])
>  
>  def blockdev_create(vm, options):
> diff --git a/tests/qemu-iotests/212 b/tests/qemu-iotests/212
> index 42b74f208b..ec35bceb11 100755
> --- a/tests/qemu-iotests/212
> +++ b/tests/qemu-iotests/212
> @@ -23,7 +23,7 @@
>  import iotests
>  from iotests import imgfmt
>  
> -iotests.verify_image_format(supported_fmts=['parallels'])
> +iotests.script_initialize(supported_fmts=['parallels'])
>  iotests.verify_protocol(supported=['file'])
>  
>  def blockdev_create(vm, options):
> diff --git a/tests/qemu-iotests/213 b/tests/qemu-iotests/213
> index 5604f3cebb..3d2c024375 100755
> --- a/tests/qemu-iotests/213
> +++ b/tests/qemu-iotests/213
> @@ -23,7 +23,7 @@
>  import iotests
>  from iotests import imgfmt
>  
> -iotests.verify_image_format(supported_fmts=['vhdx'])
> +iotests.script_initialize(supported_fmts=['vhdx'])
>  iotests.verify_protocol(supported=['file'])
>  
>  def blockdev_create(vm, options):
> diff --git a/tests/qemu-iotests/216 b/tests/qemu-iotests/216
> index 3c0ae54b44..7574bcc09f 100755
> --- a/tests/qemu-iotests/216
> +++ b/tests/qemu-iotests/216
> @@ -23,8 +23,7 @@ import iotests
>  from iotests import log, qemu_img, qemu_io_silent
>  
>  # Need backing file support
> -iotests.verify_image_format(supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk'])
> -iotests.verify_platform(['linux'])
> +iotests.script_initialize(supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk'])
>  
>  log('')
>  log('=== Copy-on-read across nodes ===')
> diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
> index 2554d84581..e18e31076b 100755
> --- a/tests/qemu-iotests/218
> +++ b/tests/qemu-iotests/218
> @@ -29,7 +29,7 @@
>  import iotests
>  from iotests import log, qemu_img, qemu_io_silent
>  
> -iotests.verify_image_format(supported_fmts=['qcow2', 'raw'])
> +iotests.script_initialize(supported_fmts=['qcow2', 'raw'])
>  
>  
>  # Launches the VM, adds two null-co nodes (source and target), and
> diff --git a/tests/qemu-iotests/219 b/tests/qemu-iotests/219
> index e0c51662c0..9ae27cb04e 100755
> --- a/tests/qemu-iotests/219
> +++ b/tests/qemu-iotests/219
> @@ -21,7 +21,7 @@
>  
>  import iotests
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  img_size = 4 * 1024 * 1024
>  
> diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
> index 0ead56d574..6788979ed3 100644
> --- a/tests/qemu-iotests/222
> +++ b/tests/qemu-iotests/222
> @@ -24,9 +24,8 @@
>  import iotests
>  from iotests import log, qemu_img, qemu_io, qemu_io_silent
>  
> -iotests.verify_platform(['linux'])
> -iotests.verify_image_format(supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk',
> -                                            'vhdx', 'raw'])
> +iotests.script_initialize(supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk',
> +                                          'vhdx', 'raw'])
>  
>  patterns = [("0x5d", "0",         "64k"),
>              ("0xd5", "1M",        "64k"),
> diff --git a/tests/qemu-iotests/224 b/tests/qemu-iotests/224
> index b4dfaa639f..d0d0c44104 100755
> --- a/tests/qemu-iotests/224
> +++ b/tests/qemu-iotests/224
> @@ -26,8 +26,7 @@ from iotests import log, qemu_img, qemu_io_silent, filter_qmp_testfiles, \
>  import json
>  
>  # Need backing file support (for arbitrary backing formats)
> -iotests.verify_image_format(supported_fmts=['qcow2', 'qcow', 'qed'])
> -iotests.verify_platform(['linux'])
> +iotests.script_initialize(supported_fmts=['qcow2', 'qcow', 'qed'])
>  
>  
>  # There are two variations of this test:
> diff --git a/tests/qemu-iotests/228 b/tests/qemu-iotests/228
> index 9a50afd205..9785868ab3 100755
> --- a/tests/qemu-iotests/228
> +++ b/tests/qemu-iotests/228
> @@ -25,8 +25,7 @@ from iotests import log, qemu_img, filter_testfiles, filter_imgfmt, \
>          filter_qmp_testfiles, filter_qmp_imgfmt
>  
>  # Need backing file and change-backing-file support
> -iotests.verify_image_format(supported_fmts=['qcow2', 'qed'])
> -iotests.verify_platform(['linux'])
> +iotests.script_initialize(supported_fmts=['qcow2', 'qed'])
>  
>  
>  def log_node_info(node):
> diff --git a/tests/qemu-iotests/234 b/tests/qemu-iotests/234
> index 34c818c485..3de6ab2341 100755
> --- a/tests/qemu-iotests/234
> +++ b/tests/qemu-iotests/234
> @@ -23,8 +23,7 @@
>  import iotests
>  import os
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> -iotests.verify_platform(['linux'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  with iotests.FilePath('img') as img_path, \
>       iotests.FilePath('backing') as backing_path, \
> diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
> index fedd111fd4..9e88c65b93 100755
> --- a/tests/qemu-iotests/235
> +++ b/tests/qemu-iotests/235
> @@ -27,6 +27,8 @@ sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
>  
>  from qemu.machine import QEMUMachine
>  
> +iotests.script_initialize(supported_fmts=['qcow2'])
> +
>  # Note:
>  # This test was added to check that mirror dead-lock was fixed (see previous
>  # commit before this test addition).
> @@ -40,8 +42,6 @@ from qemu.machine import QEMUMachine
>  
>  size = 1 * 1024 * 1024 * 1024
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> -
>  disk = file_path('disk')
>  
>  # prepare source image
> diff --git a/tests/qemu-iotests/236 b/tests/qemu-iotests/236
> index 79a6381f8e..b88779eb0b 100755
> --- a/tests/qemu-iotests/236
> +++ b/tests/qemu-iotests/236
> @@ -22,7 +22,7 @@
>  import iotests
>  from iotests import log
>  
> -iotests.verify_image_format(supported_fmts=['generic'])
> +iotests.script_initialize(supported_fmts=['generic'])
>  size = 64 * 1024 * 1024
>  granularity = 64 * 1024
>  
> diff --git a/tests/qemu-iotests/237 b/tests/qemu-iotests/237
> index 06897f8c87..3758ace0bc 100755
> --- a/tests/qemu-iotests/237
> +++ b/tests/qemu-iotests/237
> @@ -24,7 +24,7 @@ import math
>  import iotests
>  from iotests import imgfmt
>  
> -iotests.verify_image_format(supported_fmts=['vmdk'])
> +iotests.script_initialize(supported_fmts=['vmdk'])
>  
>  def blockdev_create(vm, options):
>      result = vm.qmp_log('blockdev-create', job_id='job0', options=options,
> diff --git a/tests/qemu-iotests/238 b/tests/qemu-iotests/238
> index e5ac2b2ff8..6e27fb40c2 100755
> --- a/tests/qemu-iotests/238
> +++ b/tests/qemu-iotests/238
> @@ -23,6 +23,8 @@ import os
>  import iotests
>  from iotests import log
>  
> +iotests.script_initialize()


This restrict test 208 to the Linux platform, is this OK?

The rest looks good.

> +
>  virtio_scsi_device = iotests.get_virtio_scsi_device()
>  
>  vm = iotests.VM()
> diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
> index c176e92da6..7c2685b4cc 100755
> --- a/tests/qemu-iotests/242
> +++ b/tests/qemu-iotests/242
> @@ -24,7 +24,7 @@ import struct
>  from iotests import qemu_img_create, qemu_io, qemu_img_pipe, \
>      file_path, img_info_log, log, filter_qemu_io
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  disk = file_path('disk')
>  chunk = 256 * 1024
> diff --git a/tests/qemu-iotests/246 b/tests/qemu-iotests/246
> index b0997a392f..1d7747d62d 100755
> --- a/tests/qemu-iotests/246
> +++ b/tests/qemu-iotests/246
> @@ -22,7 +22,7 @@
>  import iotests
>  from iotests import log
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  size = 64 * 1024 * 1024 * 1024
>  gran_small = 32 * 1024
>  gran_large = 128 * 1024
> diff --git a/tests/qemu-iotests/248 b/tests/qemu-iotests/248
> index f26b4bb2aa..781b21b227 100755
> --- a/tests/qemu-iotests/248
> +++ b/tests/qemu-iotests/248
> @@ -21,7 +21,7 @@
>  import iotests
>  from iotests import qemu_img_create, qemu_io, file_path, filter_qmp_testfiles
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  source, target = file_path('source', 'target')
>  size = 5 * 1024 * 1024
> diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
> index 09584f3f7d..43b40f4f71 100755
> --- a/tests/qemu-iotests/254
> +++ b/tests/qemu-iotests/254
> @@ -21,7 +21,7 @@
>  import iotests
>  from iotests import qemu_img_create, file_path, log
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  disk, top = file_path('disk', 'top')
>  size = 1024 * 1024
> diff --git a/tests/qemu-iotests/255 b/tests/qemu-iotests/255
> index 3632d507d0..ff16402268 100755
> --- a/tests/qemu-iotests/255
> +++ b/tests/qemu-iotests/255
> @@ -23,7 +23,7 @@
>  import iotests
>  from iotests import imgfmt
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  def blockdev_create(vm, options):
>      result = vm.qmp_log('blockdev-create',
> diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
> index c594a43205..d2f9212e5a 100755
> --- a/tests/qemu-iotests/256
> +++ b/tests/qemu-iotests/256
> @@ -23,7 +23,7 @@ import os
>  import iotests
>  from iotests import log
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  size = 64 * 1024 * 1024
>  
>  with iotests.FilePath('img0') as img0_path, \
> diff --git a/tests/qemu-iotests/262 b/tests/qemu-iotests/262
> index 398f63587e..f0e9d0f8ac 100755
> --- a/tests/qemu-iotests/262
> +++ b/tests/qemu-iotests/262
> @@ -23,8 +23,7 @@
>  import iotests
>  import os
>  
> -iotests.verify_image_format(supported_fmts=['qcow2'])
> -iotests.verify_platform(['linux'])
> +iotests.script_initialize(supported_fmts=['qcow2'])
>  
>  with iotests.FilePath('img') as img_path, \
>       iotests.FilePath('mig_fifo') as fifo, \
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 84438e837c..2970d7304a 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -895,7 +895,20 @@ def skip_if_unsupported(required_formats=[], read_only=False):
>          return func_wrapper
>      return skip_test_decorator
>  
> -def execute_unittest(output, verbosity, debug):
> +def execute_unittest(debug=False):
> +    """Executes unittests within the calling module."""
> +
> +    verbosity = 2 if debug else 1
> +
> +    if debug:
> +        output = sys.stdout
> +    elif sys.version_info.major >= 3:
> +        output = io.StringIO()
> +    else:
> +        # io.StringIO is for unicode strings, which is not what
> +        # 2.x's test runner emits.
> +        output = io.BytesIO()
> +
>      runner = unittest.TextTestRunner(stream=output, descriptions=True,
>                                       verbosity=verbosity)
>      try:
> @@ -903,14 +916,19 @@ def execute_unittest(output, verbosity, debug):
>          # exception
>          unittest.main(testRunner=runner)
>      finally:
> +        # We need to filter out the time taken from the output so that
> +        # qemu-iotest can reliably diff the results against master output.
>          if not debug:
>              sys.stderr.write(re.sub(r'Ran (\d+) tests? in [\d.]+s',
>                                      r'Ran \1 tests', output.getvalue()))
>  
> -def execute_test(test_function=None,
> -                 supported_fmts=[], supported_oses=['linux'],
> -                 supported_cache_modes=[], unsupported_fmts=[]):
> -    """Run either unittest or script-style tests."""
> +def execute_setup_common(supported_fmts=[],
> +                         supported_oses=['linux'],
> +                         supported_cache_modes=[],
> +                         unsupported_fmts=[]):
> +    """
> +    Perform necessary setup for either script-style or unittest-style tests.
> +    """
>  
>      # We are using TEST_DIR and QEMU_DEFAULT_MACHINE as proxies to
>      # indicate that we're not being run via "check". There may be
> @@ -920,37 +938,37 @@ def execute_test(test_function=None,
>          sys.stderr.write('Please run this test via the "check" script\n')
>          sys.exit(os.EX_USAGE)
>  
> -    debug = '-d' in sys.argv
> -    verbosity = 1
>      verify_image_format(supported_fmts, unsupported_fmts)
>      verify_platform(supported_oses)
>      verify_cache_mode(supported_cache_modes)
>  
> +    debug = '-d' in sys.argv
>      if debug:
> -        output = sys.stdout
> -        verbosity = 2
>          sys.argv.remove('-d')
> -    else:
> -        # We need to filter out the time taken from the output so that
> -        # qemu-iotest can reliably diff the results against master output.
> -        if sys.version_info.major >= 3:
> -            output = io.StringIO()
> -        else:
> -            # io.StringIO is for unicode strings, which is not what
> -            # 2.x's test runner emits.
> -            output = io.BytesIO()
> -
>      logging.basicConfig(level=(logging.DEBUG if debug else logging.WARN))
>  
> +    return debug
> +
> +def execute_test(test_function=None, *args, **kwargs):
> +    """Run either unittest or script-style tests."""
> +
> +    debug = execute_setup_common(*args, **kwargs)
>      if not test_function:
> -        execute_unittest(output, verbosity, debug)
> +        execute_unittest(debug)
>      else:
>          test_function()
>  
> +# This is called from script-style iotests without a single point of entry
> +def script_initialize(*args, **kwargs):
> +    """Initialize script-style tests without running any tests."""
> +    execute_setup_common(*args, **kwargs)
> +
> +# This is called from script-style iotests with a single point of entry
>  def script_main(test_function, *args, **kwargs):
>      """Run script-style tests outside of the unittest framework"""
>      execute_test(test_function, *args, **kwargs)
>  
> +# This is called from unittest style iotests
>  def main(*args, **kwargs):
>      """Run tests using the unittest framework"""
>      execute_test(None, *args, **kwargs)
> 

