Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D64161E0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:17:38 +0200 (CEST)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQTh-0005ws-6F
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQR9-0003pa-Gq; Thu, 23 Sep 2021 11:14:59 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQR7-0005po-QX; Thu, 23 Sep 2021 11:14:59 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTAJr-1mIFbB48xb-00UWkp; Thu, 23 Sep 2021 17:14:43 +0200
Subject: Re: [PATCH-for-6.2 0/2] disas/nios2: Simplify endianess conversion
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
References: <20210807110939.95853-1-f4bug@amsat.org>
 <a99e29c5-0aed-2a7c-cbdd-ebaecc99a448@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <aa70868b-78b0-838a-55cd-3a7399fc041f@vivier.eu>
Date: Thu, 23 Sep 2021 17:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a99e29c5-0aed-2a7c-cbdd-ebaecc99a448@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KHo14FXEPo83wCnlwqlpa3CteBaXcro0a2Zgg6Os7y+vAa95Pug
 HhvgirUGBUSol279b/+z+78SYYmeEDAOOCnkSwEJSBSIf/qDdrgO3wU3NhJJVP2s1PspPNn
 BEb5AIbVUB5VwMrLK5demZHbKVgZfpupF8GsTt0HXetmF9vx5C62kgG6oyqoOmJUjvKWuOS
 j+JFTTbdm538K7qbY/vMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zz++I2N9hWY=:VZCWv33ulyamY27miiONMJ
 CNmGk5q1hvkryVDs1mHCm0suJjpDsIRzzx2MQgJmuFGf0yLX08JR5EXMguJRk5EZzTWA1fge+
 7iq9/VpvkykAIIrEpk23qriDTnVxjsr/aQsWptRQ8tUTYXKs5dAtfbFVOaKEYD+eTbG8//TmL
 4jAYmTdc65cdH7zZH4xTqTe3xxN7XiOIyqEvC2Z+pd3fS8dmSEcYHxQs/4Ys5mF/XL8WOhhQD
 GrwYey4zYUACdFW2V0M9TRlb3ABK0gzuGjutXKYi063ZBeVNw4Yuw7rA3RuRIrGsnmGT+1rSF
 igcFSPe7Facq+12fGSpUCKmUKNwf3CAmzV5BkZ055MZHRpvf4mD6iw6Vn6irTJsKv93hauOlV
 T5Pw122Jx0noDRZvYKyw/bplKts4h4LLx+wKP6lmxSEZ26+KbMtjZDhBejxdpcEyFt5i1MjyD
 Nw69dBKCRbithn2Cw4ZTHHvNsvPOWwNfgffOnF5WLEblgEem+iioAYELaGIVuTDMZg7NcRdHh
 8nhLUbD0HmaEV88bStT5XH0xQ19qOlCzGq9wKkzxzDi8cHYN9vNQ1xGRWcfsNo1KtqB73OdmH
 esOuvC1c/j29xIWWlMvbm25J3bVTQXHFsVKR+O/yfep24nu8JcqpYKBFIbO+cbJRT/PQGsqOV
 TOFnaO4h2FTWiqdGoma34bUYzObHvk1Wg4nAzb5hKGWqbGDv0tCcC16X612nTAE3b08vlkV5Y
 7ui0GF4HO/bmJQimLQbENqkncHCNEbVOXLa1zw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/09/2021 à 11:19, Philippe Mathieu-Daudé a écrit :
> Cc'ing qemu-trivial@ (series fully reviewed).
>

An Acked-by from one of NiosII maintainers would be welcome.

Thanks,
Laurent

> On 8/7/21 13:09, Philippe Mathieu-Daudé wrote:
>> After chatting with Richard Henderson and Paolo Bonzini, we
>> concluded the load/store API is mature enough to have target
>> code endianess-agnostic.
>> Thus we could remove the TARGET_WORDS_BIGENDIAN definition from
>> target-specific code (restricting it to the binary format loaders).
>>
>> While experimenting, I noticed the Nios2 disassembler is an easy
>> win. MIPS will follow shortly.
>>
>> Philippe Mathieu-Daudé (2):
>>   disas/nios2: Fix style in print_insn_nios2()
>>   disas/nios2: Simplify endianess conversion
>>
>>  include/disas/dis-asm.h |  3 +-
>>  disas/nios2.c           | 71 ++++++++++++++++-------------------------
>>  target/nios2/cpu.c      |  6 +---
>>  3 files changed, 29 insertions(+), 51 deletions(-)
>>
> 


