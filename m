Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9232273D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:49:36 +0100 (CET)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETNu-0006ym-QB
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lETKh-0005O8-SP
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:46:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:34900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lETKe-0000G7-VD
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:46:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C75C7ACBF;
 Tue, 23 Feb 2021 08:46:10 +0000 (UTC)
Subject: Re: [RFC v1 05/38] target/arm: wrap arm_cpu_exec_interrupt in
 CONFIG_TCG
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-6-cfontana@suse.de>
 <38cb9c63-1138-2081-933e-03f6997a50fe@linaro.org>
 <ec2fa580-d4b3-14db-3d5f-001cbdc71946@suse.de>
 <0e100d15-4f6b-bfa8-1fae-d831ae32e2f9@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <a3cab839-3ddf-1adb-f25f-569da6b4daed@suse.de>
Date: Tue, 23 Feb 2021 09:46:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0e100d15-4f6b-bfa8-1fae-d831ae32e2f9@linaro.org>
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

On 2/22/21 4:54 PM, Richard Henderson wrote:
> On 2/22/21 12:31 AM, Claudio Fontana wrote:
>> actually this is a fix for an error I introduced when adding TCGOps:
>>
>> arm_cpu_exec_interrupt should be wrapped in the ifdef, as it uses tcg_ops, which is TCG-only.
>> Maybe I should extract this and make it a standalone fix.
>>
>> Currently, there is no real issue because the non-TCG build is not working for ARM anyway,
>> and that's why the issue went undetected.
> 
> If it doesn't cause a current problem, then let's not bother with a standalone
> patch.  But I wouldn't bother with the ifdef either, but instead move the
> function to an appropriate file.
> 
> 
> r~
> 

Yes, agree.

Ciao,

Claudio

