Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DC2557CA0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 15:12:11 +0200 (CEST)
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Md1-0003bo-16
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 09:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4Maq-0002RN-LG
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:09:57 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:36610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4Map-00023X-2T
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:09:56 -0400
Received: by mail-yb1-xb30.google.com with SMTP id u9so25602746ybq.3
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 06:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8+dwGjS8CmwSBOrUUbImeJ/z0JQFeA+i2iKqG3AJnQA=;
 b=v0ImYzQtHSuna0HuRZ8i2CZ8Zj7Npf9IQYqHhSUkH0uiU8FnEyK1uPUq4uZ121Cd9w
 MspjJ3H/wy5H27n1lQFM6Hs/hyz2xYgbVYSnES201ENUrz6/hs3tmNFCtZm8X36VKi/B
 SewVVj+Bycv4GWbFa9guE/QL5YHd6HI0/D4JOeeabx98rOAzXM6QQDRUdkcaetEx82xm
 mfP9CaIMkxsqbjHBE7XAFqm0rdcmIDCGuBu77ZVA9v8oQCMSh2Ttl6O0NdkDE2q7O2Xm
 6ctNAEGAYTgXdO6gWaB0ICQxriLZxElTPOX+fPR+opmINevHAPT+TJBkinOHZkMYcV50
 cW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+dwGjS8CmwSBOrUUbImeJ/z0JQFeA+i2iKqG3AJnQA=;
 b=hxTFbQ8QTNsE2Hj6wWDWqpiQ2jKdiRaXeXbyB6o0tJauW0HvfzOpbggsXJtPg/ciKO
 WL1sAPZKqmdSq6uzLlnNRiVYu4NDw2Y79sS+dCv6NGORd5xEvJmK5LLeL3whYlWFiEhM
 081a5zn4ni04Z9hGx0mdVc81J6eMBrUlrMbr9oxOZCaR0mOz66uWT8S+bBJKvmILBoSt
 B+10OetHs6B7slDp7jQA7Jud0MSMLXYpHSqYXuo7bgWCY14pzpseU3ICgb231FJyIZMy
 UEPTSqd54284+JzZg7Squs5T4mrGSa1nHVfRWm1r15ENbLRqgvfi86QO+afjvGyOvMlh
 SxVA==
X-Gm-Message-State: AJIora+ja92WkYxMRyfIUFmuOsarC/b8bnUhtdDdJHbxtvUsnd0ovO6J
 sgVVZHS+1jnz/wqxKlrFTDLgSEVM2zqhMAJiO6de7Q==
X-Google-Smtp-Source: AGRyM1ueinUN05jjYbIyxfAI2xZPoneepbDu6/YZ6pw+Naf9e6fwaeCaMFNmRpp1/CJwTrsOKNZvFXkpF21RlOTRFIo=
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr6328472ybk.479.1655989793730; Thu, 23
 Jun 2022 06:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220617144857.34189-1-peterx@redhat.com>
 <20220617144857.34189-6-peterx@redhat.com>
In-Reply-To: <20220617144857.34189-6-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 14:09:43 +0100
Message-ID: <CAFEAcA_ithXxxxBQpw3sF0XN1qz8Hgdqc4J_S8jDUgiJAL0-Yg@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: Hook kvm_arch_put_registers() errors to the
 caller
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>, 
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Jun 2022 at 15:53, Peter Xu <peterx@redhat.com> wrote:
>
> Leverage the new mechanism to pass over errors to upper stack for
> kvm_arch_put_registers() when called for the post_init() accel hook.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  accel/kvm/kvm-all.c  | 13 ++++++++++---
>  accel/kvm/kvm-cpus.h |  2 +-
>  softmmu/cpus.c       |  5 ++++-
>  3 files changed, 15 insertions(+), 5 deletions(-)

Checking for errors definitely does seem like the right thing to do.
That said:

(1) Why do we want to check for errors only on the call
for post_init synchronize, and not any of the other places
where we call kvm_arch_put_registers()?

(2) I suspect this will uncover some situations where we've
been happening-to-work because we ignore an error, and now
will start to actively fail. But I guess there's not much
we can do about that except say "we'll fix them as we encounter
bug reports about them". (I know of at least one: on the
Mac M1 running Linux, if the host doesn't have this kernel fix:
https://lore.kernel.org/all/YnHz6Cw5ONR2e+KA@google.com/T/
then the first put_registers will fail (mostly harmlessly).
I think that's the post_init sync but it might be the post_reset
one.)

thanks
-- PMM

