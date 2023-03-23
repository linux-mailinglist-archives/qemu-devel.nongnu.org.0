Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F486C66C1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 12:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfJFb-00013A-8b; Thu, 23 Mar 2023 07:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pfJFY-00012n-KC
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 07:36:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pfJFW-0005hH-1q
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 07:36:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n10-20020a05600c4f8a00b003ee93d2c914so596304wmq.2
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1679571411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ecGNG+73mRrWxMLCOH2Kb9ZFh8TRWD8c8oO8EeShaR0=;
 b=oABH3RdL3jBZD0XerI7w50YgmT3GH6DaEHqb9/QxYTCmxzFQhtkdd+uOig2S0Kotu8
 5R2bTX01tbNiOvJX2pQf+nf84PqcAVnMvVJ7Qu+HE8CNAWxPuyKRQqUkpvJVkR9rwQUf
 3pTsLGf/tk0X+AGm1fByr1T9xyosz2bUE1ILJ2y3AqswThWrwL3cwp9Cfckd3PHYgf0Z
 2uQLMCL0bNARo4F4Vpp3STeL09KUOOAyVpMczB+LmtQEn4AVz7MLhk6gnr1DUhKRMILF
 Jm/gGT/bpWnwfh5zRraCeNQ2QQ5+z7P8U5drjrU3sEewoNP1Y1xgb0i9aKtC5Qcb67vl
 uxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679571411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecGNG+73mRrWxMLCOH2Kb9ZFh8TRWD8c8oO8EeShaR0=;
 b=rZ6crI0I/Q5kvp4bUz/zTFIuK8dCogbrBe4ZK99j4uLD/E9o0FHBqoz3HJfFIBCrB0
 hOGdGD63x8jazuF9GC44O/9j7ZhddSDan/w5aeqceybjhgnI3VnnqNGBHceFEmpP8rSB
 2gbA+OTJDzuhC07iSjkTYD6IInf79aT4sROfsyrcLdCnpNE2f1Ap0M0vE0PNxsp3+fm/
 E7Pt8zUtfFuxIQC8jWe+zhGBHQVBC68wEUBtTl5PJcsFyZvplzhnmd5LZZfqXRL89amr
 M0rgjC+U+c+ZsuWCrTx0Gka9bGgxHuDdQGw2pV+Lhs3NnjUrfPy8ECcFgejW6UV7a+wL
 PxaA==
X-Gm-Message-State: AO0yUKWohC+Q6U+Nzhf3v1u+PmSbADcNIBNEIwfanCj3VFkhF1/eWyg/
 PrMHuqOnAsk61z5B3/2zwCQbyadKua+DUJXmBeU5Kg==
X-Google-Smtp-Source: AK7set9UthFeVTobRAjOxEUgZAyIOY+EHG/Tin4sk4CjAF9THs9tZu70/W60YzSLgJD/wYdFYIsCXCkvOPsR1fzEv0E=
X-Received: by 2002:a7b:c3c1:0:b0:3ea:8ed9:5f3e with SMTP id
 t1-20020a7bc3c1000000b003ea8ed95f3emr653847wmj.4.1679571410968; Thu, 23 Mar
 2023 04:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230310091215.931644-1-lawrence.hunter@codethink.co.uk>
 <CAEg0e7iXkPcqAhZH0xxbMyXVP6hnk5vvtUW52qT_2rFDK3PVcQ@mail.gmail.com>
 <4b21e3316c50763d0fbe273a59bc985c@codethink.co.uk>
In-Reply-To: <4b21e3316c50763d0fbe273a59bc985c@codethink.co.uk>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 23 Mar 2023 12:36:37 +0100
Message-ID: <CAEg0e7ju=cyTxHbuxnYK4M_HpxNqk3RxuAV62kGWiXBUR7MPaA@mail.gmail.com>
Subject: Re: [PATCH 00/45] Add RISC-V vector cryptographic instruction set
 support
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: qemu-devel@nongnu.org, dickon.hood@codethink.co.uk, 
 nazar.kazakov@codethink.co.uk, kiran.ostrolenk@codethink.co.uk, 
 frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, pbonzini@redhat.com, philipp.tomsich@vrull.eu, 
 kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 23, 2023 at 12:34=E2=80=AFPM Lawrence Hunter
<lawrence.hunter@codethink.co.uk> wrote:
>
> On 21/03/2023 12:02, Christoph M=C3=BCllner wrote:
> > On Fri, Mar 10, 2023 at 10:16=E2=80=AFAM Lawrence Hunter
> > <lawrence.hunter@codethink.co.uk> wrote:
> >>
> >> This patchset provides an implementation for Zvkb, Zvkned, Zvknh,
> >> Zvksh, Zvkg, and Zvksed of the draft RISC-V vector cryptography
> >> extensions as per the 20230303 version of the specification(1)
> >> (1fcbb30). Please note that the Zvkt data-independent execution
> >> latency extension has not been implemented, and we would recommend not
> >> using these patches in an environment where timing attacks are an
> >> issue.
> >>
> >> Work performed by Dickon, Lawrence, Nazar, Kiran, and William from
> >> Codethink sponsored by SiFive, as well as Max Chou and Frank Chang
> >> from SiFive.
> >>
> >> For convenience we have created a git repo with our patches on top of
> >> a recent master. https://github.com/CodethinkLabs/qemu-ct
> >
> > I did test and review this patchset.
> > Since most of my comments affect multiple patches I have summarized
> > them here in one email.
> > Observations that only affect a single patch will be sent in response
> > to the corresponding email.
> >
> > I have tested this series with the OpenSSL PR for Zvk that can be found
> > here:
> >    https://github.com/openssl/openssl/pull/20149
> > I ran with all Zvk* extensions enabled (using Zvkg for GCM) and with
> > Zvkb only (using Zvkb for GCM).
> > All tests succeed. Note, however, that the test coverage is limited
> > (e.g. no .vv instructions, vstart is always zero).
> >
> > When sending out a follow-up version (even if it just introduces a
> > minimal fix),
> > then consider using patchset versioning (e.g. git format-patch -v2
> > ...).
>
> Ok, will do
>
> > It might be a matter of taste, but I would prefer a series that groups
> > and orders the commits differently:
> >    a) independent changes to the existing code (refactoring only, but
> > no new features) - one commit per topic
> >    b) introduction of new functionality - one commit per extension
> > A series using such a commit granularity and order would be easier to
> > maintain and review (and not result in 45 patches).
> > Also, the refactoring changes could land before Zvk freezes if
> > maintainers decide to do so.
>
> Makes sense, will do
>
> > So far all translation files in target/riscv/insn_trans/* contain
> > multiple extensions if they are related.
> > I think we should follow this pattern and use a common trans_zvk.c.inc
> > file.
>
> Agree, will do
>
> > All patches to insn32.decode have comments of the form "RV64 Zvk*
> > vector crypto extension".
> > What is the point of the "RV64"? I would simply remove that.
>
> Ok, will remove it
>
> > All instructions set "env->vstart =3D 0;" at the end.
> > I don't think that this is correct (the specification does not require
> > this).
>
> That's from vector spec: "All vector instructions are defined to begin
> execution with the element number given in the vstart CSR, leaving
> earlier elements in the destination vector undisturbed, and to reset the
> vstart CSR to zero at the end of execution." - from "3.7. Vector Start
> Index CSR vstart"

Yes, you are right.
I just created a PR for the Zvk* spec to clarify this:
  https://github.com/riscv/riscv-crypto/pull/308

>
> > The tests of the reserved encodings are not consistent:
> > * Zvknh does a dynamic test (query tcg_gen_*())
> > * Zvkned does a dynamic test (tcg_gen_*())
> > * Zvkg does not test for (vl%EGS =3D=3D 0)
>
> Zvkg also does dynamic test, by calling macros GEN_V_UNMASKED_TRANS and
> GEN_VV_UNMASKED_TRANS
>
> > The vl CSR can only be updated by the vset{i}vl{i} instructions.
> > The same applies to the vstart CSR and the vtype CSR that holds vsew,
> > vlmul and other fields.
> > The current code tests the VSTART/SEW value using "s->vstart % 4 =3D=3D
> > 0"/"s->sew =3D=3D MO_32".
> > Why is it not possible to do the same with VL, i.e. "s->vl % 4 =3D=3D 0=
"
> > (after adding it to DisasContext)?
>
> vl can also be updated by another instruction - from vector spec "3.5.
> Vector Length Register vl" - "The XLEN-bit-wide read-only vl CSR can
> only be updated by the vset{i}vl{i} instructions, and the
> fault-only-first vector load instruction variants." So just because of
> that fault-only-first instruction we need dynamic checks.
>
> vstart is just another CSR -- software can write to it, but probably
> shouldn't.  Whether that's ever going to be useful outside testing ISA
> conformance tests or not I don't know, but it's clearly read-write (also
> section 3.7).
>
> > Also, I would introduce named constants or macros for the EGS values
> > to avoid magic constants in the code
> > (some extensions do that - e.g. ZVKSED_EGS).
>
> Makes sense, will do
>
> Best,
> Lawrence

