Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5627420755
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:29:36 +0200 (CEST)
Received: from localhost ([::1]:39130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJLr-0005dW-QW
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIwW-0004vB-Cx
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIwS-0008FV-9C
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633334598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AxAX8noHuYW60zrdGxYSW16pDWO3mFOu1qFSDQZijgc=;
 b=grHubMgR1uodYAQKwi4iTihSnRAFRQ+xV/OoH7LvfPNCNp4Vl/38WRGcnYVkXulDiUP2T3
 BpiZn0wBzRr/4Hj2HuBg4gShq8IFIvhh5+WwQnhAizZ41tw+1kojubDUzsaNGXeGJ3vhzQ
 h/xbXmYljv4uBnzomXVWFDOeaBIRg6I=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-7s2rCPpjM3GD1rLSqD8HSA-1; Mon, 04 Oct 2021 04:03:15 -0400
X-MC-Unique: 7s2rCPpjM3GD1rLSqD8HSA-1
Received: by mail-pl1-f197.google.com with SMTP id
 w4-20020a1709029a8400b00138e222b06aso7024290plp.12
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AxAX8noHuYW60zrdGxYSW16pDWO3mFOu1qFSDQZijgc=;
 b=dgMlRqv+uQa15abfr3lN2N5VQhSXTcmpIjFYqw3ost1Fv9VhlS1jdUj/OFXWER7OEp
 ESHKrefvG4Fmtp8x30r1L7Fww5Zq+ZpZDl7PzE1gtx68AWkxSwH1UAfHOZIUq8V74q4V
 PfaX1u1cF2XTayYzSYfEg7KbNxrqWxzMu2GNexkFom3zB785kpwDdOiPL3LTdd0T3Lex
 eR4SkklH3sc6MVHit19EO5SxPlxpDQ7vIcVYgZNJLDjmC/Q4LUgnwvwoZiYlIy7RdaAM
 YrBDelaOigInmetI1QKoe0LqqztaCwWrzWlaH/V98wcSP1GCiANjIK650NOiMt9Dpun1
 JikA==
X-Gm-Message-State: AOAM530pbMuKIEqS+xxYvIbxrmN4gsZR/isweAO4knD8PUO4eO50eJiB
 vDMA45lw7rLfoL0VE2aBRzCnyP0fLYUs8iMguGZjrJ/77FHpDQhUzzcXeqqacOXZBGIa5nEUXao
 WtYgvA3OoypsBSH6AzhMvkdUYAZgxObM=
X-Received: by 2002:a63:131c:: with SMTP id i28mr1898759pgl.396.1633334594006; 
 Mon, 04 Oct 2021 01:03:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/0cKT/wty8ux3xudr46DkkOJXb3FilLJUe+Z3vYUKhefDUNofKiBjXa6nYt/ufg8ezEKhaVL2fdbiBJ47cTI=
X-Received: by 2002:a63:131c:: with SMTP id i28mr1898724pgl.396.1633334593615; 
 Mon, 04 Oct 2021 01:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
In-Reply-To: <20210930054915.13252-1-dovmurik@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 4 Oct 2021 10:03:02 +0200
Message-ID: <CABgObfb3VOSav+pdwC5_xrCeM5S32B2XV02L7H7DWx+9Gi8u_g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
To: Dov Murik <dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.  However, it would be nice to have a documentation of
all our SEV firmware interfaces somewhere in docs/specs/.

Paolo

On Thu, Sep 30, 2021 at 7:49 AM Dov Murik <dovmurik@linux.ibm.com> wrote:
>
> Currently booting with -kernel/-initrd/-append is not supported in SEV
> confidential guests, because the content of these blobs is not measured
> and therefore not trusted by the SEV guest.
>
> However, in some cases the kernel, initrd, and cmdline are not secret
> but should not be modified by the host.  In such a case, we want to
> verify inside the trusted VM that the kernel, initrd, and cmdline are
> indeed the ones expected by the Guest Owner, and only if that is the
> case go on and boot them up (removing the need for grub inside OVMF in
> that mode).
>
> To support that, OVMF adds a special area for hashes of
> kernel/initrd/cmdline; that area is expected to be filled by QEMU and
> encrypted as part of the initial SEV guest launch.  This in turn makes
> the hashes part of the AMD PSP measured content, and OVMF can trust
> these inputs if they match the hashes.
>
> This series adds an SEV function to generate the table of hashes for
> OVMF and encrypt it (patch 1/2), and calls this function if SEV is
> enabled when the kernel/initrd/cmdline are prepared (patch 2/2).
>
> Corresponding OVMF support [1] is already available in edk2 (patch series
> "Measured SEV boot with kernel/initrd/cmdline").
>
> [1] https://edk2.groups.io/g/devel/message/78250
>
> ---
>
> v4 changes:
>  - struct and variable renames (KernelLoaderContext -> SevKernelLoaderContext,
>    kernel_loader_context -> sev_load_ctx).
>
> v3 resend: https://lore.kernel.org/qemu-devel/20210825073538.959525-1-dovmurik@linux.ibm.com/
> v3: https://lore.kernel.org/qemu-devel/20210624102040.2015280-1-dovmurik@linux.ibm.com/
> v3 changes:
>  - initrd hash is now mandatory; if no -initrd is passed, calculate the
>    hash of the empty buffer.  This is now aligned with the OVMF
>    behaviour which verifies the empty initrd (correctly).
>  - make SevHashTable entries fixed: 3 entries for cmdline, initrd, and kernel.
>  - in sev_add_kernel_loader_hashes: first calculate all the hashes, only then
>    fill-in the hashes table in the guest's memory.
>  - Use g_assert_not_reached in sev-stub.c.
>  - Use QEMU_PACKED attribute for structs.
>  - Use QemuUUID type for guids.
>  - in sev_add_kernel_loader_hashes: use ARRAY_SIZE(iov) instead of literal 2.
>
> v2: https://lore.kernel.org/qemu-devel/20210621190553.1763020-1-dovmurik@linux.ibm.com/
> v2 changes:
>  - Extract main functionality to sev.c (with empty stub in sev-stub.c)
>  - Use sev_enabled() instead of machine->cgs->ready to detect SEV guest
>  - Coding style changes
>
> v1: https://lore.kernel.org/qemu-devel/20210525065931.1628554-1-dovmurik@linux.ibm.com/
>
>
> Dov Murik (2):
>   sev/i386: Introduce sev_add_kernel_loader_hashes for measured linux
>     boot
>   x86/sev: generate SEV kernel loader hashes in x86_load_linux
>
>  target/i386/sev_i386.h |  12 ++++
>  hw/i386/x86.c          |  25 +++++++-
>  target/i386/sev-stub.c |   5 ++
>  target/i386/sev.c      | 137 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 178 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>


