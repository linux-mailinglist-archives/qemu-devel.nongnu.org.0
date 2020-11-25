Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D52C3E47
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:43:58 +0100 (CET)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khsHF-0001QD-I8
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khsFc-0000Zm-Qi
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:42:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:42678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khsFb-0007uU-2R
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:42:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3051BAC65;
 Wed, 25 Nov 2020 10:42:13 +0000 (UTC)
Subject: Re: [RFC v5 09/12] module: introduce MODULE_INIT_ACCEL_CPU
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-10-cfontana@suse.de>
 <20201124170832.GS2271382@habkost.net>
 <a7bed792-5c6f-c49e-946c-f705707ce685@suse.de>
 <20201124190807.GW2271382@habkost.net>
 <58e4d100-f096-0c41-4780-b8b7e9533b5d@redhat.com>
 <7a3e2790-1924-3d03-d588-a904d7e19282@suse.de>
 <3360fb6f-d1ce-5b7e-0d2f-784e8a8345cf@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b6c3acb8-2929-e600-1448-5213a08ec044@suse.de>
Date: Wed, 25 Nov 2020 11:42:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3360fb6f-d1ce-5b7e-0d2f-784e8a8345cf@redhat.com>
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
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Bruce Rogers <brogers@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, "Emilio G . Cota" <cota@braap.org>,
 haxm-team@intel.com, Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Olaf Hering <ohering@suse.de>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/20 10:30 AM, Paolo Bonzini wrote:
> On 25/11/20 10:21, Claudio Fontana wrote:
>> Hi Paolo,
>>
>> in RFC v5 , module init for ACCEL_CPU is not conditional anymore, right?
>> But the fact that its behavior depends on current_accel() still disqualifies it?
>> It is called right after the accelerator is chosen and initialized
>> in RFC v5, this still is "in the middle of the machine creation sequence"?
> Yes, machine creation basically starts after command line parsing, or 
> perhaps even _with_ command line parsing.  Basically once the user can 
> control the flow it is already too late.
> 
>> I am trying to find the actual things to fix, since when doing RFC
>> v5  I tried to specifically address two points:
>>
>> 1) no if () inside module init functions
>>
>> 2) no proliferation of module init functions
>>
>> which I accomplished via AccelClass extension to user mode, current_accel(), and class lookup.
> 
> Yes, the rest is great, I'm just not sure that MODULE_INIT_ACCEL_CPU is 
> useful and if virtual functions on accel and CPU_RESOLVING_TYPE can 
> achieve the same.
> 
>> If MODULE_INIT_ACCEL_CPU remains an option, where would you like to see the call so that it is not "in the middle"?
> 
> No later than the runstate_init() call, roughly.
> 
> Paolo
> 
> 

Aha! Then that solves it, I don't think it is feasible to put it that early with the meaning I intended for it.

Thanks for clarifying this,

Claudio

