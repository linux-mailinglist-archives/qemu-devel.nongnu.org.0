Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA993227A9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:20:05 +0100 (CET)
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETrQ-0004jp-TY
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEToq-0003GN-Q5
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:17:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:59096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lETop-0005HK-9E
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:17:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E47FAF11;
 Tue, 23 Feb 2021 09:17:22 +0000 (UTC)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <80a645c4-866c-2791-ac9c-91118018a44c@linaro.org>
 <1ae56383-7664-c2df-9402-97844cfbeade@suse.de>
 <16621e3a-bf32-8032-501e-f1aa3c37aff4@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <4ec301cb-bd15-5cd9-d9f2-8a1b49f443f3@suse.de>
Date: Tue, 23 Feb 2021 10:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <16621e3a-bf32-8032-501e-f1aa3c37aff4@linaro.org>
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

On 2/22/21 5:08 PM, Richard Henderson wrote:
> On 2/22/21 12:43 AM, Claudio Fontana wrote:
>> Regarding terminology, I think the mismatch is throughout the code right?
> 
> Yes, e.g. the top-level softmmu/.
> 
> 
>> So many of the existing "softmmu" files and directories should actually be
>> called "system", or "sysemu" to match include/sysemu right?
> Yes, please.  Let's not add new mistakes.
> 
>> Maybe it would be good to have clear documentation about this in devel/ to
>> use as a reference and end-goal, and then we could do a pass of the whole
>> code to fix the discrepancies in the use of the terms?
> I suppose.  Where do you suggest adding those couple of sentences?
> 
> 
> r~
> 

I'd say docs/devel/code-config-macros, or something like that.

I think for a new developer coming into the codebase, the big hurdle is trying to figure out why there are so many CONFIG_,

in which files and directories they can and should be used,

which effects they have and the most dangerous pitfalls (f.e. header files and mixed common/specific modules), ...

Ciao,

Claudio





