Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704BF6079A7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:33:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olt5k-0005Mq-Ri
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:33:45 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olt56-0006Qk-99
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olt4v-0005LF-Ve
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:32:54 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olt4t-0007DJ-5R
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:32:52 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGz9p-1opzp829jv-00E3Tn; Fri, 21 Oct 2022 16:32:45 +0200
Message-ID: <549a9009-f657-750f-8acb-6c7715e7fb97@vivier.eu>
Date: Fri, 21 Oct 2022 16:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 4/4] linux-user: drop conditionals for obsolete kernel
 header versions
Content-Language: fr
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-5-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221004093206.652431-5-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qflWqc+9HeUBZ+1kYU2RxH1qSbxM+ZUbx29SK2SmhMCLoBDJaxS
 imRdbWLHQw8b4SUQk0AEiB/H4SHnHONucfPFu8nz+Uj3n7IJY+CabkqovwgcvZ7Dh2or4qL
 uEzS8rpwLARIGQg3jOhsumP6vIdBTnnrzu8gyru6T/GnQIbuCfUciDU7lboQW3hrSNHhnp3
 64Jm089Cr0sRwVElwvnaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9A8CvB7nk4k=:MTn9PQTIiKsXOAMJbPQVJx
 vUczQwUOwYh+czVyuwkeoaUNI3+oRn5db6F+8hKK2b+nd2hqmKeh/mZOX8SZPZPGLHEskApYO
 9z3ddHQH8KG2wJefi9wcSg0YZBZMS0LZwIT5hntqwVCunm7yXXkXgkPdZmC+uiXFSmctFNKJ1
 fkNGF7PV52RUz8SxjdHwyi60D11Ut9KT4Lb+584xRNdgEbtZb+enfN7FiVvTI4OjTXGrtJBgy
 a1Gio4y5sloqcoWMgFo4C7LC5bt0+Z7/BDvB1ew3+6BpymTDpj0mp3AusddzJhpf5Q6/o8AEx
 dhzNmmthBub31FeRZEwKLfBejWvjw7DZaUrEo9eT8F1qajT/5uvE9pML/ejGM7W8J8nu1fyAK
 k0FOOi/8Vke2fNwuYk8vm2QsW+dGVW6maxuvGSo7grE1g3kndAQSh767z6QWqcQuvOFxKmwza
 htXVNNrbWP5WKszsAXz9Cq2YT1t/KV/VWueZfBdbkt/Psp+jQ+TiCspHb3vqee9BPYXzdMRaJ
 CCEMgaAUmMXkwvD+7cOz4wP1X6gSQITnj9fURBPYQY/PzSHP2aopplgvDY8W0g8aHCFixahHd
 HaLlZnGrZJFHoOHg23Mqppp5N3bOI30qwK54/4OdDcawU4IH+RQO2ZuqWuOThn1Zcn7U7GhEm
 o3aR24bawQ5EYZylm9zEJmnLncSxYHLpQFXj7zSR2Xpg9IYe2qtajr3B/13UwCu6cNcK154av
 UI+uvWxHjNPvg6eR/NzyL2faevaLlzDMgo93LTM0ultRW4vQ4UhMb8M6AaOrnRhsG4Rlc/5Ws
 mosWpfx
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/10/2022 à 11:32, Daniel P. Berrangé a écrit :
> Given our newly enforced 4.18 baseline for the kernel headers version,
> we can drop any conditional checks for older versions.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   linux-user/linux_loop.h    |  4 ----
>   linux-user/syscall.c       | 14 ++------------
>   tests/tcg/i386/test-i386.c | 10 +++-------
>   3 files changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/linux-user/linux_loop.h b/linux-user/linux_loop.h
> index f80b96f1ff..5a9e0edef2 100644
> --- a/linux-user/linux_loop.h
> +++ b/linux-user/linux_loop.h
> @@ -31,10 +31,6 @@ enum {
>   #include <asm/posix_types.h>	/* for __kernel_old_dev_t */
>   #include <asm/types.h>		/* for __u64 */
>   
> -#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0) /* This is a guess.  */
> -#define __kernel_old_dev_t __kernel_dev_t
> -#endif
> -
>   /* Backwards compatibility version */
>   struct loop_info {
>   	int		   lo_number;		/* ioctl r/o */
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f6a15df69d..377867907a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2540,16 +2540,12 @@ set_timeout:
>           case NETLINK_DROP_MEMBERSHIP:
>           case NETLINK_BROADCAST_ERROR:
>           case NETLINK_NO_ENOBUFS:
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
>           case NETLINK_LISTEN_ALL_NSID:
>           case NETLINK_CAP_ACK:
> -#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0) */
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
>           case NETLINK_EXT_ACK:
> -#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0) */
>   #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)
>           case NETLINK_GET_STRICT_CHK:
> -#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0) */
> +#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0) */
>               break;
>           default:
>               goto unimplemented;
> @@ -2918,16 +2914,12 @@ get_timeout:
>           case NETLINK_PKTINFO:
>           case NETLINK_BROADCAST_ERROR:
>           case NETLINK_NO_ENOBUFS:
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
>           case NETLINK_LISTEN_ALL_NSID:
>           case NETLINK_CAP_ACK:
> -#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0) */
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
>           case NETLINK_EXT_ACK:
> -#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0) */
>   #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)
>           case NETLINK_GET_STRICT_CHK:
> -#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0) */
> +#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0) */
>               if (get_user_u32(len, optlen)) {
>                   return -TARGET_EFAULT;
>               }
> @@ -2944,7 +2936,6 @@ get_timeout:
>                   return -TARGET_EFAULT;
>               }
>               break;
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
>           case NETLINK_LIST_MEMBERSHIPS:
>           {
>               uint32_t *results;
> @@ -2975,7 +2966,6 @@ get_timeout:
>               unlock_user(results, optval_addr, 0);
>               break;
>           }
> -#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0) */
>           default:
>               goto unimplemented;
>           }
> diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
> index 864c4e620d..881b45cd19 100644
> --- a/tests/tcg/i386/test-i386.c
> +++ b/tests/tcg/i386/test-i386.c
> @@ -1224,10 +1224,6 @@ static inline int modify_ldt(int func, void * ptr, unsigned long bytecount)
>       return syscall(__NR_modify_ldt, func, ptr, bytecount);
>   }
>   
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 5, 66)
> -#define modify_ldt_ldt_s user_desc
> -#endif
> -
>   #define MK_SEL(n) (((n) << 3) | 7)
>   
>   uint8_t seg_data1[4096];
> @@ -1265,7 +1261,7 @@ uint8_t seg_data2[4096];
>   /* NOTE: we use Linux modify_ldt syscall */
>   void test_segs(void)
>   {
> -    struct modify_ldt_ldt_s ldt;
> +    struct user_desc ldt;
>       long long ldt_table[3];
>       int res, res2;
>       char tmp;
> @@ -1367,7 +1363,7 @@ extern char code16_func3;
>   
>   void test_code16(void)
>   {
> -    struct modify_ldt_ldt_s ldt;
> +    struct user_desc ldt;
>       int res, res2;
>   
>       /* build a code segment */
> @@ -1774,7 +1770,7 @@ void test_exceptions(void)
>       }
>   
>       {
> -        struct modify_ldt_ldt_s ldt;
> +        struct user_desc ldt;
>           ldt.entry_number = 1;
>           ldt.base_addr = (unsigned long)&seg_data1;
>           ldt.limit = (sizeof(seg_data1) + 0xfff) >> 12;

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


