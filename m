Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5F545D79F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 10:50:45 +0100 (CET)
Received: from localhost ([::1]:46492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBOu-0003Ry-HW
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 04:50:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mqBNb-0002k7-5A
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 04:49:23 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:47067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mqBNZ-0002ph-6J
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 04:49:22 -0500
Received: from [192.168.100.1] ([82.142.2.234]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mt6x5-1mWAeE3yf3-00tR5I; Thu, 25 Nov 2021 10:49:04 +0100
Message-ID: <bf77336d-c839-0284-356e-cf314f8e2e48@vivier.eu>
Date: Thu, 25 Nov 2021 10:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] linux-user: move target_signal.h generic definitions to
 generic/signal.h
Content-Language: fr
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637830541-3222-1-git-send-email-gaosong@loongson.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <1637830541-3222-1-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PUz5yKPWotjo/4UaWEefB15oQctI3qRgzalBdvaC1izxxLJbAoy
 VO1iZhUIoa3S64UjsrYs7fn77t20tESdVR229DJJmIT9vqdzYAMP4zVXWCqTf6Jf7roCMQP
 ApMNxW6heQLKNT9b1h32hDTw2szDN8GOFXJoiwLU7ifa9oGFkZt37MRfpBU8PbTK4wTEcdS
 Seiaqxs8ocGVaQdLbBscQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:znoaL8kxfX8=:YbhRvOlsUJw0LkJyQ9P4qz
 8OX+8K0fFpIdLvsDBNZiqJf3pY18gLEbnUferQfnpx7iJENlKBQV6b8MZ1sGdwfjtgY47qLWk
 Q421G4geBEDjlm5CGOVbWtVB+sc1kNwjgN3ihzuREOyCsZbzEnI57NDbzIy7bxBPLBeolPGBX
 lhMjPmKBS+NBpcIurSz6lmOW+0tMkYFQXl0mOghsbx3AfmFNHM2RkeMwSUQYmZnZWk0fxeIsB
 IXBmovWRxMYJGkfI/j/BQXHSDCk3Fp9t9V8Y4pNGU76YiDggikB5+5v8ANd9jfT0YCle/UZfb
 GEveghj3kpf2DETItN31I6+e2ulrXk5bRO1mTEN0cj+t4Ec+6v8z+cgKVNobJQ0SzA0vvqKNm
 1acHE5ockzUpVDQ5HMJz7I+67Os/wQ3OaCOFTvIPo6MizS3cNtj2uhd2zPTwV+5gJ+0AUaGBM
 twnldvxEWgxsG3LVSX9zloxR6mq/cgleuZhmg5Zg/i9jU7HkJ3p2YYCXSnQk52tQnc7gmjJnx
 1avdKrFk/fnP7G6SKJ6rGY/OaaXYF52gThT9LDZwzkGTZEcNsuRpOYVrMlLu3xYOmtM2+TUmp
 Jhgl5iKsWbWmpGwBDYN2Dt16NdMpaQfDEMAZ+7+QcHNiDkzhl7lFQZ9SUxzfKcae/IpBzTtmu
 IqzKAblGGlt37jZHCe2t6zPEPae3bx91L4+zaqUwEVkJhqWppgmYcG+1uwYYnr2F7RKc=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/11/2021 à 09:55, Song Gao a écrit :
> No code change
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   linux-user/aarch64/target_signal.h    | 18 ------------------
>   linux-user/arm/target_signal.h        | 18 ------------------
>   linux-user/cris/target_signal.h       | 18 ------------------
>   linux-user/generic/signal.h           | 16 ++++++++++++++++
>   linux-user/hexagon/target_signal.h    | 11 -----------
>   linux-user/i386/target_signal.h       | 18 ------------------
>   linux-user/m68k/target_signal.h       | 18 ------------------
>   linux-user/microblaze/target_signal.h | 18 ------------------
>   linux-user/nios2/target_signal.h      | 16 ----------------
>   linux-user/openrisc/target_signal.h   | 23 -----------------------
>   linux-user/ppc/target_signal.h        | 18 ------------------
>   linux-user/riscv/target_signal.h      | 12 ------------
>   linux-user/s390x/target_signal.h      | 15 ---------------
>   linux-user/sh4/target_signal.h        | 18 ------------------
>   linux-user/x86_64/target_signal.h     | 18 ------------------
>   linux-user/xtensa/target_signal.h     | 17 -----------------
>   16 files changed, 16 insertions(+), 256 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


