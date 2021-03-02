Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96802329E29
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:17:47 +0100 (CET)
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3yE-0001aG-Ky
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH3wd-0000ka-MR
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:16:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:40378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH3wc-00082L-2f
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:16:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57B32AF19;
 Tue,  2 Mar 2021 12:16:04 +0000 (UTC)
Subject: Re: [RFC v2 15/24] target/arm: move arm_mmu_idx* to get-phys-addr
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-16-cfontana@suse.de>
 <ad1c16c6-131b-dad9-fe1a-0343e59757fb@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7012d1cf-cd8b-36d8-c91d-9b23af87384c@suse.de>
Date: Tue, 2 Mar 2021 13:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ad1c16c6-131b-dad9-fe1a-0343e59757fb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 5:35 AM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> ---
>>   target/arm/get-phys-addr.c | 95 ++++++++++++++++++++++++++++++++++++++
>>   target/arm/tcg/helper.c    | 95 --------------------------------------
>>   2 files changed, 95 insertions(+), 95 deletions(-)
> 
> So... get-phys-addr.c is now gaining stuff not related to get_phys_addr? 
> What's your end goal?
> 
> Is there a better a better name, like mmu_helper.c?  Should these in fact go 
> into a second file, leaving get-phys-addr to itself?
> 
> 
> r~
> 

These are all good questions;

I would like to avoid the word "helper", as it triggers tcg/ HELPER() stuff for me,
but I am not excluding it if we don't have a better idea.

The alternative to put this stuff into their own file is open for me.

Thanks,

Claudio

