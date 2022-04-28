Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B44F512F65
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:21:51 +0200 (CEST)
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0LN-0000Rz-FQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0J7-0007xJ-LG
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:19:29 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:43681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0J5-0003mA-Mt
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:19:29 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ec42eae76bso45734917b3.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vlJ5tZ82jdFNtNZPTiRXn0qlMgQFZyJANdIL6uPwMR8=;
 b=vCr7HPWwbX2BpAX9VP9zSH4LhJJ87vD63WvVO+CRo8WyLrmORW+2HTSXNz5wTKFddB
 EDMlg/0ZXqARyNIwk7v0t9nU9bfm97jpmem+HjzyVIfoJjAQGQWw2yvQob+FwRD9Icpo
 hQI3HVXHNC6veeyFh/gbVTkHgUQmkASV5tyivJCQUCTZuL60ihaZ2mTpbg0v/men077v
 Q0wdy8ywl7wyvaDkyTUkhQ0tEesed2axR1C8ZpS7IJGq4qipeOnG4MqPfbtEBhcNcCDJ
 5ba98kVKjuTYhnqNuspA0kwW2/rKJqFwCN2UjCL9SVGVOUmMpxZvH2HwdWp8ewGARIKg
 YfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vlJ5tZ82jdFNtNZPTiRXn0qlMgQFZyJANdIL6uPwMR8=;
 b=08dk1DN04tHuFGv21ml/HcUIqwamLT8Tt4mUCZUsyLznPFWnnmwNon3A1s9pg13T/p
 u3fkJtsPhws2qrW0+2EqFrxP29hVb1mrlgLeYwmRteZdcPB4wFySV3PB9FRUgNUPH4gU
 MUyhisLAwmZ2Kca6x8juLKCu/bxZkok/nmAPMkpdab7WA5ThWfnijPyG4g0kDesBzCMS
 2KuBJE5ZQ+X4k4pK7D4c/rGKCJxUjuhfWRQeVoj/TNhWcuMgGODeNZlXGaTdyRFCSevr
 K2Sg0fq+SpEGlPdigXMUdrg8a1QOdLwelwdspfo12M3LLhy/Qe6mLxTvwa9vtwpZHiWn
 nNbA==
X-Gm-Message-State: AOAM530DBl/+BhEC2DPQiI70iuf11lbsL7GcthOxS2IKyQYvOJZx2zy2
 ShGNV+KFcHgfGpBgszSneV3a6VhdE8u0jASiRWm2afBWDBW37g==
X-Google-Smtp-Source: ABdhPJwtTv4J92SxpvEuOfTtMap/l5BCeyD09efoH9l1t6ohMMM1wHmT80VS3StfydtQvs6ZhekwWHBB9+oo0RO63xM=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr22847608ywb.469.1651137566560; Thu, 28
 Apr 2022 02:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
 <Ymm6K3DjesAZR0OY@antec>
In-Reply-To: <Ymm6K3DjesAZR0OY@antec>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:19:15 +0100
Message-ID: <CAFEAcA-vPRHLPUi1ELET8eNMdZHk3Ftp35QmjZ2NX8B_ytiVfg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/7] target/openrisc: add shutdown logic
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 at 23:27, Stafford Horne <shorne@gmail.com> wrote:
> Yes, this is what was brought up before.  At that time semihosting was mentioned
> and I tried to understand what it was but didn't really understand it as a general
> concept.  Is this something arm specific?

QEMU uses "semihosting" for the general concept of a syscall-like
ABI provided by the model that allows guest code written to use it
to access some facilities as if it were a program running on the host
rather than running on bare metal. (I think the term derives originally
from the Arm term for this kind of functionality, but the concept is
not Arm-specific.)

Arm defines an ABI which looks basically like a set of syscalls:
code sets up some registers and executes a specific SVC or HLT
or other magic instruction, and the implementation is supposed to
then act on that. You can do things like "open file", "read file",
"exit", etc.
 https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst
The idea is that simulators and also debug stubs or debuggers can
implement this, and then bare-metal code can be written to use it,
mainly for debugging and test case purposes.

The risc-v folks decided they needed similar functionality, and
that the easiest way to do this was to align with the Arm specification
and document the risc-v specific bits:
https://github.com/riscv/riscv-semihosting-spec

Some other architectures have an equivalent thing but which isn't
the same set of functions as the Arm version; eg the nios2 version
is documented here:
https://sourceware.org/git/gitweb.cgi?p=newlib-cygwin.git;a=blob;f=libgloss/nios2/nios2-semi.txt;hb=HEAD

> Since the qemu or1k-sim defines our "simulator", I suspect I could add a
> definition of our simulator ABI to the OpenRISC architecture specification.  The
> simulation uses of l.nop N as ABI hooks is a de-facto standard for OpenRISC.
> From the way you describe this now I take it if we document this as a
> architecture simulation ABI the patch would be accepted.

If it's something that (a) is documented officially somewhere and
(b) everybody is using consistently (ie guest code such as GNU newlib,
QEMU, other simulators, etc), then yes, that's OK. It sounds like
you just need to write down the details of your de-facto standard
to turn it into a de-jure one :-)

We would want to guard it behind the existing semihosting command
line option, rather than having it enabled all the time, but that
part should be straightforward.

-- PMM

