Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF5650A67E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:01:11 +0200 (CEST)
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaB4-0002ds-DH
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhZpa-0005EZ-9Z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:38:58 -0400
Received: from rev.ng ([5.9.113.41]:45939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhZpW-0002ZQ-5n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3XlU2StcWdmFOylCpyezW33krKVoFvsa2NU8X+rYsvo=; b=MSoBWzjBqkUplepbXtSdXAU7w9
 gZzgs/2d6+E9XzgFSFCzAe2L+1REl2WWmHj2+7QYV5ABbSo8AZgchxzX1sV5cophp7Kk+XG169s4v
 1JhpGv6sMDk8tZ4H+Vgp+tslVEet4j7e65jVVsBHmUJWi9VcrnasozO8+zFpf4PV1/dA=;
Message-ID: <c4909f05-8f4c-0478-01b7-40ea86bb2cba@rev.ng>
Date: Thu, 21 Apr 2022 18:38:20 +0200
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
 <fcc026f5-afd4-95d2-bbbf-0c2795a0e769@rev.ng>
 <SN4PR0201MB880889BD2CE34C2FE9F18803DEF49@SN4PR0201MB8808.namprd02.prod.outlook.com>
Organization: rev.ng
In-Reply-To: <SN4PR0201MB880889BD2CE34C2FE9F18803DEF49@SN4PR0201MB8808.namprd02.prod.outlook.com>
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


>
>> -----Original Message-----
>> From: Anton Johansson <anjo@rev.ng>
>> Sent: Thursday, April 21, 2022 6:51 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: ale@rev.ng; Brian Cain <bcain@quicinc.com>; Michael Lambert
>> <mlambert@quicinc.com>; babush@rev.ng; nizzo@rev.ng;
>> richard.henderson@linaro.org
>> Subject: Re: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
>>
>>
>> Here's an updated version of `gen_set_usr_field_If`
>>
>> https://gitlab.com/AntonJohansson/qemu/-/blob/feature/idef-
>> parser/target/hexagon/genptr.c#L673
>>
>> If this looks alright and we have your "reviewed-by" on this patch, I'll go
>> ahead and submit the new patchset! :)
>> /*
>>   * Note: Since this function might branch, `val` is
>>   * required to be a `tcg_temp_local`.
>>   */
>> void gen_set_usr_field_if(int field, TCGv val)
>> {
>>      /* Sets the USR field if `val` is non-zero */
>>      if (false && reg_field_info[field].width == 1) {
> Remove the "false &&"
>
> Otherwise
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

Ah ofc! Remnant of testing. Fixed.

I'll rebase and run the usual pre-submit tests once again.

>
>
>>          TCGv tmp = tcg_temp_new();
>>          tcg_gen_extract_tl(tmp, val, 0, reg_field_info[field].width);
>>          tcg_gen_shli_tl(tmp, tmp, reg_field_info[field].offset);
>>          tcg_gen_or_tl(hex_new_value[HEX_REG_USR],
>>                        hex_new_value[HEX_REG_USR],
>>                        tmp);
>>          tcg_temp_free(tmp);
>>      } else {
>>          TCGLabel *skip_label = gen_new_label();
>>          tcg_gen_brcondi_tl(TCG_COND_EQ, val, 0, skip_label);
>>          gen_set_usr_field(field, val);
>>          gen_set_label(skip_label);
>>      }
>> }

