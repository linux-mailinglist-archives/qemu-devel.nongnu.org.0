Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C671D6AE599
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZgP-0007PG-4q; Tue, 07 Mar 2023 10:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZgM-0007DJ-St
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:56:54 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZgL-0000em-7j
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:56:54 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MVe5c-1pypmA489s-00RVYJ; Tue, 07 Mar 2023 16:56:51 +0100
Message-ID: <3902d4eb-9158-19aa-3686-bf04b0f5a85c@vivier.eu>
Date: Tue, 7 Mar 2023 16:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/15] linux-user/sparc: Handle missing traps
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NnFSX8zwEvTxsFHVjB8nBZPdJnVddZ2PWSXELUXKCyJ7uzSCzBo
 dKZoM1CO6NNsoOAtI6pWUBOxezfvGs2t0z4aLgSNFkbeUdBi5NObEhGPa8QX5fgR9B63BWn
 MMfyKxIVe1j8EkSMu2JC0fRkcppg/hb3Nj3qesdaXvT1hvSDB4pSPwdSzVKTeOHCFWOBfnY
 dOIW7/R6aPKIdQOk0dyRA==
UI-OutboundReport: notjunk:1;M01:P0:utR3bs6ay5M=;onTyAvWtldKn/LoMWVGs9jNAYc+
 MmYZOvcrruKNMx8P6gt7aHflWXnI7TGuTTZpM83kGoi8uq98/QPnEUUoxreZVQJLGQcRRFPPy
 44eG+uHHk3SP9PorWogbUe9z4lHPujYqt7g6HTBv4DsOQ9om8gNtweZNfR8MqukUfSGMU4cbm
 eyZZGE6BOKCiMQ+1hZQsZWrNo6Iy90QytsYvWPqR4Z2OqNhLlSP+d2cdVkRjjCXyVxPnOT2NB
 mp7CWmRvwrvpTsfpCBqJ81cp6n6gTyJPSQdsZoWD7KQhrKMyHljyidqeIf5dDPHcd7T5y4dEt
 9CYyONntHdekH9jVNrdYxXTNZD3f1SGq3bgL6OmbfCj3cU/kDNl6TW27HQiHA3R+0ahqsYu9q
 OOqMZ9vkUhLgLM7tT+lX6zpd9etX9+fTk3s7J9JmkvYZOrmPFWduOXH1M9NAigk806uGEV8cp
 nbOT8sJcpSZQYX+e7BOHSa9R5/C3ZZWoA4YsWL5SRqQDE35+eU9adGnBm/DwxHqdtGwuhHDTy
 uGkZPDLM1m/bMqekfjp+eneVuUsvJUtPOpaDeQJh9bL0hSR0dxMsqdzrRJHFVvzdQz2lrlamI
 pP7mFYzGFwdfn2uk8WiTkN+1KuETOLBpknRmy4BAjTU7Izm3VcktpH9ptBWiBl0NsjOSUE8lE
 DkLDxbg4oszbHRcQU/FEUMHPMnBsvh5hHMk7WlnNXw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Richard,

I don't have the time to review your series, do you want I queue it in the linux-user branch and I 
keep it if it passes my test suite?

Thanks,
Laurent

Le 16/02/2023 à 06:45, Richard Henderson a écrit :
> Lots of missing trap codes for cpu_loop().
> 
> Changes for v2:
>    - Fix v8plus syscall trap.
>    - New patch to unify syscall error return via C flag.
> 
> 
> r~
> 
> 
> Richard Henderson (15):
>    linux-user/sparc: Raise SIGILL for all unhandled software traps
>    linux-user/sparc: Tidy syscall trap
>    linux-user/sparc: Tidy syscall error return
>    linux-user/sparc: Use TT_TRAP for flush windows
>    linux-user/sparc: Tidy window spill/fill traps
>    linux-user/sparc: Fix sparc64_{get,set}_context traps
>    linux-user/sparc: Handle software breakpoint trap
>    linux-user/sparc: Handle division by zero traps
>    linux-user/sparc: Handle getcc, setcc, getpsr traps
>    linux-user/sparc: Handle priviledged opcode trap
>    linux-user/sparc: Handle privilidged action trap
>    linux-user/sparc: Handle coprocessor disabled trap
>    linux-user/sparc: Handle unimplemented flush trap
>    linux-user/sparc: Handle floating-point exceptions
>    linux-user/sparc: Handle tag overflow traps
> 
>   linux-user/sparc/target_signal.h |   2 +-
>   linux-user/syscall_defs.h        |   5 +
>   target/sparc/cpu.h               |   3 +-
>   linux-user/sparc/cpu_loop.c      | 190 ++++++++++++++++++++++++-------
>   linux-user/sparc/signal.c        |  36 +++---
>   5 files changed, 175 insertions(+), 61 deletions(-)
> 


