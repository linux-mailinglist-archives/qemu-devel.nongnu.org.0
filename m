Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76143060D2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:18:47 +0100 (CET)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4nWo-0004Vd-E1
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l4nUj-0003PD-62; Wed, 27 Jan 2021 11:16:41 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:41661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l4nUc-0006Yy-Jv; Wed, 27 Jan 2021 11:16:36 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGA0o-1lCWjJ0Aw8-00Gb6W; Wed, 27 Jan 2021 17:16:21 +0100
Subject: Re: [PATCH] tcg/tci: Restrict tci_write_reg16() to 64-bit hosts
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210123094107.2340222-1-f4bug@amsat.org>
 <5450690d-bda6-4ea8-4e4e-006db464dbda@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <03c285be-dc42-2d7d-3327-0be42c8fe92d@vivier.eu>
Date: Wed, 27 Jan 2021 17:16:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5450690d-bda6-4ea8-4e4e-006db464dbda@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pSw/wAyMj3/0d0Mm0/vVim76IHJ3YVG/7MJOnRUkjJp5yWB7vEm
 i+cT9uoSyZqom3ePnZWdHPxSRCWJfPyo7GWusXFW6/cujSHDlDz4MySdFL/Ctx+UNvD2sUS
 zlX1fLKzJg5jP5SpRgSXy4bWa0sD6c88wmg5kYNAMmwzNiegNsGnAgErXHd8FZjRiZCfp1y
 HXQLgFARBjYxkIdEIWS9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XyADAzfgy1M=:03PZPh5xySjbrOq6fQr/Ue
 IciY0EZTfahWz7BUlIpLTjAnaJxnYGcvdFKULNdC+xastQ1tkI/+bdKhHKRn/hTdbXuh99kvq
 x8RFNSXCp5RIap2yMaxtCIwhRzol+s0zk4+sprftTOd+x8nP0flbxCczfiZp6qfE6G1Xc2JYr
 Ry+AVOQlGyv2+MDlsV0EVn2+R+nDFp7X39XtVfRMPx/ChO2C/gJ7yPIkf1qVRR9dqxVC6x/OQ
 IG+n0oCeyvwwBI38edudWSbzj5gMupqmJw2BoHoeqs0Id0AGiXYEC87LgDO/u23hfWsiIOasv
 jtaWUJwkukh6qOFyQEzP7aI4XmkvdMYOGpqX048nSkE99jpJVi/szlnGlMbYxiYNamc2pJBuI
 8dpE6R0zMT9qaEfR46IGdUuajn7YR4Y0Xbv2+T38WkVMA0f81RaDDic2IiORC
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/01/2021 à 11:30, Stefan Weil a écrit :
> Am 23.01.21 um 10:41 schrieb Philippe Mathieu-Daudé:
> 
>> Restrict tci_write_reg16() to 64-bit hosts to fix on 32-bit ones:
>>
>>    [520/1115] Compiling C object libqemu-arm-linux-user.fa.p/tcg_tci.c.o
>>    FAILED: libqemu-arm-linux-user.fa.p/tcg_tci.c.o
>>    tcg/tci.c:132:1: error: 'tci_write_reg16' defined but not used [-Werror=unused-function]
>>     tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
>>     ^~~~~~~~~~~~~~~
>>
>> Fixes: 2f160e0f979 ("tci: Add implementation for INDEX_op_ld16u_i64")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   tcg/tci.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tcg/tci.c b/tcg/tci.c
>> index 2311aa7d3ab..3fc82d3c79d 100644
>> --- a/tcg/tci.c
>> +++ b/tcg/tci.c
>> @@ -128,11 +128,13 @@ static void tci_write_reg8(tcg_target_ulong *regs, TCGReg index, uint8_t value)
>>       tci_write_reg(regs, index, value);
>>   }
>>   +#if TCG_TARGET_REG_BITS == 64
>>   static void
>>   tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
>>   {
>>       tci_write_reg(regs, index, value);
>>   }
>> +#endif
>>     static void
>>   tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)
> 
> 
> Thanks for fixing this. This could optionally be applied via qemu-trivial.
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent



