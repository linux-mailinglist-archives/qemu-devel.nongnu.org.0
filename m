Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58499F4D56
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 14:38:28 +0100 (CET)
Received: from localhost ([::1]:54472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT4T4-00063o-VL
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 08:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1iT4NR-0002ja-AW
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:32:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1iT4NP-0003Rm-8y
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:32:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21940
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1iT4NO-0003RU-8O
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573219953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29BeRyDV2RfpcJLm75DjnaethbjeAhfhqfiJFTYot2Q=;
 b=bEHrs2pQupresnyc/3OxPf6468HyYrjFyeBoO7XUfaqo2TdqF35koBe0+jXmRYdm5jTgCv
 vgxbQV/V8oic/P6wOenqYP6dJGRZ85yiLcvzhk1poWi7XPbwCy/pxn34cDsjzDHBmJzGGT
 RhRnRmOU0FusDpVVFcF9hqz7IP/jq3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-lfbWmeMnMceoV2Ml_vZx_w-1; Fri, 08 Nov 2019 08:32:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 072678017DE;
 Fri,  8 Nov 2019 13:32:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-3.gru2.redhat.com [10.97.116.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 957B460BE1;
 Fri,  8 Nov 2019 13:32:24 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] configure: Only decompress EDK2 blobs for X86/ARM
 targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>
References: <20191108114531.21518-1-philmd@redhat.com>
 <20191108114531.21518-2-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <729b2d17-20f2-a5ff-1775-f0982624c53b@redhat.com>
Date: Fri, 8 Nov 2019 11:32:21 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191108114531.21518-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: lfbWmeMnMceoV2Ml_vZx_w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/19 9:45 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> The EDK2 firmware blobs only target the X86/ARM architectures.
> Define the DECOMPRESS_EDK2_BLOBS variable and only decompress
> the blobs when the variable exists.
>
> Fixes: 536d2173b2b
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: new
> ---
>   Makefile  |  2 ++
>   configure | 13 +++++++++++++
>   2 files changed, 15 insertions(+)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

- Wainer


>
> diff --git a/Makefile b/Makefile
> index aa9d1a42aa..3430eca532 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -480,7 +480,9 @@ $(SOFTMMU_ALL_RULES): $(chardev-obj-y)
>   $(SOFTMMU_ALL_RULES): $(crypto-obj-y)
>   $(SOFTMMU_ALL_RULES): $(io-obj-y)
>   $(SOFTMMU_ALL_RULES): config-all-devices.mak
> +ifdef DECOMPRESS_EDK2_BLOBS
>   $(SOFTMMU_ALL_RULES): $(edk2-decompressed)
> +endif
>  =20
>   .PHONY: $(TARGET_DIRS_RULES)
>   # The $(TARGET_DIRS_RULES) are of the form SUBDIR/GOAL, so that
> diff --git a/configure b/configure
> index efe165edf9..9b322284c3 100755
> --- a/configure
> +++ b/configure
> @@ -427,6 +427,7 @@ softmmu=3D"yes"
>   linux_user=3D"no"
>   bsd_user=3D"no"
>   blobs=3D"yes"
> +edk2_blobs=3D"no"
>   pkgversion=3D""
>   pie=3D""
>   qom_cast_debug=3D"yes"
> @@ -2146,6 +2147,14 @@ case " $target_list " in
>     ;;
>   esac
>  =20
> +for target in $target_list; do
> +  case "$target" in
> +    arm-softmmu | aarch64-softmmu | i386-softmmu | x86_64-softmmu)
> +      edk2_blobs=3D"yes"
> +      ;;
> +  esac
> +done
> +
>   feature_not_found() {
>     feature=3D$1
>     remedy=3D$2
> @@ -7526,6 +7535,10 @@ if test "$libudev" !=3D "no"; then
>       echo "LIBUDEV_LIBS=3D$libudev_libs" >> $config_host_mak
>   fi
>  =20
> +if test "$edk2_blobs" =3D "yes" ; then
> +  echo "DECOMPRESS_EDK2_BLOBS=3Dy" >> $config_host_mak
> +fi
> +
>   # use included Linux headers
>   if test "$linux" =3D "yes" ; then
>     mkdir -p linux-headers


