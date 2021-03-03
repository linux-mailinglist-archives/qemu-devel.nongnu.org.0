Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E6432B5E4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:18:19 +0100 (CET)
Received: from localhost ([::1]:60278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHMi2-00089Y-7Q
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lHMgz-0007il-4q
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:17:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:53690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lHMgx-00069r-KY
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:17:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA229AD2B;
 Wed,  3 Mar 2021 08:17:09 +0000 (UTC)
Subject: Re: [RFC v2 16/24] target/arm: move sve_zcr_len_for_el to common_cpu
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-17-cfontana@suse.de>
 <14167e60-3610-172f-b259-45a535625239@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c1a07cc4-3105-0a59-2654-82a306693884@suse.de>
Date: Wed, 3 Mar 2021 09:17:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <14167e60-3610-172f-b259-45a535625239@linaro.org>
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

On 3/2/21 5:41 AM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> it is required by arch-dump.c and cpu.c, so apparently
>> we need this for KVM too?
>>
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> ---
>>   target/arm/cpu-common.c | 33 +++++++++++++++++++++++++++++++++
>>   target/arm/tcg/helper.c | 33 ---------------------------------
>>   2 files changed, 33 insertions(+), 33 deletions(-)
> 
> Same about the choice of file as with cpsr in patch 12.  This is 64-bit 
> specific at least.
> 
> 
> r~
> 

Indeed, fixing this requires more shuffling though, because the existing code
does not protect TARGET_AARCH64-only registers and code for this.



