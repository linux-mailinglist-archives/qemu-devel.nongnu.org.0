Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885B13AC2B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 15:22:58 +0100 (CET)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irN5s-0001Zk-TB
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 09:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irN4l-0000Ef-5I
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:21:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irN4i-00043I-UI
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:21:47 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:45517)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1irN4i-00042x-LM
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:21:44 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MpUIW-1jRZQa1qrU-00ptJ2; Tue, 14 Jan 2020 15:21:28 +0100
Subject: Re: [PATCH v5 09/20] linux-user: Add support for
 FS_IOC_<GET|SET>VERSION ioctls
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1578947683-21011-10-git-send-email-aleksandar.markovic@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6606362f-0dec-056c-30af-e61d7a9bdcb4@vivier.eu>
Date: Tue, 14 Jan 2020 15:21:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578947683-21011-10-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mfAuYSsW+okxnS68gXpkDiEK9g7tdMxs/OtKKqXqJ67MYyG+dbd
 oHvNzxXj3nqTe6BID/fOyUjFs7BptNscUj24J1wTC8yPvevWABik/2HDlVSsyfBMA/EiLv2
 npb4nij1J11jqRaf9AY2AbK+3BFhfO1dLYvK18s9CW74A28OOZ99opjuoXgCCVDSr695mwy
 qbRRmW8M28l2RMDAuj60Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VYF4a74JDXk=:7erv8OSS8hJSIngZ31JE7F
 MSX4FpbmhMCCgEcYUzuEUhXx/cIOUDiO2KxIlkD5DgSbxfw/4ampiCFxh1mlTbq3bQvkMYwEI
 uibmWJ9RJst/gNxpX3X9O5kGZ4NH2PVdJ777dSurqWVPDTgrL8GnbtxvNTrbvXnxXYlDTL3/a
 yJsClQgEdD3Zv/xm2dH7ebZHmIR6p92E1GXze+9z1FLTmlp0upYamxXeNGCa0rvuRQm7IMaNx
 NWnwRDTLz2n5A4RHBXjilOxzKuXV2M2S3yit2Rr+sV8VUSfpnIcEyzX5670Wdaa9B0e3CDvFw
 IPHxCPqnFEE3I+4HRJM9ZABqC0IENAmNH/373vsf0Qu9DQlSb3GFCsl2GrwiYcmIytOJDO00f
 eH4pkljQKHVe7ZY38PPW4B4VwL7SZ55fqauntuuCRm4SbaGhEdQfgQ3HIHWdO/DYgYZ2BdMDb
 kwv+qj66w6znWyiuOra/U0F+47Ju8xFn5snMWG8xKOjLSGdkOhaD5ZfOhCIa/L15vATm8QiDn
 dtBpp9bdXDekHw6FKsBNE8OMJ3j7Y3jw1WbhckH6Qnb3W70ZW7DqPHn8v3HxqVMN0Deo5SzYz
 7oe3+g3MNtcc2261HwJ+VOHe8/uzTkUoXoKDwkXX4CKEcUJsG7aZzLqL/w6QTsaIKSLSPgFfB
 4xXV7GVQWF2ZpAlHjfyqXNDZeO8VKHzBAlzyRy41j7og2IaSWZTLGpPsxRq63QnP5llegea8t
 b642lHN+aXuNouDVgUHfTl86Y06a6MWPKVvfIQkizNeoMCuTaXamuN8NaiaGr3irSCK514VCp
 PKrewzqXPtVkZlJn3yKhoEKW7QPJezzcE0sokrv9EjT7lt10WFWDisw1j4FjzQMzh5M/qEFBq
 yx/W1vuIAeCS/Kcx6uH0/bXME5ttDnhsF26GGHbx8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
Cc: amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/01/2020 à 21:34, Aleksandar Markovic a écrit :
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> A very specific thing for these two ioctls is that their code
> implies that their third argument is of type 'long', but the
> kernel uses that argument as if it is of type 'int'. This anomaly
> is recognized also in commit 6080723 (linux-user: Implement
> FS_IOC_GETFLAGS and FS_IOC_SETFLAGS ioctls).
> 
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  linux-user/ioctls.h       | 2 ++
>  linux-user/syscall_defs.h | 8 +++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index c6b9d6a..c44f42e 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -138,6 +138,8 @@
>  
>       IOCTL(FS_IOC_GETFLAGS, IOC_R, MK_PTR(TYPE_INT))
>       IOCTL(FS_IOC_SETFLAGS, IOC_W, MK_PTR(TYPE_INT))
> +     IOCTL(FS_IOC_GETVERSION, IOC_R, MK_PTR(TYPE_INT))
> +     IOCTL(FS_IOC_SETVERSION, IOC_W, MK_PTR(TYPE_INT))
>  
>  #ifdef CONFIG_USBFS
>    /* USB ioctls */
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 98c2119..f68a8b6 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -911,12 +911,14 @@ struct target_pollfd {
>  #define TARGET_FICLONE    TARGET_IOW(0x94, 9, int)
>  #define TARGET_FICLONERANGE TARGET_IOW(0x94, 13, struct file_clone_range)
>  
> -/* Note that the ioctl numbers claim type "long" but the actual type
> - * used by the kernel is "int".
> +/*
> + * Note that the ioctl numbers for FS_IOC_<GET|SET><FLAGS|VERSION>
> + * claim type "long" but the actual type used by the kernel is "int".
>   */
>  #define TARGET_FS_IOC_GETFLAGS TARGET_IOR('f', 1, abi_long)
>  #define TARGET_FS_IOC_SETFLAGS TARGET_IOW('f', 2, abi_long)
> -
> +#define TARGET_FS_IOC_GETVERSION TARGET_IOR('v', 1, abi_long)
> +#define TARGET_FS_IOC_SETVERSION TARGET_IOW('v', 2, abi_long)
>  #define TARGET_FS_IOC_FIEMAP TARGET_IOWR('f',11,struct fiemap)
>  
>  /* usb ioctls */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

