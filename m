Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52A2C362D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 02:18:46 +0100 (CET)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khjSH-0004av-5q
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 20:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1khjQh-0003p0-1C
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 20:17:07 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:38379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1khjQf-0001ta-AF
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 20:17:06 -0500
Received: by mail-il1-x142.google.com with SMTP id v3so622281ilo.5
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 17:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pkgRQIlWtsQme1mndqUIKP0IbTrQx2NtqFydE7qZ6P4=;
 b=Xb55MfWC98QkJp9PTnlmI3b8ibaxHhDUz2Sn8tUEfJiLY5SvRWa5w0wvrCoNuSMJZi
 C4ZKshMaIGiD0sO52zNO/gpW+vES4FuVSUTzCcj6UJmvSUS4ZmRwoBPxv/SaITeBkCnh
 ogtbuZGMKOxq8e6I07oCiAo6wIE/15eSAoiGFM76mVgBKrxnxFwCMfwew4gkVmd4Kbsl
 skjbVM5V1Glwvqbe/kvRNJtUX16cNG2AZtT66iB6SR3vszLD8LKdfaVr9cWUV0/Fq6yd
 lUDci0DAaNDtaGSrO3CRNkJGxY7ThZ4SOoKWruUoz13jfRo651peuOlSx7CjcqIozZ78
 OLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pkgRQIlWtsQme1mndqUIKP0IbTrQx2NtqFydE7qZ6P4=;
 b=ZNre+gH6w6trw0xjnENmWDNf153U9KutFG44tJ6BOVdYANkftvVmjDPaZoL9Uph1qA
 CbcmNNFQb8rTKf8hiL4aTxYMhowyS6MtaIKadcuLnoNGGr8OEqbkrh3aq4HypSjq0viw
 nbFjKjFH/gkQOBRgD3R4B0cZSh2MRNM4SGw0whMpxMp3s66kZp2LH65jqgfv6miQjmI6
 2TLibVlkUfVYP6PyF5Y9wfXHSjRbUz4Qc2coGaFtXamEgFglNKy/yImtOt/WiKbEazYB
 ZNlx8Qu599vpaia80Hv8EaFnVkrnj29RIeEKltjuEB66CA69heIpYNJhzr7WNCGzJnlA
 gItQ==
X-Gm-Message-State: AOAM533W1w1YthLDDAQWmnLTfFngZ0HKlIPAOp4g0cR9TRUo6iCEwYc8
 oPkeoNiJwmaVeA1//ayVvWx4cehoW29H9evA3vo=
X-Google-Smtp-Source: ABdhPJzQdPitPtr7KyjstDJXowOfoYWgQBvAI0UpVP+xSIZvPo6IFFLLtp/cN+cnBDO0B34BmLL6HGHbt9mNNeoRYv8=
X-Received: by 2002:a05:6e02:14ca:: with SMTP id
 o10mr999779ilk.143.1606267023870; 
 Tue, 24 Nov 2020 17:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20200429082916.10669-1-f4bug@amsat.org>
 <20200429082916.10669-3-f4bug@amsat.org>
 <e33820ee-0013-bed9-ef06-9a66995f6405@amsat.org>
 <b938bfae-cc2b-e43b-36ef-8ac4b5f78eb4@amsat.org>
In-Reply-To: <b938bfae-cc2b-e43b-36ef-8ac4b5f78eb4@amsat.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Wed, 25 Nov 2020 09:16:52 +0800
Message-ID: <CAAhV-H5QAizhSiAv4DprtuzdJp+ga0QCyWzqbRxg-i=W7gVUAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/mips/kvm: Assert unreachable code is not used
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=chenhuacai@gmail.com; helo=mail-il1-x142.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Tue, Nov 24, 2020 at 6:42 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Huacai, ping?
>
> On 5/12/20 9:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > +Paolo
> >
> > On 4/29/20 10:29 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> This code must not be used outside of KVM. Abort if it is.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>   target/mips/kvm.c | 8 ++------
> >>   1 file changed, 2 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> >> index de3e26ef1f..050bfbd7fa 100644
> >> --- a/target/mips/kvm.c
> >> +++ b/target/mips/kvm.c
> >> @@ -196,9 +196,7 @@ int kvm_mips_set_interrupt(MIPSCPU *cpu, int irq,
> >> int level)
> >>       CPUState *cs =3D CPU(cpu);
> >>       struct kvm_mips_interrupt intr;
> >>   -    if (!kvm_enabled()) {
> >> -        return 0;
> >> -    }
> >> +    assert(kvm_enabled());
> >>         intr.cpu =3D -1;
> >>   @@ -219,9 +217,7 @@ int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int
> >> irq, int level)
> >>       CPUState *dest_cs =3D CPU(cpu);
> >>       struct kvm_mips_interrupt intr;
> >>   -    if (!kvm_enabled()) {
> >> -        return 0;
> >> -    }
> >> +    assert(kvm_enabled());
> >>         intr.cpu =3D dest_cs->cpu_index;
> >>
> >

