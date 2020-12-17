Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9582DD03C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:21:48 +0100 (CET)
Received: from localhost ([::1]:35350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprLu-0004gY-TY
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprKS-000424-3A
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:20:16 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:33985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprKN-0000jm-ED
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:20:15 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mof1D-1kIfEl2sOX-00p7GV; Thu, 17 Dec 2020 12:19:58 +0100
Subject: Re: [PATCH v4] linux-user: Add most IFTUN ioctls
To: Shu-Chun Weng <scw@google.com>, qemu-devel@nongnu.org
References: <20200929014801.655524-1-scw@google.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <697281a2-21a8-695a-a9bf-831838f0467d@vivier.eu>
Date: Thu, 17 Dec 2020 12:19:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20200929014801.655524-1-scw@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BnwfOc0JOBUqIbrdGI48rzunVp/WwXl643BfumwpsVQMxcOdQ83
 9dHsQxFzy0JkbOaW7twTjXPqiXMkuY7TCseo4mP7iu5Gb3+95Y660HJHZskVFrHDIo+1IJL
 iOp/gKGcjAum8A/isuOondbhHOodmIgqhCB63HS4Mtdy2UW4jaIxse0eOaNEOmu0LP8BLDT
 DMWEbLSKjWhR+xtxqGlJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4XZaXGOuqnI=:EAwAZ1TP+7IGyvgBdMh/9U
 27HuutdmSgw4U8Pg43V2LQEimuQSEMLXWQUxa6X8/d6IarG2sa1yLUGpnXORetTlotSPYyNVr
 7a4TARzodTN6iRkkdMYBgNCSrg1QgaXNjudlKkYVWQ5luR7PLU4U3yFQ0i+nFGKwea1HZ4xs0
 3TR39HUyna4vMcI24SHynaBSrcTGCB1VqwFQDWRsS0JC356ZQJOynE3OqYJ5Rfk2Sfe1THnX9
 4SySvRo/ZWwGSIY1Zwv7HNabSPMUx0V71vUg9qY+aJUqjbF1NUrtaidjyLRRHEfljbTFFYJHa
 SpJDpzRd2mUftpUkwaALRAnU+l+LeEvZZSBBgpWYZy+lMHkNeckzUmQVwFrlpVeBVtPgTCosX
 uZNsVzWs4ucb28VbR0AhsVrIJ0dxVYo/XL12d1TfgHzLCwZOabz+r7MhpgrdCydPC1xvBBmoF
 u0ONcRo0lg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: Josh Kunz <jkz@google.com>, riku.voipio@iki.fi
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/09/2020 à 03:48, Shu-Chun Weng via a écrit :
> The three options handling `struct sock_fprog` (TUNATTACHFILTER,
> TUNDETACHFILTER, and TUNGETFILTER) are not implemented. Linux kernel
> keeps a user space pointer in them which we cannot correctly handle.
> 
> Signed-off-by: Josh Kunz <jkz@google.com>
> Signed-off-by: Shu-Chun Weng <scw@google.com>
> ---
> v2->v3:
>   IOCTL_SPECIAL(TUNSETTXFILTER) type changed to MK_PTR(TYPE_PTRVOID) for strace
>   to display the raw pointer.
> 
>   Updated do_ioctl_TUNSETTXFILTER for correct usages of unlock_user() and
>   offsetof().
> 
> v3->v4:
>   IOCTL_SPECIAL(TUNSETTXFILTER) corrected to TYPE_PTRVOID.
> 
>  linux-user/ioctls.h       | 46 +++++++++++++++++++++++++++++++++++++++
>  linux-user/syscall.c      | 38 ++++++++++++++++++++++++++++++++
>  linux-user/syscall_defs.h | 32 +++++++++++++++++++++++++++
>  3 files changed, 116 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 0713ae1311..c6e5926eb4 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -593,3 +593,49 @@
>    IOCTL(KCOV_DISABLE, 0, TYPE_NULL)
>    IOCTL(KCOV_INIT_TRACE, IOC_R, TYPE_ULONG)
>  #endif
> +
> +  IOCTL(TUNSETDEBUG,     IOC_W, TYPE_INT)
> +  IOCTL(TUNSETIFF,       IOC_RW, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
> +  IOCTL(TUNSETPERSIST,   IOC_W, TYPE_INT)
> +  IOCTL(TUNSETOWNER,     IOC_W, TYPE_INT)
> +  IOCTL(TUNSETLINK,      IOC_W, TYPE_INT)
> +  IOCTL(TUNSETGROUP,     IOC_W, TYPE_INT)
> +  IOCTL(TUNGETFEATURES,  IOC_R, MK_PTR(TYPE_INT))
> +  IOCTL(TUNSETOFFLOAD,   IOC_W, TYPE_LONG)
> +  IOCTL_SPECIAL(TUNSETTXFILTER, IOC_W, do_ioctl_TUNSETTXFILTER,
> +                /*
> +                 * We can't represent `struct tun_filter` in thunk so leaving
> +                 * it uninterpreted. do_ioctl_TUNSETTXFILTER will do the
> +                 * conversion.
> +                 */
> +                TYPE_PTRVOID)
> +  IOCTL(TUNGETIFF,       IOC_R, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
> +  IOCTL(TUNGETSNDBUF,    IOC_R, MK_PTR(TYPE_INT))
> +  IOCTL(TUNSETSNDBUF,    IOC_W, MK_PTR(TYPE_INT))
> +  /*
> +   * TUNATTACHFILTER and TUNDETACHFILTER are not supported. Linux kernel keeps a
> +   * user pointer in TUNATTACHFILTER, which we are not able to correctly handle.
> +   */
> +  IOCTL(TUNGETVNETHDRSZ, IOC_R, MK_PTR(TYPE_INT))
> +  IOCTL(TUNSETVNETHDRSZ, IOC_W, MK_PTR(TYPE_INT))
> +  IOCTL(TUNSETQUEUE,     IOC_W, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
> +  IOCTL(TUNSETIFINDEX ,  IOC_W, MK_PTR(TYPE_INT))
> +  /* TUNGETFILTER is not supported: see TUNATTACHFILTER. */
> +  IOCTL(TUNSETVNETLE,    IOC_W, MK_PTR(TYPE_INT))
> +  IOCTL(TUNGETVNETLE,    IOC_R, MK_PTR(TYPE_INT))
> +#ifdef TUNSETVNETBE
> +  IOCTL(TUNSETVNETBE,    IOC_W, MK_PTR(TYPE_INT))
> +  IOCTL(TUNGETVNETBE,    IOC_R, MK_PTR(TYPE_INT))
> +#endif
> +#ifdef TUNSETSTEERINGEBPF
> +  IOCTL(TUNSETSTEERINGEBPF, IOC_W, MK_PTR(TYPE_INT))
> +#endif
> +#ifdef TUNSETFILTEREBPF
> +  IOCTL(TUNSETFILTEREBPF, IOC_W, MK_PTR(TYPE_INT))
> +#endif
> +#ifdef TUNSETCARRIER
> +  IOCTL(TUNSETCARRIER,   IOC_W, MK_PTR(TYPE_INT))
> +#endif
> +#ifdef TUNGETDEVNETNS
> +  IOCTL(TUNGETDEVNETNS,  IOC_R, TYPE_NULL)
> +#endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 945fc25279..1c955bc675 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -56,6 +56,7 @@
>  #include <linux/wireless.h>
>  #include <linux/icmp.h>
>  #include <linux/icmpv6.h>
> +#include <linux/if_tun.h>
>  #include <linux/errqueue.h>
>  #include <linux/random.h>
>  #ifdef CONFIG_TIMERFD
> @@ -5415,6 +5416,43 @@ static abi_long do_ioctl_drm(const IOCTLEntry *ie, uint8_t *buf_temp,
>  
>  #endif
>  
> +static abi_long do_ioctl_TUNSETTXFILTER(const IOCTLEntry *ie, uint8_t *buf_temp,
> +                                        int fd, int cmd, abi_long arg)
> +{
> +    struct tun_filter *filter = (struct tun_filter *)buf_temp;
> +    struct tun_filter *target_filter;
> +    char *target_addr;
> +
> +    assert(ie->access == IOC_W);
> +
> +    target_filter = lock_user(VERIFY_READ, arg, sizeof(*target_filter), 1);
> +    if (!target_filter) {
> +        return -TARGET_EFAULT;
> +    }
> +    filter->flags = tswap16(target_filter->flags);
> +    filter->count = tswap16(target_filter->count);
> +    unlock_user(target_filter, arg, 0);
> +
> +    if (filter->count) {
> +        if (offsetof(struct tun_filter, addr) + filter->count * ETH_ALEN >
> +            MAX_STRUCT_SIZE) {
> +            return -TARGET_EFAULT;
> +        }
> +
> +        target_addr = lock_user(VERIFY_READ,
> +                                arg + offsetof(struct tun_filter, addr),
> +                                filter->count * ETH_ALEN, 1);
> +        if (!target_addr) {
> +            return -TARGET_EFAULT;
> +        }
> +        memcpy(filter->addr, target_addr, filter->count * ETH_ALEN);
> +        unlock_user(target_addr, arg + offsetof(struct tun_filter, addr),
> +                    filter->count * ETH_ALEN);
> +    }
> +
> +    return get_errno(safe_ioctl(fd, ie->host_cmd, filter));
> +}
> +
>  IOCTLEntry ioctl_entries[] = {
>  #define IOCTL(cmd, access, ...) \
>      { TARGET_ ## cmd, cmd, #cmd, access, 0, {  __VA_ARGS__ } },
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 3c261cff0e..7ef0ff0328 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -891,6 +891,38 @@ struct target_rtc_pll_info {
>  
>  #define TARGET_SIOCGIWNAME     0x8B01          /* get name == wireless protocol */
>  
> +/* From <linux/if_tun.h> */
> +
> +#define TARGET_TUNSETDEBUG        TARGET_IOW('T', 201, int)
> +#define TARGET_TUNSETIFF          TARGET_IOW('T', 202, int)
> +#define TARGET_TUNSETPERSIST      TARGET_IOW('T', 203, int)
> +#define TARGET_TUNSETOWNER        TARGET_IOW('T', 204, int)
> +#define TARGET_TUNSETLINK         TARGET_IOW('T', 205, int)
> +#define TARGET_TUNSETGROUP        TARGET_IOW('T', 206, int)
> +#define TARGET_TUNGETFEATURES     TARGET_IOR('T', 207, unsigned int)
> +#define TARGET_TUNSETOFFLOAD      TARGET_IOW('T', 208, unsigned int)
> +#define TARGET_TUNSETTXFILTER     TARGET_IOW('T', 209, unsigned int)
> +#define TARGET_TUNGETIFF          TARGET_IOR('T', 210, unsigned int)
> +#define TARGET_TUNGETSNDBUF       TARGET_IOR('T', 211, int)
> +#define TARGET_TUNSETSNDBUF       TARGET_IOW('T', 212, int)
> +/*
> + * TUNATTACHFILTER and TUNDETACHFILTER are not supported. Linux kernel keeps a
> + * user pointer in TUNATTACHFILTER, which we are not able to correctly handle.
> + */
> +#define TARGET_TUNGETVNETHDRSZ    TARGET_IOR('T', 215, int)
> +#define TARGET_TUNSETVNETHDRSZ    TARGET_IOW('T', 216, int)
> +#define TARGET_TUNSETQUEUE        TARGET_IOW('T', 217, int)
> +#define TARGET_TUNSETIFINDEX      TARGET_IOW('T', 218, unsigned int)
> +/* TUNGETFILTER is not supported: see TUNATTACHFILTER. */
> +#define TARGET_TUNSETVNETLE       TARGET_IOW('T', 220, int)
> +#define TARGET_TUNGETVNETLE       TARGET_IOR('T', 221, int)
> +#define TARGET_TUNSETVNETBE       TARGET_IOW('T', 222, int)
> +#define TARGET_TUNGETVNETBE       TARGET_IOR('T', 223, int)
> +#define TARGET_TUNSETSTEERINGEBPF TARGET_IOR('T', 224, int)
> +#define TARGET_TUNSETFILTEREBPF   TARGET_IOR('T', 225, int)
> +#define TARGET_TUNSETCARRIER      TARGET_IOW('T', 226, int)
> +#define TARGET_TUNGETDEVNETNS     TARGET_IO('T', 227)
> +
>  /* From <linux/random.h> */
>  
>  #define TARGET_RNDGETENTCNT    TARGET_IOR('R', 0x00, int)
> 

Applied to my linux-user-for-6.0 branch

Thanks,
Laurent

