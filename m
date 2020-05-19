Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820B1D9654
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 14:30:09 +0200 (CEST)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb1No-0006si-L1
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 08:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jb1LW-00033R-Hp; Tue, 19 May 2020 08:27:46 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jb1LT-0003N0-WB; Tue, 19 May 2020 08:27:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08433409|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00778686-0.00114687-0.991066;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03268; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.HajG8vg_1589891253; 
Received: from 30.225.208.54(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HajG8vg_1589891253)
 by smtp.aliyun-inc.com(10.147.41.137);
 Tue, 19 May 2020 20:27:34 +0800
Subject: Re: [RFC PATCH 8/8] riscv: Add RV64F instructions description
To: Richard Henderson <richard.henderson@linaro.org>, peter.maydell@linaro.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-9-zhiwei_liu@c-sky.com>
 <99fa418c-9a2e-d806-b164-3a08fecd74e8@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <c093ec93-d16b-1ca3-39d6-9c21bd4fa623@c-sky.com>
Date: Tue, 19 May 2020 20:27:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <99fa418c-9a2e-d806-b164-3a08fecd74e8@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 08:27:38
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, palmer@dabbelt.com, alistair23@gmail.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/5/12 2:11, Richard Henderson wrote:
> On 4/30/20 12:21 AM, LIU Zhiwei wrote:
>> +FCVT_L_S RISCV 1100000 00010 rs1:5 rm:3 rd:5 1010011 \
>> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rm != 6 && $rm != 5 }
>> +
>> +FCVT_LU_S RISCV 1100000 00011 rs1:5 rm:3 rd:5 1010011 \
>> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rm != 6 && $rm != 5 }
>> +
>> +FCVT_S_L RISCV 1101000 00010 rs1:5 rm:3 rd:5 1010011 \
>> +!constraints { $rs1 != 2 && $rm != 6 && $rm != 5 }
>> +
>> +FCVT_S_LU RISCV 1101000 00011 rs1:5 rm:3 rd:5 1010011 \
>> +!constraints { $rs1 != 2 && $rm != 6 && $rm != 5 }
> Interesting question here: Do we really want to avoid the reserved rounding
> modes, or do we want to verify that we raise an invalid operand exception?
I think we should always generate legal  instructions except explicitly 
illegal instructions
with proper risu ops code.

Zhiwei
> I guess I'm fine with it either way.
>
>
> r~


