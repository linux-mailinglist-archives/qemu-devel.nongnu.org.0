Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3A13A9E8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 14:02:51 +0100 (CET)
Received: from localhost ([::1]:38976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irLqL-00027D-JM
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 08:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irLhf-00011m-UK
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:53:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irLhc-0001Sd-9U
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:53:51 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:50365)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1irLhc-0001SS-0U
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:53:48 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MYNaE-1jDuu40jVy-00VLaR; Tue, 14 Jan 2020 13:53:34 +0100
Subject: Re: [PATCH 10/12] linux-user: Add support for selecting alsa timer
 using ioctl
To: Filip Bozuta <Filip.Bozuta@rt-rk.com>, qemu-devel@nongnu.org
References: <1578574763-8327-1-git-send-email-Filip.Bozuta@rt-rk.com>
 <1578574763-8327-11-git-send-email-Filip.Bozuta@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <aca4a927-d7d4-795a-4530-980032e20208@vivier.eu>
Date: Tue, 14 Jan 2020 13:53:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578574763-8327-11-git-send-email-Filip.Bozuta@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k+mieKyjrnPuX+OXYVyy0wiiCawdC0MB7DDx8FtmNaJ5E/6f7DY
 VUX+sXrko8Mth659T01Ym4IpacL/3KLznOiH+p/ok0kP64Bdp02+CsCB1LRssEP2zTrrNQz
 ndzJ3K7TCDYb+XPqC2M2BbM/E/bG+tRYWIoEsUq0D/e0Ialf+8sJO0gcDYEw8HjvBsk4W7x
 iohKtjeq8OfF/U1RvvrVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dTt2IuV/DNk=:vxEFs9YUiErxpj5tfWfpBP
 JgHi8a2qWYjiIVspckO3sjYhLEA3f6yvUXyhp5P2x7pki0SkUm69YG0fJHkRJDaNB55vG4mCU
 5vVePJaOnCnDFEl8dR0Z3fe/WRIU2tTmvXWlnrHrZPYbpMAHQr0wXt3/OZZozv+ioq24nn9t0
 whQ4qMAM+qtogdGBXtYCE1aNIPMnAFuTIjDo3QezzHwosFd1N6Gv5/f3Dst0XxWkTNJScJLh7
 VSx+8QhNRqG7nKl3Uy8+RqP4ugIvb3ieCaC8mqa2wimoBY7rWLmv7VPXVOjlXfSTF9S6LgJHN
 muAanRaEjJ2McqAhcTRcmwWOwZyIhyphxQYkBxFIrvMXVvCkeGmMFu35uxIW7+qyur/Q7fw2p
 FUDmbhddIibaIdisql+e9iyzSHt9mYJXTtJTEWEKlddAGIeqIO+o4BOdeYBQdSqXHj7ArhOa8
 hy2tPJBJke2fNXhcYjzf+sevHkBYOhknMi/+nyiJGQV4GAgrZfp/BcocKmjfKCP712j7Vgg7l
 xN4i+SP13kDArxkz3PdfcCnzDMqCx8t93b+D5w4tQflse+UBicvabbBb1/vLKZ1qPEOK2Xo2T
 3uIe0m+lNAKxUDdVTv8etIoroMEeVEaKbRnq+QsVS6XbN0T2tZ6ZzI3KfIzLZBYZAQ3uiTKAs
 hNYG5MUQffuLiccKGImMYIVSkIDSFAB54lokQHELTUkqahTUXc5F2NHFhyGUK+hlY6SRgs9oH
 ZlsU1aZkB1PdcNlqw1AB1UJK23hVcwjWIQb0d/McyPgZQxZA6pz3Om0W0gyetkpZM7izP5bl0
 ZAWTlZ0vhsSabEUiPGzWTqggRklp8yzDFfmURFqJ27xhggBkoEWiHz6QOYfJgG5UjWEHeqF4B
 /DAzrArNFgR/0cpbrlUg==
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
Cc: riku.voipio@iki.fi
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/01/2020 à 13:59, Filip Bozuta a écrit :
> This patch implements functionality of following ioctl:
> 
> SNDRV_TIMER_IOCTL_SELECT - Selecting timer
> 
>     Selects the timer which id is specified. The timer id is specified in the
>     following strcuture:
> 
>     struct snd_timer_select {
>         struct snd_timer_id id;         /* timer ID */
>         unsigned char reserved[32];     /* reserved */
>     };
> 
>     A pointer to this structure should be passed as the third ioctl's argument.
>     Before calling the ioctl, the field "tid" should be initialized with the id
>     information for the timer which is to be selected. If there is no timer
>     device with the specified id, the error ENODEV ("No such device") is
>     returned.
> 
> Implementation notes:
> 
>     Ioctl implemented in this patch has a pointer to a
>     'struct snd_timer_select' as its third argument.
>     That is the reason why a corresponding definition
>     was added in 'linux-user/syscall_types.h'. The rest
>     of the implementation was straightforward.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
> ---
>  linux-user/ioctls.h        | 2 ++
>  linux-user/syscall_defs.h  | 7 +++++++
>  linux-user/syscall_types.h | 4 ++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 989eb9b..7652117 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -459,6 +459,8 @@
>          MK_PTR(MK_STRUCT(STRUCT_snd_timer_gparams)))
>    IOCTL(SNDRV_TIMER_IOCTL_GSTATUS, IOC_RW,
>          MK_PTR(MK_STRUCT(STRUCT_snd_timer_gstatus)))
> +  IOCTL(SNDRV_TIMER_IOCTL_SELECT, IOC_W,
> +        MK_PTR(MK_STRUCT(STRUCT_snd_timer_select)))
>  
>    IOCTL(HDIO_GETGEO, IOC_R, MK_PTR(MK_STRUCT(STRUCT_hd_geometry)))
>    IOCTL(HDIO_GET_UNMASKINTR, IOC_R, MK_PTR(TYPE_INT))
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 4d4dad3..9a33b71 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2462,6 +2462,11 @@ struct target_snd_timer_gstatus {
>      unsigned char reserved[32];
>  };
>  
> +struct target_snd_timer_select {
> +    struct target_snd_timer_id id;
> +    unsigned char reserved[32];
> +};
> +
>  /* alsa timer ioctls */
>  #define TARGET_SNDRV_TIMER_IOCTL_PVERSION     TARGET_IOR('T', 0x00, int)
>  #define TARGET_SNDRV_TIMER_IOCTL_NEXT_DEVICE  TARGET_IOWR('T', 0x01,                     \
> @@ -2473,6 +2478,8 @@ struct target_snd_timer_gstatus {
>                                                           struct target_snd_timer_gparams)
>  #define TARGET_SNDRV_TIMER_IOCTL_GSTATUS      TARGET_IOWR('T', 0x05,                     \
>                                                            struct target_snd_timer_gstatus)
> +#define TARGET_SNDRV_TIMER_IOCTL_SELECT       TARGET_IOW('T', 0x10,                      \
> +                                                         struct target_snd_timer_select)
>  
>  /* vfat ioctls */
>  #define TARGET_VFAT_IOCTL_READDIR_BOTH    TARGET_IORU('r', 1)
> diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
> index 4e90716..767632d 100644
> --- a/linux-user/syscall_types.h
> +++ b/linux-user/syscall_types.h
> @@ -116,6 +116,10 @@ STRUCT(snd_timer_gstatus,
>         TYPE_ULONG, /* resolution_den */
>         MK_ARRAY(TYPE_CHAR, 32)) /* reserved */
>  
> +STRUCT(snd_timer_select,
> +       MK_STRUCT(STRUCT_snd_timer_id), /* id */
> +       MK_ARRAY(TYPE_CHAR, 32)) /* reserved */
> +
>  /* loop device ioctls */
>  STRUCT(loop_info,
>         TYPE_INT,                 /* lo_number */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

