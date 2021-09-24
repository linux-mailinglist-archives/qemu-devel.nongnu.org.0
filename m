Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B031C417771
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:22:41 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTn28-0004Dd-QO
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTn0E-0002pN-NM
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:20:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTn0D-0004R1-1i
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:20:42 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t8so28637071wrq.4
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 08:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fpI7MPub3fkwJM/tu9WtSnXaQsFdyy6OygNW3kVrZnE=;
 b=RhRoDQBli6j4vfDOhxNloPoIIrMa/630YUcLP2g8l+/7kls83kZnFw5JVlJJGYCIxG
 AwGSnBtMaK0+tFHr62SvGZWQNjnjnPTZsiVoA33+b6THzagATtjs5xJDmZ0ZMn/tTF1a
 eLQglkr1JLxCsq4+oAbS5iwyNzWppsGy2YUmLyo09T+aGVH+qV/5l32JWOzRr3ZpO8ML
 vWfH9TZuXhCdTp6XO3usOcBWYRYHfrIBp1hHVoCNibwvgbyb5QQ4NbuaMD1DS8aEFOXb
 /FLqH7jwa/SxnLwiSdHoHb866sxpHdFMqI7oOtnyA3fSvaffxeEup6eVsx8m3opCUgi0
 GV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fpI7MPub3fkwJM/tu9WtSnXaQsFdyy6OygNW3kVrZnE=;
 b=SjzXiMlVTDVzdAknmnHzHP5vNYQ+oPymFEfsyFe5j9r27Ke4s9P7ddKLJ5j538JepN
 6TksS27In4jTvqiXgcSse/j/I7HvNlTvap4IjjJo47uxtd1YHH2cNk98BiTCic3RfH89
 HbBhqxz7r345P171B+g0uSqg6uujQC5Ze8QevkhWzONHo4o/TYfR6/TjCx+b1DlfjyD6
 yPE9/MMgTxZYOy66RP/woO3u8XSsCUe7qzkyTQpRsSPhSP+DnnMoHIKG3OypSqyWzD3C
 8APAUZ9L5p9LlBmaFRGrfmS8HMjrR05C54NI5Vgl6bMoYcUV74IDgjXUaxkgBUh53+Xw
 itQQ==
X-Gm-Message-State: AOAM531WiM6FNSBE0RO65TTZcxdHNoEqKFFV3K4i0JdQR45LDOCQpBn2
 r0mLZj9LNEbFRL8DbETHPRdZx2IN/jbZ2ar/ko9hGg==
X-Google-Smtp-Source: ABdhPJwq/3S/eWjzZS4CX235rChFiovtDzz3ZNqBMcpkp5G+/Cb6n1A1lFT52oL716Co2ib1gZA4F62WobKeB63QgH8=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr2709309wmo.21.1632496839315; 
 Fri, 24 Sep 2021 08:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210924135631.2067582-1-laurent@vivier.eu>
In-Reply-To: <20210924135631.2067582-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Sep 2021 16:19:46 +0100
Message-ID: <CAFEAcA_hbkYjbUwv-8fhyeA_vKwcWDxNZf9PCPp3bQrSgQ2ZiQ@mail.gmail.com>
Subject: Re: [PULL 0/7] Linux user for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

On Fri, 24 Sept 2021 at 14:59, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 2c3e83f92d93fbab071b8a96b8ab769b01902475:
>
>   Merge remote-tracking branch 'remotes/alistair23/tags/pull-riscv-to-apply-20210921' into staging (2021-09-21 10:57:48 -0700)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request
>
> for you to fetch changes up to fce9608d02b665fdc3ab7b23f1a911ba6c66775b:
>
>   linux-user/aarch64: Use force_sig_fault() (2021-09-23 14:43:58 +0200)
>
> ----------------------------------------------------------------
> Pull request linux-user 20210924
>
> Clean up siginfo_t handling for arm, aarch64
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

