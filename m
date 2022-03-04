Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4494F4CDD11
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:00:10 +0100 (CET)
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQD9s-0002lB-Vq
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:00:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQCn9-0007fz-Fl
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:36:43 -0500
Received: from [2607:f8b0:4864:20::1131] (port=33962
 helo=mail-yw1-x1131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQCn6-00082I-Nj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:36:38 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2db2add4516so101459837b3.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 10:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gaDu5fZePzBVNfAVpXpEa0n5sdOjwhrJsI3Cis42Yvg=;
 b=LdDLfapbrcYaq5qj6BObrTT+vlGB1XzD3+C4+Ug+FpmVenAVB0mIdZyoTTCdn/rkPT
 L7OMPRJcKkZEF3eJqiMDopEERjEN9oaKSVwjAwIcgIEW+tY7Xt3+DSoi1YBjsTG0bpz2
 IGpPY0IXJlYVjiiLE7BcQFOMkniFx8aIP4A+CONXooguFaiI9CLvWUXkvGCHDfEEe0YL
 8R8XZCV1FAdaNXR1oH1KQJXOFqk3r9ZCgTsAqTb9G5Qxdn05oVmXfcKXltIKSCw/exRM
 PmjREfr0xVw2oW3s/S370zXmz6tKMApMlDtHx5ecklAo5suqA64NV6PuWW2zDwIoyGgy
 8ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gaDu5fZePzBVNfAVpXpEa0n5sdOjwhrJsI3Cis42Yvg=;
 b=zIGElqw5th/F079D9mqlMm9ELYwW4hOKOGYSRkOxNqQlX2fnGN9qxyO4DcI6o3OM1o
 kw4SP89vofzSjPNfj7+GU09ezzLXmWEPGOMN5FKBE+SSvtdOiLCC1MANNRRzFQx+XaLm
 CjSNlQ1BE7Ounv9s44Iz/aqeQ+Q9ReVpoFTf0s8O80L5jWIEQTaFs6mUxeesnh3zz9Gx
 CUYXczsnhKMCG64rvu/CKQrFZfUDMAYNwFhL/AKVUoqLqiXMna3EyJZBGH2VxyZqnMDz
 d9hYahouP4gpOY8hio5VV4Qg731+CxfbXKO1YqrqyMLerf5VliihHBAJ2K2KX+bugeC4
 9zLQ==
X-Gm-Message-State: AOAM533Avmz8gyiSx+sbUAMPPy66i/Hhq9aqMI4UdR1BzLEGxU4+FnsT
 8fD2nY6Q25Hny/yIbeLfciqlL//hnQC78xc0r43jmg==
X-Google-Smtp-Source: ABdhPJxF/DUy2Q3lENHzYNKpvtCdf0QODNE8Q1nvKLKevvFMaTxdK2Ybb4WrMotCAPSqZtnD7jw1HtUHqLxHnWBUVJ8=
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr4095695yws.347.1646418994639; Fri, 04
 Mar 2022 10:36:34 -0800 (PST)
MIME-Version: 1.0
References: <20220304174559.55645-1-eric.auger@redhat.com>
In-Reply-To: <20220304174559.55645-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 18:36:23 +0000
Message-ID: <CAFEAcA9_Kiu4mhaS6Sji4-aqcMAOQ3U3AYWm5mdSthBhFxK=ew@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GIC_TCG is unset
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Cc: qemu-devel@nongnu.org, drjones@redhat.com, qemu-arm@nongnu.org,
 f4bug@amsat.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 17:46, Eric Auger <eric.auger@redhat.com> wrote:
>
> In TCG mode, if gic-version=max we always select GICv3 even if
> CONFIG_ARM_GIC_TCG is unset. We shall rather select GICv2.
> This also brings the benefit of fixing qos tests errors for tests
> using gic-version=max with CONFIG_ARM_GIC_TCG unset.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
>
> ---
>
> v1 -> v2:
> - added Drew's R-b
> - dropped PATCH 2/2 for the time being (requires more discussions)
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 46bf7ceddf..f29779c951 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1852,7 +1852,11 @@ static void finalize_gic_version(VirtMachineState *vms)
>          vms->gic_version = VIRT_GIC_VERSION_2;
>          break;
>      case VIRT_GIC_VERSION_MAX:
> +#ifdef CONFIG_ARM_GIC_TCG
>          vms->gic_version = VIRT_GIC_VERSION_3;
> +#else
> +        vms->gic_version = VIRT_GIC_VERSION_2;
> +#endif
>          break;
>      case VIRT_GIC_VERSION_HOST:
>          error_report("gic-version=host requires KVM");

This doesn't look right, because the correct condition for
"should 'max' be 2 or 3" is "do we have a GICv2 or a GICv3
compiled in", which is nothing to do with "is the GIC a TCG
GIC or the KVM GIC". Indeed at this point in the code we
know we're dealing with TCG, so the right response to
"we don't have a TCG GIC" is "give up entirely".

I think fundamentally CONFIG_ARM_GIC_TCG is either misnamed
or selecting the wrong files to compile.

thanks
-- PMM

