Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A73C9888
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 07:51:31 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3uHS-0003tF-MQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 01:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m3uFg-0001fZ-6z
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 01:49:40 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:37500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m3uFe-0004Ni-L0
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 01:49:39 -0400
Received: by mail-lj1-x231.google.com with SMTP id h19so7003053ljl.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 22:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A/PvA1DB0W5wp+a8Jesrkmf512SBcdKf2TLwujd0mHs=;
 b=EQxYapb1uUstI3d8aTGl3fY9z0le160jeIBGmL2nJsbgqr8ux2VlwMfhBbvyrU8pQo
 bNR8hbUCicTntkRekvIJrfI1oiY8jMQY6LG2RqZZ8rH4Qk+K1mfaRAubuliuOGn32wYq
 2ULQBmdyU0Zc8yZGWfUCbNYWnEUB1DckK5blR+j56gTolJ6G15pHDB3xLyijxHdOSvIJ
 teEKXgBkGGVXZiuFZKv90lxPVqjmPUSJf52lERWJOC5tqrLXA7MNI6VM+rFKlxR5PKOA
 1/PvL9UtKxnKFn96ge3mQdQ136cbmM6nqN26LgtTtrvmyw056OBZ+Hsy9h3uVUYLcwHB
 J7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A/PvA1DB0W5wp+a8Jesrkmf512SBcdKf2TLwujd0mHs=;
 b=pZmui1qiZQHtktDOUfbqTUh5jk5FEP7dy+H2ErvIGEneglx+vlphB+V5XF2FfJASn3
 EKhdGlYKB5RFAGjLImx6YAriNc6NfcT+u4IMLktBbp+Q7HOPtAMnnzVThs1sTUEGMqOA
 y2Ojm/D1SVAU/i3MEb7rsvnUKJeGpK1VLd2hx3mWZaXbdzDfDN2fs2hk9GiXLTeWWgBp
 CjWY+0Xu7ffSTghjMexKbHP9uK8xKa2LXd/dFCVMunjS0TDBNpX20elqnGhinWiRNGqI
 HGcodftXlpjdVfzY2TQCEQiv7z/stHFyDPS5ZkJyy8zT7heWWYpPx5vnNGUVjyExkGpN
 hIow==
X-Gm-Message-State: AOAM532zPtFjBCVpZOiiAAYQAwP2w7gzl/jpae6Nug05NTgVe6dcLhIK
 iFqEQEswXxVDPim7Tx53Wi2rRMHK4XzBTiS/1Rk=
X-Google-Smtp-Source: ABdhPJyu6X9WsZWORN2UOxa5XsxOWtYz/s7oZ1sB/2kxB204aN6CUmy6sAFqeT/NuDU/UphlBBt0ssJTs6NraAsRDJU=
X-Received: by 2002:a2e:3515:: with SMTP id z21mr2142470ljz.250.1626328175946; 
 Wed, 14 Jul 2021 22:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
 <YOxYM+8qCIyV+rTJ@google.com>
 <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
 <YO8jPvScgCmtj0JP@google.com>
In-Reply-To: <YO8jPvScgCmtj0JP@google.com>
From: harry harry <hiharryharryharry@gmail.com>
Date: Thu, 15 Jul 2021 00:49:34 -0500
Message-ID: <CA+-xGqOkH-hU1guGx=t-qtjsRdO92oX+8HhcO1eXnCigMc+NPw@mail.gmail.com>
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=hiharryharryharry@gmail.com; helo=mail-lj1-x231.google.com
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

> No, each vCPU has its own MMU instance, where an "MMU instance" is (mostly) a KVM
> construct.  Per-vCPU MMU instances are necessary because each vCPU has its own
> relevant state, e.g. CR0, CR4, EFER, etc..., that affects the MMU instance in
> some way.  E.g. the MMU instance is used to walk guest page tables when
> translating GVA->GPA for emulation, so per-vCPU MMUs are necessary even when
> using TDP.
>
> However, shadow/TDP PTEs are shared between compatible MMU instances.  E.g. in
> the common case where all vCPUs in a VM use identical settings, there will
> effectively be a single set of TDP page tables shared by all vCPUs.

What do you mean by "MMU instance"? Do you mean VMCS? MMU is hardware.
Could you please share me the code of the MMU instance in KVM? Thanks!

