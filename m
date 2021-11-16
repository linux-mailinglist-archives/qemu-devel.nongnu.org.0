Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E49453C81
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 00:02:38 +0100 (CET)
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn7TJ-0003eP-De
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 18:02:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn7S8-0002xX-TZ
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 18:01:24 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=40675
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn7S7-0004mo-HS
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 18:01:24 -0500
Received: by mail-io1-xd2e.google.com with SMTP id p23so644360iod.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 15:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r55/Q+j196ukiiGoiL0lGCHK5rW2sWon6zSQubuD98A=;
 b=Sni/WktbyVPe/ENxTqQULiHA4PK75kltppecldBgZvgHhORgr9TdwSM2HP+onUodiy
 fQ1YcF5QKBqmqUb8nsx4j1MZgn4NXurQEvvGZil/wyuVAvN9DzQah72P7GceAMeW25Aw
 qmKZswX6/sioYxltNfwvDDGNyviikZjE3B1yNC2e3Zdw2wd7H2zEKhCWfILK1YqtUTEJ
 psHe0ysu8tiw3clPU/tTiguTEHTlickQDw8+ic1yStepd/Gm887W5Fq+XISYfw+TWcJf
 M1plAx5EnyNqUpdD2z+iJ6Nt1cWW2V7qmshMBHg9PFUQ3cUqnq2MGbJEKujM/6SJglIX
 z2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r55/Q+j196ukiiGoiL0lGCHK5rW2sWon6zSQubuD98A=;
 b=t0zHdxkMEO3V8UcEfK/AM5K/0qwuxxwtyZMgFUaWKa6N6CyD0UQ545gkzHHW7k5Pal
 OKWWSRo1uCY+B/WuXn9uEaqTJ6a5+melx7/dJCwnRP3jjgq67GsEubbkykklTdWq9d1j
 bvyGMW/oFi0vd8xt0MPY8qvLvWeYgCS5QoBdaZzrXlA6xAaHAkpgXsVNCzebMdmjxxHX
 i8NkuwUQ6dqq8ZNPXoGXo2/zZa0q89nGxIOQX5ZLPGGYZFCwnNGXsvNDRJOiqHL8JmRR
 pDEhqpKlDbZqWD8oULAdkMkUmjtEdd4U4QdjKGb1N1xnLTCVHF9XRVSeCpMVJyzYe+VD
 /72Q==
X-Gm-Message-State: AOAM530Mh0zHH9A7FtLPSyNg/9ebvTAlQbmTkm9FVoz7lSXAwoKtZyl8
 Z3I2/+f3KRJa+zXkZbAyVmZUJvYrKaOunCYocdA=
X-Google-Smtp-Source: ABdhPJyNybi+fYx+AobZLgQZAriQkIZRly/PtHpin3cXUzPaKkg5cbr3DgexPGruNt+5ZH6yAFay0X8J6smmQHr8S2Y=
X-Received: by 2002:a05:6602:1487:: with SMTP id
 a7mr7464322iow.57.1637103681839; 
 Tue, 16 Nov 2021 15:01:21 -0800 (PST)
MIME-Version: 1.0
References: <20211116095042.335224-1-richard.henderson@linaro.org>
In-Reply-To: <20211116095042.335224-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Nov 2021 09:00:55 +1000
Message-ID: <CAKmqyKMyExbk8GBN122aJe4YkKXKe0AHNc+bc3Uor0WBRLdnFg@mail.gmail.com>
Subject: Re: [PATCH for-6.2] meson.build: Merge riscv32 and riscv64 cpu family
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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

