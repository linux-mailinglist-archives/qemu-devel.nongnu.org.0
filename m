Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44BC346671
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:33:00 +0100 (CET)
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOktn-0004yf-OY
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOkDT-0000ZH-5u
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:49:15 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOkDQ-0000YI-GM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:49:14 -0400
Received: by mail-ed1-x533.google.com with SMTP id h13so24237386eds.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pwJASSa1vy/ihDbjNy1GdaHHWSi4DSn6yXfNgVMqErc=;
 b=wdMYfFLsIppqNIwgS/AsIGDs6B52UykbZjU5Yf0HSn5CJYI7iZHeLANq0IYMSIMeks
 Zv09MDqeVhcRNv7wUwKPYVSiFlYjDLd9B4xNARAnZOWOawNhyItjO5od4/LH0cM092rt
 uiL2fXHvAGJVhNEJ3Wvfn/w2+x78tYTMVx47o6LHS9ySAVQiZcxrPxoqvffzyUsnWCd7
 6wxZzLN3gdxyJ3KX7U0fNcJw82P4a0oW67RhgRhYss3hcYuys+HJVVe1tFc3wAmuzmqY
 Vj95D7268XGQQoaUPV5J5YklqLBzy47HpKVzVBWhw9o+xh/GM4m0ODoN5fc033V4WMee
 JTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pwJASSa1vy/ihDbjNy1GdaHHWSi4DSn6yXfNgVMqErc=;
 b=oz8YVUDJYszWTWeIpvZqypU92JvQ+fex2SIIxOe+06Xc814rQQPO+oGxPUyjEDGnbx
 6hNo8PYkHeKoJmfd7yh+Uhri80QeFx2O+K1183jJUTTcdVucoJ439MdBtjABspPaFo1U
 JIvg2dWNRJAgQOSrH1Y3hrhRk7zZkEl3TMzhi+hJef1c92cIrLgeL8sNEtEOR3BOfwWj
 gqUKu1w7JfwUFZZXCPkH3A3yHZullN4VYN43M+FaaG0L1sAx3guEDz947Xt39veokBOe
 VV9+jPUVYaIDzsX9STOyJiu8/QsB2iRErqGSN/ZG6q1hDf2hgU+vEp29ve3kdGGgzAxB
 aNLw==
X-Gm-Message-State: AOAM532GNjBn3JjTISGTtgDTWzhuk7ouecPIvK7S1QsXRJN/0/gI/XSs
 0HD5SNBmLpgxjgkg5Di1pUiwadWWUZ341UWAV6c+yA==
X-Google-Smtp-Source: ABdhPJx2fXRFm/ijLmtuTtoDxzUd5HOAhszY2uWk0I7FPY1HI68l+JLP9LgzRHEnwaGujXHY943b0ofGE3asGBU7rAM=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr5395451edu.100.1616518150845; 
 Tue, 23 Mar 2021 09:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 16:48:41 +0000
Message-ID: <CAFEAcA_y51rpHho9aTaFkvzBV0DVWST-vCn5Rmeyfzq+0tJvrg@mail.gmail.com>
Subject: Re: [PULL 00/16] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, 23 Mar 2021 at 01:59, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit c95bd5ff1660883d15ad6e0005e4c8571604f51a:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-fixes-20210322' into staging (2021-03-22 14:26:13 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210322-2
>
> for you to fetch changes up to 9a27f69bd668d9d71674407badc412ce1231c7d5:
>
>   target/riscv: Prevent lost illegal instruction exceptions (2021-03-22 21:54:40 -0400)
>
> ----------------------------------------------------------------
> RISC-V PR for 6.0
>
> This PR includes:
>  - Fix for vector CSR access
>  - Improvements to the Ibex UART device
>  - PMP improvements and bug fixes
>  - Hypervisor extension bug fixes
>  - ramfb support for the virt machine
>  - Fast read support for SST flash
>  - Improvements to the microchip_pfsoc machine


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

