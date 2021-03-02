Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF932AA20
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:13:04 +0100 (CET)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAS7-0001uO-2N
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH9PX-00077G-Be
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:06:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:50646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH9PP-0000W5-0a
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:06:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AFCFAC54;
 Tue,  2 Mar 2021 18:06:09 +0000 (UTC)
Subject: Re: [RFC v2 22/24] target/arm: cpu64: wrap arm cpregs with CONFIG_TCG
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-23-cfontana@suse.de>
 <d85fe6a2-1288-8c15-f723-3e7f7550a19d@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <bcaca65f-ea79-418c-9e60-c1003ec0cba3@suse.de>
Date: Tue, 2 Mar 2021 19:06:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d85fe6a2-1288-8c15-f723-3e7f7550a19d@linaro.org>
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

On 3/2/21 5:58 PM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> these cpregs should be moved to tcg/ later on.
>>
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> ---
>>   target/arm/cpu64.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
> 
> What is this in aid of?  It's certainly wrong.
> 
> r~
> 

Yes, I dropped it, thanks.

Claudio

