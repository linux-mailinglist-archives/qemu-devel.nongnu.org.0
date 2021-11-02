Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9468443081
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:35:20 +0100 (CET)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhush-0007TM-Ro
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhuJM-0005d5-Jd
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:58:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhuJJ-0000pV-Hl
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:58:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso1628763wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4aq7qESjTXcmAVoWfogH4O6aZvKAI01kAsAQr0Z+Pok=;
 b=fuWMdW+ndcSqBGFs7YF6Bgi95HG7MnhOMsGVCPZg5Xu08wUGVCoZ1TXz6zI4yXAGvq
 h/THmWegIDoECNtpzvuxveE4147KtUL21hZr8KSzcjvcAPCeZNM6cEjIQbpxXuHpp5D5
 tdJjj0rT6XW8PawRe2cIK7ID5f7WM3qZfTwHlFa0qpz850kiChi3leIaxaD5/n1xi57h
 0AZDK3YuzApdKVqsy9qA5O3psJ0w2DFv8OWaoECQTMRZ2Ey6u0lq17pGeiJbjUXBeR90
 mu5kfPQFHo1vsuCM/ZMoChirgQfE9OaMjo03NEg148VvRL2RISpZXq5dm8dhB+b/jUb/
 CwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4aq7qESjTXcmAVoWfogH4O6aZvKAI01kAsAQr0Z+Pok=;
 b=z6Lc8CYGZoS/aLCmwD1PiAaE1MzQrUQK4NnU/K+CBgxpGE5HCFnmgs7IogCla48gkL
 vWB8P8BiaB3BBhGXD3GSQP8mqv6e8Kfxpo6VAO+EoSv3O4BddSaUZhkciAhVFRXElF51
 Lc2Rtpk6/hNikH20Vqu1QaxPPlS7qM1LFDB5kRHPxkD+Z5r9wq4lNOMCPPFcTiDeH1WN
 52hI+DwtaXqy6GYueyRQRECT2xWmyVuv5fuRg0tCi/xqVxXMt7lcAaYN/pQSydIjthl1
 VO5uxPsVhj3Z5sOnnl/G1DHEwLewZaz8axhFuTRbsIFz7QbqgL10Ze80c4psiEmUXQVu
 bn5Q==
X-Gm-Message-State: AOAM531OdOucN3ScFflCONOMwCftTBZjm2TY54vIPqR/xAybXQq3ruhv
 vJf03ABwKC5qe4b3mnmfkXfWTX2D2fZI1bqFPqi06A==
X-Google-Smtp-Source: ABdhPJzU9MwZg3uBh6wQ/4wLfi2MLhwQfSMo/NNvSinjKqGCTfiMBi0pYJa4hH6FE/ntWlF/Te7tLQAtl+2JaFvpjJM=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr7423961wmc.126.1635861523963; 
 Tue, 02 Nov 2021 06:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211102135645.213417-1-pbonzini@redhat.com>
In-Reply-To: <20211102135645.213417-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 13:58:33 +0000
Message-ID: <CAFEAcA-bdhfWJY=E7oG1N7fjQocoZp4BZ8Lca4k+JzbVsHnE-A@mail.gmail.com>
Subject: Re: [PATCH] configure: fix --audio-drv-list help message
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Nov 2021 at 13:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> --audio-drv-list is now establishing which audio drivers to try if -audiodev
> is not used; drivers for -audiodev are configured with --enable/--disable
> options or possibly --without-default-features.  Adjust the help message
> for --audio-drv-list.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 4c444e1750..97fee368ee 100755
> --- a/configure
> +++ b/configure
> @@ -1390,7 +1390,7 @@ Advanced options (experts only):
>    --disable-strip          disable stripping binaries
>    --disable-werror         disable compilation abort on warning
>    --disable-stack-protector disable compiler-provided stack protection
> -  --audio-drv-list=LIST    set audio drivers list
> +  --audio-drv-list=LIST    set audio drivers to try if -audiodev is not used
>    --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
>    --block-drv-rw-whitelist=L
>                             set block driver read-write whitelist

Would --default-audio-drv-list=LIST be a better choice for
an option with these semantics ?

-- PMM

