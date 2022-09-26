Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E255EB107
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 21:14:20 +0200 (CEST)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octYZ-00032x-AY
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 15:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1octRy-0004mT-RF
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:07:30 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1octRv-0007Yu-BI
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:07:29 -0400
Received: by mail-ej1-x633.google.com with SMTP id dv25so16120758ejb.12
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cW6SI3svECFkjaNcx7SDd/YGDU30luCGFo7onpRuRkk=;
 b=nX6T8DmolD0Bj2Vx+7MyC/iFTrawki3IN8Wu6M0EZVa//1zZK8Wd8xKl4GF4qnOVp8
 2zx+nqNMABUod37zvCWbEGHH6UlFZQRtJwix4wFNIXb3LHPXX2vMEN2/eichMIwhUyBM
 6d8irypnYesOn3BdkebVmONo05yKI1yJXVHpqS8mj913UElSmL7Rb0h4C6LIEVTGvK0r
 gGcq1nZ2N2xtt6TxTYCuBv6WmlvI1xbP/nC3QAcypKCu7aLTW/8z1K7P0VIzY5JDxOmE
 lf7FHjburwI1No+fozQnQ0jDEj0m5RTJskj0Gek05sejzoSfw3Bb5Bxq0KG8DUc77wJW
 gYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cW6SI3svECFkjaNcx7SDd/YGDU30luCGFo7onpRuRkk=;
 b=HNZkn0D43ySrzGTK7gD66l2jtyOWSQuvlzD7aYRSErYLi3ksxuah7Ue6IZBRlbKtAI
 BEfmOWdHoN4D4o3X/iZCCkYiOIPYC6IdEK2xs4qJqaIXfSjzqO+4yDmVgzOMb4EQBQbE
 mennzLbE4LKJBygE8trXtZ1uodSKTfsEWGepPI0hDheR7hCPhFNn2WnuRe+WW3GO78jt
 3SRjutP2tan+Xx7asarm1jWxa0VuAQ+j7E3KmcwcFyfE27nSxVQJfsUWgw5TUftlfM0z
 pmtQhpL22eN4ezg00mjDn/u8VQdK5Jj4k67is6XjZTTcibOEv3oQDeASkWpMHAISbCdz
 uZ3g==
X-Gm-Message-State: ACrzQf0aOdPm3DX7GTOkAUfCdWsmprlaMLRVi50411xA8KoUMZLJ0Pom
 FVbnFzjRLLa8shIotBlAo4hRqdGz3vhNb8EEOdwv7Q==
X-Google-Smtp-Source: AMsMyM4/VfW8wuB5VQsHq+cAI6TYy5rAoEiRwxbbx44NRLXJZKIXoW1nzkbNJsEpuhSorugaeuRC4NVluyejdtEfG3Y=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr19190242ejc.365.1664219244633; Mon, 26
 Sep 2022 12:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133644.1345269-1-peter.maydell@linaro.org>
 <20220926180812.oojocmldqsf7kl2o@altlinux.org>
In-Reply-To: <20220926180812.oojocmldqsf7kl2o@altlinux.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 20:07:13 +0100
Message-ID: <CAFEAcA8tfam1tENE+O9Ae=69mbb=k=XOuJ0AsM9ErqURSnsuXQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
To: Vitaly Chikunov <vt@altlinux.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Dmitry V. Levin" <ldv@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Mon, 26 Sept 2022 at 19:08, Vitaly Chikunov <vt@altlinux.org> wrote:
>
> Peter,
>
> On Mon, Sep 26, 2022 at 02:36:44PM +0100, Peter Maydell wrote:
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
> > ---
> >  target/arm/kvm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index e5c1bd50d29..2982d216176 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >      if (max_vm_pa_size < 0) {
> >          max_vm_pa_size = 0;
> >      }
> > -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +    do {
> > +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +    } while (vmfd == -EINTR);
>
> This does not seem correct. ioctl(2) returns -1 on error and will set errno
> to EINTR (in this case).

Oops, thanks for the catch. I was copying the pattern from kvm-all.c,
but there we are calling kvm_ioctl(), which does "if ioctl
returns -1, return -errno", and here we are calling ioctl() directly.
(We can't use kvm_ioctl() here because this stunt VM doesn't have
a KVMState.) I'll respin the patch with the obvious fix.

thanks
-- PMM

