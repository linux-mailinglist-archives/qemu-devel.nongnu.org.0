Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979E641CAA8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:53:55 +0200 (CEST)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcqA-000694-E3
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVcoh-0004Ws-Hw; Wed, 29 Sep 2021 12:52:23 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:51845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVcoe-0005H8-DT; Wed, 29 Sep 2021 12:52:23 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MUGyh-1mNkrM3Col-00RImz; Wed, 29 Sep 2021 18:51:59 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210929163124.2523413-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3] target/i386: Include 'hw/i386/apic.h' locally
Message-ID: <bee85404-7092-5565-aa77-165b35db10ee@vivier.eu>
Date: Wed, 29 Sep 2021 18:51:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210929163124.2523413-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VHCygShHmm5lkuRdmYl0n8jXTGLVo014Pc6rEYQlAMZPMqqY3A8
 26nrU38g9+9fxjB2h+yqV79i74Sk7GkpqSk5+kruGgXSZVAzLWMb81pRgjyiUYy+/OPIiEZ
 +MlHs+BlegEgNtG8sYMnL+pz1A+xLrG0ZuiL3J++cq1z0YXkPUQxEmpYKNCtEEAZu5bDmlL
 ilo5QMyHAZlSjjuz3q2oQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ngWqlchEnA=:Smohn14fEXftSRde+V6C2H
 ih9WY/RaxqKquMI9YZp4DXsbRpzTw9URCmMxWDhSXcEOFNN+YKwtprcTmFOOsAUferjpdyYja
 nBGHmQHibh/EA69RU/NO7JmyCzEUvpOWSFHmaA6pp/+nBiXjuQK/x9QIcM129R7Z/BH2MGdRz
 ptP8qHLlx3RWxa5mR9rtbKf2THxMj1Db1UrdYv5Eg92/mmv0PrkepQfNzdUcY89Sgpz1yzgLZ
 DDot7EueHgEFK1H6vKPs7pieWevf7p/K7NZPiLqQcr3pIXf8O0GQmNlsUVsF4dEyAkn8zJIdk
 DoeXiwVItKVQdAVDhKehf1Xp1iEKJLZv7U6wQ/EvMAkpHas1uqgEdE7K4KB5TqlYntGvJzVDF
 Tt2WrVtL75N5/DtW5A84NDUjEDPTfQeHRr44Dj97Zji7dQP6r8H4HACdQWZy+Cv+yJ+Op7F/Q
 RclOEOXmYtvj2euxIl1xFDXPAT4xou96/bcPlb1s6pRBWIp9cJvqKgDFwK7M4wXNDzBQ8ZeEi
 XYOFb4VfbTCARDrAlv+zq9i1CmKja9U8f9XxYLFvZ6LSPuYGQNh/BgUE378gMQoJYFjqCBeym
 JO6aTBNrDwdiaqOuAsAxGCY/Ccq47xkMvLqcVC0boEDlSweTUZK8zsOtPwNgVZUf2tO+U0/vQ
 4t8L9Age5g7EW3J6wiBf8HAkCZQNQnI1o6tyT1ZjC4vUZV2VJcWnNcCH0C5uC1fS5Jsg/bMJX
 PILFbj6TU+1cGk7oCZIq5MPqigNNh7NnFxirEA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 haxm-team@intel.com, Richard Henderson <richard.henderson@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/09/2021 à 18:31, Philippe Mathieu-Daudé a écrit :
> Instead of including a sysemu-specific header in "cpu.h"
> (which is shared with user-mode emulations), include it
> locally when required.
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/i386/cpu.h                    | 4 ----
>  hw/i386/kvmvapic.c                   | 1 +
>  hw/i386/x86.c                        | 1 +
>  target/i386/cpu-dump.c               | 1 +
>  target/i386/cpu-sysemu.c             | 1 +
>  target/i386/cpu.c                    | 1 +
>  target/i386/gdbstub.c                | 4 ++++
>  target/i386/hax/hax-all.c            | 1 +
>  target/i386/helper.c                 | 1 +
>  target/i386/hvf/hvf.c                | 1 +
>  target/i386/hvf/x86_emu.c            | 1 +
>  target/i386/nvmm/nvmm-all.c          | 1 +
>  target/i386/tcg/sysemu/misc_helper.c | 1 +
>  target/i386/tcg/sysemu/seg_helper.c  | 1 +
>  target/i386/whpx/whpx-all.c          | 1 +
>  15 files changed, 17 insertions(+), 4 deletions(-)
> 
...
> diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
> index 02b635a52cf..0158fd2bf28 100644
> --- a/target/i386/cpu-dump.c
> +++ b/target/i386/cpu-dump.c
> @@ -22,6 +22,7 @@
>  #include "qemu/qemu-print.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "hw/i386/apic_internal.h"
> +#include "hw/i386/apic.h"
>  #endif
>  
>  /***********************************************************/

Why do you add this part compared to v1?

...

> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 4ba6e82fab3..50058a24f2a 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -70,6 +70,7 @@
>  #include <sys/sysctl.h>
>  
>  #include "hw/i386/apic_internal.h"
> +#include "hw/i386/apic.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/accel.h"
>  #include "target/i386/cpu.h"

Same question

Thanks,
Laurent

