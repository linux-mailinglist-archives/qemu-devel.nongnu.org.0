Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F46381AC3
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:27:11 +0200 (CEST)
Received: from localhost ([::1]:60862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhzwM-0006Wy-Jx
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhzvP-0005U8-Vc; Sat, 15 May 2021 15:26:11 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhzvM-0006xW-C3; Sat, 15 May 2021 15:26:11 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MysiI-1lVZhX0LAI-00vwVn; Sat, 15 May 2021 21:25:49 +0200
Subject: Re: [PATCH v4 17/28] linux-user: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-18-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f6b4d61e-5b70-2d9d-1943-a848374f7759@vivier.eu>
Date: Sat, 15 May 2021 21:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210303214708.1727801-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kBYrzGuOYGorR32jKX3wzuZFhjzlWIm2J4kEHCGlovAT1p3/66O
 1aUNH3JfSvZDo9DlyBOcspIkZJ0eoIvEVgzP89aUBYtqvf5O0qYGjQ87c6ynw9KVyBCg9Yq
 CHqjiF3T0gdbRMBcFVdWo51V/YK5VdNqVz25Ps2s0sTzPUA3i+dCeT6Ltpx7Tn4nboves0x
 qhKz6afCn/RBdZXhxzwKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d5evw8aclaY=:XIaYfFh2dkD4ww/zAnr8Tz
 h84Zv7AJrAYW77u6LjYwoemKXUZublIBuBj6WYLdBZWtIUngWEFmz1k/DE+N3B+pH15kkdfts
 6rm5aD3xQmNe0QCVxXRlABrH6LtRDB30cIbO3VblMmWuvNP7dR2eiyL4/gd3pI070mUg0jfxJ
 IsqkEevGExcMsWojtFopLLIjQI4v/2/vkz4nIkpnzUmMUrXHLwVK6ysZfmXetspcR5OaEIHOl
 qWPl+lek92EQFPa7vatO9etGzvTCYcGL4p1Eh4l/3aDX53epTuiI09HbXIAj2hWPn71g0XvJF
 6ug7qnEZpzChTSAgHpm9i4ZNgGsD0oB+uc7+K8LqDc99VkBfgOSpZXwZJIkO/0paE8HPdrT27
 Q7GxySApHCP4yYS3ALcL+LCeVLJKNu/nZvv/ZwS0Z+gPhcMXnpCagxRHkk9bg4fWo3SUKwWCw
 xELfFZn/fZHeTu8MyMM9wnICnoCxEy+HYRYgdZPKmjMnNtLJAnkSSR+B3Tb1mAxWFMhAH5tEt
 hl4ilueQNp5ac/GW01wrjQ=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/03/2021 à 22:46, Philippe Mathieu-Daudé a écrit :
> We can not use watchpoints in user-mode emulation because we
> need the softmmu slow path to detect accesses to watchpointed
> memory. This code is expanded as empty stub in "hw/core/cpu.h"
> anyway, so we can drop it.
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/main.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 81f48ff54ed..d7af3ffbc22 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -200,7 +200,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
>      CPUState *new_cpu = cpu_create(cpu_type);
>      CPUArchState *new_env = new_cpu->env_ptr;
>      CPUBreakpoint *bp;
> -    CPUWatchpoint *wp;
>  
>      /* Reset non arch specific state */
>      cpu_reset(new_cpu);
> @@ -211,13 +210,9 @@ CPUArchState *cpu_copy(CPUArchState *env)
>         Note: Once we support ptrace with hw-debug register access, make sure
>         BP_CPU break/watchpoints are handled correctly on clone. */
>      QTAILQ_INIT(&new_cpu->breakpoints);
> -    QTAILQ_INIT(&new_cpu->watchpoints);
>      QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>          cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
>      }
> -    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> -        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
> -    }
>  
>      return new_env;
>  }
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

