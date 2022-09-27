Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13B5ECB7E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:43:43 +0200 (CEST)
Received: from localhost ([::1]:46934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odEcQ-0001AH-VN
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odEaF-00061L-NG
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:41:27 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odEaC-0003HE-E4
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:41:27 -0400
Received: by mail-ej1-x635.google.com with SMTP id z13so22266415ejp.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 10:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8u3AVihglAkdz6OkHdZN1ld0QmEhCcRwpssqab1F93Y=;
 b=EtRmGWRRC9PRJ+K5at5j4u7n65Xy3ZtFORohLg/+ULPbF6cp8r2gWKb6yKtZDqkmU4
 3LvlgXudeyppcMVa34C8EbKZ5J3+ZjZ24WUsRBxzc/z9aSeARNMmCrfmKajnz1UscsA1
 ptdkY3ZSoA8wo9IHaXicaG+CqEzPGJV+nNGtqKVjGrco8W6fq3KEUI6SabtcyPDYlDZ7
 +j9ev5nSfnRlKmXNw+tY23026i9oy+CuGzqExjl2pQAz+wRNQ6C2kJpihWuPkqgiqsBU
 kk1Ej2AIr8whSgHRWTMt6tndeTBY+xS1fa2HSn6HziV9yKYPL8DobOfCNDX7zm3+Zswp
 pOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8u3AVihglAkdz6OkHdZN1ld0QmEhCcRwpssqab1F93Y=;
 b=NlB15Fl2FbXPoK6y4hCN75gv8pT0JUlLA97MCEotKnsKY4jYcEFAEUUrRi96dxIRFS
 G702TqPEPIFcnQ3WBXZhYIgkvvipeQ/KTWSorVLzdkpZS7kBXQ+OD/oDQIKq2ZIprQ3M
 nrXThTSWP26x2wWvoAC8lY1qZ9zqSP+eAQhQJsfZ7vRj0WOBEY0vk2AmzXkobKKe4SMZ
 SWThJhjMEENBVcu0mDYDBDbVbI0KThilxtl8p2AMNJtjee8cWWI6LkTFaNCr15CjPlxV
 QsunMHzu+hc0dT/WJAj5HWb+49RKp0hH2bC6+dpmzZFdZPHzX0fZUPV6d4iO2aCpU/3O
 Nbjw==
X-Gm-Message-State: ACrzQf3vP6SWYH2YZw0n3CwCdYE03AwQleGngdB0P/YIFgdGXKtwFtRP
 kHOD19mvpOm5ftEbQ/TdjT2mUV1aZZ/7U47Ne4YYmw==
X-Google-Smtp-Source: AMsMyM7dJU3Wb/2pktojlwV1MRrldKLgoxaXOcnt8sQqeSp8vOS6TkKy00gav4Jo18l9bhxYWsgDMu2ok0WIKKVW/NI=
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr15519334ejc.555.1664300482405; Tue, 27
 Sep 2022 10:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220927164920.1502219-1-peter.maydell@linaro.org>
 <51698c38-468a-83e7-5ff0-be2175f1e17d@redhat.com>
In-Reply-To: <51698c38-468a-83e7-5ff0-be2175f1e17d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 18:41:10 +0100
Message-ID: <CAFEAcA95hJ-=yLqEg=3pmPsgxn0z1ad4w1fzCk=PduUwH=EVNA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/kvm: Retry KVM_CREATE_VM call if it fails
 EINTR
To: eric.auger@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 27 Sept 2022 at 18:07, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 9/27/22 18:49, Peter Maydell wrote:
> > Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
> > there is no pending signal to be taken. In commit 94ccff13382055
> > we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
> > generic KVM code. Adopt the same approach for the use of the
> > ioctl in the Arm-specific KVM code (where we use it to create a
> > scratch VM for probing for various things).
> >
> > For more information, see the mailing list thread:
> > https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
> >
> > Reported-by: Vitaly Chikunov <vt@altlinux.org>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > The view in the thread seems to be that this is a kernel bug (because
> > in QEMU's case there shouldn't be a signal to be delivered at this
> > point because of our signal handling strategy); so I've adopted the
> > same "just retry-on-EINTR for this specific ioctl" approach that
> > commit 94ccff13 did, rather than, for instance, something wider like
> > "make kvm_ioctl() and friends always retry on EINTR".
> >
> > v2: correctly check for -1 and errno is EINTR...
> > ---
> >  target/arm/kvm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index e5c1bd50d29..356199c9e25 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >      if (max_vm_pa_size < 0) {
> >          max_vm_pa_size = 0;
> >      }
> > -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +    do {
> > +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +    } while (vmfd == -1 && errno == -EINTR);
> shouldn't it be errno == EINTR?

Augh. Yes.

-- PMM

