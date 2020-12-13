Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7691A2D8F38
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 19:04:58 +0100 (CET)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVjt-00073u-FL
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 13:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVi6-0005jH-Po; Sun, 13 Dec 2020 13:03:06 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:41799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVi4-0006QK-Tr; Sun, 13 Dec 2020 13:03:06 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N1wdd-1k96D72J2n-012DtA; Sun, 13 Dec 2020 19:03:00 +0100
Subject: Re: [PATCH 6/6] configure / meson: Move check for linux/btrfs.h to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-7-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a1c4022f-4b1c-5171-8051-0dfb26fc6ef7@vivier.eu>
Date: Sun, 13 Dec 2020 19:02:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-7-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EwRORKCcJC1EfoJ1t7ZPKATAQaZke8VM56S5d++nqvFq+xOSe5M
 3R2ibcqaovF7K6OsBeZ6JBOI+rBd2uHmS1uW2EG0dfTKFqpb5EToSXhRDzUrQDb4YWJku/n
 m0GI2UwY2uO6i4mVYO6+r0Z0DLYuOvoiGyqaifWLqweKKjG7hCGHndlLgu3wzSPJ+ZfKJeN
 E41QUiXRVmsj6Gu6jKOUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xjqX+jDCPzw=:KpbPX4pBwdJKJIvg/xzzXQ
 8JejbAk/tjq0+3gevTqhlXNHTlTnTc1a8OJ1aoSoKpLcpFm2PnnWuDQdsFluLRb/27ZHsJcSp
 E7QmR3nJo1u//gqqkgNDPQpG1+PHvVNolPBwzagM2B50kinYq55o4eWLYKiOucR00lQQMLxaR
 JnSuEnFeAiDBFWRabvkwVIcdo5PryEJn2gsE3DfzkJlUxeanvjwmhA7zEIzOaG1+qX+kLAHC3
 gll1FQBZmIEOhp2ASkn6cd7/2RWVjZUmkJWEmMDh2p7I9y1WnXicHNSP9KjE9TFVacYDCDCjv
 hTpr23gVzb7KSM5BE9LI7EOIgBteK3cv8Pg8zTT2sTcZKEdPsyhio87FU87dIQWZMlV/o7WwX
 CAAVhu+SRpEqktqzHeYyvd1a/LILf5y4q6+5IuzLh4bKDbiF187DUHJj4/4LQTp6Dvt5Ezgia
 tuCEBZ2OEg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
> we're at it, rename the #define to HAVE_BTRFS_H to match the other
> HAVE_someheader_H symbols that we already have.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure                 | 9 ---------
>  linux-user/syscall.c      | 2 +-
>  linux-user/syscall_defs.h | 2 +-
>  meson.build               | 1 +
>  4 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 8d40a0beb3..1ba4bf9a3d 100755
> --- a/configure
> +++ b/configure
> @@ -4389,12 +4389,6 @@ if compile_prog "" "" ; then
>    syncfs=yes
>  fi
>  
> -# check for btrfs filesystem support (kernel must be 3.9+)
> -btrfs=no
> -if check_include linux/btrfs.h ; then
> -    btrfs=yes
> -fi
> -
>  # Search for bswap_32 function
>  byteswap_h=no
>  cat > $TMPC << EOF
> @@ -6086,9 +6080,6 @@ fi
>  if test "$syncfs" = "yes" ; then
>    echo "CONFIG_SYNCFS=y" >> $config_host_mak
>  fi
> -if test "$btrfs" = "yes" ; then
> -  echo "CONFIG_BTRFS=y" >> $config_host_mak
> -fi
>  if test "$inotify" = "yes" ; then
>    echo "CONFIG_INOTIFY=y" >> $config_host_mak
>  fi
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 063130be04..7bf99beb18 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -112,7 +112,7 @@
>  #include <linux/if_alg.h>
>  #include <linux/rtc.h>
>  #include <sound/asound.h>
> -#ifdef CONFIG_BTRFS
> +#ifdef HAVE_BTRFS_H
>  #include <linux/btrfs.h>
>  #endif
>  #ifdef HAVE_DRM_H
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index cabbfb762d..b934d0b606 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -1006,7 +1006,7 @@ struct target_rtc_pll_info {
>  #define TARGET_FS_IOC32_SETVERSION TARGET_IOW('v', 2, int)
>  
>  /* btrfs ioctls */
> -#ifdef CONFIG_BTRFS
> +#ifdef HAVE_BTRFS_H
>  #define TARGET_BTRFS_IOC_SNAP_CREATE            TARGET_IOWU(BTRFS_IOCTL_MAGIC, 1)
>  #define TARGET_BTRFS_IOC_SCAN_DEV               TARGET_IOWU(BTRFS_IOCTL_MAGIC, 4)
>  #define TARGET_BTRFS_IOC_FORGET_DEV             TARGET_IOWU(BTRFS_IOCTL_MAGIC, 5)
> diff --git a/meson.build b/meson.build
> index ab9571a354..bf62e260ed 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -808,6 +808,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
>  config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
>  config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
>  
> +config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>  config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


