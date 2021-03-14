Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B44933A1F9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 01:01:32 +0100 (CET)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLECJ-0000uY-LI
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 19:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLEBK-0000SU-Pq
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:00:30 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLEBI-0003i2-Lj
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:00:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 d139-20020a1c1d910000b029010b895cb6f2so17309094wmd.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 16:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KX9bi8S2Qi0nRawNjVu7nQiy6iljFRltuB9jsD19CCA=;
 b=CieEiWlVF/pdM2kN3Fumm9v9ZNiPpbIEPhNkNdYFmXbmx5djyzoOYhRH6OkZsTD9AC
 N1wp99YdxMt5olw8YK/aCDnU7cesXyUV6aKnDyb6wMwjscCNVvxIX71K9wTJb4mghCW4
 CfFRQXVUKHpUQhmvgw9LnEqg4tEw+V0+ZLdRbCHYGnuNBCzAxvqlyz7R9zdzeJCfiri6
 /P87dEVR4ZEq32wioOyJhCqjJ22/ccvQfQTTOVNQYTvs7kP8ky4QmL6ErAd4WpmYhGty
 GxkMDusHRPqVzzZmxHtmOSkeaGsakbhXAG1zbUnu+7l9CEBtdHYXoPVR0pQBoLMPyp8B
 hzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KX9bi8S2Qi0nRawNjVu7nQiy6iljFRltuB9jsD19CCA=;
 b=gQHE1CyOP2qEMF/7bGMQPVQy64GIFC5Xlfl8RryHonNYQ0lDMjBbV0924/7dLDQUSa
 GwXuGPgaBWNayA3tTxIwIIlY8mngTPgy51Tg8XDAUZ7FUK8U1VdUNtzRkkAF+BBtUh0U
 R/QerYyFu+F+6jEBxGliEltiHpUkr8sYGGZmCjW51aETXz2OPwe/6TXzTM4SwX8rv474
 qcU3K517+AdYKQUD6Z4MUB5WWD6mWf0ZjCpzzyYdmuc4zMKIPBa6wC8S9rHZkedDRJz6
 CwYYou5QzCsKj92cRsyldRgz8nidmK8gZYukCy0kn0aW2r7+ttOBtpKafU0G+WrMy0zl
 Yh/g==
X-Gm-Message-State: AOAM531EuoQGeYA0Pfo2bePzeMHmy/wAHxhwWEBGjN/wlV2n2j4y6kfu
 jjTAfVFNhZb5N7qE2gOGBV7IGW4Aa3Og2w==
X-Google-Smtp-Source: ABdhPJw5TBPTD3oQ/z7yKKgsvfXmF0rWU2MkrkbV4VFGeEDBhavMsj4LHIRSpBlxiNVyadgFe3xl1g==
X-Received: by 2002:a1c:7fcd:: with SMTP id a196mr9958284wmd.180.1615680026777; 
 Sat, 13 Mar 2021 16:00:26 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s23sm7504133wmc.35.2021.03.13.16.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 16:00:26 -0800 (PST)
Subject: Re: [PATCH v16 00/23] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5f185a27-6140-9426-f915-ce09609b7962@amsat.org>
Date: Sun, 14 Mar 2021 01:00:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210204163931.7358-1-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Claudio,

On 2/4/21 5:39 PM, Claudio Fontana wrote:
> v15 -> v16:
> 
> * cpu: Move synchronize_from_tb() to tcg_ops:
>   - adjusted comments (Alex)
> 
> * cpu: tcg_ops: move to tcg-cpu-ops.h, keep a pointer in CPUClass:
>   - remove forward decl. of AccelCPUClass, should be in a later patch. (Alex)
>   - simplified comment about tcg_ops in struct CPUClass (Alex)
>   - remove obsolete comment about ARM blocking TCGCPUOps from being const.
>     (Alex)
> 
> * accel: replace struct CpusAccel with AccelOpsClass:
>   - reworded commit message to be clearer about the objective (Alex)
> 
> * accel: introduce AccelCPUClass extending CPUClass
>   - reworded commit message to be clearer about the objective (Alex)
> 
> * hw/core/cpu: call qemu_init_vcpu in cpu_common_realizefn:
>   - dropped this patch (Alex, Philippe)
> 
>   will try again later, also in the context of:
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg686480.html
> 
> * accel: introduce new accessor functions
>   - squashed comments in previous patch introducing accel-cpu.h. (Philippe)
> 
> * accel-cpu: make cpu_realizefn return a bool
>   - split in two patches, separating the change to the phys_bits check
>     (Philippe)

I am looking at this code:

$ git grep tcg_ softmmu/physmem.c
softmmu/physmem.c:153:static void
tcg_log_global_after_sync(MemoryListener *listener);
softmmu/physmem.c:154:static void tcg_commit(MemoryListener *listener);
softmmu/physmem.c:161: * @tcg_as_listener: listener for tracking changes
to the AddressSpace
softmmu/physmem.c:167:    MemoryListener tcg_as_listener;
softmmu/physmem.c:590:static void tcg_iommu_unmap_notify(IOMMUNotifier
*n, IOMMUTLBEntry *iotlb)
softmmu/physmem.c:606:static void tcg_register_iommu_notifier(CPUState *cpu,
softmmu/physmem.c:640:                            tcg_iommu_unmap_notify,
softmmu/physmem.c:654:void tcg_iommu_free_notifier_list(CPUState *cpu)
softmmu/physmem.c:668:void tcg_iommu_init_notifier_list(CPUState *cpu)
softmmu/physmem.c:698:        tcg_register_iommu_notifier(cpu, iommu_mr,
iommu_idx);
softmmu/physmem.c:761:    if (tcg_enabled()) {
softmmu/physmem.c:762:
newas->tcg_as_listener.log_global_after_sync = tcg_log_global_after_sync;
softmmu/physmem.c:763:        newas->tcg_as_listener.commit = tcg_commit;
softmmu/physmem.c:764:
memory_listener_register(&newas->tcg_as_listener, as);
softmmu/physmem.c:891:    assert(tcg_enabled());
softmmu/physmem.c:904:    if (cc->tcg_ops->adjust_watchpoint_address) {
softmmu/physmem.c:906:        addr =
cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
softmmu/physmem.c:927:                if (wp->flags & BP_CPU &&
cc->tcg_ops->debug_check_watchpoint &&
softmmu/physmem.c:928:
!cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
softmmu/physmem.c:1004:    assert(tcg_enabled());
softmmu/physmem.c:1059:    if (dirty && tcg_enabled()) {
softmmu/physmem.c:1107:    if (tcg_enabled()) {
softmmu/physmem.c:2605:static void
tcg_log_global_after_sync(MemoryListener *listener)
softmmu/physmem.c:2634:        cpuas = container_of(listener,
CPUAddressSpace, tcg_as_listener);
softmmu/physmem.c:2639:static void tcg_commit(MemoryListener *listener)
softmmu/physmem.c:2644:    assert(tcg_enabled());
softmmu/physmem.c:2647:    cpuas = container_of(listener,
CPUAddressSpace, tcg_as_listener);
softmmu/physmem.c:2700:        assert(tcg_enabled());
softmmu/physmem.c:3000:    if (tcg_enabled()) {

which reminded me the starter generic part of your effort
(already merged).

Do you have plans for this code?

Similarly:

$ git grep kvm_ softmmu/physmem.c
softmmu/physmem.c:752:    assert(asidx == 0 || !kvm_enabled());
softmmu/physmem.c:1295:    if (kvm_enabled())
softmmu/physmem.c:1296:        kvm_flush_coalesced_mmio_buffer();
softmmu/physmem.c:1566:    if (kvm_enabled()) {
softmmu/physmem.c:2046:    if (kvm_enabled() && !kvm_has_sync_mmu()) {

Thanks,

Phil.

