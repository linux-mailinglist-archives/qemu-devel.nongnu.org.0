Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE14CD26B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:30:53 +0100 (CET)
Received: from localhost ([::1]:47934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5D2-0007mw-3K
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:30:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ54r-0005lm-Ma
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:22:25 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:36067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ54p-0002IQ-VK
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:22:25 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJn8J-1njWng0FT7-00K9dN; Fri, 04 Mar 2022 11:22:17 +0100
Message-ID: <bbe0a241-8453-482a-b077-ec28dbd7c76e@vivier.eu>
Date: Fri, 4 Mar 2022 11:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/10] macfb: don't use special irq_state and irq_mask
 variables in MacfbState
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1HssnDKXRNaVEyOrwRWkWycxb4+HnvR/YTpajWUDLf3b/ynsd5C
 mT+YvqEPNkWWi/C34Ar5pOzDRoSxFJ/4dj0oy0yrZ9TkvXOytkI97KysNK0Zc2x8s5FQ/uV
 KxPfdTXfHaRJyTGC2ixOSEz/iEks54eCTAcF7ScKT5yfb2UVlwgDTS/NTmuQg0dpqvOsAfZ
 tJ+XbMorwyL+jWlohaA9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9MU2fX5qoA4=:dtzTy9w6b+e06xUs/xbe2o
 RTnb4TPWqYLY4wQq6lqlw7Jn7PdZP2KcoRelvH5+1BdRIRJH9VawbnkXhNRGujnTlH0Cz7IAh
 I/BYLFBaKsITmF7XzmcMMv8SyimMAsKOp2eGHSKAD2faaQGQjsMj5cY7RqOSmBWLIo2zpcvzK
 Wp0EdAqn1jD9CLFxrWD0N3P9D25dS9fPXaG/Gh2YKfHl3MA5ZgUigs3X0PUNo2r+V99DRUv6r
 Q9hQtyXQhF0i8E2/ySnOOFJ1MBD7eg+zfu7wNfkIk4KWHo5gKANxkzUkYKbuxrd0APQMBWXSf
 neVkrzOHG8A2OyB0AhPebV89c2yQxMwzZ+wsYUpPy6vh8LjHPcWB6wMjlmn2cDfqiYYUIQse3
 2RPWUITLi4ob9f6vlhuUGJNDTTV/oawd2P+SxQyDAAfN0kizYBF69KHRX2J+QnfDivxaqGUyu
 UADejTM8k8f8rG82WEcxxeR6fSO32QePYDK2tZRIkRjk0FNya8X+N1sNcYAbcHfYceQbq81a/
 azDrW+rB2/p2athdw0oSwveQeMc1lEa8wMCzUPdVXXGg82ysxXGHUbmbz92OQtTPrUKbcaP50
 MF6fTSeRqwt6g5jn0iCNFY22IR+esWRstG25+Qb/UuGpLLpgmTrrs2VE5GDXeZigb4Uj44XgU
 fk4m9K7jbHAJ3FYSR8t+a8lvlKog+rbD6z3ZYt7n7cIv98Bf2TRDZiA0ofedf3QZMbRg=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Le 02/03/2022 à 22:27, Mark Cave-Ayland a écrit :
> The current IRQ state and IRQ mask are handled exactly the same as standard
> register accesses, so store these values directly in the regs array rather
> than having separate variables for them.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/display/macfb.c         | 15 +++++++--------
>   include/hw/display/macfb.h |  2 --
>   2 files changed, 7 insertions(+), 10 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

