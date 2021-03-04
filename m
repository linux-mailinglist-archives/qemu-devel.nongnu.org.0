Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F97932D1F2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:42:10 +0100 (CET)
Received: from localhost ([::1]:37054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHmMr-0002HM-7b
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHmLf-0001CZ-DW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:40:55 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHmLb-0006PT-Iw
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:40:55 -0500
Received: by mail-ed1-x52b.google.com with SMTP id h10so34298852edl.6
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 03:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pc5OZ/q6ft25WXrEaV90BsKQ6D6IusnYR/G4yIr/FJc=;
 b=tCZDG4v3bbQ5Hyf2dA6Cg2aBK3qcoMLP8e4Hsm4W8T4ry7NuHDZNjaW4c/sDLiD8Zv
 QaSFu9PXDV+v1sjIViRY6ejjvGAtvlu5pt/fRufD2nqNHHCK6cDgAXlVw0NWrJ6bQZkY
 tPzRnnZFWtmbmXXoACAUEIzcucj6e5imCJJfQDmsZp1KZoD8MxdTMy6E7MwpST93uebF
 KVFxVgzqG6GMu9ORRqk+qAm/M+EGYnGpXpFkpSiOUCdNrqUk4d6V4LhZ9eOcfDfUJJhC
 E/hitOrH7mRDR43wekTF5ldg2Uf1AjaS8mNcAczG12GiiWdVHXA0C8+My5kco+6BlQY3
 LJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pc5OZ/q6ft25WXrEaV90BsKQ6D6IusnYR/G4yIr/FJc=;
 b=JTnT5OeAPZ9eND6TT4D6AGTDiVTVENJc+9Wn8u8k1DyKHHFWl8XFEm34RDffQwgz4F
 7cg66xmg11f9QagMtJCWIjGOiZsM1wh+JRWLGUtPgznC6yJ/UeLi/dXGPw/XG6DSGSCa
 Cketwk6v0OW5B7sigDfYzBkMXYDG6QtfTHITwSM7uJ7xrTfaW1K0DOYJONaYnYFKFGvM
 Rp4LmxPwHUMhc2dsjZ6tgX4trmCw4ISq0REuM1FZG93BlWXIb1uhPv+otvDJ0TZGOviU
 nJGeDgGQriXbHFmBNgKOHqruQ12hyJqy2uyugNlO/NwB/l6kviVMSJgQah8ua8/FNnw7
 eIJQ==
X-Gm-Message-State: AOAM530RUAe8Q2nPUv4e+TA1ysMHbhpwP/LI8gRXz2G+tAqt8/z4YiLV
 rtlkrU54+AXEU0M0swdn5Y2Sh5NPDFEoNXmvCdDsug==
X-Google-Smtp-Source: ABdhPJwxqgOxQ0cCXDU0worHBd6j4/7XkQI97XLP6u/rsTZrF4fPB9Ve5idSLsYcgisE3K9w874G6iSOgMbVn1VrLk4=
X-Received: by 2002:a50:d307:: with SMTP id g7mr3824082edh.204.1614858050044; 
 Thu, 04 Mar 2021 03:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-9-f4bug@amsat.org>
In-Reply-To: <20210205144345.2068758-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Mar 2021 11:40:34 +0000
Message-ID: <CAFEAcA9TxOuA=PkD=0zUfHBEdDpYT=EUsgCUjuM5_=b-xK8sZQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] hw/arm/virt: Restrict 32-bit CPUs to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jones <drjones@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 14:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Support for ARMv7 has been dropped in commit 82bf7ae84ce
> ("target/arm: Remove KVM support for 32-bit Arm hosts").
> Restrict the 32-bit CPUs to --enable-tcg builds.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f5e4a6ec914..ab6300650f9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -197,8 +197,10 @@ static const int a15irqmap[] =3D {
>  };
>
>  static const char *valid_cpus[] =3D {
> +#ifdef CONFIG_TCG
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> +#endif /* CONFIG_TCG */
>  #ifdef TARGET_AARCH64
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),

How painful would it be to just have it check whether the
CPU type is present in the executable, rather than hard-coding an ifdef ?

I think that if you try to run the virt board with command line
arguments that (implicitly or explicitly) mean you've asked for
a CPU which isn't present in the QEMU executable, it should give
an error rather than silently selecting something else.

thanks
-- PMM

