Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D1A453D44
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 01:45:45 +0100 (CET)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn956-000789-2R
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 19:45:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn8z6-0004o2-H2
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:39:32 -0500
Received: from [2607:f8b0:4864:20::12b] (port=44647
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn8yv-0007aW-1i
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:39:30 -0500
Received: by mail-il1-x12b.google.com with SMTP id h2so948736ili.11
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 16:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r55/Q+j196ukiiGoiL0lGCHK5rW2sWon6zSQubuD98A=;
 b=i1KoH4/aNVWhhoFxy6R4Z7Ihicd4/pS8cd7iX3pNhCXmLN1c6o5LgWrUgbmT2TdW8x
 1NiFrPdwxqLZlROJGL5G1JhZJiLaZt+solIUxphl1alr7dwVPZWG5DYjHgq6yGZ4RE0P
 WasLiu+FK3Fran5I3AjcgyeYWfE/3nBgAY+3Ay4IXniZjsJFXd6wYlE/m+PU+xNLhsuX
 gA0cMm7Op7qAtiMK6OiAyRjsEUyIvwbYTGmydH0Plh5KhqyltLmWrTc5DVzZe6Wnf/IU
 R7tUOO6YGcZF/73QlRYtmtv5uyagZt2rJ70Fv6azpLZvOUiJK5Sw/D6+lg65cUv+BbM/
 Kjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r55/Q+j196ukiiGoiL0lGCHK5rW2sWon6zSQubuD98A=;
 b=78A9J0SBWf3x0fbEJtsDaMe7yPtcmxbyq8LJvldnQXLAPbCqTlvJXEroC+18oCbPqH
 +D09aXpSIxguiQaVy1uzGx8BgXKIVOzwvJllMNkSDd+QAlgDIsAsYpP7Nc/7fgvbZ0CF
 IRFWWKjtSwqKU+3gySOcqUL5FPrSAj+Ft9hCpA93cEQwQSK/e4urZ1EWB37Q4KOAwle+
 PHxWxaEgQj+WizDZjYHyIT2NFF7cHLqo1Q+1+kGwkHHNxqMZKbvl8yJysZfW9SIZZc5u
 kLaaP3JrYdHTCYeDShC4DulZSPQtsadTOOYBIYIHDD0oXMYw4uwcFMpGR5iWKNfj1An2
 PrMA==
X-Gm-Message-State: AOAM531io2ko0jK99vb1whG7g6+YIAc9494TeBHnd0Bmyixywwku2AKS
 LoYXQ3dDol8oY+Q8P4j5KLuoLXQe4oRePog1MUo=
X-Google-Smtp-Source: ABdhPJwOZH0l78BMh+E9Mn8lepb4yf8fl7hctwK4kurT0uBD44fjxFA5Z9gUMWqsK+ggRJztO7GTh2LQnEMXsBO6zOE=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr6928171ilv.74.1637109559980; 
 Tue, 16 Nov 2021 16:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20211116095042.335224-1-richard.henderson@linaro.org>
In-Reply-To: <20211116095042.335224-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Nov 2021 10:38:53 +1000
Message-ID: <CAKmqyKMwgE+oG0M8MBgSAWp53wPnQuNfH8mVdjENkVaCK2_Bcg@mail.gmail.com>
Subject: Re: [PATCH for-6.2] meson.build: Merge riscv32 and riscv64 cpu family
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 7:51 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In ba0e73336200, we merged riscv32 and riscv64 in configure.
> However, meson does not treat them the same.  We need to merge
> them here as well.
>
> Fixes: ba0e73336200
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> +
>  targetos = host_machine.system()
>
>  if cpu in ['x86', 'x86_64']
> --
> 2.25.1
>
>

