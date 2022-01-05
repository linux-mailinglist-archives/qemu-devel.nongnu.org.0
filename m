Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952248594C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 20:38:06 +0100 (CET)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5C6n-0001re-5t
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 14:38:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5C4h-00010j-Qe
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:35:58 -0500
Received: from [2a00:1450:4864:20::42a] (port=46695
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5C4g-0005CC-2B
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:35:55 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i22so270019wrb.13
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 11:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ws9khMrCsjFloVcjhe+e/uKYPpVi/VqkDNcVx7b/W2I=;
 b=Ia1DBEb7GH7CS5kJWs7AN/xF58p2S4pQzF7Mj2IZdyzSFbcNEiEl+4lFmoXWsx5HJl
 OT/UMPyqZV6dL67kovvhMPi0e/D8d8dFyQvswwEGzqIi81kmSNPux3z/W4RQK3amHJAE
 0vVNZzQ7rvH/1MMdGLrSQysNoKEF+/aEk0OCLUS6zpsD/aUhDIdavLPVXse8AfKrMHSk
 WTlCrmk6Rq0Jf3Jf93zjzuAeU3n0EZrLlcs/DiPhujQFIvaNA7S+mArkh3m6bNYK9zI2
 9EvgnlKVyOilzvlMOVrlWbq2n0AB42GBTyCSkqXLmlbPy1fw6aWtw9KqY/p8Ur5gpNic
 G+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ws9khMrCsjFloVcjhe+e/uKYPpVi/VqkDNcVx7b/W2I=;
 b=lvNtEHJPbBaHzPTC7RijmdhXSBWtW4P9Roln/saaaObY6SQ6aBLqoNIGrvM0MrbGze
 BFNGcKKZ3Msxrre7iYzLg5mItsx7v5C1I2Wmc8/vzsBMq/KUH8O/Xf8STVh9ERYbP3ii
 gXzCFiQPAlWku0/Weljst4vLsKxlqj/durScaZMWfRW+0GPPE3052y+tb61DNavN/1Og
 h8oYgHqcal9kVCOpjwA7laKPgKLAbt/k46+ca9PEAxwq4J33aycSv0QMjCUfEw2ws3wS
 Q8AFn5pPVaAFp4WdSuNYZWxtK+yxnSAaJrfEbhxT+DNlw20SQfRIyzp1wFe4W3NvYxZ+
 Qzpg==
X-Gm-Message-State: AOAM5319BBplSNQ5VWldSSz+BiMenXpBijTsFuTuBmJn2TQDgcDiTeii
 nuYx6jTf6BvmtB5lW1ELjR9UpQ==
X-Google-Smtp-Source: ABdhPJynAr8eCA35r40t0PKvz7wKotObmaCsWhS3xYFFOQtO7M6TA486y02VZ/YUVigfU0QU4tq4+w==
X-Received: by 2002:a05:6000:148:: with SMTP id
 r8mr48089558wrx.333.1641411346783; 
 Wed, 05 Jan 2022 11:35:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bk17sm11548589wrb.105.2022.01.05.11.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 11:35:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53ECE1FFB7;
 Wed,  5 Jan 2022 19:35:45 +0000 (GMT)
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
 <874k6ij9z4.fsf@linaro.org> <58ecc207ca704277a5cf1b259b77f6b0@siemens.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Schwarz, Konrad" <konrad.schwarz@siemens.com>
Subject: Re: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
Date: Wed, 05 Jan 2022 19:34:24 +0000
In-reply-to: <58ecc207ca704277a5cf1b259b77f6b0@siemens.com>
Message-ID: <87v8yyht66.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Schwarz, Konrad" <konrad.schwarz@siemens.com> writes:

>> -----Original Message-----
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>> Konrad Schwarz <konrad.schwarz@siemens.com> writes:
>>=20
>
>> >  static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>> >  {
>> >      RISCVCPU *cpu =3D RISCV_CPU(cs);
>> > @@ -163,21 +167,33 @@ static int riscv_gen_dynamic_csr_xml(CPUState *c=
s, int base_reg)
>> >      riscv_csr_predicate_fn predicate;
>> >      int bitsize =3D 16 << env->misa_mxl_max;
>> >      int i;
>> > +    riscv_csr_operations *csr_op;
>> > +    struct riscv_gdb_csr_tg const *csr_tg;
>> >
>> >      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>> >      g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.=
dtd\">");
>> >      g_string_append_printf(s, "<feature>      name=3D\"org.gnu.gdb.ri=
scv.csr\">");
>>=20
>> With these changes does it still match the org.gnu.gdb.riscv.csr
>> register description in gdb? Previously for custom XML I've used the
>> org.qemu.ARCH.REGS form to distinguish between something GDB expects and
>> something we invented (changed since 797920b952ea).
>
> I don't expect it to match -- but why should it?
> The whole point of target descriptions is for GDBserver to inform
> GDB of the precise set and layout of pre-defined register classes.
> The class `org.gnu.gdb.riscv.csr' is known to a RISC-V capable
> GDB as the class of all CSRs; a specific RISC-V core might
> have vendor-specific CSRs, but they would still be included
> in `org.gnu.gdb.riscv.csr'.

Certainly for ARM's SVE there is special handling code in gdb to deal
with the control of the vector length. As long as GDB doesn't make any
such assumptions for RISC-V then go right ahead.

>
> Section G.5 in the GDB manual makes this clear:
> "You can add additional registers to any of the standard features --
> GDB will display them just as they were added to an
> unrecognized feature."


--=20
Alex Benn=C3=A9e

