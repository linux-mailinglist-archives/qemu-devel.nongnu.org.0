Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB74C1B02
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:35:22 +0100 (CET)
Received: from localhost ([::1]:50178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwTw-0004h2-Nf
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:35:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1nMwSO-0003iY-Sl
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:33:44 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113]:44438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1nMwSM-0006DV-Mk
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:33:44 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1nMwRP-0003AV-QA; Wed, 23 Feb 2022 19:32:43 +0100
Message-ID: <7822c00f-5a2d-b6a2-2f81-cf3330801ad3@maciej.szmigiero.name>
Date: Wed, 23 Feb 2022 19:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-13-chao.p.peng@linux.intel.com>
 <a121e766-900d-2135-1516-e1d3ba716834@maciej.szmigiero.name>
 <20220217134548.GA33836@chaop.bj.intel.com>
 <45148f5f-fe79-b452-f3b2-482c5c3291c4@maciej.szmigiero.name>
 <20220223120047.GB53733@chaop.bj.intel.com>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v4 12/12] KVM: Expose KVM_MEM_PRIVATE
In-Reply-To: <20220223120047.GB53733@chaop.bj.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.02.2022 13:00, Chao Peng wrote:
> On Tue, Feb 22, 2022 at 02:16:46AM +0100, Maciej S. Szmigiero wrote:
>> On 17.02.2022 14:45, Chao Peng wrote:
>>> On Tue, Jan 25, 2022 at 09:20:39PM +0100, Maciej S. Szmigiero wrote:
>>>> On 18.01.2022 14:21, Chao Peng wrote:
>>>>> KVM_MEM_PRIVATE is not exposed by default but architecture code can turn
>>>>> on it by implementing kvm_arch_private_memory_supported().
>>>>>
>>>>> Also private memslot cannot be movable and the same file+offset can not
>>>>> be mapped into different GFNs.
>>>>>
>>>>> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
>>>>> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
>>>>> ---
>>>> (..)
>>>>>     static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
>>>>> -				      gfn_t start, gfn_t end)
>>>>> +				      struct file *file,
>>>>> +				      gfn_t start, gfn_t end,
>>>>> +				      loff_t start_off, loff_t end_off)
>>>>>     {
>>>>>     	struct kvm_memslot_iter iter;
>>>>> +	struct kvm_memory_slot *slot;
>>>>> +	struct inode *inode;
>>>>> +	int bkt;
>>>>>     	kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
>>>>>     		if (iter.slot->id != id)
>>>>>     			return true;
>>>>>     	}
>>>>> +	/* Disallow mapping the same file+offset into multiple gfns. */
>>>>> +	if (file) {
>>>>> +		inode = file_inode(file);
>>>>> +		kvm_for_each_memslot(slot, bkt, slots) {
>>>>> +			if (slot->private_file &&
>>>>> +			     file_inode(slot->private_file) == inode &&
>>>>> +			     !(end_off <= slot->private_offset ||
>>>>> +			       start_off >= slot->private_offset
>>>>> +					     + (slot->npages >> PAGE_SHIFT)))
>>>>> +				return true;
>>>>> +		}
>>>>> +	}
>>>>
>>>> That's a linear scan of all memslots on each CREATE (and MOVE) operation
>>>> with a fd - we just spent more than a year rewriting similar linear scans
>>>> into more efficient operations in KVM.
>>>
(..)
>>> So linear scan is used before I can find a better way.
>>
>> Another option would be to simply not check for overlap at add or move
>> time, declare such configuration undefined behavior under KVM API and
>> make sure in MMU notifiers that nothing bad happens to the host kernel
>> if it turns out somebody actually set up a VM this way (it could be
>> inefficient in this case, since it's not supposed to ever happen
>> unless there is a bug somewhere in the userspace part).
> 
> Specific to TDX case, SEAMMODULE will fail the overlapping case and then
> KVM prints a message to the kernel log. It will not cause any other side
> effect, it does look weird however. Yes warn that in the API document
> can help to some extent.

So for the functionality you are adding this code for (TDX) this scan
isn't necessary and the overlapping case (not supported anyway) is safely
handled by the hardware (or firmware)?
Then I would simply remove the scan and, maybe, add a comment instead
that the overlap check is done by the hardware.

By the way, if a kernel log message could be triggered by (misbehaving)
userspace then it should be rate limited (if it isn't already).

> Thanks,
> Chao

Thanks,
Maciej

