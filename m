Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FA1309280
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 08:17:16 +0100 (CET)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5kVO-0006du-RI
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 02:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l5kU0-0006BP-VL
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 02:15:48 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:45574
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l5kTy-0005mQ-M3
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 02:15:48 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id BD656DA06D0;
 Sat, 30 Jan 2021 08:15:41 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-3-richard.henderson@linaro.org>
 <CAFEAcA-Ez=3Xv5jVei1E3noa20D17_Uz_HFOmXK5Ek_p0_dwkA@mail.gmail.com>
 <ce10459d-0dde-6a1f-2efa-5643ebf2931d@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v3 02/24] tcg/tci: Remove TCG_TARGET_HAS_* ifdefs
Message-ID: <a0bea30f-4477-14a3-2576-2e3d549e456e@weilnetz.de>
Date: Sat, 30 Jan 2021 08:15:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ce10459d-0dde-6a1f-2efa-5643ebf2931d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.01.21 um 07:47 schrieb Richard Henderson:

> On 1/29/21 1:16 PM, Peter Maydell wrote:
>> On Fri, 29 Jan 2021 at 20:13, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> The opcodes always exist, regardless of whether or not they
>>> are enabled.  Remove the unnecessary ifdefs.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   tcg/tci/tcg-target.c.inc | 82 -------------------------------------=
---
>>>   1 file changed, 82 deletions(-)
>>>
>>> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
>>> index 9c45f5f88f..b62e14d5ce 100644
>>> --- a/tcg/tci/tcg-target.c.inc
>>> +++ b/tcg/tci/tcg-target.c.inc
>>> @@ -71,70 +71,42 @@ static const TCGTargetOpDef tcg_target_op_defs[] =
=3D {
>>>       { INDEX_op_add_i32, { R, RI, RI } },
>>>       { INDEX_op_sub_i32, { R, RI, RI } },
>>>       { INDEX_op_mul_i32, { R, RI, RI } },
>>> -#if TCG_TARGET_HAS_div_i32
>>>       { INDEX_op_div_i32, { R, R, R } },
>>>       { INDEX_op_divu_i32, { R, R, R } },
>>>       { INDEX_op_rem_i32, { R, R, R } },
>>>       { INDEX_op_remu_i32, { R, R, R } },
>>> -#elif TCG_TARGET_HAS_div2_i32
>>> -    { INDEX_op_div2_i32, { R, R, "0", "1", R } },
>>> -    { INDEX_op_divu2_i32, { R, R, "0", "1", R } },
>>> -#endif
>>> -#if TCG_TARGET_HAS_div_i64
>>>       { INDEX_op_div_i64, { R, R, R } },
>>>       { INDEX_op_divu_i64, { R, R, R } },
>>>       { INDEX_op_rem_i64, { R, R, R } },
>>>       { INDEX_op_remu_i64, { R, R, R } },
>>> -#elif TCG_TARGET_HAS_div2_i64
>>> -    { INDEX_op_div2_i64, { R, R, "0", "1", R } },
>>> -    { INDEX_op_divu2_i64, { R, R, "0", "1", R } },
>>> -#endif
>> Why are div2/divu2 special cases such that their entries
>> get deleted rather than unconditionally included ?
> Because div/div2 are mutually exclusive.


Yes, that's correct, but as you wrote, "the opcodes always exist,=20
regardless of whether or not they are enabled." The old code already=20
shows that both cases are mutually exclusive.

If someone decides to use TCG_TARGET_HAS_div2_i64 instead of=20
TCG_TARGET_HAS_div_i64 with TCI, that lines (in addition to the=20
implementation of the opcodes) would be needed again.

Regards,

Stefan



