Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4115EBF16
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:58:19 +0200 (CEST)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7M2-0004z9-0v
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7I7-0007yj-FP
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:54:18 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:57095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7I5-0007Ue-UC
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:54:15 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MvavG-1pUGPN3Qta-00seBb; Tue, 27 Sep 2022 11:54:11 +0200
Message-ID: <ce0f5623-95fa-7e11-721b-6b7c0b3824eb@vivier.eu>
Date: Tue, 27 Sep 2022 11:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/8] linux-user: Implement FUTEX_WAKE_BITSET
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
 <20220829021006.67305-4-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w0+PGoJH8l/+rc3UCIbuETyiCvQ/57wKY0aTP6wixxmNvynZt/L
 iURfLx1bz+THV2t56MweFm2QQDQ9yw/3y5cs4F/1sd9w/BEFEsXxLESVkxWvQEsH6TI8oty
 nyRSu7PRzbmhYLgjH4Uifp1KT7lgerSDbvIE3qHcTnA/MoboQTGe8L8H2gN6sAmzs4/1g/D
 tsRNQ+mZra58v29ZbmT0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0iU14/IS+OA=:VulAFHQMYvI8vdiDs1ZJXz
 7b8FNzXfiG7vpwiQtmfR0uLFDJGFnVznleKZ+ykREK7B9Vl137BntmQQu/XXsGo6ntxIFQwea
 jjTPhRGiRt3xwokq4bYNMoNZDlt+YEdYKoR4ec/bPSGYCiIUnaoooNqm02ITUpifOqqu662NZ
 bu7Xocs9FwU/nJ15CTQnZxsLjuiHVwd24BG/5tLjeac+ovQi5x7313l7XgWl79c9RSSpYVPNM
 VfmYlRxQBX6MV2bGE6xlCRB3/bO8t0T3Vj44Z9I62d1tLVThad8PfuTqgK3Q6zRblCFYNaSbE
 AyNUKaogJDaOCIWsBK0oWP6Jdj3AxxWQq0N9sdzUVC+Np1k2W6ve4/3vHBK/do0wfGV78qATI
 qMOaBzVjvBM60BS9X9xyHhUM0B0qZOKx+gOMNF0tOQui/qI+oGTCWre7dKrtGBk2YfFv6+VNG
 /fAoTrcmPnuEIwW94EIn2jC8CcUE3iIKawvfDx/gv5s8SPtxdzIFNbmkPVfrZsH3TqAZuWkNU
 xffyi2a3hJ3wFRYQ56U6ocGqiR9kmxjLtgBj3BPW9BhomlQhdeI6M7kwuLkmG98M0Eu93AyWM
 IzIH2+3g9h6dEqM3+ntNgw26/q95qRNpcTf7YylsHi/obw3SvKUjAlWhQJYvgkbmVvih/0YXR
 FVC48ELzdIm7PdPP+KDAorTkZ/nxhYraGW3FH9q9/UYpz+MmzST09kTBPzcMSBPGQPXTjZj54
 YHJMccvnc0N9k8+0RSexpeWD4S32gCO4G6U/LXG5uPg+vBaqXRs1QQM+mXdLnXkNC1TMBJAiv
 nLoyklj
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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

Le 29/08/2022 à 04:10, Richard Henderson a écrit :
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8fbd5a9556..8bf4b79a9e 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7774,6 +7774,7 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
>           val = tswap32(val);
>           break;
>       case FUTEX_WAKE:
> +    case FUTEX_WAKE_BITSET:
>           timeout = 0;
>           break;
>       case FUTEX_FD:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


