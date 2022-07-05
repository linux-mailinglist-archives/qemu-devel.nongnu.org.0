Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594A566A25
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:51:33 +0200 (CEST)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8h5W-0003AE-Tq
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o8h39-0002Sx-VY
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:49:04 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o8h38-0001Xq-CK
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:49:03 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N4yNG-1nPlSM1N2K-010xH3; Tue, 05 Jul 2022 13:48:54 +0200
Message-ID: <35eec7ba-0cc1-5aee-954f-f2e30d64f480@vivier.eu>
Date: Tue, 5 Jul 2022 13:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Add LoongArch to qemu_get_family()
Content-Language: fr
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, yangxiaojuan@loongson.cn
References: <20220705065943.2353930-1-gaosong@loongson.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220705065943.2353930-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:c0msmCLc6IPYaz8qKqhSdMcExcPjvZWT/qsOWESjVJkceocC8Ob
 EqQ9SRPmEshguDQZ5wI1IyvSKUdLRnxq6Gk+7SCcUxg1GDRQ06UyLTQU1Fgp4HY4VZb4EHQ
 VaPGKjhANaFJFdRMp2AEpjnNXF/TU4ZS1FZXnk68tZkMzegFMKCITgFkNCbzq0cJL8JFfu3
 /8x9a9DCZ1jJLbY7IOA1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FlEvZktzlLI=:Bj5ei7run8o+lyizVFM7Ta
 5l6Hxc2IVto/gwAOXeLKf2Wg5oKNkyLcprAq8dT6NmAnY3mfZRxIkoMJkGC/EPPVypSW029U9
 giP14u/vSUfOQegU9Du3kU59IB5o5hXDyFqamrds1vXoZvU0UmCzZxJFVKD748DvVPrzjLX4h
 98R5//pCGvSBbVclFG+JV6mzEggi+R59JaNqmGSS+KpBUPcTJy+ihIRjJrCvH8OMOCDlMpSx2
 YkXWYS/YffRLwg9QylKcVlsxa3GHhxYQ7IaOaRT/mZh8tBu9bxibuTIeEl95t40vYmoqMWrsx
 R6BWuMeM2JITFFZvTJ2MKC2IFi0keuG91Zs92LswJxCJ6xjov3K2Nue8ebPXUDJtKqA0w7EqI
 WOSVENOmod7TkFD7f2bazNvUTsl3kCj2yM49GT++rlXQYFQ7G4Jo5OXwfC8+TYoRPj8v7SHYV
 k8hNdajjQiDf3ak8LOh6SKaDaNfJ5vk6h/MjYhxrGJ7JgZgsdv6+dvWL48BaldXggME91Rb+4
 5AfPhoK9wMWQh1uTlJHk83DhguBxX8Y7TkL0pES/F4/7ga6bxFW2U5wzr/8mO80IUWrQy5s7e
 J/qqm4xt97gL/w9cKONkK+oagZ9zOukdydijCgpWThyWdxzxFL6GE/Lg1/ggqJTfeUBEyRNxB
 sGkPJvRjr0mue8pHwGeYH4TyvBAe3EAlWz/IzEbBkW1kQNH6J4osvyvlrdO70/W/4milPHH/S
 cFmuDSsEwjJWw2STeH81DmOsaA0SQPg3OYPpgg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 05/07/2022 à 08:59, Song Gao a écrit :
> qemu_get_family() needs to add LoongArch support.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   scripts/qemu-binfmt-conf.sh | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 1f4e2cd19d..6ef9f118d9 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -171,6 +171,9 @@ qemu_get_family() {
>       riscv*)
>           echo "riscv"
>           ;;
> +    loongarch*)
> +        echo "loongarch"
> +        ;;
>       *)
>           echo "$cpu"
>           ;;

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

