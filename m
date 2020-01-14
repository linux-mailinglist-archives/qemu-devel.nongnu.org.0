Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC9713A97D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 13:39:29 +0100 (CET)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irLTk-0005P8-KW
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 07:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irLSm-0004dQ-48
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:38:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irLSi-00051q-Jh
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:38:28 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46473)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1irLSi-00051c-Ao
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:38:24 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N6sSV-1jjOsQ0Z5z-018Nss; Tue, 14 Jan 2020 13:38:01 +0100
Subject: Re: [PATCH 04/12] linux-user: Add support for getting/setting RTC
 wakeup alarm using ioctls
To: Filip Bozuta <Filip.Bozuta@rt-rk.com>, qemu-devel@nongnu.org
References: <1578574763-8327-1-git-send-email-Filip.Bozuta@rt-rk.com>
 <1578574763-8327-5-git-send-email-Filip.Bozuta@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <49d61933-60d5-535d-5ccb-b31a0a2be594@vivier.eu>
Date: Tue, 14 Jan 2020 13:37:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578574763-8327-5-git-send-email-Filip.Bozuta@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RmcAUmxHJRwDlghB0vJoFd3CHCgNAA2gLqPQhMVd6HFDqT+iAR6
 F2glotW4D9ZoD9J+KxgyWgbiB1MfINvXHZ7kITrQmo2+i9c4abeeqhIv5owAVW22AF3MgHZ
 S0zT/m/aNVhnADx1P14QxWESTlx+ZXpT0nizmEt2vWvuJcS08WElxgN3Pvg0AzxVN/tq2Ms
 Nvbe1YwkHQkefYKD/1x9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E80EoNefGI4=:hA+0zQoKLlf+BQD9ZkueYL
 OwOcjoVWLLcyGHkRealuVJDeUlOqpJwTPMf2cXw2S+SI/F7cibAvfC8cmDsIocaoh2SH5wHSq
 7666XsEGHZxyJvPfP/2ZO81H2sxK5tgys1XuRURo3HHCrPKxBJlAtUn9D34cV+Z5rzs57xCuz
 VfXY4zoa/SZBk9N/6sXj+u8cg9K6tkq54z9Guhz+M1fcvmLmkRWglyZSZxzr7MsRfIp178uTS
 p5FOJ3WYo3YwfxskuRoFca1TKA8ugPfbG95h3+EHgl3/3+oHMvgYwwSayoH2DcfFt72k5nXY1
 M5QeNIPinGW/LHqXipt8f1MP9yzIBUZpV9p9QHFp8+EQT6F/iv3gZO94JrOjmrKrvMhy5y2ip
 GuKfbkITmnNeXMiky9prRN0BfBoE9dwYQYmbEs53MWi2ge3l1gV3x1u2QhPJjWHxO442l420d
 xgfUjhZbMVMx7tzMOd+GfvLU7UKqFL1Jegi7BoGNd+pUeKSOekm5eZlJ8HbG+ZI40RMP1gEBc
 3brqNgzXnxn7sXlDjG5FMRbqFtv2BamsppP+9Aqn6dEFwNx738NZNIq0KmF7IEb37iVDxFuGb
 sGjTuP378FZkAieCGoMt/e8VcHFGWywIbsBalI7ZCx81Ap/GQjvAHfTkMyZgFtmZ7E0EKjShK
 tckhSHuJ4Qnhy3QbHXUYXXCXdVt106w/eJG1jMEBVbJ0Msy3PcFYbNa21JTFX3V8Hs6aWytIX
 sstb/76FQDkk/XN02iQOWrNPGbGFYHXveg+DEjXkKrxy3ocmvbjwWFbm4vsj/Yp/h6miPRyLR
 pBeBQVUZ6K1J2uQ1XTNp4AJa6VujG3HB+7dvFMT0kM0VdPTtH8CVcvkdfyCYzGdjKJQyw4P5W
 5a/a6obq4q1zslVEiQuA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.133
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
> RTC_WKALM_SET, RTC_WKALM_GET - Getting/Setting wakeup alarm
> 
>     Some RTCs support a more powerful alarm interface, using these
>     ioctls to read or write the RTC's alarm time (respectively)
>     with this structure:
> 
>         struct rtc_wkalrm {
>             unsigned char enabled;
>             unsigned char pending;
>             struct rtc_time time;
>         };
> 
>     The enabled flag is used to enable or disable the alarm
>     interrupt, or to read its current status; when using these
>     calls, RTC_AIE_ON and RTC_AIE_OFF are not used. The pending
>     flag is used by RTC_WKALM_RD to report a pending interrupt
>     (so it's mostly useless on Linux, except when talking to the
>     RTC managed by EFI firmware). The time field is as used with
>     RTC_ALM_READ and RTC_ALM_SET except that the tm_mday, tm_mon,
>     and tm_year fields are also valid. A pointer to this structure
>     should be passed as the third ioctl's argument.
> 
> Implementation notes:
> 
>     All ioctls in this patch have a pointer to a structure
>     rtc_wkalrm as their third argument. That is the reason why
>     corresponding definition is added in linux-user/syscall_types.h.
>     Since all  elements of this structure are either of type
>     'unsigned char' or 'struct rtc_time' (that was covered in one
>     of previous patches), the rest of the implementation is
>     straightforward.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
> ---
>  linux-user/ioctls.h        | 2 ++
>  linux-user/syscall_defs.h  | 2 ++
>  linux-user/syscall_types.h | 5 +++++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index accbdee..b09396e 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -85,6 +85,8 @@
>       IOCTL(RTC_IRQP_SET, IOC_W, TYPE_ULONG)
>       IOCTL(RTC_EPOCH_READ, IOC_R, MK_PTR(TYPE_ULONG))
>       IOCTL(RTC_EPOCH_SET, IOC_W, TYPE_ULONG)
> +     IOCTL(RTC_WKALM_RD, IOC_R, MK_PTR(MK_STRUCT(STRUCT_rtc_wkalrm)))
> +     IOCTL(RTC_WKALM_SET, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rtc_wkalrm)))
>  
>       IOCTL(BLKROSET, IOC_W, MK_PTR(TYPE_INT))
>       IOCTL(BLKROGET, IOC_R, MK_PTR(TYPE_INT))
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index bbfa935..37504a2 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -780,6 +780,8 @@ struct target_pollfd {
>  #define TARGET_RTC_IRQP_SET         TARGET_IOW('p', 0x0c, abi_ulong)
>  #define TARGET_RTC_EPOCH_READ       TARGET_IOR('p', 0x0d, abi_ulong)
>  #define TARGET_RTC_EPOCH_SET        TARGET_IOW('p', 0x0e, abi_ulong)
> +#define TARGET_RTC_WKALM_RD         TARGET_IOR('p', 0x10, struct rtc_wkalrm)
> +#define TARGET_RTC_WKALM_SET        TARGET_IOW('p', 0x0f, struct rtc_wkalrm)
>  
>  #if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4) ||    \
>         defined(TARGET_XTENSA)
> diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
> index a35072a..820bc8e 100644
> --- a/linux-user/syscall_types.h
> +++ b/linux-user/syscall_types.h
> @@ -266,6 +266,11 @@ STRUCT(rtc_time,
>         TYPE_INT, /* tm_yday */
>         TYPE_INT) /* tm_isdst */
>  
> +STRUCT(rtc_wkalrm,
> +       TYPE_CHAR, /* enabled */
> +       TYPE_CHAR, /* pending */
> +       MK_STRUCT(STRUCT_rtc_time)) /* time */
> +
>  STRUCT(blkpg_ioctl_arg,
>         TYPE_INT, /* op */
>         TYPE_INT, /* flags */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

