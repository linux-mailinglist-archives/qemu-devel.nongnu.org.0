Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB85358F095
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 18:42:36 +0200 (CEST)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLomv-0005rc-KL
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 12:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oLoic-0001uG-KH
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:38:06 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:33853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oLoia-0004e4-Hw
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:38:06 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmUDf-1ndRTV0AQj-00iXPx; Wed, 10 Aug 2022 18:38:00 +0200
Message-ID: <eed04e3e-c15b-cb93-ca4d-6749d4712732@vivier.eu>
Date: Wed, 10 Aug 2022 18:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for 7.1] linux-user: fix compat with glibc >= 2.36
 sys/mount.h
Content-Language: fr
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220802164134.1851910-1-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220802164134.1851910-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YH/aeUbePwZXZCH4HSqWI5iKwmd0P4m3hqAiwUWheAzaTbqAuco
 9VWHX0YvGWy+LJY3de0+eZtBIccUuMbQux1RmXBW6P8UtEMKzqlgV/psn0mLVrqQoTPZNDF
 CDoqRHJdpyiY98UOB8qaxFuFwlLFrVbBTEfuuG8lmzmW95DL15xuJaFXUP0w5468nPXn2vF
 RzxC4j7fZh7UUe4X6TCNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YCubozckLW0=:y5lP3Cg3wMjMubK9/m1Fus
 l2Ts94KLnBtt+G2v27nK3xU/2v9FegeeBz90Ydua9nXE96uvsKK/EmnjwzYo1CQFRFnzoDU57
 MQGK7NXG2hR6r1rawty0rxoc5YzBS5uIKqGU9vvrxqSJ7F5Fc7R3guF8/9qW0vV4mVbHPMFiE
 7Emb+XA0qs2J0bpYO5jvRtLc1bIWVMFiYt0s3jBBQe60Qh3YdHAK86tG8qtCSp4ZMpmoIbd9e
 IQt2C1R2AFeIAbU3p0L3ERtFz1vEQ9KFvkcHfbbns5wg7dotrnVahwv8g+hDoF75HxYjMnlC4
 2KCxRETBo4159nHRiQAlo2WyQYrdRgMpQlofMXeJ7VFWFWqVlEslGGLCRq6BvFCqOFzG0qeE0
 b8bfcs+1LkNNtEI+nCBGTCTwNgsSCEmm7v28GhK5ORarjmaNOBI2eATK+S5VIsI7HeSsvicDF
 gymoRrA4mQO9mFsHzeFalw2A14Dw+LRTatSDWOVcv23OaT0bQqJ9jQT1hFtNOVZ0dqgCbbRrc
 suhyD/eecTqXJtdZuJ2hEgZMj3ez3zZpSARxW9Wqya3vmNgeMVJpUt/BtltvuyFN1vE2+ntOg
 Vyagj5JpItnCBkVJuwihr6ArLAU/Wt2NxQWyarJ+H5P16BFurEdZ2D1lkD4mNVJaNY3jNMih5
 le8fqMB2W2f9OUxy/L4FcI/43sUXK3KTf/1cJewmQNqQ9FWBNSK+OZQU3F5cuNr8akOTVacK8
 qrPEBgMBsKT5zMiYMEm8UwjY2qaCH2wEfW4Mnw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/08/2022 à 18:41, Daniel P. Berrangé a écrit :
> The latest glibc 2.36 has extended sys/mount.h so that it
> defines the FSCONFIG_* enum constants. These are historically
> defined in linux/mount.h, and thus if you include both headers
> the compiler complains:
> 
> In file included from /usr/include/linux/fs.h:19,
>                   from ../linux-user/syscall.c:98:
> /usr/include/linux/mount.h:95:6: error: redeclaration of 'enum fsconfig_command'
>     95 | enum fsconfig_command {
>        |      ^~~~~~~~~~~~~~~~
> In file included from ../linux-user/syscall.c:31:
> /usr/include/sys/mount.h:189:6: note: originally defined here
>    189 | enum fsconfig_command
>        |      ^~~~~~~~~~~~~~~~
> /usr/include/linux/mount.h:96:9: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
>     96 |         FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
>        |         ^~~~~~~~~~~~~~~~~
> /usr/include/sys/mount.h:191:3: note: previous definition of 'FSCONFIG_SET_FLAG' with type 'enum fsconfig_command'
>    191 |   FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
>        |   ^~~~~~~~~~~~~~~~~
> ...snip...
> 
> QEMU doesn't include linux/mount.h, but it does use
> linux/fs.h and thus gets linux/mount.h indirectly.
> 
> glibc acknowledges this problem but does not appear to
> be intending to fix it in the forseeable future, simply
> documenting it as a known incompatibility with no
> workaround:
> 
>    https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
>    https://sourceware.org/glibc/wiki/Synchronizing_Headers
> 
> To address this requires either removing use of sys/mount.h
> or linux/fs.h, despite QEMU needing declarations from
> both.
> 
> This patch removes linux/fs.h, meaning we have to define
> various FS_IOC constants that are now unavailable.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   linux-user/syscall.c | 18 ++++++++++++++++++
>   meson.build          |  2 ++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index b27a6552aa..52d178afe7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -95,7 +95,25 @@
>   #include <linux/soundcard.h>
>   #include <linux/kd.h>
>   #include <linux/mtio.h>
> +
> +#ifdef HAVE_SYS_MOUNT_FSCONFIG
> +/*
> + * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
> + * which in turn prevents use of linux/fs.h. So we have to
> + * define the constants ourselves for now.
> + */
> +#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
> +#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
> +#define FS_IOC_GETVERSION              _IOR('v', 1, long)
> +#define FS_IOC_SETVERSION              _IOW('v', 2, long)
> +#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
> +#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
> +#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
> +#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
> +#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
> +#else
>   #include <linux/fs.h>
> +#endif
>   #include <linux/fd.h>
>   #if defined(CONFIG_FIEMAP)
>   #include <linux/fiemap.h>
> diff --git a/meson.build b/meson.build
> index 294e9a8f32..30a380752c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1963,6 +1963,8 @@ config_host_data.set('HAVE_OPTRESET',
>                        cc.has_header_symbol('getopt.h', 'optreset'))
>   config_host_data.set('HAVE_IPPROTO_MPTCP',
>                        cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
> +config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
> +                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
>   
>   # has_member
>   config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


