Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FB0601B5A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:34:23 +0200 (CEST)
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXkc-0002WT-4U
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okXel-0007RG-SA; Mon, 17 Oct 2022 17:28:20 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:35555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okXek-0004zP-22; Mon, 17 Oct 2022 17:28:19 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 i25-20020a4a8d99000000b0047fa712fc6dso2835430ook.2; 
 Mon, 17 Oct 2022 14:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dZfbSM/eu6aLP/sf8Nx/h8h8KdrjQj7Qbkfnw0beKBM=;
 b=NmniUuc7/8hPzKwofhWg5Do3jcMLDtOMyippVvj2NQqyulMZNR6UcLiFdYQxzJLmo2
 PHwlK9QBreK9mSFhN9rjQgpTrsyXsMpkc0XA0OS7mSFMYZdRyV6p40LHjOxLkJ5Nz2Am
 QGHHWGJFlV634EdjEOiT1lzGPeV2easSDnnUHjAsm+mJZhvrX+qQ4GrUunNNVF8ik2uK
 D01zSDpJtil5QAL6zaDKODArBjKstQYx4fBaNvXWm3+hmCj9BLVyVQnwuJdFXur3Pjv1
 9LklvElqVeN4JRzLohJgB3MVBE56xcp5u3w698xEqyvk5sEm+rhNGNUDK8CTMU/q2kLa
 vajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dZfbSM/eu6aLP/sf8Nx/h8h8KdrjQj7Qbkfnw0beKBM=;
 b=XhRD8OGqAviHXe/NFET10JnIqaiAecj7mQS2wyazm/oSEVGhjSKlNc7cr7003LQI50
 HdKvHYfsEj/jPwQeGVi666mCz76TEdafCcUuFnobSR57mpegJhIy387V3h2vixSrfund
 5c4YFfeFrc7J5JdFYbVan1CAZMKRj95LzzRK5oEL5Y1Nbz8M0xt754CTSk+3vrxibP6j
 aH0u6Qa4oCG0CuIdnrPSE1CENcc8rKJhLh87WPaO9aMSYwXTkm9lZCR5XfhwtjBtDjgg
 OZngABIwIGAWfRa7h4tiUn3nLR9DaxA47liKhkvptENKcMeLfRB7+zNnwj+OMNNBHg+9
 DAyA==
X-Gm-Message-State: ACrzQf0Ec3EADrUNjRaDgZOCQmwbAcQHNr9LxXMKji8DskGKhY9/XV3n
 3nNdCSUCrAH1+dZHqC3DjX0=
X-Google-Smtp-Source: AMsMyM69rgc8euezf8wBYEclH5xTISheBc2AhL80F7eYWPZxdqAyTo1Qm6tGn8Tb0DTCrvpFI5NBYg==
X-Received: by 2002:a4a:e9f4:0:b0:476:2561:3eed with SMTP id
 w20-20020a4ae9f4000000b0047625613eedmr5037604ooc.53.1666042096531; 
 Mon, 17 Oct 2022 14:28:16 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a9d6f94000000b006619483182csm5240059otq.18.2022.10.17.14.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 14:28:16 -0700 (PDT)
Message-ID: <a57da50b-8d6c-945f-b0ac-dfe311d075c1@gmail.com>
Date: Mon, 17 Oct 2022 18:28:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 00/29] PowerPC interrupt rework
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 fbarrat@linux.ibm.com, alex.bennee@linaro.org, farosas@linux.ibm.com
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus,

Nice cleanup and rework. The code is way better now.

I send a PR today without this series. As soon as that gets merged I'll
push these patches to ppc-next. This will give us more time to test the
changes and see if we can detect any unintended changes/bugs.

Thanks,

Daniel

On 10/11/22 17:48, Matheus Ferst wrote:
> Link to v2: https://lists.gnu.org/archive/html/qemu-ppc/2022-09/msg00556.html
> This series is also available as a git branch: https://github.com/PPC64/qemu/tree/ferst-interrupt-fix-v3
> Patches without review: 3-27
> 
> This new version rebases the patch series on the current master and
> fixes some problems pointed out by Fabiano on v2.
> 
> Matheus Ferst (29):
>    target/ppc: define PPC_INTERRUPT_* values directly
>    target/ppc: always use ppc_set_irq to set env->pending_interrupts
>    target/ppc: split interrupt masking and delivery from ppc_hw_interrupt
>    target/ppc: prepare to split interrupt masking and delivery by excp_model
>    target/ppc: create an interrupt masking method for POWER9/POWER10
>    target/ppc: remove unused interrupts from p9_next_unmasked_interrupt
>    target/ppc: create an interrupt deliver method for POWER9/POWER10
>    target/ppc: remove unused interrupts from p9_deliver_interrupt
>    target/ppc: remove generic architecture checks from p9_deliver_interrupt
>    target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER9
>    target/ppc: add power-saving interrupt masking logic to p9_next_unmasked_interrupt
>    target/ppc: create an interrupt masking method for POWER8
>    target/ppc: remove unused interrupts from p8_next_unmasked_interrupt
>    target/ppc: create an interrupt deliver method for POWER8
>    target/ppc: remove unused interrupts from p8_deliver_interrupt
>    target/ppc: remove generic architecture checks from p8_deliver_interrupt
>    target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER8
>    target/ppc: add power-saving interrupt masking logic to p8_next_unmasked_interrupt
>    target/ppc: create an interrupt masking method for POWER7
>    target/ppc: remove unused interrupts from p7_next_unmasked_interrupt
>    target/ppc: create an interrupt deliver method for POWER7
>    target/ppc: remove unused interrupts from p7_deliver_interrupt
>    target/ppc: remove generic architecture checks from p7_deliver_interrupt
>    target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER7
>    target/ppc: add power-saving interrupt masking logic to p7_next_unmasked_interrupt
>    target/ppc: remove ppc_store_lpcr from CONFIG_USER_ONLY builds
>    target/ppc: introduce ppc_maybe_interrupt
>    target/ppc: unify cpu->has_work based on cs->interrupt_request
>    target/ppc: move the p*_interrupt_powersave methods to excp_helper.c
> 
>   hw/ppc/pnv_core.c        |   1 +
>   hw/ppc/ppc.c             |  17 +-
>   hw/ppc/spapr_hcall.c     |   6 +
>   hw/ppc/spapr_rtas.c      |   2 +-
>   hw/ppc/trace-events      |   2 +-
>   target/ppc/cpu.c         |   4 +
>   target/ppc/cpu.h         |  43 +-
>   target/ppc/cpu_init.c    | 212 +---------
>   target/ppc/excp_helper.c | 887 ++++++++++++++++++++++++++++++++++-----
>   target/ppc/helper.h      |   1 +
>   target/ppc/helper_regs.c |   2 +
>   target/ppc/misc_helper.c |  11 +-
>   target/ppc/translate.c   |   2 +
>   13 files changed, 833 insertions(+), 357 deletions(-)
> 

