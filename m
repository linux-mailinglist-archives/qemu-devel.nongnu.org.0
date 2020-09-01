Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA441258C33
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 11:59:39 +0200 (CEST)
Received: from localhost ([::1]:43562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD34k-0004ck-U1
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 05:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD33D-0001Re-AE; Tue, 01 Sep 2020 05:58:03 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:47069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD33B-0004FJ-Dj; Tue, 01 Sep 2020 05:58:02 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MoNu2-1kxOLy2VU8-00op6x; Tue, 01 Sep 2020 11:57:54 +0200
Subject: Re: [PATCH v3 04/10] target/arm/translate-a64:Remove redundant
 statement in disas_simd_two_reg_misc_fp16()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
 <20200827110311.164316-5-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b4135c25-4158-ebe8-4199-b2b9669c5209@vivier.eu>
Date: Tue, 1 Sep 2020 11:57:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827110311.164316-5-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HijNUrbLIJSVgO0hHbHN0j4hlj6U5z/NaZPZcc58Jx8wIFdyT3r
 DA+aFjjdWDzfiOTSHfqnzs2rKfJ42Yhmuxn9/EFkSs/XivaL1oS8W5TA2CkvGCLcZcYkjAx
 3pOx4bJ68LNNtz0m4yYSge6CdT1tJmJIEY1fgwk9awI4ZEj86KSFsGcOtbAz+J56PbCGkKw
 W1I4ORoZd2XhnGEBthP+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zpQCU3r4ZNU=:tT1t7s6AWT0AYqx/QKgVRW
 3KeT8qLQYYOZCzjumloy9R1+phhOpnDEC7VaIOAdjRTWwtsEivMRopdblWx/Q0NcJcLasWaGg
 Q/9lmGbaizfvR6xE2G/C+FXPHUlxWHMy5YCwgW0iyNaHWbDQn97na5PvxxyRefQfAQIQssjdz
 9pMi2JTmhEVI5oxb8PM7Z2YC4vh+wZAY8ND2s76NzFB9jWR5MtsgMAhasVe2+/0/+0qw7iZD3
 kv+8HIcegfQDZ4a8JfDGcdmfjHG1UDUiYDyZfVT4QTEPewp2E7v87Fx8DA+Iy2wMJR+oCBWCn
 3w4u8IFt+9rOA0DfvMVNkyP0m2/q7SuDGXL/AGOwofS2SsZGr9F9/8oRa442EMjTMY+MweEar
 NA9R69vT5To5E2Vh2uzl4hZLBXWdgf4OITQwoz8k9g9v1fmgRj6WzHVWdpwf1zW88a1l/Qr35
 QygDqULlWQHRhUFHnV5f2zsfiLYgseZcnoYQf6jZV1qJTuOaSqFVi/SFnZFaaHGlOhuzmusN8
 yAqxVryasGFzTRphndD43lRb0S9aZAvdWKalWXYtaiZ1GhIVeybMn8KJJZh8/hL3EtmiCrSa9
 NXVrLDjP7DP/RiT5W95StncaEUYz87jevyjxRq/9XPRl1wETHapdIGUxOx41Dslj1RN/bWL2z
 /FreOZmYrrDA+DSF45vcBIE7BalCIPP5D9gilWrBe1XChTTI9PUFqlhoXxzx90vObZdVDzbHN
 kUBvpLhljXJ+T+B9g3OV4pi7jAn+7ANqJ8ffq7kWgCIyCbKBfgZHw0D0fZyU1vbzgL66ouW/a
 X87/DXsmGeYi5UOJUG9UmLewvfSWZRb1DEoesj+JFW+jjmOCcRSHQxS/tU9of5pnqMnis/g
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:47:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.13,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 pannengyuan@huawei.com, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/08/2020 à 13:03, Chen Qun a écrit :
> Clang static code analyzer show warning:
> target/arm/translate-a64.c:13007:5: warning: Value stored to 'rd' is never read
>     rd = extract32(insn, 0, 5);
>     ^    ~~~~~~~~~~~~~~~~~~~~~
> target/arm/translate-a64.c:13008:5: warning: Value stored to 'rn' is never read
>     rn = extract32(insn, 5, 5);
>     ^    ~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> ---
>  target/arm/translate-a64.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index c83bb85e4e..47cce160d8 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -13016,9 +13016,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
>      fpop = deposit32(opcode, 5, 1, a);
>      fpop = deposit32(fpop, 6, 1, u);
>  
> -    rd = extract32(insn, 0, 5);
> -    rn = extract32(insn, 5, 5);
> -
>      switch (fpop) {
>      case 0x1d: /* SCVTF */
>      case 0x5d: /* UCVTF */
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


