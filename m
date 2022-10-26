Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B460DE76
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:57:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ond7A-0007G5-NS; Wed, 26 Oct 2022 05:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ond78-00079t-5Z; Wed, 26 Oct 2022 05:54:22 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ond76-0001qI-Hb; Wed, 26 Oct 2022 05:54:21 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Ml6i4-1pUiAo3hXQ-00lW7j; Wed, 26 Oct 2022 11:54:11 +0200
Message-ID: <1afb769c-37ff-5bff-f023-7eb7dcc63cc9@vivier.eu>
Date: Wed, 26 Oct 2022 11:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/3] target/m68k: Rename qregs.def -> qregs.h.inc
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-trivial@nongnu.org
References: <20221025235006.7215-1-philmd@linaro.org>
 <20221025235006.7215-2-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221025235006.7215-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mG8AYAcl9rMjzOSFBzUdt1gu1YI98JG4Vnd6r09DaeZ9Yo+qoOp
 y1dzF6sKl/KG5nih8ekOVaiaZ991NE1Tb2CeHKM6GVsYKgr+5Bc+N14arMBembWXMgLYA2c
 LO9Y89zekecpuy4W2YtPMPmoEQyfSZoVWiMfUhT6N61X0DQiwK/24QaT3I+v3o8SyVhaoZy
 I+9GD/mGBgyy/SXMLJTew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hdAQLNh4r9g=:oSVE6tmHPjt3LgritGlqz4
 L9bVddGXIqieFHtrdBelwz0ekt3HgTKA17MSY93wzxabGjIq10rRlTktdRheiX0wWNhMDZOrI
 CehmFs66IaO5JwUY0nBeohT8LAvRa5dstumsJHfLhQZG8LwG8y5AnQGIxNIorYvIhKxy5OERM
 QH9y2eA3O7YS8VEFYW5Uk20GqipFCU+YT++N7OrpMwNLN4WxTjmSk8kAneScip6D1pUaWhAut
 W2VStnEx7/k/Mg7e+xtml6zJbU08d/O+5Um1H41vKxrfszwO+t9IXSwue3Mirk7vBEJG6d9o4
 rwf2QZAnkUAYwbint75rBHj+D2QLPflHdEEdOfus7G44EhB/5djwTgLl5uhANIbDLqVf4RWNE
 9aHEQ6dvYYKXY3vsYhpukW8uiQUrqdh1WF4gpx5DxdweAdvkfynmpGNsQE66oVu85Xd1tNehJ
 KLv4T/e9o7baheXGPkz2fpIR+aA6moL+sOFjTYLvMIGyPCU7l23leCjv6Lt3nlBMcrhms21e4
 wYaG4sz93DrIRKkEHrbkE+/HKP5qEr9FPZSS5w1HuDMmEquXq54qdP2AGd715EeM1+7K4JpES
 5SMbuHR3/ehjy8mnYaoNh2cvmWD1qsTefHhREdpEo9Iv/IbIXDleYrZMco9KAh2Fs+5TaaHP6
 J+VT987K20TMBGBjFG/k7xY0GoJ6w+T8RKgwJTxZhRAvUhx3NcyVdXYhDY+YZuZsEfe3oC8Hh
 +LOl9R9+YN5SaSHTv9pbC4EULf5sbVbfYXN2yI0DH2jvMQQ6uSFlaYWgPAmYKiBeNkzySEq+4
 xvlz+Yc
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 26/10/2022 à 01:50, Philippe Mathieu-Daudé a écrit :
> We use the .h.inc extension to include C headers. To be consistent
> with the rest of the codebase, rename the C headers using the .def
> extension.
> 
> IDE/tools using our .editorconfig / .gitattributes will leverage
> this consistency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/m68k/{qregs.def => qregs.h.inc} | 0
>   target/m68k/translate.c                | 4 ++--
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename target/m68k/{qregs.def => qregs.h.inc} (100%)
> 
> diff --git a/target/m68k/qregs.def b/target/m68k/qregs.h.inc
> similarity index 100%
> rename from target/m68k/qregs.def
> rename to target/m68k/qregs.h.inc
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 9df17aa4b2..f018fa9eb0 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -39,7 +39,7 @@
>   
>   #define DEFO32(name, offset) static TCGv QREG_##name;
>   #define DEFO64(name, offset) static TCGv_i64 QREG_##name;
> -#include "qregs.def"
> +#include "qregs.h.inc"
>   #undef DEFO32
>   #undef DEFO64
>   
> @@ -75,7 +75,7 @@ void m68k_tcg_init(void)
>   #define DEFO64(name, offset) \
>       QREG_##name = tcg_global_mem_new_i64(cpu_env, \
>           offsetof(CPUM68KState, offset), #name);
> -#include "qregs.def"
> +#include "qregs.h.inc"
>   #undef DEFO32
>   #undef DEFO64
>   

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

