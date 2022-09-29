Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719375EFDF2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:31:41 +0200 (CEST)
Received: from localhost ([::1]:55032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odzG0-0006I3-J4
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odzDZ-0003to-G1; Thu, 29 Sep 2022 15:29:09 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:49369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odzDX-0008OU-OV; Thu, 29 Sep 2022 15:29:09 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MFKbB-1oSfSv02HJ-00FkNH; Thu, 29 Sep 2022 21:29:00 +0200
Message-ID: <cbc7643d-40e3-a083-828a-2fafd79f34d2@vivier.eu>
Date: Thu, 29 Sep 2022 21:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] Drop superfluous conditionals around g_free()
Content-Language: fr
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, mtosatti@redhat.com,
 sunilmut@microsoft.com, qemu-trivial@nongnu.org
References: <20220923090428.93529-1-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220923090428.93529-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ylFc4fLbCgq5fTHebFJbVmSVX6RExaIu+ClYh1r3V9clTwZUKFg
 gKM76+5UdLjKNyyeH61wIuCElnefR7PCooV22Lz09UxRvny/ewf32r2oYtvg778fqf5slbd
 Vx/ksfrq7a609PB7mGNncV02tC0rFiHnTYKgQykUug0ODJfB0w25vv8YCcsSIX3+eYN0hvv
 HKGRd4NOHSGd88FhZ9nPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ktj2herafiE=:ae33yk3u96zKaDEsnXjEJ7
 hUcNiotsMLFGe0Jzz1i8ELLf5rIxt4aQOMYWYLXI0eqVab+yUPER+wwQJKU4b5UfxiQbI69Vd
 NrZcORy59MxVgjfzXXJSXS+HyiiJveM2eGlyWBz65JqThYDBGaNO3s4+yDWwpq4vkAEV2lCxz
 UjQV8zsydokB5Qwhqpe0JIbNA3NvJUXFC+WkHCSicUjfTlEYexSM+zGwZ+FJp6LKZ5X1qyXuB
 Imm91SFNaiX8d/qBL/cdt8+PTQG7MHCpqHm7POawzLCQYwN4h3NFi9qFO8mxMQ87K0Oka1Mw2
 SlCw+ADAONW0kdhPiG3wj4rYvEOmblM7MpxxtIHMEUphsqapLhIQX8+H52U/VPKi3Xd7PT4TI
 x2cveoGz9o9vLMU2KSg5l6Okkqi7MYdcOVQjTHLxzEzpl8x9CLvKvv5WhgBo+yYKWG+70YKT3
 ZouPA/3wFdgr9nxVDl40T1uD1sDsFpmJ+S9aRIR8Bdbyz1EJJUjiwQgemt+x3dEAvfEqNrQUj
 iOQBM7eCbxsI3j4CrSokdg4Gnbww8w1uezp8nfU8yagVzbij3yF1BssfVmcCqWZgfNwR+G7AA
 jjMmmykH05+KnilwgdE07aaOkkenq6Gyr1gXCuAMIXZYRJyOVGIxt3cGprKBceoGgC6l+TtxG
 /7sNBWTeczuFZGFZZT/U6Ef9EBsmtYTzp8xuH1tJg6grdWNbECB0zluchhFYzKa+4ZNG7K67m
 sMRMp/Y9Gi6rIWKWwrEltcI2oIHl+yTanoIBX+f6MVFm6g1OdqUoDNqJDNWFoBfZr9JPWXeNp
 UvpCPwe
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.099,
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

Le 23/09/2022 à 11:04, Markus Armbruster a écrit :
> There is no need to guard g_free(P) with if (P): g_free(NULL) is safe.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   replay/replay.c             |  6 ++----
>   target/i386/kvm/kvm.c       | 12 ++++--------
>   target/i386/whpx/whpx-all.c | 14 ++++++--------
>   3 files changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/replay/replay.c b/replay/replay.c
> index 4c396bb376..9a0dc1cf44 100644
> --- a/replay/replay.c
> +++ b/replay/replay.c
> @@ -366,10 +366,8 @@ void replay_finish(void)
>           fclose(replay_file);
>           replay_file = NULL;
>       }
> -    if (replay_filename) {
> -        g_free(replay_filename);
> -        replay_filename = NULL;
> -    }
> +    g_free(replay_filename);
> +    replay_filename = NULL;
>   
>       g_free(replay_snapshot);
>       replay_snapshot = NULL;
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index a1fd1f5379..9603bf265a 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2176,15 +2176,11 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
>   
>       g_free(env->xsave_buf);
>   
> -    if (cpu->kvm_msr_buf) {
> -        g_free(cpu->kvm_msr_buf);
> -        cpu->kvm_msr_buf = NULL;
> -    }
> +    g_free(cpu->kvm_msr_buf);
> +    cpu->kvm_msr_buf = NULL;
>   
> -    if (env->nested_state) {
> -        g_free(env->nested_state);
> -        env->nested_state = NULL;
> -    }
> +    g_free(env->nested_state);
> +    env->nested_state = NULL;
>   
>       qemu_del_vm_change_state_handler(cpu->vmsentry);
>   
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index b22a3314b4..8e4969edeb 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -1225,14 +1225,12 @@ static void whpx_translate_cpu_breakpoints(
>           }
>       }
>   
> -    if (breakpoints->breakpoints) {
> -        /*
> -         * Free the previous breakpoint list. This can be optimized by keeping
> -         * it as shadow buffer for the next computation instead of freeing
> -         * it immediately.
> -         */
> -        g_free(breakpoints->breakpoints);
> -    }
> +    /*
> +     * Free the previous breakpoint list. This can be optimized by keeping
> +     * it as shadow buffer for the next computation instead of freeing
> +     * it immediately.
> +     */
> +    g_free(breakpoints->breakpoints);
>   
>       breakpoints->breakpoints = new_breakpoints;
>   }

Applied to my trivial-patches branch.

Thanks,
Laurent


