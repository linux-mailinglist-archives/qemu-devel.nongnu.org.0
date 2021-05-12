Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C3137D3A7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:50:00 +0200 (CEST)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtvj-0001f7-6E
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgtu4-0000Wl-9p
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:48:16 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgtu0-00036U-K9
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:48:16 -0400
Received: by mail-ed1-x536.google.com with SMTP id l7so28324151edb.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIXujJwGmXJ8WjYvjTs2Zvo7KOvVBis/EBjP4D21e3E=;
 b=eFcAqYmtjSu5NsEyH0NFqvgQM4JfMUJ7hpukPrrvW8a7bvFi7ltaZTPt9J+CxRsRbC
 48xumfZD3wg//52Gc1fKOu8dG6ElT8hWTGV19HyfXZnEgjOZrEGwY3oMzA6i6z1nBirx
 F34Y8na4CNgKjA9+Eq5G6Kzl508YBfVVpwp3EgEcJiNTqgKF6y9tirrlx9jK8ctBWLmc
 5JwjM+Y8yGNbbOErFh3zKLUAs+To9sVAxnMILzHrwzE3TGmJ8Lq0ni8s426Y1zfp0SYx
 VRtFIzL6NJNSJVSzAw8s6Kek9aLyMVpn1nN+7E5YG/DlksVwnyCqnBfBcx3x4Z/AVfam
 DFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIXujJwGmXJ8WjYvjTs2Zvo7KOvVBis/EBjP4D21e3E=;
 b=TzgUqhsLv0IoeCquzoIIfn3IEO/O4getn6LOc5sXrJYCKJQd8HjEBLHzw6/02IrRtq
 u5sZ+3EprpZwfrTnnZrWMffeqm2CBsXPBegP6CpEAl6AkcLNm8P/JdJCrqobLuL6xci0
 yiw0wmK56Al/TR+wBfeCc+9FwsOye7nNRK7gaUZNLwTQToZ8TDlSAqienhP+Wau6lz52
 QrDkEqO0NR2HK00Gvat0QuWtDoVbO9KCCNVAql4H8lW6zjfkjoWYhAmgJIiduQ7zraZP
 6TZ+C+YSzAaR49pNPMfGOxDux6jO2KLyruqsWCpCIRjQYGKmG8gxaN+Kyz14eBGaWj5Z
 u/FA==
X-Gm-Message-State: AOAM530aeB4mmdEtuwTBCxh569jRhA3saNuCPa8j4I0Vl9UQT5Zdpl1E
 smYB4G6B6P9FKx1yd+BW5/sxTNDBdLGqfA4WGGy9BQ==
X-Google-Smtp-Source: ABdhPJzYYhRWDP6jDR17fSfKn2N/6sK1d/68AypWlAR7ND3bO8UJbkQhNfT844FrghJDTwDlhidpyFJr0+e1IsryVWU=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr44654104edx.52.1620845290420; 
 Wed, 12 May 2021 11:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210511101951.165287-1-alistair.francis@wdc.com>
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 19:46:56 +0100
Message-ID: <CAFEAcA_aRMfGF3A2rravx9p0eb-5eFiWXycZXrNk4RBBrviLXw@mail.gmail.com>
Subject: Re: [PULL v3 00/42] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Tue, 11 May 2021 at 11:20, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit e4f3ede95ce813d5705c65e1c0e1c80c70739ebb:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210505-pull-request' into staging (2021-05-10 19:55:06 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210511
>
> for you to fetch changes up to c30a0757f094c107e491820e3d35224eb68859c7:
>
>   target/riscv: Fix the RV64H decode comment (2021-05-11 20:02:07 +1000)
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


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

