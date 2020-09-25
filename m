Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66E5278639
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 13:46:18 +0200 (CEST)
Received: from localhost ([::1]:46690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLmB7-0000gp-5c
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 07:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLm9a-00007j-Ds
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 07:44:42 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:40410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLm9Y-0001Qu-6G
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 07:44:42 -0400
Received: by mail-ed1-x544.google.com with SMTP id t16so2162432edw.7
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 04:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q+gjWeCIJpF37/CeGdA1gU9DodqrC5mFCz9B23GXwFw=;
 b=MAFDhKFZhKdeGk8K8QXWiE4t1NVic2tAH6zUyhXheljtBosHPMPxNFs6b9jcFgb8qN
 LdiS09UmMc+3/0qhpLokz4olNbjISB5BDRdaTUDA7alPi4FRELwhbuqdP8VnGPJofU1q
 jAaJVvChkqp3IC6rQ1FTCFZFYGt5wc1ufJFXUvR9VPSLqI4t13A0mZp0gQovokExlSDH
 eoY8MUlUpUB4R2AAbkTZPIt7DGcoQHtsPikpwfZMNtjEujfbhycYvfmv2ZFN7ZQfYRFN
 fJ/poCGNA0fKY9V1GVJtut0nyqRIcmNo5Rr4hNFsfjccrR8yIi6hHovjfxa3Ru8dxzXH
 rt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q+gjWeCIJpF37/CeGdA1gU9DodqrC5mFCz9B23GXwFw=;
 b=LGKl52ACp2int1rnbzzs/efJi4sSuYzBGv+G8Q67nXJ+p28er2ovYhiixCokZEsr5O
 YvmBqQO5eNxbotoux9PsWtwdQq4b4tEJhLvRwVIQMYaxLQawe6l6hs0HhJmg9bDgCLYx
 t+vVC33Q+O0tbaa9bzPS+QcGCnRl5HdAU4ImWcHP4Q6/+5saN+KsrtIpIlZMsr8lozLt
 V9ltZbC9/hC3Oke1mIm272YJdoOJiOc/3MRI+5F5gXjon+rf+/ovg3jm/mrMeHAjCON8
 NwHr6Eng+SSWkfe1/+pfnaCE5tO60JEkvTcNlY5HuCRRh0NY/ZCmwKNkyFBgosbQU/x/
 td+Q==
X-Gm-Message-State: AOAM531G3k66wtCjT/FIiFrRc9jUCgopPieoMJdlAUzvLtAj26PjCX/4
 /Te8bKC4tzVA0SIsqsfHbqFU0n62uoKgh8WuG6vKzA==
X-Google-Smtp-Source: ABdhPJw1bL7qNVxieRRq3zSgebIeHOkEmjyGqUeE2H5LgEBe8N9ByUUWk0jtnNuYbtFzSyZW77X6uJZjLmN/STnF4Tk=
X-Received: by 2002:aa7:d58e:: with SMTP id r14mr918546edq.52.1601034276415;
 Fri, 25 Sep 2020 04:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200925102257.1848666-1-pbonzini@redhat.com>
 <CAFEAcA-okvLfrjtvVVUWJWunzOSC8kgAEUuMM1JXciebfSJ0pg@mail.gmail.com>
In-Reply-To: <CAFEAcA-okvLfrjtvVVUWJWunzOSC8kgAEUuMM1JXciebfSJ0pg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Sep 2020 12:44:25 +0100
Message-ID: <CAFEAcA_6j7n5CvahUkxuQmWLfpq6L5ya+XTCMqnxaTqoB05QpA@mail.gmail.com>
Subject: Re: [PULL v2 00/92] Misc patches for 2020-09-24
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Sep 2020 at 11:45, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Fri, 25 Sep 2020 at 11:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>  Date: Fri Sep 25 11:41:22 2020 +0100
>     Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <f4bug@amsat.org>
> ERROR: pull request includes tag with UTF-8 error in person name
>
> (that's "configure: Do not intent to build WHPX on 32-bit host")
>
> (I will run the merge through the other tests to see if there's
> any other issues with it.)

It also failed on the clang build: all the usermode binaries
failed like this:

/usr/bin/ld: capstone/libcapstone.a(cs.o): relocation R_X86_64_32S
against `.bss' can not be used when making a PIE object; recompile
with -fPIC
/usr/bin/ld: capstone/libcapstone.a(utils.o): relocation R_X86_64_32S
against symbol `cs_mem_malloc' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(ARMModule.o): relocation
R_X86_64_32S against symbol `arch_init' can not be used when making a
PIE object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(AArch64Module.o): relocation
R_X86_64_32S against symbol `arch_init' can not be used when making a
PIE object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(PPCModule.o): relocation
R_X86_64_32S against symbol `arch_init' can not be used when making a
PIE object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(X86Module.o): relocation
R_X86_64_32S against symbol `arch_init' can not be used when making a
PIE object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(ARMDisassembler.o): relocation
R_X86_64_32S against `.rodata' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(ARMInstPrinter.o): relocation
R_X86_64_32S against `.rodata' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(ARMMapping.o): relocation
R_X86_64_32S against `.rodata' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(AArch64Disassembler.o): relocation
R_X86_64_32S against `.rodata' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(AArch64InstPrinter.o): relocation
R_X86_64_32S against symbol `cs_mem_free' can not be used when making
a PIE object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(AArch64Mapping.o): relocation
R_X86_64_32S against `.rodata' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(PPCDisassembler.o): relocation
R_X86_64_32S against `.rodata' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(PPCInstPrinter.o): relocation
R_X86_64_32S against symbol `cs_mem_free' can not be used when making
a PIE object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(PPCMapping.o): relocation
R_X86_64_32S against `.rodata' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(X86Disassembler.o): relocation
R_X86_64_32S against `.rodata' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(X86IntelInstPrinter.o): relocation
R_X86_64_32S against symbol `cs_mem_free' can not be used when making
a PIE object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(X86ATTInstPrinter.o): relocation
R_X86_64_32S against symbol `cs_mem_free' can not be used when making
a PIE object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(X86Mapping.o): relocation
R_X86_64_32S against `.rodata' can not be used when making a PIE
object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(AArch64BaseInfo.o): relocation
R_X86_64_32S against symbol `cs_mem_free' can not be used when making
a PIE object; recompile with -fPIC
/usr/bin/ld: capstone/libcapstone.a(X86DisassemblerDecoder.o):
relocation R_X86_64_32S against `.rodata' can not be used when making
a PIE object; recompile with -fPIC
/usr/bin/ld: final link failed: Nonrepresentable section on output

thanks
-- PMM

