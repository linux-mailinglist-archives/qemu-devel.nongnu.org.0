Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B8F3CB118
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 05:21:29 +0200 (CEST)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4EPk-0005Fv-Gl
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 23:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m4EOU-0004Tx-Ip
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 23:20:06 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:36823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m4EOS-0003Ew-Rp
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 23:20:06 -0400
Received: by mail-lf1-x133.google.com with SMTP id y42so13637862lfa.3
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1YJZ1CWMmebpSmtQddMMIIyxPUmJh3e5O5JeZSNpVGs=;
 b=nxKomr+4b8nUr5nZA7o0Un2l3lcqOxbFjPG9P8ddAeJpxbPxqCIK43r3pTnzv2WoUM
 DK52SNtlDCj+0MGDyWA9LkQXWJGwDn4p5L02XE6rJNDEpSRBbn/4WZfQGPWIcoQCeDsx
 JBPcRwHKiZa1PRrV9YE9ECOq7o2eBqmkPfMPd9Ma/AZzKa4EMqCVMBdmFEECQ0nwqMxn
 OInSDMsAasv51sOB23FHYqowemSr/t/4JeEU7QW+lQ4ijvWz+hHlM2H/qce2oz/v42fA
 JV5rnRwzyNSIekiHaomTSkv9WU23rbYSl1RV6mP66ZfIWiKlAkGlb2RH9k7WXdDAr+2o
 POyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1YJZ1CWMmebpSmtQddMMIIyxPUmJh3e5O5JeZSNpVGs=;
 b=GTZJz8HH4eFiVXYylmErPSTzKhF3ofk7I/DUKeH7nRtMccNeDrW6J3kxtSIYycY96J
 XqTTokwnmi+XCd6e2q0lMphBSwUAunNMuUxuMkNFYo6wLSOzYTSivEWysrZzzi9iPYJI
 iUSNuuY3c4B0Xz3inmGDO+tvuGeCriBjYbhnl7R+dgJuPLfCCOT37rSWmrtusFUFT4NI
 LjfOObSkRxZ19OMSuk7idds1ykMKtqI2coj0bcoBzRpAfBsEj8rHnN/vYQ6aE9iv5y/o
 74/d4codO4Cgv5YtefxeEpXe047820raS5+KcDDIWaiYz+rl3DM2Mg/jvGuyOCzoBHQQ
 bXSA==
X-Gm-Message-State: AOAM533CPAxeKBASzMM5tmv76hKXVBhWo29P2yu82WfJGWjGDGnXe/s3
 FVPnGmBkcf6m8XsfVey5LofxyQB/Ff5dQZO3yrM=
X-Google-Smtp-Source: ABdhPJyVq5th++qXg53cvve/xs6hma3tAScm8LW1cQsaL++a+pZcGEmQN+gylMMwVZhPapBUf9LoENsGX/SAV+/xXSg=
X-Received: by 2002:ac2:50c3:: with SMTP id h3mr6102308lfm.126.1626405603089; 
 Thu, 15 Jul 2021 20:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
 <YOxYM+8qCIyV+rTJ@google.com>
 <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
 <YO8jPvScgCmtj0JP@google.com>
 <CA+-xGqOkH-hU1guGx=t-qtjsRdO92oX+8HhcO1eXnCigMc+NPw@mail.gmail.com>
 <YPC1lgV5dZC0CyG0@google.com>
In-Reply-To: <YPC1lgV5dZC0CyG0@google.com>
From: harry harry <hiharryharryharry@gmail.com>
Date: Thu, 15 Jul 2021 22:20:04 -0500
Message-ID: <CA+-xGqN75O37cr9uh++dyPj57tKcYm0fD=+-GBErki8nGNcemQ@mail.gmail.com>
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=hiharryharryharry@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, mathieu.tarral@protonmail.com,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Sean,

Thanks for the explanations. Please see my comments below. Thanks!

>  When TDP (EPT) is used, the
> hardware MMU has two parts: the TDP PTEs that are controlled by KVM, and the IA32
> PTEs that are controlled by the guest.  And there's still a KVM MMU for the guest;
> the KVM MMU in that case knows how to connfigure the TDP PTEs in hardware _and_
> walk the guest IA32 PTEs, e.g. to handle memory accesses during emulation.

Sorry, I could not understand why the emulated MMU is still needed
when TDP (e.g., Intel EPT) is used?
In particular, in what situations, we need the emulated MMU to
configure the TDP PTEs in hardware and walk the guest IA32 PTEs?
Why do we need the emulated MMU in these situations?

Best,
Harry

