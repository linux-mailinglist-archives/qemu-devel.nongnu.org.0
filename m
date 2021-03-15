Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121EA33AF72
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:00:00 +0100 (CET)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLk11-00052R-5A
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLjyr-0003zO-8T
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:57:45 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLjyp-0008DH-Nk
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:57:45 -0400
Received: by mail-wm1-x332.google.com with SMTP id g20so7733246wmk.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cqe+o1I/0ZT/qsuRZedTSA43V5QrsGcOPMxeWrE+YE0=;
 b=ZUZX11n/RqJ42HfDQsH7+3KZV79R3Im2gIdgE4SeJAc0QHXEvsOYbO/vtuJMGPtIBM
 FqJDDMh6BOvmKfTjQsHfIV0GFJVKdQs/c5zIfxHWc5ywI19jJIn5TiC+fD/gLrd9p+OI
 ybV8Eslm5a8xkaZrCfkMdJGx0A0Rc82i3RkPx3ZgAXxROYPz/FVrMzQZOD6GltzxlzWK
 8DOvk34qe6MzW/wqw65ALTd6IHiVPa+iyVHZpT3Zi5PD/nE//qqu0cKzzOgmL0NOBD6l
 ZTsQfBJJrgV/kgnJofOLWxMaEoIFoa7Zj/AZfB4ApFvkrIraaXltTGHm1oKuL4AA7LCr
 /ADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cqe+o1I/0ZT/qsuRZedTSA43V5QrsGcOPMxeWrE+YE0=;
 b=m1l6qSD648Hzr0X+tyvebusNUHasyALYHqelpoIepba3Ui/xDZwXBJN1e/UYiUttub
 DQsD6Pc2Eacs43fMYWLrnjy2NEqbFeJmtJrdsv74q/jXMsqcEGhNdnnULiMCj1PsvucI
 zkxn8qpYsN9u3KWcF9JbzPN9Lhb1re6wAozMuZ2W3P3wViikCOCYUMXlyzgaJ2bCuLgV
 an9jyh58PdPXPNnEdFlQ/HqUvSJzgA9EATfK67+86K47MoXYlo89QVlQZoPtEzc6bnvQ
 tqF5+SFo7/rQSBaHla7YyVLXSJfIkyT0rKjOZpWjDdJDTs8zA3TLNUEBW1ZlZdCdJgcl
 VNNg==
X-Gm-Message-State: AOAM531douUeCCR3jYx9rt+FIyryoI2GTrowSVdOw5r0djXnu4OeNtFb
 qtIB+PabzZ2iFlQLUpaQvtNKOSXf/ONKlg==
X-Google-Smtp-Source: ABdhPJwdXFPTTlcK7VjCprFOBXjAqhvGoaKOTY3gHMwQ4eh5yEQETFOmcJNjNnEZDHQ4hb+WuLtClw==
X-Received: by 2002:a05:600c:2102:: with SMTP id
 u2mr25382393wml.22.1615802260453; 
 Mon, 15 Mar 2021 02:57:40 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z2sm17752498wrv.47.2021.03.15.02.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:57:39 -0700 (PDT)
Subject: Re: [PATCH v16 00/23] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
 <5f185a27-6140-9426-f915-ce09609b7962@amsat.org>
 <a8dd803b-ff0a-c456-14b5-1e2dffbf2120@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <647ebd9a-953d-c00b-e965-95e000393a86@amsat.org>
Date: Mon, 15 Mar 2021 10:57:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a8dd803b-ff0a-c456-14b5-1e2dffbf2120@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 3/15/21 10:44 AM, Claudio Fontana wrote:
> Hi Philippe,
> 
> On 3/14/21 1:00 AM, Philippe Mathieu-Daudé wrote:
>> Hi Claudio,

>>
>> I am looking at this code:
>>
>> $ git grep tcg_ softmmu/physmem.c
>> softmmu/physmem.c:153:static void
>> tcg_log_global_after_sync(MemoryListener *listener);
>> softmmu/physmem.c:154:static void tcg_commit(MemoryListener *listener);
>> softmmu/physmem.c:161: * @tcg_as_listener: listener for tracking changes
>> to the AddressSpace
>> softmmu/physmem.c:167:    MemoryListener tcg_as_listener;
>> softmmu/physmem.c:590:static void tcg_iommu_unmap_notify(IOMMUNotifier
>> *n, IOMMUTLBEntry *iotlb)
>> softmmu/physmem.c:606:static void tcg_register_iommu_notifier(CPUState *cpu,
>> softmmu/physmem.c:640:                            tcg_iommu_unmap_notify,
>> softmmu/physmem.c:654:void tcg_iommu_free_notifier_list(CPUState *cpu)
>> softmmu/physmem.c:668:void tcg_iommu_init_notifier_list(CPUState *cpu)
>> softmmu/physmem.c:698:        tcg_register_iommu_notifier(cpu, iommu_mr,
>> iommu_idx);
>> softmmu/physmem.c:761:    if (tcg_enabled()) {
>> softmmu/physmem.c:762:
>> newas->tcg_as_listener.log_global_after_sync = tcg_log_global_after_sync;
>> softmmu/physmem.c:763:        newas->tcg_as_listener.commit = tcg_commit;
>> softmmu/physmem.c:764:
>> memory_listener_register(&newas->tcg_as_listener, as);
>> softmmu/physmem.c:891:    assert(tcg_enabled());
>> softmmu/physmem.c:904:    if (cc->tcg_ops->adjust_watchpoint_address) {
>> softmmu/physmem.c:906:        addr =
>> cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
>> softmmu/physmem.c:927:                if (wp->flags & BP_CPU &&
>> cc->tcg_ops->debug_check_watchpoint &&
>> softmmu/physmem.c:928:
>> !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
>> softmmu/physmem.c:1004:    assert(tcg_enabled());
>> softmmu/physmem.c:1059:    if (dirty && tcg_enabled()) {
>> softmmu/physmem.c:1107:    if (tcg_enabled()) {
>> softmmu/physmem.c:2605:static void
>> tcg_log_global_after_sync(MemoryListener *listener)
>> softmmu/physmem.c:2634:        cpuas = container_of(listener,
>> CPUAddressSpace, tcg_as_listener);
>> softmmu/physmem.c:2639:static void tcg_commit(MemoryListener *listener)
>> softmmu/physmem.c:2644:    assert(tcg_enabled());
>> softmmu/physmem.c:2647:    cpuas = container_of(listener,
>> CPUAddressSpace, tcg_as_listener);
>> softmmu/physmem.c:2700:        assert(tcg_enabled());
>> softmmu/physmem.c:3000:    if (tcg_enabled()) {
>>
>> which reminded me the starter generic part of your effort
>> (already merged).
>>
>> Do you have plans for this code?
>>
>> Similarly:
>>
>> $ git grep kvm_ softmmu/physmem.c
>> softmmu/physmem.c:752:    assert(asidx == 0 || !kvm_enabled());
>> softmmu/physmem.c:1295:    if (kvm_enabled())
>> softmmu/physmem.c:1296:        kvm_flush_coalesced_mmio_buffer();
>> softmmu/physmem.c:1566:    if (kvm_enabled()) {
>> softmmu/physmem.c:2046:    if (kvm_enabled() && !kvm_has_sync_mmu()) {
>>
>> Thanks,
>>
>> Phil.
>>
> 
> Hi Phil,
> 
> indeed it is a juicy target for splitting things between TCG-only and non-TCG code,
> specifically as we discovered that we don't need any of the watchpoint stuff outside of TCG.
> 
> I think I am tied up in the ARM code for a while,
> so if you are asking because you want to start there, just go ahead,
> I'll try to review, otherwise I'll get back to it (and to i386) later on.

No plan yet. I looked back at what I did + your patches to get
the big picture again, and had a look at my notes and wip patches.

Since you are making big changes/progress, I now prefer to check
upfront to avoid duplicated effort.

Regards,

Phil.

