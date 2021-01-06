Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0792EBD47
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 12:41:17 +0100 (CET)
Received: from localhost ([::1]:56084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7Bj-0005cK-SH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 06:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kx7AY-0004tI-TM
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:40:02 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kx7AW-0006yq-UP
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:40:02 -0500
Received: by mail-wm1-x335.google.com with SMTP id y23so2367174wmi.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=f1hDkLDYSffgyCej41WjzuQmeq9TxZ6OlvLEdOBU+Xg=;
 b=IpuiiGfqaIR4Hwwgm04iuBpj8o5apeOTw+2AxNXnPwX+nnW5o3CH+haPhfGH0FIfmR
 shB9dKIzCzgbPeRAzmXq5C2fuAbtmHXeKD9ezo0eIiuAPsex03Uzxhrnki1F1waKNkWv
 7XUXaKJ8Z7farJP5oHowRy4T1arhZY+kS9kImshL+NB3fy9OpbZnPUpC8ctfkmSCbBWx
 49Fjf0sKmaMFTLpNRriPBrY4iacttxJciVGmxGfAJilomlIYCnMHFGXaFy1gCdspz+DA
 SPUgf0Yqawr5znVRObTRcg7/zljHwR5Og97WMWYcUAQ1+JA5Os1cYhlA2h7UNI9dcLtQ
 Grdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=f1hDkLDYSffgyCej41WjzuQmeq9TxZ6OlvLEdOBU+Xg=;
 b=HNQc1AfvaPJM+dFQ7x8/E2zjarSN73C7MIyCWW+BrI6jMOJ4kPzt7TJyiwphX+/mm7
 Dd4CVk+PXAwQ4qaaJL4WrbimSA83M8l2UTXwk1ApohIf8bsD7OLVtn76R9Wkvf/mu2ul
 MF0Jdid6KenGrDwAOB7YYljItaqQ/o4vzBnzk4YmV9izG6p5G2SHfDFqm3iZB+uNfrW5
 ZyLdXxTGkighpHKmpT511B5C+7oip3WePCEnU9AzaRlPPEU7qIgynwYvApIUBRE8y/U0
 aZR/HBxyrtg+/+eJ7DxpusMe8zpeecAIQ3MWbamW5KioyEm/7DBOdphiMKnZtejxUNb4
 ZiNw==
X-Gm-Message-State: AOAM530LoVApUyb0lv34CyzPKRr2+WbzM5cChjuiiCKWqDvSkau9Pdkl
 i4JHD3cI3VoGcxCLUArmiPMo/w==
X-Google-Smtp-Source: ABdhPJyKTaX9jY7pjSLQCJoILOIslpC4vngMBFK/Enb8en0FIdxsXpesSNfYMjxLluSCqhwZtIhSlw==
X-Received: by 2002:a7b:c773:: with SMTP id x19mr3220155wmk.127.1609933199250; 
 Wed, 06 Jan 2021 03:39:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q73sm2756066wme.44.2021.01.06.03.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 03:39:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9CBA1FF7E;
 Wed,  6 Jan 2021 11:39:56 +0000 (GMT)
References: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
 <CAKmqyKO-7x9Ea9xKuAAm5Z0b8zLr0Xqhrwya43iqByhxjeDCGw@mail.gmail.com>
 <CAOkUe-AqC4UXOPZeX+uyXqucF12AaW_76oDqgn6EE-PomckYjA@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Subject: Re: [PATCH v2] gdb: riscv: Add target description
Date: Wed, 06 Jan 2021 11:35:08 +0000
In-reply-to: <CAOkUe-AqC4UXOPZeX+uyXqucF12AaW_76oDqgn6EE-PomckYjA@mail.gmail.com>
Message-ID: <87czyi2t0z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Sylvain Pelissier <sylvain.pelissier@gmail.com> writes:

> Hello,
>
> I may have made an error by copy pasting the comment into the file. I sent
> a new v3 with git send-email. I hope it is fine now.

Your v3 doesn't include the review tags you got for v2 which makes it
look un-reviewed. See:

  https://wiki.qemu.org/Contribute/SubmitAPatch#Proper_use_of_Reviewed-by:_=
tags_can_aid_review

You can either apply them manually by copy and paste when you reword the
commit message or use a tool to apply the old version and collect tags
from the mailing list archive.

> Regards
>
> Sylvain
>
> On Tue, 5 Jan 2021 at 22:03, Alistair Francis <alistair23@gmail.com> wrot=
e:
>
>> On Wed, Dec 30, 2020 at 12:26 AM Sylvain Pelissier
>> <sylvain.pelissier@gmail.com> wrote:
>> >
>> > Target description is not currently implemented in RISC-V architecture.
>> Thus GDB won't set it properly when attached. The patch implements the
>> target description response.
>> >
>> > Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
>>
>> Hello,
>>
>> This patch fails to apply. How did you send the email?
>>
>> Alistair
>>
>> > ---
>> >  target/riscv/cpu.c | 13 +++++++++++++
>> >  1 file changed, 13 insertions(+)
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index 254cd83f8b..ed4971978b 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] =3D {
>> >      DEFINE_PROP_END_OF_LIST(),
>> >  };
>> >
>> > +static gchar *riscv_gdb_arch_name(CPUState *cs)
>> > +{
>> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
>> > +    CPURISCVState *env =3D &cpu->env;
>> > +
>> > +    if (riscv_cpu_is_32bit(env)) {
>> > +        return g_strdup("riscv:rv32");
>> > +    } else {
>> > +        return g_strdup("riscv:rv64");
>> > +    }
>> > +}
>> > +
>> >  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>> >  {
>> >      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
>> > @@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c,
>> void *data)
>> >      /* For now, mark unmigratable: */
>> >      cc->vmsd =3D &vmstate_riscv_cpu;
>> >  #endif
>> > +    cc->gdb_arch_name =3D riscv_gdb_arch_name;
>> >  #ifdef CONFIG_TCG
>> >      cc->tcg_initialize =3D riscv_translate_init;
>> >      cc->tlb_fill =3D riscv_cpu_tlb_fill;
>> > --
>> > 2.25.1
>>


--=20
Alex Benn=C3=A9e

