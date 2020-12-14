Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBE12D9697
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:49:08 +0100 (CET)
Received: from localhost ([::1]:50412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolPf-0006ds-Ue
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kolNy-0004mf-Mw
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:47:22 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:46625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kolNv-0004OB-Hi
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:47:22 -0500
Received: by mail-ej1-x641.google.com with SMTP id j22so3907348eja.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WRKjMTQKF0GvI/z1ZBBiHLejOaTf/HjUd5EWH78lpMc=;
 b=jRUBHXm3VTI/5RBmj3IqBjfqCGIv8Js6fZNgewxXKSE8W4NhgLkTFtHRc5r+JUBbUf
 7ctDiq1y817NoVxULfZZHTyytNDTmypA7nUpJB4VxcWdUruGoI5MHzDWZHnjo/cytIzv
 4pg/ddpl/YhPCzIUfZmObJGoYuNP9dJn3e7M/me+Puyy+m4ChmQ1CuCwMagTf1+df/f4
 JWg2pzhFymtpZysFmH7QWDIz90XVzNTFbidFB/Icx7tLxOWdO5k9xh3B2esA4iy1GHf8
 g9e/5vnHR7ihR/93D1xuKIT7ZQ9LQOdY6ppXSR3+Ljxvl4i3rOHc8GlpA89jFMa+Sto0
 9pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WRKjMTQKF0GvI/z1ZBBiHLejOaTf/HjUd5EWH78lpMc=;
 b=LT2fULnU4qmMKkNinXy9mLqqVLwXfpq8GzJaKS7j+FY1XQlNVZ4nLD+TJb2f6ZLNvO
 yQqnlIUbIQ89jecRnY43XdEBcnMshgQ9IrRDFFOjo/Q7g2cqVHcgsZkcrFcm8/bB79pe
 VCnyFC8kaTUhNJpmTQZWhedPOS+wd/Va07XwYe+zHjMojUgYdlidS79P7dXjvzKtXVcJ
 tVFW+rUcK4dmcv8th3MnV/xAMyHh4tCh/28TH+RGMni8yuNZQz1tEB9yELwPrsXlmOT0
 EkC9Ga/lXGR1Twi95LkDzqBcGeaGT+ZqzHnCRfL6+wj+fzMRnI4UzfjrihCMTX335IzO
 Xixg==
X-Gm-Message-State: AOAM533hd0+3xNQwAOaKDARghGCvB46c4Wz6kvseZo/HCxJsuUCeD3XW
 nPCX/wriXifHO/V7+BZG13r+n/QIM9sYRqF+8l35kg==
X-Google-Smtp-Source: ABdhPJwL9OfdCDNA1ujaEalwUyOC26hpMEMEQniKjQSmh+eL7Av0NryPhZV2HT3bdXktdvUQ3fDQXPFnfh/VUe6yWH0=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr9926362eje.4.1607942838031; 
 Mon, 14 Dec 2020 02:47:18 -0800 (PST)
MIME-Version: 1.0
References: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
 <1603891979-11961-2-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1603891979-11961-2-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 10:47:06 +0000
Message-ID: <CAFEAcA9P8VD1qg_8taP5SbmmpgKYwDOmAZQNoK6uGr56Pz_Dww@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/misc/pvpanic: Build the pvpanic device for any
 machine
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Peng Hao <peng.hao2@zte.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Oct 2020 at 14:20, Mihai Carabas <mihai.carabas@oracle.com> wrot=
e:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> The 'pvpanic' ISA device can be use by any machine with an ISA bus.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
>  hw/misc/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 793d45b..cb250dd 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -11,6 +11,7 @@ softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('t=
mp105.c'))
>  softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
>  softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
>  softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c')=
)
> +softmmu_ss.add(when: 'CONFIG_PVPANIC', if_true: files('pvpanic.c'))
>
>  # ARM devices
>  softmmu_ss.add(when: 'CONFIG_PL310', if_true: files('arm_l2x0.c'))
> @@ -90,7 +91,6 @@ softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true: =
files('iotkit-sysinfo.c')
>  softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid=
.c'))
>  softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c')=
)
>
> -softmmu_ss.add(when: 'CONFIG_PVPANIC', if_true: files('pvpanic.c'))
>  softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c',=
 'aspeed_sdmc.c', 'aspeed_xdma.c'))
>  softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))

This patch doesn't seem to actually change anything -- it's just
moving a line of code around in the file ?

thanks
-- PMM

