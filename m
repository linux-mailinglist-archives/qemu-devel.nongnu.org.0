Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E315EB8E5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 05:37:39 +0200 (CEST)
Received: from localhost ([::1]:52486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od1Pe-00010G-EH
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 23:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1od1NI-0007bq-AF
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 23:35:12 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:38898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1od1NF-0003UT-EH
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 23:35:11 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1278624b7c4so11771325fac.5
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 20:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=cTpiKMeX1kSGN77h4IpKuIZpd1OqUkwiSO/vMCf+e/s=;
 b=MXfMcL1hGOQ/PAd6xNgWrB9oi7hWTbvw+fbY0u3+j7hytgSqaT+AK02qt9UGcG3EiJ
 hag2OyiFk9LSc5ywdMZdMaCBISTQYNnI9staCYUpfrVspuY1V3CWaleTcU+VVH1mjm1x
 jrP9Ni2bw2taqfWBMiZY2y9zQfK7OmtAqqWj9PMgF+QhJ7l43L4B4eCHqfj3yv0J2mQ5
 ptt3nCJnSCSNTNAhdweVAmkUeVVJ9IWRK72nej00V3vuQv9tTZfP4DI+M6a+Qv617eyj
 YB+rhew2MkG/xef9e5dmvwmhckjrppfYNTBEiTG+SQopWd/0TEGsDKb1QKj2JOEToW2k
 lHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cTpiKMeX1kSGN77h4IpKuIZpd1OqUkwiSO/vMCf+e/s=;
 b=uUt94rdfuebjSS9Cg44jrhmB5snai6fHckdxyHQMhgpWYiWrsum9kpfDxKUfVpno+i
 vNI5CexZzjRpyq55SYZ7okMZLRmCMWItTtHfSpoWk9d6Y/01lnt3m2EglG8aZggZ7nyr
 SkkntdoRxwV66p32LJtXKmkkUeHjmfgpNU1m20Y88mZ3bbANTA83+z6gRSGW/3iOJHn5
 JxzOw4nAs84Ig/bPpSS3CSy0eChDXcenJ4Dv38SSgUvZgJnLdru+5LzS4imiUDI5HOV8
 DI6UJDHcYcmp4GLjgqakkJ8NgJarOUSQfbt8ae1UH8FvBbxtwQf8PJ8sqvNZHR9rGgpR
 KfMw==
X-Gm-Message-State: ACrzQf2DUqiUaGGl0tAbjQdRkG4DkTZbMzSRWdoDiX0yWtHphO0QLKTV
 fR8JVQnp3Hij2qCUfuRDt8Cf99hY8c0xP4bNUz30WQ==
X-Google-Smtp-Source: AMsMyM5cT51Sa8udV1uqA4TEpA0dAbPFd+n82rMCRngi/LHAGLghjiTitKvJaat0y/BodqdjjvQP1IIcPqHolvJxYK8=
X-Received: by 2002:a05:6870:46a8:b0:128:b162:621a with SMTP id
 a40-20020a05687046a800b00128b162621amr1068870oap.90.1664249707217; Mon, 26
 Sep 2022 20:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qPD2OAxeg4WA65utUmFj4Y=SceeFTuStpZS4pPWevdBXA@mail.gmail.com>
 <20220905131544.2xlaycrcyviufo5y@kamzik>
 <CAB88-qPOGVksP1ekqTjcGHbi2_iVzsW-b9wokgREEQJ8LgfU=Q@mail.gmail.com>
 <CALw707oeRt4+C9HTbzzt0RcP-FtYeh1vTh7meGY99vKQQnsktA@mail.gmail.com>
 <CAB88-qPeGqcPHhCccxgTO__gh_spbzrbVNQ4Z-340E7T4mRBCw@mail.gmail.com>
In-Reply-To: <CAB88-qPeGqcPHhCccxgTO__gh_spbzrbVNQ4Z-340E7T4mRBCw@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Tue, 27 Sep 2022 11:34:55 +0800
Message-ID: <CALw707rMN584L55kB2DeYhmvQ1nB6rxnasJC8f6T0Vx=sceWyw@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/intc: sifive_plic.c: Fix interrupt priority index.
To: Tyler Ng <tkng@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=jim.shu@sifive.com; helo=mail-oa1-x2e.google.com
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

Hi Tyler,

Thanks for the explanation. I understand the issue here.
I think we should align the priority base in each RISC-V platform to
the same value (no matter 0x0 or 0x4) if they use PLIC in the same
way.


Thanks,
Jim Shu

On Tue, Sep 27, 2022 at 4:04 AM Tyler Ng <tkng@rivosinc.com> wrote:
>
> Hi Jim,
>
> Thanks for raising this comment. I think I understand where the confusion=
 happens and it's because in the OpenTitan machine (which uses the sifive p=
lic), it uses 0x00 as the priority base by default, which was the source of=
 the problems. I'll drop this commit in the next version.
>
> -Tyler
>
> On Sun, Sep 25, 2022 at 6:47 AM Jim Shu <jim.shu@sifive.com> wrote:
>>
>> Hi Tyler,
>>
>> This fix is incorrect.
>>
>> In PLIC spec, Interrupt Source Priority Memory Map is
>> 0x000000: Reserved (interrupt source 0 does not exist)
>> 0x000004: Interrupt source 1 priority
>> 0x000008: Interrupt source 2 priority
>>
>> Current RISC-V machines (virt, sifive_u) use 0x4 as priority_base, so
>> current formula "irq =3D ((addr - plic->priority_base) >> 2) + 1" will
>> take offset 0x4 as IRQ source 1, which is correct.
>> Your fix will cause the bug in existing machines.
>>
>> Thanks,
>> Jim Shu
>>
>>
>>
>>
>> On Tue, Sep 6, 2022 at 11:21 PM Tyler Ng <tkng@rivosinc.com> wrote:
>> >
>> > Here's the patch SHA that introduced the offset: 0feb4a7129eb4f120c758=
49ddc9e50495c50cb63
>> >
>> > -Tyler
>> >
>> > On Mon, Sep 5, 2022 at 6:15 AM Andrew Jones <ajones@ventanamicro.com> =
wrote:
>> >>
>> >> On Thu, Sep 01, 2022 at 03:50:06PM -0700, Tyler Ng wrote:
>> >> > Fixes a bug in which the index of the interrupt priority is off by =
1.
>> >> > For example, using an IRQ number of 3 with a priority of 1 is suppo=
sed to set
>> >> > plic->source_priority[2] =3D 1, but instead it sets
>> >> > plic->source_priority[3] =3D 1. When an interrupt is claimed to be
>> >> > serviced, it checks the index 2 instead of 3.
>> >> >
>> >> > Signed-off-by: Tyler Ng <tkng@rivosinc.com>
>> >>
>> >> Fixes tag?
>> >>
>> >> Thanks,
>> >> drew
>> >>
>> >> > ---
>> >> >  hw/intc/sifive_plic.c | 2 +-
>> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
>> >> > index af4ae3630e..e75c47300a 100644
>> >> > --- a/hw/intc/sifive_plic.c
>> >> > +++ b/hw/intc/sifive_plic.c
>> >> > @@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwa=
ddr
>> >> > addr, uint64_t value,
>> >> >      SiFivePLICState *plic =3D opaque;
>> >> >
>> >> >      if (addr_between(addr, plic->priority_base, plic->num_sources =
<< 2)) {
>> >> > -        uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
>> >> > +        uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 0;
>> >> >
>> >> >          plic->source_priority[irq] =3D value & 7;
>> >> >          sifive_plic_update(plic);
>> >> > --
>> >> > 2.30.2
>> >> >

