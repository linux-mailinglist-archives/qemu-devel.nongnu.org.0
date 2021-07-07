Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95BD3BE14D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 05:15:35 +0200 (CEST)
Received: from localhost ([::1]:58406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0y2A-0008MD-Be
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 23:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1m0y1C-0007gi-5Z
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:14:34 -0400
Received: from smtpbg511.qq.com ([203.205.250.109]:33244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1m0y17-0006wp-Hm
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:14:31 -0400
X-QQ-mid: bizesmtp43t1625627649tajl1p8j
Received: from [10.128.196.47] (unknown [223.72.72.71])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 07 Jul 2021 11:14:08 +0800 (CST)
X-QQ-SSF: 0140000000200080X000B00Z0000000
X-QQ-FEAT: qt1C09sEgK9Exod8H9A6+NrN4/5ro3RIE6i+vdkolftLvrq4vUrfoiBX2c212
 yh0eZEcuRFj5fst4vL1ws5XFwP01HobB+3HUuMIoYuVTzFHA5ytzkbTnqimd85EnJQQ+qvV
 hsHfXQNmvQwADUH3STcQ1LWMwMivLvlNP3vGXSudtOcGgeH0DAajcy23FaQJ6lOQiVV2xX8
 68iQaTHjHA4H1Mg9ZO7L3l+QhW8Nb1o3iqP7hressaTuSfl8h0Oh5R+wIqQd+nLvsS0aEyu
 rAA9zvKWqJnTZU5Oxhn1DOLKMiCAEenaAWZrvmr6Z38iYj3rnA0RrnfbWWtl+o9qdDSppam
 epcNu5vXfExGJt52qyVr1MVcpfd8w==
X-QQ-GoodBg: 2
Subject: Re: [PATCH 2/2] tcg: Bake tb_destroy() into tcg_region_tree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <cover.1625404483.git.lrwei@bupt.edu.cn>
 <8dc352f08d038c4e7a1f5f56962398cdc700c3aa.1625404483.git.lrwei@bupt.edu.cn>
 <6cf44d4a-c127-2910-f0b6-de32db273738@linaro.org>
From: Liren Wei <lrwei@bupt.edu.cn>
Message-ID: <ecdeddcf-cb50-fb73-50e3-cf5cb404f659@bupt.edu.cn>+1E6DD77CD3963BD3
Date: Wed, 7 Jul 2021 11:14:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6cf44d4a-c127-2910-f0b6-de32db273738@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=203.205.250.109; envelope-from=lrwei@bupt.edu.cn;
 helo=smtpbg511.qq.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 8:34 AM, Richard Henderson wrote:
> On 7/4/21 7:31 AM, Liren Wei wrote:
>> -static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp)
>> +static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp, gpointer _)
>
> Using _ here as the variable name isn't ideal.  I guess if this were 
> c++ we would actually omit the name, which is kinda the same.  But I 
> think it's just as easy to name it userdata, as per glib docs.
>
> I'll fix that up while queuing, thanks.
>
Got it, thanks.
> I'm not keen that the spinlock init and destroy are in different 
> places, but surely that should be fixed by moving the init to 
> tcg_tb_alloc, probably moving it to tcg/region.c as well.
>
>
> r~
Indeed, that would be much more clear. But I kind of feel that 
initialization of TB spinlock is deliberately placed after 
tcg_gen_code() in the current implementation to prevent buffer_overflow 
or any rewinding from leaking the initialized spinlock (, through it 
seems to me that there is nothing to leak for a spinlock whatsoever).

Liren Wei




