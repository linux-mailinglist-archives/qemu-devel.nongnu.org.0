Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8E40BD0A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 03:16:50 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQJXd-0000YV-9U
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 21:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1mQJUZ-0007e3-69
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 21:13:39 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:45850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1mQJUV-0002GK-9J
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 21:13:38 -0400
Received: by mail-lj1-x236.google.com with SMTP id l18so2020519lji.12
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 18:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AmjPUf40LXI/e0KC8m91cNkWL29erRjYQ4f10DEWEfs=;
 b=Kt3yf8PRJzB34CVmepICkMX0iXWgXJeIPs/wkPllSsM3feCV6LB+vEl8wta93PM7CB
 C/SuLZEOL/dsuEF51+jyUHu3FqrJNEAiNMK8e7OYNEY+c838RvEHZO8775D8EhnrPnRH
 50SNxaOEUPJMVhG2iVZxPkloRu6H3GWWxUaS9WlxawQcQvk42PJZmz8ihaYPuB29JAVH
 9hblrCtesbPSpKACjgL48hV/+EkHYaKoIbtSB8XoVXdUJ5edpMvbXoi44RWsVMsF9RoF
 hb/NLuQRoFF9hsT6huZohFWT/WAQZa1fPmikzkmKGQ5eRQU2Q4jPJNM/eg8G4YvGO57p
 c+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AmjPUf40LXI/e0KC8m91cNkWL29erRjYQ4f10DEWEfs=;
 b=tDQOuke1s1GkBOCg63UU0nnXV67/MrjIbTyDEOCOVWwIhtZrajPN7qd4Cd42S4+7gU
 0/w55L//qHlGBCjgZ9faQEtN+Nev3lRyloxiegeRDRyBIJTkH4UweAsJPB/x8l7jbrvM
 Ajpg6XgUdchcLFTClcE3FUctEipb44+/guF+wNbGjKgrmpvI6znqLaovcsuGICU8+MbF
 vkzODOffuPEqSqBs+2HTZO+f2v9BAXMiSP0gs4xCbPTuenERCNQ9B4X4A5swGa12RxJI
 CB4oT918cP5Pd0HVOK02C1yDr1pFptzaLBXlRzFaUdeQODta2TGhWe48xAByikQC4638
 rncQ==
X-Gm-Message-State: AOAM533OriOMms5LE1nGcOLSDbyaC0/e20CTFWHjuwAugwSufGSm2Kqw
 bTb4PukaKcu8YRSbHc2lWnLk7kdyCq8arB7X8kXRTQ==
X-Google-Smtp-Source: ABdhPJwluQQS7xA2ipNIULQe8ishvDWwb0gAb/EEtFPPcGRAACh9UPH8ecVORFd1UioFtGsXjqZBYAAnnOX1BePKiZk=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr17877617ljb.62.1631668411944; 
 Tue, 14 Sep 2021 18:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210419202257.161730-1-richard.henderson@linaro.org>
 <20210419202257.161730-18-richard.henderson@linaro.org>
 <YS19IBEGrIUnUT2p@Ryzen-9-3900X.localdomain>
 <0699da7b-354f-aecc-a62f-e25693209af4@linaro.org>
In-Reply-To: <0699da7b-354f-aecc-a62f-e25693209af4@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 18:13:20 -0700
Message-ID: <CAKwvOdmCnwVGUEu+vuNNhB_BNumjYGS4YmgF9-d+tAeAgY+hvA@mail.gmail.com>
Subject: Re: [PATCH v5 17/31] target/arm: Enforce alignment for LDM/STM
To: Richard Henderson <richard.henderson@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=ndesaulniers@google.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 7, 2021 at 6:44 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/31/21 2:51 AM, Nathan Chancellor wrote:
> > I just bisected a boot hang with an LLVM-built multi_v7_defconfig +
> > CONFIG_THUMB2_KERNEL=y kernel down to this commit. I do not see the same
> > hang when the kernel is compiled with GCC 11.2.0 and binutils 2.37 nor
> > do I see a hang with multi_v7_defconfig by itself. Is there something
> > that LLVM is doing wrong when compiling/assembling/linking the kernel or
> > is there something wrong/too aggressive with this commit? I can
> > reproduce this with current QEMU HEAD (ad22d05833).
> >
> > My QEMU invocation is:
> >
> > $ qemu-system-arm \
> >      -append "console=ttyAMA0 earlycon" \
> >      -display none \
> >      -initrd rootfs.cpio \
> >      -kernel zImage \
> >      -M virt \
> >      -m 512m \
> >      -nodefaults \
> >      -no-reboot \
> >      -serial mon:stdio
> >
> > and the rootfs.cpio and zImage files can be found here:
> >
> > https://github.com/nathanchance/bug-files/tree/15c1fd6e44622a3c27823d2c5c3083dfc7246146/qemu-2e1f39e29bf9a6b28eaee9fc0949aab50dbad94a
>
> Hmm.  I see
>
> IN:
> 0xc13038e2:  e890 008c  ldm.w    r0, {r2, r3, r7}
>
> R00=c13077ca R01=c11a8058 R02=c11a8058 R03=c031737f
> R04=48379000 R05=00000024 R06=c031748d R07=c03174bb
> R08=412fc0f1 R09=c0ce9308 R10=50c5387d R11=00000000
> R12=00000009 R13=c1501f88 R14=c0301739 R15=c13038e2
> PSR=200001f3 --C- T svc32
> Taking exception 4 [Data Abort]
> ...from EL1 to EL1
> ...with ESR 0x25/0x9600003f
> ...with DFSR 0x1 DFAR 0xc13077ca
>
> So, yes, it's a ldm from an address % 4 = 2, so it is correct that we should trap.  You
> should see the same trap on real hw.

Makes sense. I guess if we can find which label that's in, we can look
closer into the code generated by the compiler.
scripts/extract-vmlinux doesn't seem to be able to extract a vmlinux
from either zImage artifact though; not sure yet we'll be able to
disassemble those.

Oh, I guess GDB can show us. Looks like 0xc13038e2 is...hard to tell,
there's no debug info so we just have jumps to addresses in hex, not
symbols.  I don't know my way around GDB well enough to get a sense
for where we are in the source code.
https://gist.github.com/nickdesaulniers/764ac9afab04775846ffa6c90c5a266a

If I rebuild QEMU from source, I don't get any disassembly that looks
similar, probably as a result of different compiler versions, and
maybe adding debug info.

--
Thanks,
~Nick Desaulniers

