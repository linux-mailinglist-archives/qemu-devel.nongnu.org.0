Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4113A774B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 08:43:47 +0200 (CEST)
Received: from localhost ([::1]:39436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt2na-0005zb-F0
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 02:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lt2mm-0005JI-Cl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 02:42:56 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:43451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lt2mj-0006Ys-16
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 02:42:56 -0400
Received: from [192.168.100.1] ([82.142.19.46]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNss4-1ldaIk1nlw-00OIFB; Tue, 15 Jun 2021 08:42:50 +0200
Subject: Re: [PATCH] linux-user: Use public sigev_notify_thread_id member if
 available
To: Michael Forney <mforney@mforney.org>
References: <20210526035556.7931-1-mforney@mforney.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4f876e7c-efab-6c39-0779-0948262a0346@vivier.eu>
Date: Tue, 15 Jun 2021 08:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210526035556.7931-1-mforney@mforney.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s6+2s3WcmBPDC77Xd8QyqScS7sRUPi6ftjO/6pUqiuaXZ6qkj32
 v2t1/6zgkpG+4PLf0tZU80jn/k0ML5CjK0eRM6McdBPDY+wTIyt4zicbHRzkO6IZT/fTXct
 Mei3GDajiQ9SNxS20VB1LLO14SHsfFUuCXWHhOpDmNWTHSmQw2LuXP69EvgYupJtC7pp8Ai
 n7VLIkvu1AifiXauEKh+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ATiH1m8xbDU=:5dQY09xZcVVPWPiD3DGiiD
 X+E/DKROspObBKJ0cOpKLHBdxlq0EZo/cOZWBjYBPfktIB03qnB2Zr2Q2ICsd50/q2Jud2CTV
 3UxAuJ/YmbpAquNkNEMedWwd/4EuzNcl+lCy+z0Z8Qza+e28UAt+ZOhxzEmXhlrJR3kE1xgTJ
 JuyhgKx2EiDRsX5mtmfn8uSrN6hJUurSd27jg2XVqy+LnhGpK5mQCtpSomq2VPdzikIfLqXUO
 8WVPifnB7nhnFg6q+Buvj/DWL9FTbv7WlU1ObiHys8Mj1LQ0yI+sBvOjwitWSHAMVcZgnYGMC
 /eLSCWyyEqGvXrAJ6cRdp1AABDscG5a2yLWvyXQxa2RdxH8LHtORegi7f5yqeseM6QG8ALIVm
 I2tuwfKChT0yli2LNZqp3/5kBsYqPN/Z6LqrY20LHBpojlDFVqa9hvSQ7VSFfp8wZsdT2eB7A
 dBQ9tLm7YGI18aX5S2IIbDdAGtPpTI7DdpIKb0ZL6fYQuCc75n0I2c85BkgI1tdoTmasMU+r7
 brMx4a6Db0FHuZjk3pxuX4=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/05/2021 à 05:55, Michael Forney a écrit :
> _sigev_un._tid is an internal glibc field and is not available on
> musl libc. The sigevent(7) man page and Linux UAPI headers both use
> sigev_notify_thread_id as a public way to access this field.
> 
> musl libc supports this field since 1.2.2[0], and glibc plans to
> add support as well[1][2].
> 
> If sigev_notify_thread_id is not available, fall back to _sigev_un._tid
> as before.
> 
> [0] http://git.musl-libc.org/cgit/musl/commit/?id=7c71792e87691451f2a6b76348e83ad1889f1dcb
> [1] https://www.openwall.com/lists/musl/2019/08/01/5
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=27417
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> ---
>  configure            | 16 ++++++++++++++++
>  linux-user/syscall.c |  6 +++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 676239c697..fa39b0a727 100755
> --- a/configure
> +++ b/configure
> @@ -4462,6 +4462,19 @@ if compile_prog "" "" ; then
>      st_atim=yes
>  fi
>  
> +##########################################
> +# check if we have sigev_notify_thread_id
> +
> +sigev_notify_thread_id=no
> +cat > $TMPC << EOF
> +#include <stddef.h>
> +#include <signal.h>
> +int main(void) { return offsetof(struct sigevent, sigev_notify_thread_id); }
> +EOF
> +if compile_prog "" "" ; then
> +    sigev_notify_thread_id=yes
> +fi
> +
>  ##########################################
>  # check if trace backend exists
>  
> @@ -5718,6 +5731,9 @@ fi
>  if test "$st_atim" = "yes" ; then
>    echo "HAVE_STRUCT_STAT_ST_ATIM=y" >> $config_host_mak
>  fi
> +if test "$sigev_notify_thread_id" = "yes" ; then
> +  echo "HAVE_SIGEV_NOTIFY_THREAD_ID=y" >> $config_host_mak
> +fi
>  if test "$byteswap_h" = "yes" ; then
>    echo "CONFIG_BYTESWAP_H=y" >> $config_host_mak
>  fi
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index c9f812091c..63464f9a96 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7393,6 +7393,10 @@ static inline abi_long host_to_target_timex64(abi_long target_addr,
>  }
>  #endif
>  
> +#ifndef HAVE_SIGEV_NOTIFY_THREAD_ID
> +#define sigev_notify_thread_id _sigev_un._tid
> +#endif
> +
>  static inline abi_long target_to_host_sigevent(struct sigevent *host_sevp,
>                                                 abi_ulong target_addr)
>  {
> @@ -7413,7 +7417,7 @@ static inline abi_long target_to_host_sigevent(struct sigevent *host_sevp,
>      host_sevp->sigev_signo =
>          target_to_host_signal(tswap32(target_sevp->sigev_signo));
>      host_sevp->sigev_notify = tswap32(target_sevp->sigev_notify);
> -    host_sevp->_sigev_un._tid = tswap32(target_sevp->_sigev_un._tid);
> +    host_sevp->sigev_notify_thread_id = tswap32(target_sevp->_sigev_un._tid);
>  
>      unlock_user_struct(target_sevp, target_addr, 1);
>      return 0;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

