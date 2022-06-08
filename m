Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C6542B9B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 11:33:53 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nys4W-00015L-98
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 05:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nys2D-0000Ld-HX
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 05:31:31 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nys28-00075t-1v
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 05:31:29 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2Nm2-1o2i3F3CWs-003to1; Wed, 08 Jun 2022 11:31:19 +0200
Message-ID: <f0f09e0f-48db-7031-f8ae-17ab71ad8834@vivier.eu>
Date: Wed, 8 Jun 2022 11:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 3/3] target/m68k: Use semihosting/syscalls.h
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220607222616.717435-1-richard.henderson@linaro.org>
 <20220607222616.717435-4-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220607222616.717435-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xR4NjJP/d4r3Vx6SNUkL8UiQY6Id7feehLjsKqW1boq5GiLBMwd
 yZYZ4yxQbgckXikPp6dUjtRDNba+naFaRK6ZZr+d8fGMtrWjdQwGC05ByV7UuVZOQ19UrC1
 94PDIF0Mhdy9175BZYeMsVmsWboOq0lc5LMRShV0KRQfRFFTCo7+lzUCcmRX7cktPx+4Nms
 kj7+r33V54r7Ell/gJeQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3Nj1sOV1gwA=:ub1mpZbu36iavxy0s0tzJx
 TWPF4RaSk7e3CZwJoEckihFHvqaqrDQMr3RhgnZCbhov0Zuqf069z0SDTuomvq5n/VMy5AHEb
 U97eZhsPjqrwEW8cMcSEbrUE4LKDt3ftfj677Ti3IhpTaxujDi87DJRsgt/BPiaozeM2aP/Pg
 GBLYXJ7Lel/isdqpSWdHLKT//fw7CsA/meeogOJKoQQ633bqXZhv0E04q94f+JZ+ur5JAKPCp
 ME3wMz+8bKd4+Wk5Sz6mnPGr3eHTyeFV6Wg0FKQxP+PnUPsTN5VJfXFTfITv5aURdiHIBA/mP
 uHMiQpmPhY4sFZ+iYhokum2iNF9pahcG4JLjut4/uhpM+Ift2agZ+tTgtdGW6Pz/sCh5LQ6lM
 qxbnRCbsbOW8ht0mA1XtHzzvJyaThgDj9hetWFmz9H3hJIboSDqqYkqRVlpF3u2EcU2QlCijp
 CecDWmvOCEmD2ZghMf9+jUUgOfiGtscbmcF00iLgXeq1veaAgTh1UOHqFZXIX3cktnEIuizmq
 3RT14Q/PyJDWwTmywjYs7r47J7vikE1EskWXcWiqbEx3Z+FEbdaGLEcZwUGys2eU/azKSei3b
 Y9ikOTnLWnWILlzqtKQ3OOcOKXglPXDkT+fY3EVK6/ZqW4/YireyoEpUGv+wqO1JA62PjVj4d
 doudpvXtnORDwCxWPWlFvfAWU9t7NBwqRUGcG+Gn/w6wnCOvVSQJfjz5WWBtK0b4A1ljB54BG
 NmC0eQKIoc1NoxEWuoxyYYiVbbup3Yqbj5lSjw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Le 08/06/2022 à 00:26, Richard Henderson a écrit :
> This separates guest file descriptors from host file descriptors,
> and utilizes shared infrastructure for integration with gdbstub.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/m68k-semi.c | 306 ++++++++++------------------------------
>   1 file changed, 76 insertions(+), 230 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


