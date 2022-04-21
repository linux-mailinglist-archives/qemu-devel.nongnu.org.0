Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D2509FA2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:29:05 +0200 (CEST)
Received: from localhost ([::1]:51296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVvl-0002Yc-2p
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhVLV-0001Mh-Hj
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:51:37 -0400
Received: from rev.ng ([5.9.113.41]:41507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhVLT-0000Zb-DH
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LHi4J0BFRsNbEvYLbQg+HvJCtqnsGjQuTrSauH1zYEo=; b=FqWIF/rXwy8zJYE1xEtVk1kNsQ
 MmSptlAbggvGzhM6sAWieP63U30e7Uw7gImA1Fuyrz6ap8+yv4i6q5tg4vS1j9fDFhAZTyiJstNmO
 AYq0/Rvvj54bu6db94tBxyJjNFFSlrpOabXueXXM6cg1RDQWbOuVyU57iiEBoqhI4JSw=;
Message-ID: <fcc026f5-afd4-95d2-bbbf-0c2795a0e769@rev.ng>
Date: Thu, 21 Apr 2022 13:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Michael Lambert <mlambert@quicinc.com>, "babush@rev.ng" <babush@rev.ng>,
 "nizzo@rev.ng" <nizzo@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
References: <20220209170312.30662-1-anjo@rev.ng>
 <20220209170312.30662-11-anjo@rev.ng>
 <SN4PR0201MB8808765107E51ACC51D89DECDEEA9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <3553bdb8-021c-3105-f8d3-4d65fd2bc0b8@rev.ng>
 <SN4PR0201MB880894159A8E5558A97707E3DEED9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Organization: rev.ng
In-Reply-To: <SN4PR0201MB880894159A8E5558A97707E3DEED9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

Here's an updated version of `gen_set_usr_field_If`

https://gitlab.com/AntonJohansson/qemu/-/blob/feature/idef-parser/target/hexagon/genptr.c#L673

If this looks alright and we have your "reviewed-by" on this patch, I'll 
go ahead and submit the new
patchset! :)

-- 
Anton Johansson,
rev.ng Labs Srl.

>
>> From: Anton Johansson <anjo@rev.ng>
>> Sent: Tuesday, April 12, 2022 10:11 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: ale@rev.ng; Brian Cain <bcain@quicinc.com>; Michael Lambert <mlambert@quicinc.com>; babush@rev.ng; nizzo@rev.ng; richard.henderson@linaro.org
>> Subject: Re: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
>>
>> Very nice catch, this is the bug that plagued us a few weeks ago when rebasing,
>> it has since been fixed. Actually the `gen_set_overflow` fucntion has been removed
>> completely as it was only called when we handled `asl/asr_r_r_sat`.
>> Current way we handle overflow:
>>
>> Overflow is now only set by saturates, this assumption holds for the instructions
>> we parse in phase 1. In the parser, all saturates call `gen_rvalue_sat` which emits
>> a call to `gen_set_usr_field_if` in `genptr.c` to set USR_OVF only if the value is
>> non-zero. It does this via OR'ing with the previous value.
>>
>> See https://gitlab.com/AntonJohansson/qemu/-/blob/feature/idef-parser/target/hexagon/idef-parser/parser-helpers.c#L2109 for `gen_rvalue_sat`
>> and https://gitlab.com/AntonJohansson/qemu/-/blob/feature/idef-parser/target/hexagon/genptr.c#L669 for `gen_set_usr_field_if`
> Your implementation of gen_set_usr_field_if is not correct.  Don't extract the bits from the value based on the reg_field_info.  The easiest thing to do is compare val with zero and jump over a call to gen_set_usr_field.  If you are determined to do an "or", you have to assert that ref_field_info[field].width == 1.  Then, you can extract 1 bit from val starting at offset zero and shift the result left by ref_field_info[field].offset and then "or" with USR.
>
> Thanks,
> Taylor


