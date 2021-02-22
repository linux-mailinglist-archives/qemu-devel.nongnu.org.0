Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24654321238
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:47:58 +0100 (CET)
Received: from localhost ([::1]:50996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6sn-0004Ql-8F
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lE6oF-00008n-Ds
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:43:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:36796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lE6oD-0005J9-O5
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:43:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26A42B12A;
 Mon, 22 Feb 2021 08:43:12 +0000 (UTC)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <80a645c4-866c-2791-ac9c-91118018a44c@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1ae56383-7664-c2df-9402-97844cfbeade@suse.de>
Date: Mon, 22 Feb 2021 09:43:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <80a645c4-866c-2791-ac9c-91118018a44c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On 2/22/21 6:35 AM, Richard Henderson wrote:
> On 2/21/21 1:24 AM, Claudio Fontana wrote:
>>   target/arm: move psci.c into tcg/softmmu/
> 
> Terminology: the opposite of user-only is not "softmmu" but "system".
> 
> One glorious day in the far future user-only will, as an option, use softmmu.
> It will fix all sorts of problems with alignment faults and host/guest virtual
> address space mismatch.
> 
> 
> r~
> 

Hi Richard,

first thanks for all the useful pointers in the series.

Regarding terminology, I think the mismatch is throughout the code right?

So many of the existing "softmmu" files and directories should actually be called "system",
or "sysemu" to match include/sysemu right?

To me these distinctions are a bit unclear.
Maybe it would be good to have clear documentation about this in devel/ to use as a reference and end-goal,

and then we could do a pass of the whole code to fix the discrepancies in the use of the terms?

Thanks,

Claudio





