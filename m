Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F282452F86
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 11:54:28 +0100 (CET)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmw6d-0006Yu-48
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 05:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmw5f-0005tH-A7
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:53:27 -0500
Received: from [2a00:1450:4864:20::42f] (port=46700
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmw5d-0003rz-OK
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:53:26 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u1so36680488wru.13
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 02:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=seAAjlG2WfXpjwFFRXbegtxTmavRFzOYsj5w7wyUXjg=;
 b=yVVp4VGUE1gjPOIMt2nZv4XPiz+AGNtxWlMtF/e2poCmoe8lpNGFy7djqicFDS+Utr
 fDzPhC6tTQnIdYvtKK2Z+Eq0KD8ROrvBCXYKeAFyRzRWr9/CE5Klw3Ci/Q8U+xGlbijz
 VpnZPLuRAIMapvnW5gg7V/75W0N5wCfXcPSc1siHWUNprHVfoGdar2/pw+g2Lh5uQOXL
 yiyfM1NPS3gXs2VVDcOZLQBmbAkeq+7fWxrmCQfOfuRCd9Hfnhhuv6R4o3p/EiB5LbtO
 lepjbAu+H6ggH6pYYkICsFUxOJstUtvNqttw8I89kQ9a8WyU/iCP1H/CRYzDQSxDtXML
 wtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=seAAjlG2WfXpjwFFRXbegtxTmavRFzOYsj5w7wyUXjg=;
 b=cNhKpUUqAcu7/eoivb2WRcQvhd/rcMxaH4VO6RrxJJtDMtmeQt8ZmD6WD9Lz18r7bf
 nfVCeO7Z2iCvLy++xr40o0SSS70lvcWlfLpivWjKF9kx+Vr3rskxIL+pysU6ZQOcPvzs
 rm+73VM23zxV/IaClbqLrAYpWowM8M8Jgtf0qtZTRgcY9UJwxO8LyWDietkUuuEJNu4Y
 yL1Uc/zc0GA4UOfMh97gR0OoXB74Eig3j5kwpc4aiP02hOulzQRyRrwUa6PVV3rWDIDQ
 kCPzjAf/kacsWoIf0H3Hh4v2h9bAk/ZB1VpCv3DsYX5Tr2y9iS1giEPqC1TS/Djjt7qD
 vYWA==
X-Gm-Message-State: AOAM532f2As/4RlAT1/7+oW1aXCXyFuJB5Koz864jnMHbuD8zmo91yp8
 wBVpcE/Dt3rfLVE67blSSQEbidkDrvYg/3GTERdzTQ==
X-Google-Smtp-Source: ABdhPJyqb5L3IKgkevtVT7cZVF/jefmazPhFw/66lz/SqfTovUPpxtfocGQi1Eoxm5PUD9EkxZOleX9vjLa7ZSDBP4w=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr8282853wrt.275.1637060004121; 
 Tue, 16 Nov 2021 02:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20211116095042.335224-1-richard.henderson@linaro.org>
In-Reply-To: <20211116095042.335224-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Nov 2021 10:53:12 +0000
Message-ID: <CAFEAcA9-BfaXq=3pH2PM58TrmW=sOhA2EgG+V=eYTDpnY6AiXA@mail.gmail.com>
Subject: Re: [PATCH for-6.2] meson.build: Merge riscv32 and riscv64 cpu family
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, alistair.francis@wdc.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Nov 2021 at 09:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In ba0e73336200, we merged riscv32 and riscv64 in configure.
> However, meson does not treat them the same.  We need to merge
> them here as well.
>
> Fixes: ba0e73336200
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> At the moment, configure for riscv64 host fails during meson.
>
>
> r~
>
> ---
>  meson.build | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index 2ece4fe088..ccc6cefc25 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -59,6 +59,12 @@ supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
>    'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
>
>  cpu = host_machine.cpu_family()
> +
> +# Unify riscv* to a single family.
> +if cpu in ['riscv32', 'riscv64']
> +  cpu = 'riscv'
> +endif

Needing to do this seems kinda awkward :-(

-- PMM

