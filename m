Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011A4F3857
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 16:33:02 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbkEv-0003Ez-H5
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 10:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbkCe-00027G-Jh
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:30:40 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbkCc-00036s-Pl
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:30:40 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id w134so15817767ybe.10
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 07:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbBj51u2ep0swGILZwFiquMlcZJ8xUUa1hba8VU3Gnc=;
 b=Y6p1bhHLSbHsPbtniFwytYf+wMfjCKzHR2yoXyWH4OsRlsVZYJJg6DKM7iXDmGlQTk
 el85tKzV0P/5d30nJ7Iz6jbCIiXiF+1g+n+pxt7fKP0ybZrdXMTnCFtsf7nm4Eq16nyf
 ol4i0jo+tT29+fT3Ai3vrp5OA8Qo8QXwNjBoClLQnAO26HtSfjqgnvZ/W2zdAD0qXGzf
 WsUXVucpY+lTGOIr/WyddzRkbHwe/06HaddgEFIPKy8q5bjyRjyhmBu5QrAbPtdSCbTu
 JgeNJFNXnGp2sZ4271A5JUYwtdNJ8SYb5QlINVCEJ8bhI4jEfpOe4HeDZfWwpAV0FzSX
 TYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbBj51u2ep0swGILZwFiquMlcZJ8xUUa1hba8VU3Gnc=;
 b=gvc8tJ8t2uJASGqCPS42vY9XaODS8jYbo2VztoTWDHm9h11m7gHMw4GY7U9iAlNDOB
 mkqSEwo3saFqnZmu7DluyJsXnqpHAJzCCo/RXy3sy3Usw+SxnbhzEmN6v7/k95GhBgXH
 KmxnwQ51/h+ILbTJ8/Ej+z0BVTzz4FPrhoantxR0EHSDN5ncln/QWX7NtAH6oyH6P8q0
 Esk8/UaxzH9uttUxefXm2UKWdavp6WoVNbT2nVNRmC7xSqcyi+34mlclovCIplrL4EmH
 rQMm837SV6AP6v7vnmLyiZRKxTu5tF7iWSysb+CgESFyjcPksDEsLeMmj7GYc9NuSK12
 Y/Bg==
X-Gm-Message-State: AOAM531P5CmWCU96gjueFuGU16xOroxLq91yUMwcgSMJYiAKx3UUuMHa
 ojtNDWTo/V21Tlm3EoVBqoQz23VroQmTbzfjhIBPHmj+Mb0=
X-Google-Smtp-Source: ABdhPJzFuKNQlFzINGbVhVEKZFZADuLzQVxH3vthKiK1GvudRtKNNtvBbItRzDcd+k+nYwkdkj3QmhplZ1GHniXto0k=
X-Received: by 2002:a25:d8c3:0:b0:633:c81f:737d with SMTP id
 p186-20020a25d8c3000000b00633c81f737dmr2658201ybg.193.1649169037788; Tue, 05
 Apr 2022 07:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220405130439.44253-1-danielhb413@gmail.com>
 <20220405130439.44253-2-danielhb413@gmail.com>
In-Reply-To: <20220405130439.44253-2-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 15:30:26 +0100
Message-ID: <CAFEAcA-YkrrhFsGg0eWdQgU_VR4cSX5tLnHYCk8tK77cb-9Grg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] kvm-all.c: hint Valgrind that kvm_get_one_reg()
 inits memory
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 14:07, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> There is a lot of Valgrind warnings about conditional jump depending on
> unintialized values like this one (taken from a pSeries guest):
>
>  Conditional jump or move depends on uninitialised value(s)
>     at 0xB011DC: kvmppc_enable_cap_large_decr (kvm.c:2544)
>     by 0x92F28F: cap_large_decr_cpu_apply (spapr_caps.c:523)
>     by 0x930C37: spapr_caps_cpu_apply (spapr_caps.c:921)
>     by 0x955D3B: spapr_reset_vcpu (spapr_cpu_core.c:73)
> (...)
>   Uninitialised value was created by a stack allocation
>     at 0xB01150: kvmppc_enable_cap_large_decr (kvm.c:2538)
>
> In this case, the alleged unintialized value is the 'lpcr' variable that
> is written by kvm_get_one_reg() and then used in an if clause:
>
> int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
> {
>     CPUState *cs = CPU(cpu);
>     uint64_t lpcr;
>
>     kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
>     /* Do we need to modify the LPCR? */
>     if (!!(lpcr & LPCR_LD) != !!enable) { <---- Valgrind warns here
> (...)
>
> A quick fix is to init the variable that kvm_get_one_reg() is going to
> write ('lpcr' in the example above). Another idea is to convince
> Valgrind that kvm_get_one_reg() inits the 'void *target' memory in case
> the ioctl() is successful. This will put some boilerplate in the
> function but it will bring benefit for its other callers.

Doesn't Valgrind have a way of modelling ioctls where it
knows what data is read and written ? In general
ioctl-using programs don't need to have special case
"I am running under valgrind" handling, so this seems to
me like valgrind is missing support for this particular ioctl.

More generally, how much use is running QEMU with KVM enabled
under valgrind anyway? Valgrind has no way of knowing about
writes to memory that the guest vCPUs do...

thanks
-- PMM

