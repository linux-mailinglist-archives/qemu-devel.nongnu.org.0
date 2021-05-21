Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A1338BC48
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 04:11:35 +0200 (CEST)
Received: from localhost ([::1]:53266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljudR-0007V2-U2
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 22:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ljubu-0006o3-Bg
 for qemu-devel@nongnu.org; Thu, 20 May 2021 22:09:58 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:47847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ljubn-0001Ub-1C
 for qemu-devel@nongnu.org; Thu, 20 May 2021 22:09:58 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07450222|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0738354-0.00120214-0.924962;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.KGVOQ0E_1621562980; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KGVOQ0E_1621562980)
 by smtp.aliyun-inc.com(10.147.41.120);
 Fri, 21 May 2021 10:09:41 +0800
Subject: Re: [PULL v3 36/42] target/riscv: Remove the hardcoded MSTATUS_SD
 macro
To: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
 <20210511101951.165287-37-alistair.francis@wdc.com>
 <CAFEAcA-ZPxvdTE13cjxy7o7mcD7DT7p8nRPbueF_S9QO0F3_FA@mail.gmail.com>
 <CAKmqyKNfZy4SryA91u65mxvsumTKb+dyX2whaCEpkAxr7rq9gQ@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <573b18ae-baa5-1d38-9d5c-b484d8a49748@c-sky.com>
Date: Fri, 21 May 2021 10:07:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNfZy4SryA91u65mxvsumTKb+dyX2whaCEpkAxr7rq9gQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.149; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-149.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/21/21 6:55 AM, Alistair Francis wrote:
> On Thu, May 20, 2021 at 11:55 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Tue, 11 May 2021 at 11:22, Alistair Francis <alistair.francis@wdc.com> wrote:
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Message-id: fcc125d96da941b56c817c9dd6068dc36478fc53.1619234854.git.alistair.francis@wdc.com
>>> ---
>>>   target/riscv/cpu_bits.h  | 10 ----------
>>>   target/riscv/csr.c       | 12 ++++++++++--
>>>   target/riscv/translate.c | 19 +++++++++++++++++--
>>>   3 files changed, 27 insertions(+), 14 deletions(-)
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index 26eccc5eb1..a596f80f20 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -78,6 +78,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>>>       return ctx->misa & ext;
>>>   }
>>>
>>> +#ifdef TARGET_RISCV32
>>> +# define is_32bit(ctx)  true
>>> +#elif defined(CONFIG_USER_ONLY)
>>> +# define is_32bit(ctx)  false
>>> +#else
>>> +static inline bool is_32bit(DisasContext *ctx)
>>> +{
>>> +    return (ctx->misa & RV32) == RV32;
>>> +}
>>> +#endif
>> Hi; Coverity points out (CID 1453107) that this is_32bit() function
>> can never return true for at least some build configs, because RV32
>> is defined as ((target_ulong)1 << (TARGET_LONG_BITS - 2))
>> but ctx->misa is a uint32_t field, which (if TARGET_LONG_BITS is
>> 64) is not big enough for the RV32 bit.
> This seems like a false positive as RV32 is defined as:
>
> ((target_ulong)1 << (TARGET_LONG_BITS - 2))
>
> while ctx->misa is a target_ulong.

Although the misa in RISCVCPUState is target_ulong, the misa in 
DisasContext is uint32_t.

I think we should  fix up the misa in DisasContext.

Zhiwei

>
> So it should always be able to return true.
>
> Alistair
>
>> Bug, or false positive ?
>>
>> thanks
>> -- PMM

