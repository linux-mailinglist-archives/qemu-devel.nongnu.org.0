Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32E67B327
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:21:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfha-0007sz-Ro; Wed, 25 Jan 2023 08:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfhB-0007oE-UF
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:20:10 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfhA-00034a-11
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:20:09 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2Ujn-1ogPYQ3eUZ-013x7E; Wed, 25 Jan 2023 14:20:06 +0100
Message-ID: <14ec347c-1551-12e9-344c-78442c30e405@vivier.eu>
Date: Wed, 25 Jan 2023 14:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: un-parent OBJECT(cpu) when closing thread
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230124201019.3935934-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230124201019.3935934-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jDlkWbSqtM194hHiv/q35WSLBB+0cgUhPun3KGtk/JFD3zb7GUf
 XM2vvMeYgwILPU8+5/qq6JZZAiKReny/O98VDQZxMO1dfsIwN89eilFspGMCnieqI99V25t
 7Yb24Svn2sxV2ApI2eSCwBMqt8JI/0BG6kmtKIVXN+ozvTaAtU4o6q6jFYEBWiTg6vcqpi8
 YjkTOes8QOzsEpQ4WT97Q==
UI-OutboundReport: notjunk:1;M01:P0:ORmNoYZbKPA=;SKjFIsJrPwlrClUSiQiy+BAkdsK
 t1KNymBrcnQ/3BPWpkEMeD3ybDXdc4RWO8+Sbpm3+kK8ltxSE1T20nbT0aRdMPX3z5rQyRehr
 0XNH5kQXobqE4a5yA1YzbGr84tPOgY5r4il+rn4LdYrEJKVIMDufxLIv85sNn03y88V+YLJ60
 QV+SwX/QL9YOfHar3oGd8IHjDRUqRsYVghnLxQRBseQysUASTqOBPc3F906oeprlKiSdSGiGZ
 v8NGzehVq0sNhasezbmieSir9PaC7CLMH9wxOrN2nRw3Gh6ISzylPk+Fva1G3gOZysWMHfNJ2
 xDpQvQeAFAGLIGpsBD6r+J9IcthTY0yk47XE2BsYac4mctzQAIs4d/DES/TkjjrL+uI4HMQZ9
 4mpmzkLAfEUXQ/FW0RrMMAyYTOqxfku963vyTpP6jTIONA/zNBlqfU4moxlsOfWZ032lhwRHn
 1vwiFfYC7/QjxF4uVdP1rKHaQ+oPCat/qvpHz0kjAgO4R3yximhvU9kKKSwVg760hctHx22Lo
 nRanfZKc80gQkA94keXDHXdahjqf69gAAAuKsZjK7QRGAjq22wWTbXtri9dD64P9XCj4piwTF
 +gSf9kWxwLmPrA32Y/UKfr31jbZlMjLVwyLTdL5QSODu0J9FW5nQ0zXKdHiyvH5Myt9CuGFGK
 H0jlekEj+/cedKK83vSNWo/rMDETfvUXSSMN96bpug==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 24/01/2023 à 21:10, Richard Henderson a écrit :
> This reinstates commit 52f0c1607671293afcdb2acc2f83e9bccbfa74bb:
> 
> While forcing the CPU to unrealize by hand does trigger the clean-up
> code we never fully free resources because refcount never reaches
> zero. This is because QOM automatically added objects without an
> explicit parent to /unattached/, incrementing the refcount.
> 
> Instead of manually triggering unrealization just unparent the object
> and let the device machinery deal with that for us.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <20220811151413.3350684-2-alex.bennee@linaro.org>
> 
> The original patch tickled a problem in target/arm, and was reverted.
> But that problem is fixed as of commit 3b07a936d3bf.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1f8c10f8ef..4ca1b59343 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8642,7 +8642,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           if (CPU_NEXT(first_cpu)) {
>               TaskState *ts = cpu->opaque;
>   
> -            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
> +            if (ts->child_tidptr) {
> +                put_user_u32(0, ts->child_tidptr);
> +                do_sys_futex(g2h(cpu, ts->child_tidptr),
> +                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
> +            }
> +
> +            object_unparent(OBJECT(cpu));
>               object_unref(OBJECT(cpu));
>               /*
>                * At this point the CPU should be unrealized and removed
> @@ -8652,11 +8658,6 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>   
>               pthread_mutex_unlock(&clone_lock);
>   
> -            if (ts->child_tidptr) {
> -                put_user_u32(0, ts->child_tidptr);
> -                do_sys_futex(g2h(cpu, ts->child_tidptr),
> -                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
> -            }
>               thread_cpu = NULL;
>               g_free(ts);
>               rcu_unregister_thread();

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


