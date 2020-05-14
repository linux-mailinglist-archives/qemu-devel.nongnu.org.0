Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E61D36D5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 18:43:48 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZGxW-0003Ct-QH
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 12:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZGwc-0002CC-7W
 for qemu-devel@nongnu.org; Thu, 14 May 2020 12:42:50 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZGwa-0003EJ-E3
 for qemu-devel@nongnu.org; Thu, 14 May 2020 12:42:49 -0400
Received: by mail-ot1-x341.google.com with SMTP id 63so2863353oto.8
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=MTEmiVaVWD3viLGSQT0u66G3rUQRuooPZn1vb5fhd0g=;
 b=FBVhlOLZEjR5lp64gVkikH1WXVLqy+KC8pIHjJdX5xRMn7rVdbAxyYmLyObxsSK5jI
 SsNaLfdvxB2iIPycIh5wcYdp0TAtacn/w5b4qukCi9Vdds53Zx3AhBA7H3dYmBGVd5bx
 cksUKDqY0PHKzUFSGaztMaCeyqtEJ2yP9aj/0skEEQtlP6ct6jmgJEWUmY+ZbK838B/s
 FqJWVAnFaR8XLICtMNRx1sDp3nIjSYDWuMc625gNEooZ6QGmfQpbUDB6IsPAXQSXAX4s
 JR9CXUFHFuyUqzjM8+QYrnZItP0BUiEjR+TzS15LiH+lam8xcCfkIxThrl3JbR+LVbFu
 AYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MTEmiVaVWD3viLGSQT0u66G3rUQRuooPZn1vb5fhd0g=;
 b=MYkTpxAtRi+1j7uWtiS/UrO3UhAq1OPBWKYrJDxMi2ZMZq0kf3B6nqmkERosEdElIR
 IEyhbMVCljsLigP9TJMISgkJp+tF8wml5qGalF0UUqUaB+Q0OJdxHV1LcSQqtcjzVFNN
 ksrMYeDrtJCXlY8hdI4tgcVMkUD+LXs8CzBWEup5yeG1MkQydh4o1N4qLR/K5NBiAPXt
 dwMsIlsg1Icgj7Ri6IR2MKTtxT4+aLaQeASpm1YrLYBiYygm9TjdjHfp2X7enCUNbytN
 nj65R/EZclvZK227bVP31uJc3Oe9LuLnBXf4Ov3cVIa/6JKG3EsCaxTK66s1ML8h99ix
 RSRg==
X-Gm-Message-State: AOAM532biOhSh49t53IHIyV7TEAzskWRFc+AE+CUmOCbYdY+kLzLouKb
 0DBBpJGhMLoZgvYHrD5B2ye2lMbnScsbYGumJszIzXU4
X-Google-Smtp-Source: ABdhPJxqJurGuKq0+MoSk+MOxIbkoKkIu/bmZkHGSp9B8CFbpOX8Kb+U06ufYdOr5wvKm1qg8bQVNNO7wRLYkAGX2uQ=
X-Received: by 2002:a9d:398b:: with SMTP id y11mr4295736otb.135.1589474566461; 
 Thu, 14 May 2020 09:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200514142138.20875-1-peter.maydell@linaro.org>
In-Reply-To: <20200514142138.20875-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 May 2020 17:42:35 +0100
Message-ID: <CAFEAcA-qywECdMMXLYB=D0erzFUzx2i0W0th2fNJiiC5efbrTA@mail.gmail.com>
Subject: Re: [PULL 00/45] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Thu, 14 May 2020 at 15:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Mostly this is patches from me and RTH cleaning up and doing
> more decodetree conversion for AArch32 Neon. The major new feature
> is Dongjiu Geng's patchset to report host memory errors to KVM guests;
> also a new aspeed board from Patrick Williams.
>
> thanks
> -- PMM
>
> The following changes since commit 035b448b84f3557206abc44d786c5d3db2638f7d:
>
>   Merge remote-tracking branch 'remotes/gkurz/tags/9p-next-2020-05-14' into staging (2020-05-14 10:58:30 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200514
>
> for you to fetch changes up to e95485f85657be21135c17a9226e297c21e73360:
>
>   target/arm: Convert NEON VFMA, VFMS 3-reg-same insns to decodetree (2020-05-14 15:03:09 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * target/arm: Use correct GDB XML for M-profile cores
>  * target/arm: Code cleanup to use gvec APIs better
>  * aspeed: Add support for the sonorapass-bmc board
>  * target/arm: Support reporting KVM host memory errors
>    to the guest via ACPI notifications
>  * target/arm: Finish conversion of Neon 3-reg-same insns to decodetree


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

