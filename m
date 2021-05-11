Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D5E37A351
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:19:55 +0200 (CEST)
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOYU-0005yo-TU
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNmq-0004Ew-AS
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:30:40 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNmo-0002Ft-9F
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:30:39 -0400
Received: by mail-ej1-x62e.google.com with SMTP id f24so28518637ejc.6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UEN6Xb04cSlbf9jh0o/vp92RnVNxdDpfFbmDUkDjoSE=;
 b=YA2rKN7j5GGn44YxBf2g2ofxheSBYbvNdBQ0hQSjF5HOkmT3zDWulMUUCyjdyoK6eS
 oCdmr6/DQc/I20H5JWr1COuKYYy0UtDG9g+M/V9SlA27xU9erg+ztpPYeP+FTH+bFdek
 bW1qlC/hiTMqWKvOz/EqtN2ZH9lfLiKSl32Nffmu0whuVGjksT9T06NrOinAiLxoIRNC
 yn3ymfrodXzq714YXt0UDLJJ7FiWGZcU13dLs0b4cY49qQwTDjhRUBe0fiKwcuz/qyH2
 dOQoTOtghApUhT3nihwi5qU45ZQYkkvcnaqOcx1lzJp+2uw/KsBTFzAI3sFs86O1SKRp
 Dy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UEN6Xb04cSlbf9jh0o/vp92RnVNxdDpfFbmDUkDjoSE=;
 b=Xq83FAFKxjoadR6ANfLoBRrhKR39Rjo56X4adwTMLjqJcUX0Ur5+bo8v94fSpzMPp9
 Serqr1dzxeU9Axc7fICYPjgXMMOoNkG5BbS/OLQTnzlXOgTjDIar7zljsWkHAKgT6GbM
 jt7ZOEFcT6yqV8eY5aN4bmpSWhEs72Ci7JsFAVXBRbdm3Zf+Ha2xb991xqoJwTiKNkb4
 SP4vlAvmRhw4Wh5kZdNLLnQHMzHjAytkKTuTaLaEKQOweuDQG5iUjVQj54qHdl0PBHRb
 RCmGjfzG2x/A+wmbDZMaM1ysUgvPKqg6OwpCu8ePib7WLsvs6lCJD1JczxvbWVT2jJE8
 E5CA==
X-Gm-Message-State: AOAM530eL5VE12jg45rabFUmz7d267AtrZ4qlvYIGl3qauw6YR9L3BDS
 vwL/SGtdPQSDKUhEuXVP/HOb70gThSbpFroLDd5hJA==
X-Google-Smtp-Source: ABdhPJyGh1BEhI2w4/mJ4lsJel68rvBLloKtYkXfU8CrPmsl33X+m71ZZEMKaoAtlINJn3S4hTUo/N2Z9Me/YF8E3hA=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr30061619ejb.407.1620721836298; 
 Tue, 11 May 2021 01:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:29:23 +0100
Message-ID: <CAFEAcA--Ge5Fy1bHxkfVxe90S2qqK=XDid0UemEVFosb7-uojA@mail.gmail.com>
Subject: Re: [PULL v2 00/42] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 May 2021 at 00:23, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit d45a5270d075ea589f0b0ddcf963a5fea1f500ac:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.1-pull-request' into staging (2021-05-05 13:52:00 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210506
>
> for you to fetch changes up to d9e1a4683bc52ff218dcc133f73017bc4c496346:
>
>   target/riscv: Fix the RV64H decode comment (2021-05-06 08:59:59 +1000)
>
> ----------------------------------------------------------------
> A large collection of RISC-V fixes, improvements and features
>
>  - Clenaup some left over v1.9 code
>  - Documentation improvements
>  - Support for the shakti_c machine
>  - Internal cleanup of the CSR accesses
>  - Updates to the OpenTitan platform
>  - Support for the virtio-vga
>  - Fix for the saturate subtract in vector extensions
>  - Experimental support for the ePMP spec
>  - A range of other internal code cleanups and bug fixes
>

This triggers new runtime errors in the clang sanitizer build:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-
vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-riscv64
tests/qtest/qom-test --tap -k
PASS 1 qtest-riscv64/qom-test /riscv64/qom/virt
PASS 2 qtest-riscv64/qom-test /riscv64/qom/none
PASS 3 qtest-riscv64/qom-test /riscv64/qom/microchip-icicle-kit
PASS 4 qtest-riscv64/qom-test /riscv64/qom/spike
PASS 5 qtest-riscv64/qom-test /riscv64/qom/sifive_e
../../hw/core/loader.c:459:15: runtime error: null pointer passed as
argument 1, which is declared to never be null
/usr/include/fcntl.h:161:6: note: nonnull attribute specified here
Bad address
../../hw/core/loader.c:73:15: runtime error: null pointer passed as
argument 1, which is declared to never be null
/usr/include/fcntl.h:161:6: note: nonnull attribute specified here
PASS 6 qtest-riscv64/qom-test /riscv64/qom/shakti_c
PASS 7 qtest-riscv64/qom-test /riscv64/qom/sifive_u

(and same again in the test-hmp test)

Looks like something's passing a NULL filename to an image
loading function.

thanks
-- PMM

