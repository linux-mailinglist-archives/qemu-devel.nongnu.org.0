Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2854D13A951
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 13:31:59 +0100 (CET)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irLMU-0002Mh-4C
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 07:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36317)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irLLL-0001vX-2a
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:30:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irLLH-0002TR-Io
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:30:47 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:52423)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1irLLH-0002SP-9P
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:30:43 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N5mWp-1jkVSX2kot-017HPv; Tue, 14 Jan 2020 13:30:22 +0100
Subject: Re: [PATCH 02/12] linux-user: Add support for getting/setting RTC
 time and alarm using ioctls
To: Filip Bozuta <Filip.Bozuta@rt-rk.com>, qemu-devel@nongnu.org
References: <1578574763-8327-1-git-send-email-Filip.Bozuta@rt-rk.com>
 <1578574763-8327-3-git-send-email-Filip.Bozuta@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e642e7bb-9a20-f519-b51a-917f7c13354e@vivier.eu>
Date: Tue, 14 Jan 2020 13:30:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578574763-8327-3-git-send-email-Filip.Bozuta@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8x4Dl7UIcmTugiG/ckPtx+frQ19Tw0G+ONga5pFuSx5Icyp62zu
 Qgd5t9spA9gwD2JaXEN9MTT/Ylp4BLZ8WKGPikDFYn/746t/DkTuqsXOfT7Sc16KpDAfyUQ
 +aXy153hEzLw1zmCFr1q7wKcbs3x3OI7wJsIJa4jBghGcsdTR02vC/EsomHMi1MTEm4fQ9u
 uT8ivakwh+JCBTv8bi6NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CgUz8DiC/KM=:s1Rilxo9dJ+VTBZwrLaxKg
 ro3TmySVsOpEiu7ybeFqTV8T1xD1ej5tiUvoevDx01xHJHs+XxTa53dUk4DHh3gHI36hjE0lM
 HOpEmQwByWFHUn3Yjp9cbUMSeRBl50sKpKJjMBy8x0aWaf4x/d+54zkSpmjTYmUw1Nhxity2z
 Y6x48bVFtYtoeMuOVqvY6SmVveJbZmAy3eV50nJ+9piuavoy3VuPZR5NxFBK4YDmSNVenPLxJ
 uM78gj53GvUZosztviCJEIAxRnq1PIKxInp9IvBqKUupqV1X6e1oTO/wSBI6pJaIt+MJ87Za6
 NbXe0hvn2p4Fe3RT2QCXLb0MG748tU50OKZoOUCRB5i5VBvSYxjDXb3/VPskMjCi6R/O34/dl
 rJuZPY5UQXaCu8CCJoP76H8ZQzCoiKg4wMyLqc7ETDRpX8uzzHWYJ7s8r41BtYgM0WLaDqlJT
 epxygxhG8MPmKL4kRq++C2dEdAYuFC0m+NRl9DkQlwvVm47NEF76G6Okp+wL+ADlwKtvHg3tM
 IdUYs+Z4ZbgDeTqMAkl/ahYCxjdj3oOx2J7Ii5zP+aHGbM97mZ66LEbEVK6qXoNIX9U8y36DY
 5/tZ21vpo8ba5B1ia/2QY/QI3FDBhXd20MIl24Bnv2FoTPh30mjVfdg6tN7PS09lopnxHfvpu
 touoCbzjCkTHq8Y8Ko9+4Ofn7McrH88cXQ3Xg49D73BRxS3h87EkC2lDzKHUOL3+e9WoDXbCn
 IW4TnYQgr4tZduyYbBDasdsWulmQrLV6173XuH2hY6jGyVgdw4U+llg2yR8RTra6UKzjeXmEy
 c2WBUx1AXIEAxBjPT96NGY4kBjHZHWiqfSBR0RSLRNYDxMdfx/2VZZVEpPbVamDLtMRbZa/eJ
 hLVgEK7GmqGkzKVmhXJA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.130
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
> This patch implements functionalities of following ioctls:
> 
> RTC_RD_TIME - Getting RTC time
> 
>     Returns this RTC's time in the following structure:
> 
>         struct rtc_time {
>             int tm_sec;
>             int tm_min;
>             int tm_hour;
>             int tm_mday;
>             int tm_mon;
>             int tm_year;
>             int tm_wday;     /* unused */
>             int tm_yday;     /* unused */
>             int tm_isdst;    /* unused */
>         };
> 
>     The fields in this structure have the same meaning and ranges
>     as the tm structure described in gmtime man page. A pointer
>     to this structure should be passed as the third ioctl's argument.
> 
> RTC_SET_TIME - Setting RTC time
> 
>     Sets this RTC's time to the time specified by the rtc_time
>     structure pointed to by the third ioctl's argument. To set
>     the RTC's time the process must be privileged (i.e., have the
>     CAP_SYS_TIME capability).
> 
> RTC_ALM_READ, RTC_ALM_SET - Getting/Setting alarm time
> 
>     Read and set the alarm time, for RTCs that support alarms.
>     The alarm interrupt must be separately enabled or disabled
>     using the RTC_AIE_ON, RTC_AIE_OFF requests. The third
>     ioctl's argument is a pointer to an rtc_time structure. Only
>     the tm_sec, tm_min, and tm_hour fields of this structure are
>     used.
> 
> Implementation notes:
> 
>     All ioctls in this patch have pointer to a structure rtc_time
>     as their third argument. That is the reason why corresponding
>     definition is added in linux-user/syscall_types.h. Since all
>     elements of this structure are of type 'int', the rest of the
>     implementation is straightforward.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
> ---
>  linux-user/ioctls.h        |  4 ++++
>  linux-user/syscall_defs.h  |  4 ++++
>  linux-user/syscall_types.h | 11 +++++++++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 97741c7..f472794 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -77,6 +77,10 @@
>       IOCTL(RTC_PIE_OFF, 0, TYPE_NULL)
>       IOCTL(RTC_WIE_ON, 0, TYPE_NULL)
>       IOCTL(RTC_WIE_OFF, 0, TYPE_NULL)
> +     IOCTL(RTC_ALM_READ, IOC_R, MK_PTR(MK_STRUCT(STRUCT_rtc_time)))
> +     IOCTL(RTC_ALM_SET, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rtc_time)))
> +     IOCTL(RTC_RD_TIME, IOC_R, MK_PTR(MK_STRUCT(STRUCT_rtc_time)))
> +     IOCTL(RTC_SET_TIME, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rtc_time)))
>  
>       IOCTL(BLKROSET, IOC_W, MK_PTR(TYPE_INT))
>       IOCTL(BLKROGET, IOC_R, MK_PTR(TYPE_INT))
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index f91579a..f0bf09d 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -772,6 +772,10 @@ struct target_pollfd {
>  #define TARGET_RTC_PIE_OFF          TARGET_IO('p', 0x06)
>  #define TARGET_RTC_WIE_ON           TARGET_IO('p', 0x0f)
>  #define TARGET_RTC_WIE_OFF          TARGET_IO('p', 0x10)
> +#define TARGET_RTC_ALM_READ         TARGET_IOR('p', 0x08, struct rtc_time)
> +#define TARGET_RTC_ALM_SET          TARGET_IOW('p', 0x07, struct rtc_time)
> +#define TARGET_RTC_RD_TIME          TARGET_IOR('p', 0x09, struct rtc_time)
> +#define TARGET_RTC_SET_TIME         TARGET_IOW('p', 0x0a, struct rtc_time)
>  
>  #if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4) ||    \
>         defined(TARGET_XTENSA)
> diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
> index 4e36983..a35072a 100644
> --- a/linux-user/syscall_types.h
> +++ b/linux-user/syscall_types.h
> @@ -255,6 +255,17 @@ STRUCT(blkpg_partition,
>         MK_ARRAY(TYPE_CHAR, BLKPG_DEVNAMELTH), /* devname */
>         MK_ARRAY(TYPE_CHAR, BLKPG_VOLNAMELTH)) /* volname */
>  
> +STRUCT(rtc_time,
> +       TYPE_INT, /* tm_sec */
> +       TYPE_INT, /* tm_min */
> +       TYPE_INT, /* tm_hour */
> +       TYPE_INT, /* tm_mday */
> +       TYPE_INT, /* tm_mon */
> +       TYPE_INT, /* tm_year */
> +       TYPE_INT, /* tm_wday */
> +       TYPE_INT, /* tm_yday */
> +       TYPE_INT) /* tm_isdst */
> +
>  STRUCT(blkpg_ioctl_arg,
>         TYPE_INT, /* op */
>         TYPE_INT, /* flags */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

