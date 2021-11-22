Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA0C4592AE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 17:08:43 +0100 (CET)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpBs2-0000Jk-A7
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 11:08:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mpBqk-00083V-54
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 11:07:22 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:59985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mpBqi-0001NW-DC
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 11:07:21 -0500
Received: from [192.168.100.1] ([82.142.2.234]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Movrq-1mIfhi1zv4-00qVoI; Mon, 22 Nov 2021 17:07:16 +0100
Message-ID: <8050bb8b-844d-3307-8503-9851493cb1e5@vivier.eu>
Date: Mon, 22 Nov 2021 17:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] linux-user: implement more loop ioctls
Content-Language: fr
To: Andreas Schwab <schwab@suse.de>
References: <mvmzgpwmfxs.fsf@suse.de>
 <290f4df5-fe4a-6665-89f8-69f958cf452c@vivier.eu> <mvmtug4mbfx.fsf_-_@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <mvmtug4mbfx.fsf_-_@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NHAbm1gFewVAcAmTq/4W/gFQju9C7tK5KJef/a9Ko2r/wY95NNt
 dgEaySA9VAqfKPjXzyV0n6a7DW6JzB0S0eLmUYKa6ijGp/O9QMOZ16HNpdahx3qsPeAWsWg
 YM18SxYiWTKeJxaIwAWt254FgwjoAtB4nTh7kVbKgancXevte89uTBrIxm6rtu0e4RG01xb
 RQ57aOzNTrrLtBKmsQulA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xzDqBzqbjYU=:nihLj+zPQU3XXPS6OE4yZk
 kP5FPdgouhobr+UIHJw0LyYezqR6YO7OG0RkhvL7eJ58DIxqyYHZMHGBcayfQ3vfkrQIUH9xn
 rpEVflm1t6QzrQgshcuolXS2tx94HdeppiO4NAb6quRTpiPD2ucQ1x01EeHILAQNwZV9/pVAW
 jSkLWStVmsBIv31131BoVfJ0SsiD9LEWrPAYCMYgWinsUZYjcHUyEL9abwKBpFrlY2zS9Jf0C
 HOcvCQ/tkiFq0G/2Ck2SgOZNlPElZt2b0hBgtIHQdDrrHuP6nbl9FXAY2k0rdvMsPwMk9Yf5z
 LgUFc3hsapY0kAOxVgRnr+1/N2adYFKgeAlZS2wsJCYCX2Z8fhJMU8C8+cS4WRelQRONAiz7W
 G1aoZXP0XGYJoBJ3vCs5o5/u52TFquR0MRwribTMUvxgUelT9uxtjRW5Sc0Xk8WcdjwBMhgim
 zkwQJ1ZsGJLKwVCXXoIM7kszmT/HDyUVIxNZad/XBVwh4wL5kr7OwivSQ9RfUOaqkmefTas8w
 jcTF6uzXESG5ONcjEzHq+ZycqROYgdAQj8vPe+i5pUn+BvuX3ye/3wXMLtVDrbHEOA90eWFTC
 Yx8S+5ID0Nq+6Xa86/Ir+LFmK5o1zCsgoOD1pMDX0Uc2dScfNaH4SSYk+ZeyG+jC/YZEJjRu6
 DtmDSHR8iuqYvjHTOuCiTXvdB54f+IrxcBijkG0xuO9+HPIhQ4zp2lrLnebncHGGzYQo=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/11/2021 à 16:56, Andreas Schwab a écrit :
> LOOP_CONFIGURE is now used by losetup, and it cannot cope with ENOSYS.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
> v2: fix s/loop_configure/loop_config/ typo
> 
>   linux-user/ioctls.h        | 4 ++++
>   linux-user/linux_loop.h    | 2 ++
>   linux-user/syscall_defs.h  | 4 ++++
>   linux-user/syscall_types.h | 6 ++++++
>   4 files changed, 16 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 7193c3b226..f182d40190 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -637,6 +637,10 @@
>     IOCTL(LOOP_SET_STATUS64, IOC_W, MK_PTR(MK_STRUCT(STRUCT_loop_info64)))
>     IOCTL(LOOP_GET_STATUS64, IOC_R, MK_PTR(MK_STRUCT(STRUCT_loop_info64)))
>     IOCTL(LOOP_CHANGE_FD, 0, TYPE_INT)
> +  IOCTL(LOOP_SET_CAPACITY, 0, TYPE_INT)
> +  IOCTL(LOOP_SET_DIRECT_IO, 0, TYPE_INT)
> +  IOCTL(LOOP_SET_BLOCK_SIZE, 0, TYPE_INT)
> +  IOCTL(LOOP_CONFIGURE, IOC_W, MK_PTR(MK_STRUCT(STRUCT_loop_config)))
>   
>     IOCTL(LOOP_CTL_ADD, 0, TYPE_INT)
>     IOCTL(LOOP_CTL_REMOVE, 0, TYPE_INT)
> diff --git a/linux-user/linux_loop.h b/linux-user/linux_loop.h
> index c69fea11e4..f80b96f1ff 100644
> --- a/linux-user/linux_loop.h
> +++ b/linux-user/linux_loop.h
> @@ -96,6 +96,8 @@ struct loop_info64 {
>   #define LOOP_CHANGE_FD		0x4C06
>   #define LOOP_SET_CAPACITY       0x4C07
>   #define LOOP_SET_DIRECT_IO      0x4C08
> +#define LOOP_SET_BLOCK_SIZE     0x4C09
> +#define LOOP_CONFIGURE          0x4C0A
>   
>   /* /dev/loop-control interface */
>   #define LOOP_CTL_ADD            0x4C80
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index a5ce487dcc..560a29afd8 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -1219,6 +1219,10 @@ struct target_rtc_pll_info {
>   #define TARGET_LOOP_SET_STATUS64      0x4C04
>   #define TARGET_LOOP_GET_STATUS64      0x4C05
>   #define TARGET_LOOP_CHANGE_FD         0x4C06
> +#define TARGET_LOOP_SET_CAPACITY      0x4C07
> +#define TARGET_LOOP_SET_DIRECT_IO     0x4C08
> +#define TARGET_LOOP_SET_BLOCK_SIZE    0x4C09
> +#define TARGET_LOOP_CONFIGURE         0x4C0A
>   
>   #define TARGET_LOOP_CTL_ADD           0x4C80
>   #define TARGET_LOOP_CTL_REMOVE        0x4C81
> diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
> index ba2c1518eb..c3b43f8022 100644
> --- a/linux-user/syscall_types.h
> +++ b/linux-user/syscall_types.h
> @@ -201,6 +201,12 @@ STRUCT(loop_info64,
>          MK_ARRAY(TYPE_CHAR, 32),  /* lo_encrypt_key */
>          MK_ARRAY(TYPE_ULONGLONG, 2))  /* lo_init */
>   
> +STRUCT(loop_config,
> +       TYPE_INT,                 /* fd */
> +       TYPE_INT,                 /* block_size */
> +       MK_STRUCT(STRUCT_loop_info64), /* info */
> +       MK_ARRAY(TYPE_ULONGLONG, 8)) /* __reserved */
> +
>   /* mag tape ioctls */
>   STRUCT(mtop, TYPE_SHORT, TYPE_INT)
>   STRUCT(mtget, TYPE_LONG, TYPE_LONG, TYPE_LONG, TYPE_LONG, TYPE_LONG,
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

