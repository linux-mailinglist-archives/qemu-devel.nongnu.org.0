Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3D31D1B2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 21:45:07 +0100 (CET)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC7DR-0002Ca-9V
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 15:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lC7Ca-0001lH-Mj
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 15:44:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:47894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lC7CW-0007Jk-W9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 15:44:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65BE1ACBF;
 Tue, 16 Feb 2021 20:44:01 +0000 (UTC)
Subject: Re: [RFC v19 13/15] i386: slit svm_helper into softmmu and stub-only
 user
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210216104647.13400-1-cfontana@suse.de>
 <20210216104647.13400-14-cfontana@suse.de>
 <bfc83c84-5626-cc49-2387-60df46a41b4c@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <75b68e78-2aef-08a4-b88e-d21b852654be@suse.de>
Date: Tue, 16 Feb 2021 21:44:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bfc83c84-5626-cc49-2387-60df46a41b4c@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Eric,

On 2/16/21 8:34 PM, Eric Blake wrote:
> On 2/16/21 4:46 AM, Claudio Fontana wrote:
> 
> In the subject, s/slit/split/

thanks, fixed.

> 
>> XXX Should we assert that cpu hidden flag SVME is not set,
>> when attempting to generate VMRUN and related instructions
>> in CONFIG_USER_ONLY?
>>
>> XXX Similarily, should we check for CONFIG_USER_ONLY when
>> attempting to cpu_load_efer?
> 
> If you don't fix the comment, s/Similarily/Similarly/

Thanks, will probably replace the whole comment,

I was just trying to make noise with this one to attract attention :-)

Thanks,

Claudio

> 
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> ---
> 
> 


