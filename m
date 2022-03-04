Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75F4CD280
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:37:39 +0100 (CET)
Received: from localhost ([::1]:60978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5Ja-0000aZ-Fp
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:37:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ5EM-0003BB-TX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:32:15 -0500
Received: from [2607:f8b0:4864:20::1136] (port=38362
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ5EK-0001cV-Dk
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:32:13 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2dbc48104beso86374607b3.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uUtM437+r4MlvW9kPj/TQ7LhfXT00Mtco9gaLL/La/s=;
 b=dvqFpLItHlnSqHytXxq1d5yfTTJ/I0B8BIpZ743RrZ9UqY+OgmBwmaPu5kQ1ny7Nos
 imG1/byd90C/TTkpkM1fTUoY+PmvbZgpiNBWGR488PYiNb/yVME0beVrKhTn4uRTv86M
 8BmePQDiwq1/xC+zvRFnb/giVAmU84R78l9a71uowVyNf0Wj0ON1p3WqZT12gx/NjJA4
 /ONQw5pp8j3g1bUevVABxOySdVWk4A5+RXMjxJcgcoLNvFkuRouSblxFFMX8lyQ1Fdlj
 oMinoucNA0zo3jWoRFTBsJnCENWGoOtqbzV60VIDt05UqJVixg6rSS6Pa7mdThg53B8y
 H3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uUtM437+r4MlvW9kPj/TQ7LhfXT00Mtco9gaLL/La/s=;
 b=OjeOv173t4uxNr4NpSD6HcmHWLHBIPsGo0GYGDMjxf22IyxjZ303UXfYs55A0bdhJt
 CpLyV6JqRjt6T3pU1u4TCtcXYobCL6XX21tR841oSTjXDR4ezXS6ZRRnkaLE7ax70zgE
 kFlhYJx7iL2dKTAkJOcCm+nNMJjUGMqLOp3tdNzLoalijJGRvM3/w8yTHIEIhvJ8bXjf
 lzGoMeSxojsSJ0Imt7Euht0CaTyCLNg2Oeir5ay7U55s8cAxGkwE3Xt7RqCH57Ko4qAQ
 W64aYfmynha7qyOMK1CyJUBvsfrzAjVdSIEJlIDDzJvwdBO/URqm4hEQp4F79ewuuL4Y
 e3HQ==
X-Gm-Message-State: AOAM5305qCg1gf8F1mUZYwgjhcmSkLE1HWIm2Wn3Jqpnx5xxiofbY6ON
 A+0Wi4at9hAI+u7utXsZc9yf097IHoSJcAgWTyJvWQ==
X-Google-Smtp-Source: ABdhPJyBBcEj3z/bjZAPfxy5SXgKiaXnut7K1IjlDhtjW8L8l93N/Q1Q2gtUyr8gRObsdIxsXHGHZnUya+IXFV+MnNQ=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr15639420ywl.455.1646389930264; Fri, 04
 Mar 2022 02:32:10 -0800 (PST)
MIME-Version: 1.0
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 10:31:59 +0000
Message-ID: <CAFEAcA86eV=qu5JwzweG3YCjfynX+JYDGnjyp=N5eD7zkB0ERg@mail.gmail.com>
Subject: Re: [PULL 00/13] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On Thu, 3 Mar 2022 at 05:31, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' into staging (2022-03-02 12:38:46 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220303
>
> for you to fetch changes up to 6b1accefd4876ea5475d55454c7d5b52c02cb73c:
>
>   target/riscv: expose zfinx, zdinx, zhinx{min} properties (2022-03-03 13:14:50 +1000)
>
> ----------------------------------------------------------------
> Fifth RISC-V PR for QEMU 7.0
>
>  * Fixup checks for ext_zb[abcs]
>  * Add AIA support for virt machine
>  * Increase maximum number of CPUs in virt machine
>  * Fixup OpenTitan SPI address
>  * Add support for zfinx, zdinx and zhinx{min} extensions
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

