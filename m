Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AE022814A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 15:48:51 +0200 (CEST)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxsdW-0006t7-5x
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 09:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kamil@netbsd.org>) id 1jxsZT-0004w4-D7
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 09:44:39 -0400
Received: from mail.netbsd.org ([199.233.217.200]:62225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kamil@netbsd.org>) id 1jxsZR-0005wH-9a
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 09:44:39 -0400
Received: from [IPv6:::1] (localhost [127.0.0.1])
 by mail.netbsd.org (Postfix) with ESMTP id A511784CEC;
 Tue, 21 Jul 2020 13:44:31 +0000 (UTC)
Subject: Re: [PATCH v4 3/4] Introduce the NVMM impl
To: Maxime Villard <max@m00nbsd.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200206115731.13552-1-n54@gmx.com>
 <20200206213232.1918-1-n54@gmx.com> <20200206213232.1918-4-n54@gmx.com>
 <e85f03be-60bc-2852-7856-91790ba5958b@redhat.com>
 <ca1210a3-2ea5-3862-c4fa-bdcd5624fe29@m00nbsd.net>
 <CABgObfZjnFFV3hosrP+sf5d3KmPPGuFJZo-oY5=u340wtxLYGg@mail.gmail.com>
 <a646f01d-fcf5-5984-d7ea-ccbb9a20ce2b@m00nbsd.net>
From: Kamil Rytarowski <kamil@netbsd.org>
Autocrypt: addr=kamil@netbsd.org; keydata=
 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
Message-ID: <95b2f5d8-4353-469a-9635-2718c6bc6e57@netbsd.org>
Date: Tue, 21 Jul 2020 15:42:20 +0200
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a646f01d-fcf5-5984-d7ea-ccbb9a20ce2b@m00nbsd.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.233.217.200; envelope-from=kamil@netbsd.org;
 helo=mail.netbsd.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 09:44:34
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, slp@redhat.com,
 qemu-devel@nongnu.org, jmcneill@invisible.ca, philmd@redhat.com,
 rth <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.03.2020 07:45, Maxime Villard wrote:
> Le 02/03/2020 à 20:35, Paolo Bonzini a écrit :
>>
>>
>> Il lun 2 mar 2020, 20:28 Maxime Villard <max@m00nbsd.net <mailto:max@m00nbsd.net>> ha scritto:
>>
>>
>>     >> +        nvmm_vcpu_pre_run(cpu);
>>     >> +
>>     >> +        if (atomic_read(&cpu->exit_request)) {
>>     >> +            qemu_cpu_kick_self();
>>     >> +        }
>>     >> +
>>     >
>>     > This is racy without something like KVM's immediate_exit mechanism.
>>     > This should be fixed in NVMM.
>>
>>     I don't immediately see how this is racy.
>>
>>
>> You can get an IPI signal immediately after reading cpu->exit_request.
>>
>>     It reproduces the existing
>>     logic found in whpx-all.c, and if there is a real problem it can be
>>     fixed in a future commit along with WHPX.
>>
>>
>> It's buggy there too and it has to be fixed in the hypervisor so it can't be done at the same time I'm both. KVM does it right by having a flag ("immediate_exit") that is set by the signal handler and checked by the hypervisor.
>>
>> An earlier version of KVM instead atomically unblocked the signal while executing the guest, and then ate it with a sigwaitinfo after exiting back to userspace.
>>
>> You don't have to fix it immediately, but adding a FIXME would be a good idea.
>>
>> Paolo
> 
> Kamil, please add /* FIXME: possible race here */ before the atomic_read().
> 
> Thanks
> 

So, is this still considered as a possible race? Were there any other
changes to be introduced?

Can we see this patchset merged?

