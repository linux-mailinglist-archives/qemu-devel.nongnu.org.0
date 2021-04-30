Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DF36FE67
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:21:42 +0200 (CEST)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVtd-0004cT-Aa
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVk4-0006yQ-FU; Fri, 30 Apr 2021 12:11:48 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:47393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVjx-0008FI-Az; Fri, 30 Apr 2021 12:11:48 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N62mG-1lW5n61FaC-016T9m; Fri, 30 Apr 2021 18:11:28 +0200
Subject: Re: [PATCH] vmstate: Constify some VMStateDescriptions
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20210408140706.23412-1-zhukeqian1@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <17c8e836-5d55-8691-8cd8-32ce39e6dc61@vivier.eu>
Date: Fri, 30 Apr 2021 18:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408140706.23412-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1Ndks8bXx1C46SS+8zYdJBgtnKYAGvild5sTKgN4m7ZiXSQ4SPm
 UdRvpMzBxR+uL4NwtfCrbzJrGXNT+VNnYj62mX290u1a52IxQBPPU3lDzZr9u7FXBybd2bt
 fb4VDTScR81ITnoCtWke17CqJlRNxpmqbHx3ob1vN+8aGDY9um2oA1V8fGgqgOsFrDPapfQ
 qvYohMqGxSZyoyuv+UD2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OE3VP/w16eI=:SbZ7nzqgzoqBMAgmMfSxmQ
 qTmDdlk1lHu5o0JRivjbiJ8nQ11mUVPG1jopXULEhVHeyV4Oky9zLttR1a4P/t7PRSgD0qZiw
 VG/47ElMsAVlwbUUvk93ZabGdA0zePRCsM81ZAOsr7VbxZYxJjF21lXzymUZ4hyAGo8b9pz5M
 xV6aKY0NQZO0Vqk4CrNps6b7rdQ0GcyTcysCLrEfu0M7E0omEsXXXOdKT1qIxmWKsZQXHTp9Q
 Q5x6JjC5ENKWei+hxvSNSqIB6EEWkaaoYgNxoziEWB9AVPZLOK+FzVx/pHeNxHQsYXOhXE8w+
 YhL0kIRI0WYRnuteNinq4denZneqDAyYS6kPjLOrso4Wg8ruBd2dV7HfYFEvqTNn3lgPBwTPS
 /JAEL5+wgStMifIyKk2AHwR/ndj12eaSlNKA5ncAOvJ3VAu6pZtU3kIyEMYy4CvJAqRTwE+ip
 DYuTUpXLofpJPoA+M++8MvC5jPwZi4dCcB/hcIEc8A/7zS/49voei+B6ksI0NpzUKtKPDoNJE
 kh035K6fWD2iGB1SK3J/TI=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/04/2021 à 16:07, Keqian Zhu a écrit :
> Constify vmstate_ecc_state and vmstate_x86_cpu.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  hw/block/ecc.c           | 2 +-
>  include/hw/block/flash.h | 2 +-
>  target/i386/cpu.h        | 2 +-
>  target/i386/machine.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/ecc.c b/hw/block/ecc.c
> index 1a182367ee..6e0d63842c 100644
> --- a/hw/block/ecc.c
> +++ b/hw/block/ecc.c
> @@ -78,7 +78,7 @@ void ecc_reset(ECCState *s)
>  }
>  
>  /* Save/restore */
> -VMStateDescription vmstate_ecc_state = {
> +const VMStateDescription vmstate_ecc_state = {
>      .name = "ecc-state",
>      .version_id = 0,
>      .minimum_version_id = 0,
> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
> index 7dde0adcee..86d8363bb0 100644
> --- a/include/hw/block/flash.h
> +++ b/include/hw/block/flash.h
> @@ -74,6 +74,6 @@ typedef struct {
>  
>  uint8_t ecc_digest(ECCState *s, uint8_t sample);
>  void ecc_reset(ECCState *s);
> -extern VMStateDescription vmstate_ecc_state;
> +extern const VMStateDescription vmstate_ecc_state;
>  
>  #endif
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 570f916878..1bc300ce85 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1786,7 +1786,7 @@ struct X86CPU {
>  
>  
>  #ifndef CONFIG_USER_ONLY
> -extern VMStateDescription vmstate_x86_cpu;
> +extern const VMStateDescription vmstate_x86_cpu;
>  #endif
>  
>  int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index 137604ddb8..f6f094f1c9 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -1396,7 +1396,7 @@ static const VMStateDescription vmstate_msr_tsx_ctrl = {
>      }
>  };
>  
> -VMStateDescription vmstate_x86_cpu = {
> +const VMStateDescription vmstate_x86_cpu = {
>      .name = "cpu",
>      .version_id = 12,
>      .minimum_version_id = 11,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


