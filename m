Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAF434061B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:52:33 +0100 (CET)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMs8d-0007k4-TC
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMs6W-0006rv-5h; Thu, 18 Mar 2021 08:50:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:41054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMs6U-0005Cj-AW; Thu, 18 Mar 2021 08:50:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4FEBAC75;
 Thu, 18 Mar 2021 12:50:15 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
 <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
 <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
 <CAFEAcA8t3Roq2qL1RTru1H+WZAQMVmWcN=VjCtJkvAzmyws_YQ@mail.gmail.com>
 <20210318123727.vfjaecuklzicmprn@kamzik.brq.redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <f41c34dc-2cad-5929-06d8-6ea098ab5b8a@suse.de>
Date: Thu, 18 Mar 2021 13:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210318123727.vfjaecuklzicmprn@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 1:37 PM, Andrew Jones wrote:
> On Thu, Mar 18, 2021 at 11:38:51AM +0000, Peter Maydell wrote:
>> On Thu, 18 Mar 2021 at 11:31, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>> I tend to agree. The problem is for the running VMs started before
>>> 82bf7ae84ce (so up to any fork based on v5.2). I don't know what
>>> the forks are supposed to do with the running VMs if they want to
>>> migrate them to newer QEMU (or upgrade the host QEMU).
>>
>> Anybody with a Cortex-A15 KVM VM is just going to have to stay
>> with their pre-existing ancient hardware, their pre-existing
>> host kernel and their pre-existing QEMU binary. That's what
>> "we deprecated and then dropped support for this" means:
>> we no longer support running that kind of VM, so users who
>> were doing it need to either do something else instead, or
>> else just keep on going with the old versions they have.
>>
> 
> I strongly agree.
> 
> And, downstream-wise, I can't speak for anything but RHEL, but RHEL
> cannot have this problem. There are no 32-bit ARM builds for RHEL.
> 
> Thanks,
> drew
> 

I don't see a strong issue with this either, there is no 32bit support for KVM ARM.

Thanks,

Claudio

