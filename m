Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A1522992A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 15:27:22 +0200 (CEST)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyEmI-00010s-1Q
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 09:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jyElU-0000Ym-BP
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 09:26:32 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:48557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jyElS-00014b-IQ
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 09:26:32 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N95qT-1kvVX21gt5-016C5F; Wed, 22 Jul 2020 15:26:27 +0200
Subject: Re: [PATCH 1/2] linux-user: Modify
 'target_to_host/host_to_target_itimerspec()'
To: Filip Bozuta <Filip.Bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200722111024.272553-1-Filip.Bozuta@syrmia.com>
 <20200722111024.272553-2-Filip.Bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4e7f0a57-042b-bd15-2555-9322de779d0a@vivier.eu>
Date: Wed, 22 Jul 2020 15:26:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200722111024.272553-2-Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bRN+g4NXDg0SvJQvltyXhYbKT/W+HrfWihDHdKak90zizzty7Zy
 DhPWMOvrn2Kv93xW1ulx/8Fsssd7HMuo85W7sgLUrbupBBLwPbBzcBhMlIXbG6elqQ5O0I/
 Fud6q0zb38z2ark096srSq4pLB2Sj6IDZoL5Ax4JHZvATGReyRmvw7gTfAeBo+6DYVbi4aO
 GkyuIZfhH9uRiB7X3iuGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YZr3MdyWCT8=:np071Ec7hNr9gtvgkq+anh
 lJgwWSLjENwOrTUnCSyr48vj4pfZ35aun5THXC8Oodiqk47/SnP9vlrexU0N6581FugpPZshZ
 S99HfeMMpI8POTeiDTE9ooCW/VeN8lF66BF/Svqf+kuyUVWeBSensz5Nv9qNfyLeIH5ozTwZ8
 90iSZZATn9kJbg0jS1Nm8DRXxzBJFQzifgdtMeFQS1hjR/kmv3BGjhqyyS21//FIhofuruU/Y
 l7vmNq1MvepfHuzCP8Owqj1NwDqaawwNeEmWlESCuC2198vFRbO462iRLyUCDUtH3wcGdLj3I
 mIvB92ERsLiua7o7Ez0abVLGuyh17fNaYvnyNoz2xFQ8Ha/8zNf+ji1yvDr4T7nyItVTU+Dop
 x8jycz0ZKDH2Q/ManAMMenZ06o4vcmvfQVxtMkdhOgnLeeZqmEsKTPiSiA7MtSk0TPhX6PW6Q
 3Z73wuvmhQf0oWDfkV/Me6I13x0GXJQuSoDDODhAO1LZfb6Tc6qxYjJ9XYZVpZfC4qwQlYxrw
 ui3GESJqMPtZ+u3LHTHQSEU+3DR5CaNKjgnn8XrOpbv1siQcDUWCohEeDPpa6psEcjgk/qCjS
 zl0hZVnIXkVey01B4o81W6MePFr3ORRM25FB2wZx5SshFaim3gZwzvA+O/lCBk1HNWlnFHGVA
 77DMvaIkl7TCg/dDbnApjGsfq+V0Gt/hvoxCZH3GM6X/1+7eBP84uGctZCsIoOJswPvHZZP7P
 tXIkOVPQWzJv3EYBQqmmBcZrsrOL5qxD1nKAOclRypj+blZALKnwgO8dcRl8mlCOXCjntYlah
 F76Afr/Lv3FKhXHqXFalg4/P1wCjpjzZq8E978ZtjclnBM/D6MBDtNijr50/OdG1SeeJOsg
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 08:04:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/07/2020 à 13:10, Filip Bozuta a écrit :
> Functions 'target_to_host_itimerspec()' and 'host_to_target_itimerspec()'
> are used to convert values of type 'struct itimerspec' between target and
> host. This type has 'struct timespec' as its fields. That is the reason
> why this patch introduces a little modification to the converting functions
> to be implemented using already existing functions that convert 'struct timespec':
> 'target_to_host_timespec()' and 'host_to_target_timespec()'. This makes the
> code of 'target_to_host_itimerspec()' and 'host_to_target_itimerspec()' more
> clean and readable.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  linux-user/syscall.c | 38 ++++++++++++--------------------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1211e759c2..17e09c3cd3 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1236,7 +1236,9 @@ static inline abi_long copy_to_user_timeval64(abi_ulong target_tv_addr,
>      defined(TARGET_NR_nanosleep) || defined(TARGET_NR_clock_settime) || \
>      defined(TARGET_NR_utimensat) || defined(TARGET_NR_mq_timedsend) || \
>      defined(TARGET_NR_mq_timedreceive) || defined(TARGET_NR_ipc) || \
> -    defined(TARGET_NR_semop) || defined(TARGET_NR_semtimedop)
> +    defined(TARGET_NR_semop) || defined(TARGET_NR_semtimedop) || \
> +    defined(TARGET_NR_timer_settime) || \
> +    (defined(TARGET_NR_timerfd_settime) && defined(CONFIG_TIMERFD))
>  static inline abi_long target_to_host_timespec(struct timespec *host_ts,
>                                                 abi_ulong target_addr)
>  {
> @@ -6790,46 +6792,30 @@ static inline abi_long target_ftruncate64(void *cpu_env, abi_long arg1,
>  
>  #if defined(TARGET_NR_timer_settime) || \
>      (defined(TARGET_NR_timerfd_settime) && defined(CONFIG_TIMERFD))
> -static inline abi_long target_to_host_itimerspec(struct itimerspec *host_itspec,
> +static inline abi_long target_to_host_itimerspec(struct itimerspec *host_its,
>                                                   abi_ulong target_addr)
>  {
> -    struct target_itimerspec *target_itspec;
> -
> -    if (!lock_user_struct(VERIFY_READ, target_itspec, target_addr, 1)) {
> +    if (target_to_host_timespec(&host_its->it_interval, target_addr) ||
> +        target_to_host_timespec(&host_its->it_value, target_addr +
> +                                sizeof(struct target_timespec))) {

The "+ sizeof(struct target_timespec)" ignores possible type alignment
in the structure.

I think it is safer to use "+ offsetof(struct target_timespec,
it_interval)" for the first one and "+ offsetof(struct target_timespec,
it_value)" for the second one.

Thanks,
Laurent

