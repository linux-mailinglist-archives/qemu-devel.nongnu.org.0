Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD853526B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 19:10:07 +0200 (CEST)
Received: from localhost ([::1]:53646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuGzq-00035W-WF
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 13:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nuGy7-0002Pn-JF
 for qemu-devel@nongnu.org; Thu, 26 May 2022 13:08:15 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nuGy5-0006Gr-Ul
 for qemu-devel@nongnu.org; Thu, 26 May 2022 13:08:15 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3Xvv-1nkXbU103n-010Zmy; Thu, 26 May 2022 19:08:11 +0200
Message-ID: <ca5f326a-7f48-f872-a3f4-3c4823d1409d@vivier.eu>
Date: Thu, 26 May 2022 19:08:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] target/m68k: Enable halt insn for 68060
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430170225.326447-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430170225.326447-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MkLYFV6YTfg1vNUZcaBEo61YJ74czVd/8pMRuEKjMQLF0oqR9lX
 I0T7Z6Ce8tG3lmoXXiGc5qySrIDOSv+S0XOjE0+daTk+wjWw+XtrIl6YNh5J/SXHDqzczvh
 GVyc8Qp+YtpHyGA3rOGf8/9L6934JCXJbZC9w2TEWAM/Ka1u5So0nm8ecm6d/42lEWkUajp
 WwOeOqbrAlckJnDHWWZrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cZ5zDSmFwCk=:TTcJ439LHewBbL3sq9CzP4
 DlFlk5ePNWkzRct/kCjf9TsFr7lyhNJvfJi8f9mAK7MEW85xb6kmSgrjnGB4C3FpVLG3TVws/
 FSwM0547SVKqj3z2QVFBIq7TFk188PGt+bLItx+oydwwIhGTBYx6ImpGfnbNhvP18JxHOQ6NN
 xH+qMTCtb4AVvpm9uKve0aQV+bCJnoltaZEBhP5M9kgbZZ0XHO1Adt2DRjVMyhS/pHjLsY0ag
 xG2/llm8hm13W6w5RmfHaHSRzF9fLZi1S8fxVXIFxyDk6VU/p6fc9gGfmG10tKx2m0AzLg44v
 ZnczdTUOkO+KHAWhymF8kB2exj9ilZjaVJQP/yfNxLZV8lzpSXHgtPSjT8L/mYvsaMdGAOM8m
 FFxG7VnV4H3uhrGi63EXrqjXCLU9koxxh8YPKMB9QLOWUhWRxpdjF6EcXjVyssLK88nIFXVQl
 jSlG7StvL1vKgiettvZVQgLO4jAiggF2H2b4AopPZQgiXJa7c0qJj6wHNVo0r4hJ3Rh/mH2l9
 +Ac/ALq9ZUjD/eEuqmwbRtJtZLrR8k89pD3rqhUWkmz1CIJ3EvNvKXFTCUdtZC7tvmGS42xTk
 0zCafpHULynT5c5qrntmRoC30gi+Q2WdgG5jndRFdDunmA9wz1GEpbxOcs2fd5BGXeavFnOUS
 MKT8xZyS5gzPIplE2Ot6Eq29ht9U80g7z8GPk1Glzjxwpk80a5UIVcz4BcqyBKTdf/qzCxrEV
 D6I45WUbc3nI4IcoKn9M1E8Cxu0YggVhbnNVEQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 30/04/2022 à 19:02, Richard Henderson a écrit :
> While looking at semihosting, I noticed that 060 does have halt.
> 
> Then I was a bit surprised that it wasn't being disassembled and
> thought trying to exactly match disassembly to cpu was a bit
> frought with peril -- one also wants to know what the insn was
> *supposed* to be when it raises SIGILL.
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>    target/m68k: Clear mach in m68k_cpu_disas_set_info
>    target/m68k: Enable halt insn for 68060
> 
>   target/m68k/cpu.c       | 6 +-----
>   target/m68k/translate.c | 1 +
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 

Series applied to my m68k-for-7.1 branch

Thanks,
Laurent

