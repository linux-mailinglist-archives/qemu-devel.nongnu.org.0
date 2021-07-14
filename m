Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F23C7DF4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:31:57 +0200 (CEST)
Received: from localhost ([::1]:50916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3XUy-0003fv-BF
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m3XTN-0002kU-FG
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:30:17 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:33595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m3XTL-0004rQ-IQ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:30:17 -0400
Received: by mail-lf1-x133.google.com with SMTP id t17so1586632lfq.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 22:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C3Z9CFxob2kEmCEAlCKWUPaU9hX+53zK6v4wQ2QlHFg=;
 b=VPTgdfil+GwXO7aZSuEge0uSYQQpIq8WFDOqaG4kz23mRyTm20rQHqJ6c9s9XXZR2d
 NDmm00L1EkY2wl7TcNTtMHSYWCjs7970YZtlzfApInzryHYZRQ8Wmn65qSFQpKv/JAbz
 l35cCt+Dzou82ybFA/qs2UQhP6a16jKNVg4z48ozplhKIzsp4+W7TvoLj/RDE7mvagKw
 6SBHHeVgj4aBy24TfbEaTnyGJMCTI1XxY7uM+po33N5UcLNnT50dJunb9RlylUGPfI4X
 tx3Arba6kUxkzNCayOii13Hr2/rvB5I5BH7H+PxmDpPgFEw+OB9XeMQcGpl3iTnYUkaT
 gkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C3Z9CFxob2kEmCEAlCKWUPaU9hX+53zK6v4wQ2QlHFg=;
 b=HEgbSUwNy2i3wBkCFuBFq6PIvBDIouDVFQFhGqTr6nxLq1sfqOyo8hlmooFsSiE2wT
 +YsXUHFDHEFEG7qGZmTXRIVECvVRPICtL2JTQNqvqr272b9K85DpkfiKkuROZSxPqf2o
 mHci7ABLz8FNm64rl9LXHOjJgTS3YWceehf+AEuHW4S5E95eL1EHY6AOqjhXdUvRY0/g
 OjdKYCiLU7Sn5P5MZvjJu7ySx6obAvaaFLMy9jsvNa2a16WkSarSR9gv8KjJKqOElLDb
 56GN6hHFvBTkEQw/OvEQY6Lrf2xyaLUF3Dz5Mh9irYXxYKHHnliq0LfGj8pCsA1yW0fJ
 IBFQ==
X-Gm-Message-State: AOAM5337x/J92kFcMJAmdIjLr/UwLQoif/qOCU27dfT9XiwYydkbHaqQ
 sNGGh0KhcJtUL8fi3mI8RgL9ETxhtolzd8PQNLI=
X-Google-Smtp-Source: ABdhPJzwGzp1+TAupobQLPbG3N+XphKRuUSDwilCNDvuT3/BEtaVEVbBuQflBmok1a5NdcLA6b+zt0OuoEJ3TExFYWg=
X-Received: by 2002:a19:5f43:: with SMTP id a3mr6316001lfj.504.1626240613790; 
 Tue, 13 Jul 2021 22:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
 <YOxYM+8qCIyV+rTJ@google.com>
In-Reply-To: <YOxYM+8qCIyV+rTJ@google.com>
From: harry harry <hiharryharryharry@gmail.com>
Date: Wed, 14 Jul 2021 00:30:12 -0500
Message-ID: <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
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

Dear Sean,

Thanks for the comments!


> Heh, because the MMUs are all per-vCPU, it actually wouldn't be that much effort
> beyond supporting !TDP and TDP for different VMs...
>

Sorry, may I know what do you mean by "MMUs are all per-vCPU"? Do you
mean the MMUs walk the page tables of each vCPU?


> ...but supporting !TDP and TDP in a single KVM instance isn't going to happen.
> It's certainly possible, but comes with a very high complexity cost, and likely
> even performance costs.

For one KVM instance, I think it might be possible to let several
physical cores use !TDP and other cores use TDP but I am not sure
about the implementation complexity.

>
> The more sane way to support !TDP and TDP on a single host would be to support
> multiple instances of KVM, e.g. /dev/kvm0, /dev/kvm1, etc...  Being able to use
> !TDP and TDP isn't strong justification for the work required, but supporting
> multiple KVM instances would allow upgrading KVM without having to migrate VMs
> off the host, which is very desirable.  If multiple KVM instances are supported,
> running !TDP and TDP KVM instances should Just Work.

Yes, for different KVM instances, it may be much easier but there
might be some other issues, e.g., communication overhead between
different instances. I think the upgrading idea is great but is very
limited to local upgrading.

Best,
Harry

