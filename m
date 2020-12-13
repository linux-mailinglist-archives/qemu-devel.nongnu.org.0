Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2CD2D8F37
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 19:04:58 +0100 (CET)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVjt-00073H-At
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 13:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVgv-00044W-8h; Sun, 13 Dec 2020 13:01:53 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:50761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVgt-0006Gc-Bf; Sun, 13 Dec 2020 13:01:52 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPrXf-1kS9Dk0CCx-00MvGu; Sun, 13 Dec 2020 19:01:47 +0100
Subject: Re: [PATCH 5/6] configure / meson: Move check for sys/signal.h to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-6-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <788f7fc0-48e8-67ec-3eea-ba54f77168c8@vivier.eu>
Date: Sun, 13 Dec 2020 19:01:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-6-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L0o24RLsoeieOjMTp53euaI/DRzepeM8hyHubA3yZMGsVG3xi5Y
 97ieUnlxMR6+FQXnJfs06DpgfdgRP5HKfdissgUez6fGHqgIPJPrd5OpRN3pbYdEEsMiwYb
 jQKkve9nIIDxWpC6pR+YzCoANeEkEQRgvKOYtkUDVuL8uYa1tUOhum6d2KYwNvLArJLX1zI
 XxtRvTBiltMRfbvxi7RLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x0bGmqirrII=:c+4fOUrcTer51jVwJ4vtjT
 IQO8qTaYYVTktWzFPm7m1zOm3nJ1jBgDADzRWPsKBhbCRzb9Xu2CuHII3k3Qc2jH3Belul9Qf
 IdacYLopMMrcKtwIN4kMgkQ7fgzk0ypl5B6AXiX0E0/jYVh+BG0DrUs4ihLB7d+QUF7Kf6G9H
 nvv18jNzN1Fup9vaEz7dibdTHjR7e2igukA5Wv1RekT1kig/3H3lsQ2IIkmnPu5u7wESvpAvG
 93Go3Tf+vGDAiBM6a9coYdaVFsnC5b28jklj4I7VTiZOLnWMh2ISk15KGd1SYuHoAYNJF/UQC
 mdxt3jJnLaEYMdVp7f0jnYIulxejtiwA2A8aZHp/3yhiHZUa1xfD/kt5P6tra/6p44ZD5M1mB
 FJPEySNLKdXwL6zNddQbRp+FOIcwuKzACTyJsFyUwhtO5FY5mQwkZ72vuL8NzPDMZBLxtAObT
 ZiiMMKU+9Q==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/11/2020 à 18:10, Thomas Huth a écrit :
> This check can be done in a much shorter way in meson.build. And while
> we're at it, rename the #define to HAVE_SYS_KCOV_H to match the other
> HAVE_someheader_H symbols that we already have.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure            | 9 ---------
>  linux-user/ioctls.h  | 2 +-
>  linux-user/syscall.c | 2 +-
>  meson.build          | 1 +
>  4 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 871e4bb9fb..8d40a0beb3 100755
> --- a/configure
> +++ b/configure
> @@ -4389,12 +4389,6 @@ if compile_prog "" "" ; then
>    syncfs=yes
>  fi
>  
> -# check for kcov support (kernel must be 4.4+, compiled with certain options)
> -kcov=no
> -if check_include sys/kcov.h ; then
> -    kcov=yes
> -fi
> -
>  # check for btrfs filesystem support (kernel must be 3.9+)
>  btrfs=no
>  if check_include linux/btrfs.h ; then
> @@ -6092,9 +6086,6 @@ fi
>  if test "$syncfs" = "yes" ; then
>    echo "CONFIG_SYNCFS=y" >> $config_host_mak
>  fi
> -if test "$kcov" = "yes" ; then
> -  echo "CONFIG_KCOV=y" >> $config_host_mak
> -fi
>  if test "$btrfs" = "yes" ; then
>    echo "CONFIG_BTRFS=y" >> $config_host_mak
>  fi
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 585874f090..8efb4d38c0 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -715,7 +715,7 @@
>    IOCTL_IGNORE(TIOCSTOP)
>  #endif
>  
> -#ifdef CONFIG_KCOV
> +#ifdef HAVE_SYS_KCOV_H
>    IOCTL(KCOV_ENABLE, 0, TYPE_NULL)
>    IOCTL(KCOV_DISABLE, 0, TYPE_NULL)
>    IOCTL(KCOV_INIT_TRACE, IOC_R, TYPE_ULONG)
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 27adee908e..063130be04 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -73,7 +73,7 @@
>  #ifdef CONFIG_SENDFILE
>  #include <sys/sendfile.h>
>  #endif
> -#ifdef CONFIG_KCOV
> +#ifdef HAVE_SYS_KCOV_H
>  #include <sys/kcov.h>
>  #endif
>  
> diff --git a/meson.build b/meson.build
> index 054e40e9a5..ab9571a354 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -811,6 +811,7 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>  config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
> +config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>  config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
>  
>  ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
> 

Applied to my trivial-patches branch with fixed subject.

Thanks,
Laurent


