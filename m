Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA76731F96C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:32:33 +0100 (CET)
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4xU-0004vz-Gi
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4a6-0003d1-6I
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:08:23 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4a2-0003WH-TJ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:08:21 -0500
Received: by mail-ed1-x52b.google.com with SMTP id p2so9456551edm.12
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 04:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rnkn7mbM56SteQutXvRxji6jtVMYcThd8dUUo2XhtOE=;
 b=ELXA41CKlOXTN1/9N7Ts9CcJHRq/Kx13l/8BE4BziuJKhXr1/wWwWFHmFyUqcfwNqs
 hG7c2ic8cC+Q5l8dCzvH2ioxtvIbxgG85e1aFkXUS/NCcVpIo+1F9Ygkxrt36CeLFqkZ
 5r+542tbF2ZxAjnV2bLBL6aHXOgPZXTQqEWDTM9qeiDe+GA9Xh7CakA+SJfGSSB0cbNZ
 UBk8LVUgT8suW7aa/Fsv8LWB9ciPWNDrV0biKm1PCeOmr0KoZ2kkkfslUnL+oE3lk+1a
 wJN7v/S3daAyHONr0dvfgAGgA80LcjPaMCVAdG4d7+cJZ6vxcIuF0Z1BVL13tpsM8jbz
 bG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rnkn7mbM56SteQutXvRxji6jtVMYcThd8dUUo2XhtOE=;
 b=fsBZUXQLdzvotmbM/RUw0SnpE11TNwRVsCeLp/Lh125rCynFq/NLObQuFM50eOukAj
 2JzETKG1fDBMeiWe1P3ur8zX9bhQOWHxByvGEiqJSRAcEPmHhwKtlhTJefeCgOV6byz8
 oV54mD6AYAMYigOAtsVux+COPpsj/YeS4QSh5sY5cY19DZruBlC7MvyMOZnGewajpoYd
 eFKZ0umoNvm6Pq/akjV/LsX8nIL87IvpUA6vF5H/eS/m9VcKXk4k8M/RFH9mMzMvA5+2
 IlP7hzS/QXTF0hgZMJQwymQwg6HA9r2Ov0QQRb3X4BypCjdULCBdTjkLmb7+HNX6jy4A
 J9Yw==
X-Gm-Message-State: AOAM531/J+PyWAUcXIEbRQ4HmPPZsPTpZhMggEE6fiz7rvUfevD+UfJv
 48FZCvK6+jFmVS8zuL0PiBLdMzsyqBJT0ZYmbLKrsg==
X-Google-Smtp-Source: ABdhPJx5PDdFuTeJWwNR+YNIQtZ7qwv2WTUigwRfVG4qQBVImGyqqTnw7XwIshfI5fI8sFOL12fb2yxRS1qvjUU5KfM=
X-Received: by 2002:a05:6402:545:: with SMTP id
 i5mr5364744edx.44.1613736496919; 
 Fri, 19 Feb 2021 04:08:16 -0800 (PST)
MIME-Version: 1.0
References: <20210219114428.1936109-1-philmd@redhat.com>
 <20210219114428.1936109-3-philmd@redhat.com>
 <YC+nxWnB+eaiq736@redhat.com>
In-Reply-To: <YC+nxWnB+eaiq736@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 12:08:05 +0000
Message-ID: <CAFEAcA-A=TG43w2yNfrDwCgYYNZBEa25cM_yYgREfQyKa=PZEQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] hw/boards: Introduce 'kvm_supported' field to
 MachineClass
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 11:58, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> Is the behaviour reported really related to KVM specifically, as opposed
> to all hardware based virt backends ?
>
> eg is it actually a case of some machine types being  "tcg_only" ?

Interesting question. At least for Arm the major items are:
 * does the accelerator support emulation of EL3/TrustZone?
   (KVM doesn't; this is the proximate cause of the assertion
   failure if you try to enable KVM for the raspi boards.)
 * does the board type require a particular CPU type which
   KVM doesn't/can't support?
Non-KVM accelerators could at least in theory have different answers
to those questions, though in practice I think they do not.

I think my take is that we probably should mark the boards
as 'tcg-only' vs 'not-tcg-only', because in practice that's
the interesting distinction. Specifically, our security policy
https://qemu.readthedocs.io/en/latest/system/security.html
draws a boundary between "virtualization use case" and
"emulated", so it's really helpful to be able to say clearly
"this board model does not support virtualization, and therefore
any bugs in it or its devices are simply outside the realm of
being security issues" when doing analysis of the codebase or
when writing or reviewing new code.

If we ever have support for some new accelerator type where there's
a board type distinction between KVM and that new accelerator and
it makes sense to try to say "this board is supported by the new
thing even though it won't work with KVM", the folks interested in
adding that new accelerator will have the motivation to look
into exactly which boards they want to enable support for and
can add a funky_accelerator_supported flag or whatever at that time.

Summary: we should name this machine class field
"virtualization_supported" and check it in all the virtualization
accelerators (kvm, hvf, whpx, xen).

thanks
-- PMM

