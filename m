Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE454E9465
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 13:27:11 +0200 (CEST)
Received: from localhost ([::1]:48188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYnWg-0000T0-RG
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 07:27:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYnU6-0007Vk-Ea
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 07:24:30 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=42613
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYnU0-00032h-Gg
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 07:24:29 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id u103so25367389ybi.9
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 04:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xmOofWXPDOZiFtpjDyUYyMlgL0oxxk8dYXPeAiOLviQ=;
 b=Zgz2ilLvTSiR0eGyvyuCcsc6wgeDI7hcj5K316U+DlfEhZWtGLtjS5uJfYPdEkS4af
 gWoHcRMGR8lFRKgx7x6GDmq/rzR5HObeRun5RUq5ZMphJaZ7D4SjCjxLNwCb0moJPaRI
 ZicVa5YnXpAUAMNfzb1uJLERuW0utOEsKnnDgR9LOizI6WrgAzJbhWUzPLNv+g3f4YWO
 GlBk6m/r9Bh1aEz5dXbgX4PWWSofMhnJBujYA2vE80pxoQ5a7tN72kOlCgKq/KKmnl4b
 TiLUPfrYSu5lNka0xz+lK3wSKWKY9MlKCS2zjgfI50PKGEda3No65xvfeQG5ep+BJHXf
 RmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xmOofWXPDOZiFtpjDyUYyMlgL0oxxk8dYXPeAiOLviQ=;
 b=UXvL0T0ziiDzA8w+POM9yGkXx4HNLRR7JRJWeSaoyAUIeshf2V5npvvKM8sMYo8zOe
 ABWXp8ToLp5i7XroZ2zgCwvui5nWDqFvAIUIvBM3hQE4MILWngBlcR10QHgOcUhknjBr
 T4KJetJZPSkWKzrD9qEvic3GevGHo+Y+aGvraWK0sJA6GZye1uneWO5l7iJAC7Z1hbwE
 bE/50t4/rLjxMJCmIceOjnOFBW1uR1oi2CrWVQWtGRJNOf2C9gQ2FcoQ/mun2zMSpOjg
 JnIdC9fZeNpOWdwSIUK/SsH1CItml4oiEO/EEbZUY4xdwGzOuAQu8+iCIxWPiSDVxm1H
 dLtA==
X-Gm-Message-State: AOAM533x2l8Y9XNVeAUQHwPtpVrd0SD4cLiHOKwXyKtHpliiAjYO3G22
 VI9hxdS6zJEsRaMPwbTLyTaXIJeEU8zkgR6JRxwG7Q==
X-Google-Smtp-Source: ABdhPJyhARaz0zB0XWC2DwGU6wSO/IqjixjS3s3LvBF5QV0n1cWGYTbiHYLWfvgRDRW+dS9wjQ1aPbqbu2e+dFomcuY=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr22215825ybq.67.1648466660275; Mon, 28
 Mar 2022 04:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <mw2ty4ijin-mw2ty4ijio@nsmail6.0>
 <CAFEAcA_xpi2kCdHK-K=T3-pbHjWS47xyCzG47wg3HBSKFo4z8w@mail.gmail.com>
 <de27054a-900b-d1fc-69be-82cb6c893c44@kylinos.cn>
In-Reply-To: <de27054a-900b-d1fc-69be-82cb6c893c44@kylinos.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 11:24:06 +0000
Message-ID: <CAFEAcA8MbzCvEWL0eu41-hPBTs9OZf1WV168RQCb9K3ZHC-pqw@mail.gmail.com>
Subject: Re: [PATCH] kvm/arm64: Fix memory section did not set to kvm
To: Cong Liu <liucong2@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 at 10:42, Cong Liu <liucong2@kylinos.cn> wrote:
> On 2022/3/25 23:00, Peter Maydell wrote:
> > This is correct behaviour. If the memory region is less than
> > a complete host page then it is not possible for KVM to
> > map it into the guest as directly accessible memory,
> > because that can only be done in host-page sized chunks,
> > and if the MR is a RAM region smaller than the page then
> > there simply is not enough backing RAM there to map without
> > incorrectly exposing to the guest whatever comes after the
> > contents of the MR.
>
> actually, even with fixed 8192 qxl rom bar size, the RAMBlock
> size corresponding to MemoryRegion will also be 64k.

Where does this rounding up happen? In any case, it would
still be wrong -- if the ROM bar is 8192 large then the
guest should get a fault writing to bytes past 8191, not
reads-as-written.

> so it can
> map into the guest as directly accessible memory. now it failed
> just because we use the wrong size. ROUND_UP(n, d) requires
> that d be a power of 2, it is faster than QEMU_ALIGN_UP().
> and the qemu_real_host_page_size should always a power of 2.
> seems we can use this patch and no need to fall back to "treat
> like MMIO device access".
>
> >
> > For memory regions smaller than a page, KVM and QEMU will
> > fall back to "treat like MMIO device access". As long as the

> I don't understand how it works, can you help explain or tell me
> which part of the code I should read to understand?

The KVM code in the kernel takes a fault because there is
nothing mapped at that address in the stage 2 page tables.
This results in kvm_handle_guest_abort() being called.
This function sorts out various cases it can handle
(eg "this is backed by host RAM which we need to page in")
and cases which are always errors (eg "the guest tried to
fetch an instruction from non-RAM"). For the cases of
"treat like MMIO device access" it calls io_mem_abort().
In io_mem_abort() we check whether the guest instruction that
did the load/store was a sensible one (this is the
kvm_vcpu_dabt_isvalid() check). Assuming that it was, then
we fill in some kvm_run struct fields with the parameters like
access size, address, etc (which the host CPU tells us in the
ESR_ELx syndrome register) cause an exit to userspace with
KVM_EXIT_MMIO as the reason.

In QEMU, the code in kvm_cpu_exec() has a case for the
KVM_EXIT_MMIO code. It just calls address_space_rw()
using the address, length, etc parameters that the kernel
gave us. If this is a load then the loaded data is filled
in in the kvm_run struct. Then it loops back around to do a
KVM_RUN ioctl, handing control back to the kernel.

In the kernel, in the arm64 kvm_arch_vcpu_ioctl_run()
we check whether we've just come back from a KVM_EXIT_MMIO
exit, and if so call kvm_handle_mmio_return(). If the
faulting instruction was a load, we read the data from
the kvm_run struct, sign extend as appropriate, and write
to the appropriate guest register. Then we increment the
guest program counter. Finally we start execution in the
guest in the normal way.

> the test code appended.
> it works with some differences between arm64 and x86. in x86, it
> printf rom_test->magic and rom_test->id correctly, but in arm64.
> it printf rom_test->magic correctly. when I try to print the
> rom_test->id. I get "load/store instruction decoding not
> implemented" error message.

You don't show the guest code, which is the thing that matters
here. In any case for the QXL ROM we already have the fix,
which is to make the ROM as big as the host page size.

-- PMM

