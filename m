Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7162A4B8C76
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:31:24 +0100 (CET)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKMH4-0002ze-TH
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:31:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKMFH-0002Hz-3v
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:29:31 -0500
Received: from [2a00:1450:4864:20::42a] (port=38690
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKMFD-0007Iy-Af
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:29:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d27so4075754wrb.5
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 07:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6WOI/W39Nup1MCQnUEl9ekSkV0dYSwyX7ylSpJklMe4=;
 b=PUMy3SS/Z0iPUoK991z/966O7Y3d4/DbWX7d/si/GN7Nc7V78nqspKcuGSb2a+Bc6W
 zPXyP2YARcLPkdPrzWaiv5UaPNNp6ppBi2tXevwcIyj5aftwrpFbrq2yqdGsS+IWEEoD
 k0Pn3jr6Atx3a2b8+sBKk65e6JS2qbpzYyCsIaXIqyEC/X1pzia8CCDg+vjztnuVFtm3
 x5Fx5EUBqy0iUNZU0cTKEP5rUZaa7h7PYkjONzXDwCMeY+5EgvrVC/0TQgty5+J6DJbU
 g8eM5YtCytI9eKO3ULFweY4+emqygW3+pNBntskCmBHnNtludvd6xFozA0AhsfHxFWbE
 xMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6WOI/W39Nup1MCQnUEl9ekSkV0dYSwyX7ylSpJklMe4=;
 b=QKdX6UpQJVEHudWDNE/sNPOVud8CO8R8yifQtDOwVNfn9N9A3iBU2trjYAiTNmQx1Q
 ThIhJsbBqjsMJi+x5ti8XVgOGMOqU6h5SqF4ft0iJgpLTcTxCKvmGTZ6EWfbfjvOyqY9
 hKu4iOrCFbL14zE7jmoF0o64+vg7527Zhnjstjz4VlBlGE22L8tkcLgt7AuvSAUg86Df
 /VJXQsbZl/5mO3RNfOV/DPtrZ9x/EWnV0DkwvNM1ViuhIaC9Vm7oeawxLjQqm3fIEQZK
 6JTY7lQhpyX9G3wiri4j+J094aJmaXNZW3c6HfDJ8iwjQbtttUEqSVgoEHSHgra8KY3s
 g/fw==
X-Gm-Message-State: AOAM532uxfgP7QcXGGHqUQ+/2vWtpP2vfAg+Q4HqDdcFAMe3ohJ0Q6Tl
 ngq7PMKVTUsGovUyYoTeWHhXQMLc6GW9WGPGJjSRpQ==
X-Google-Smtp-Source: ABdhPJwenO9nYbR+2jC/d1nlAY4+y6TGK+v1cLu/3dDyO8kQFLKcMzc50yNFOcH8vsCmRuepl4C8QJy8hqroSSKDb3k=
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr2778286wrm.521.1645025356801; Wed, 16
 Feb 2022 07:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 15:29:06 +0000
Message-ID: <CAFEAcA8v8yuzuXZoiGre2fYsVnOTStKKqVByYT_LnxZD=sJfAA@mail.gmail.com>
Subject: Re: [PULL v2 00/35] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022 at 07:13, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit ad38520bdeb2b1e0b487db317f29119e94c1c88d:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2022-02-15 19:30:33 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220216
>
> for you to fetch changes up to 7035b8420fa52e8c94cf4317c0f88c1b73ced28d:
>
>   docs/system: riscv: Update description of CPU (2022-02-16 12:25:52 +1000)
>
> ----------------------------------------------------------------
> Fourth RISC-V PR for QEMU 7.0
>
>  * Remove old Ibex PLIC header file
>  * Allow writing 8 bytes with generic loader
>  * Fixes for RV128
>  * Refactor RISC-V CPU configs
>  * Initial support for XVentanaCondOps custom extension
>  * Fix for vill field in vtype
>  * Fix trap cause for RV32 HS-mode CSR access from RV64 HS-mode
>  * Support for svnapot, svinval and svpbmt extensions
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

