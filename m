Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D512B2083
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:34:48 +0100 (CET)
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdc2B-0001Q1-9s
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdc1C-0000wp-3o
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:33:46 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdc1A-0005HF-0D
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:33:45 -0500
Received: by mail-ej1-x643.google.com with SMTP id cw8so14303981ejb.8
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 08:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/cT6s0FA3o4uf3KxFqIHCoXfn45nfOqThtlFfHzTzL0=;
 b=NuL4VWX5Jeq1/DI+tibxCflWCYyNuqQK0X+HT0rWByXhAw051RdVa/pl0mybOjzTYs
 Sz4Acn9/vx1z3Kyq+5LMQjsnD2eeMgkjNx25hz9R+ERP5n3QA4lA8FXRat9i7ZKvmj0o
 d5O5zCBW5B2OCjlN6/DDGMHyLIgmZA6KNXvPXfgr7aJqFmYk8mk7W0DaNKdoYbud2iVW
 AqakXJUM09C42JvPmXbalXd0x3VGqz/c8H8Ves8gMexMb3i+q/UyoX31QQYPOxemexsv
 KcQaBbMoSeAZekKyeEc873XZZRi5EUOOGL6Zcq0An5QF8YA778gRG/FrIF7mUT2X4iRf
 dhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/cT6s0FA3o4uf3KxFqIHCoXfn45nfOqThtlFfHzTzL0=;
 b=a4CoOBSScskEzJKjsq/1svx7ICHLtpH8Hl8J7btSv+jrS5YEVWgAiZiKzW8ZlfnWnX
 Iq1Of3fK8KmcggdnyHeoghg+YQnAd+5y2hrieolHwGvi/2uo+d1F9j0l9NVGGGUJwkYg
 14eS37Y9qcSfeGQtMdqa2kHLkgZW+pztvoVpHOOVfNjdhO9XE+SELyIPNbcoG27vOEx4
 GWNtWP/9T5LLEdBlKk+Uhx8MDMGTJOEXpRZ0RMpSWMqcmAninkK4Q/xmwZo2tlR8qU2x
 ZcZE7EhZYZyYVX9drruX/d30dh0EE/F94sFzy/01y/LsdiSSlX3nezEZ3VQ/Y0LvEW1I
 iWhg==
X-Gm-Message-State: AOAM531zLUaQPtOKJzwrewjlBl1TDmFKmzu0pvAWF3HjuiWigY9fo9y0
 KkHIvwM/HV4bsjbcSBKHCXbdstD321b5hZM579Kuib5/ccQ=
X-Google-Smtp-Source: ABdhPJxtxlIrNSIntTF62ZjLVUCseGBlb090sJNhTl+XLHt3cqJEhEKKjNAcTQQl4XYwwG2XJVWT34hl7KyjFbBRO/8=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr2886193ejr.56.1605285217095; 
 Fri, 13 Nov 2020 08:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20201113162248.4131-1-amphetamachine@gmail.com>
In-Reply-To: <20201113162248.4131-1-amphetamachine@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 16:33:25 +0000
Message-ID: <CAFEAcA-COoCiVhCdnixVkAR9M9uSpLUrnY39zufmBkmag2Hcfg@mail.gmail.com>
Subject: Re: [PATCH] configure: Force-remove temp dir
To: Dan Church <amphetamachine@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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

On Fri, 13 Nov 2020 at 16:26, Dan Church <amphetamachine@gmail.com> wrote:
>
> Sometimes the compiler will leave a write-protected .o file in the temp
> directory, and GNU rm will ask before deleting it unless -f is
> specified.
>
> Signed-off-by: Dan Church <amphetamachine@gmail.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 4cef321d9d..663b91a334 100755
> --- a/configure
> +++ b/configure
> @@ -7080,4 +7080,4 @@ done
>  echo ' "$@"' >>config.status
>  chmod +x config.status
>
> -rm -r "$TMPDIR1"
> +rm -rf "$TMPDIR1"

We rm -rf this directory at the top of configure, so it seems
like an oversight that we don't use '-f' here at the bottom too.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

You should probably look into why your compiler is generating
write-protected .o files, though -- that doesn't sound normal.

thanks
-- PMM

