Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EBE5533CC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:39:23 +0200 (CEST)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3e6E-0000My-LQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e3h-00062W-Ju
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:36:45 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:33261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3e3g-0003Ig-1V
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:36:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MyK9U-1nkkkj3jLg-00yjW1; Tue, 21 Jun 2022 15:36:22 +0200
Message-ID: <8b020b8f-b859-90ef-a795-6194d39ddf9e@vivier.eu>
Date: Tue, 21 Jun 2022 15:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 7/7] target/xtensa: use semihosting_exit_request on
 semihosted exit syscall
Content-Language: fr
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20220621125916.25257-1-lmichel@kalray.eu>
 <20220621125916.25257-8-lmichel@kalray.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220621125916.25257-8-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Z7pWryT+p5JrZUsmU2jCGbvsnaet8CFMu6WwvHAXtVdhfSNNF7M
 kv9+XV2XL9O1zeN6ggVr/iwvTQ610tMz0DKjkYUEtbOjD7HEh360zW4MESTb1o827ndDxv+
 pAcMV54k1flpUzUojINSN1UaBdizpGwd9j3j0d8Qov3Ydc84xAWhxqDmXleMtQTwejVFOWB
 ZHGJ2tmASIaCN0aelaHaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G0+2KGDtNWg=:dfVCoxMzcK1S9G1J1CEA9r
 FHuNNbB+J12tyz1Jp34mV/M+XbvvvrEcs2h2q5repAGD0gbmPrM/YPoW9S/Tl/Rwmo28OEy4Z
 ERfH5nFj/lv9/3/lR4SoCYeZoWYl8/o7j3JqksWSLTRBJZQI4/HLwLdiLUoNbsXykMQ3eOgB1
 OS43zD/4ItysNJT4YeqYGqqYt5/fUg3DroaeMlJLecuX4jxCu7K4MDolcFy+11NC2WcG0/rUN
 6APBK68IivfurePb4s71mAfJ2EZZ6u2p9erw7ezoMJrWcsANoTpN9D66mJ2TQGj5G0rF6XRkD
 sNLGOdCSAICIgotB41H9p2xDapf/1XeRqx3VnNDXSs1vPcGkQ8aZG98S4l5jFocZCVtxjitKN
 dq2CY1JKZ33pPhFiHHXC0VuJR5gUJ+dVeDzICsrhmX8MgzJ9lA5oQRhEeSR+eQHwD5nBPMOoU
 seACc76Zfz9eLSMBho4m8345vPog6nM7Tsbp7Ox4DbcXwnEhMlt5mUmWi7GxZuCKKpQgEO77s
 yMy0MxZXvZXSp4Yub1OO/ObaAwPsLf63Sq4uKAD1pfR/24omHFqybF83uUA2F0WMiW5VpKEyr
 YrJjVwmCzLNwt934s16wMEMkhsyDnJSSUZ+5VqtrDXqZRWYjf44ULtmwpN1Ea4MPl3We7vnqs
 1MRyo07bOBTsanarlr2SzlIIv12988fevXxWAN6R7CXMSqQz/acHblGZ90b52iqs/9BUfbGyK
 s+5fmh7mkHlrxhFPcFxhcFRTT/alCbddfhh5PA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Le 21/06/2022 à 14:59, Luc Michel a écrit :
> Use the new semihosting_exit_request instead of a call to exit when
> handling a semihosted exit syscall.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
>   target/xtensa/xtensa-semi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


