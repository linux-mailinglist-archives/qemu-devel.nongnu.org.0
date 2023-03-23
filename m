Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDBC6C6F77
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 18:39:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfOtt-0001Tm-KL; Thu, 23 Mar 2023 13:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfOtp-0001T2-4L
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:38:53 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfOtn-0005eU-G7
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:38:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id h8so90115399ede.8
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679593129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8lZgkD+XyrbFHFtpewsFKZ1wxbJtu/NYQEYIGOkTBZA=;
 b=ykHgvShyv5LEtEme7HcsUw6fLGYP9pdikk51fbnypOYzJ1uhSfeMF0nDmSEX/aBoi3
 QbhKcfMVT7j+irTOWN5lzfcv6ECbOtm0jWPiCUfkbaZybyqhlPQZEGgRE+ixZbd+gnc1
 QoTKEv8Lw1ozys4oM1G8DCun/NJ6mDlZpOFXdhDt+8KMH7lBRo0QWdkgSyo8KmFFoi1n
 pIWLFpE0BioeLMHBvOQFokTa/t+ffhTLTEptuTq0wWlAKUTSR8ofvHK6AWlVhrFSfZi8
 oUFjCy0KeMr1BEWWV55FgvO+nz9kNhBsTBH+ztB/DyTyQID1e8wuMxqntchaH34y5SSK
 y/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679593129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8lZgkD+XyrbFHFtpewsFKZ1wxbJtu/NYQEYIGOkTBZA=;
 b=OnaZCHlJgslxuwfqML38gLev1Aad1TNf8UP7mZCT3L40LBczl+EUm2vPw3LvdgDddW
 40FaLKuMCnVTpXxDrc1jEkaIvg0xxksobYPPBuVnjhkzmr/la4V5387aknahOQ+fteJ6
 Auf40/kdkOSUxX9uGp30Zql5JD95RfMND7z75utO+FHSeXrOdu81nCC/xvd3T2uYuLzC
 1AKyW24XPfUl74KCrveW0c/V/fHALAQAT3CtaKd0y2+oDd7DniHsbT2cBAKOGwa8Xln8
 jKweim8pTZMaCN7JDXGL+C0b6hbnEPpcVgH9uwSShvjbBxLGlYIMNMdwfRmtWWUgXOHG
 UgHw==
X-Gm-Message-State: AO0yUKW94i0ktHelh6em4tPqbGPU9QKc1aZWwGHRebwjzgB/xrdQotM8
 ITpSyNTf/xea/CuhDPvD8NWO8ZuCLYCEnXQGvkVD7w==
X-Google-Smtp-Source: AK7set96bNLiy+91WM1lU9i5zB01OsBerVgWQo/Sa8piYVB+WLaDXGhNVCWBSSBs5QlW91bC6/MQKHvVYV1MWkkWGdY=
X-Received: by 2002:a17:906:2e09:b0:878:4a24:1a5c with SMTP id
 qq9-20020a1709062e0900b008784a241a5cmr5536829ejc.6.1679593129619; Thu, 23 Mar
 2023 10:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230323161053.412356-1-danielhb413@gmail.com>
 <20230323161053.412356-2-danielhb413@gmail.com>
In-Reply-To: <20230323161053.412356-2-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Mar 2023 17:38:38 +0000
Message-ID: <CAFEAcA89KN5SEi5hFoKKpzVSo=xV3gCn7b2bMBhb5qoQ=U9_mg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Mar 2023 at 16:11, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>
> After the command 'dumpdtb' were introduced a couple of releases ago,
> running it with any ARM machine that uses arm_load_dtb() will crash
> QEMU.
>
> One alternative would be to mark machine->fdt = NULL when exiting
> arm_load_dtb() when freeing the fdt. Another is to not free the fdt and,
> instead, update machine->fdt with the new fdt generated. This will
> enable dumpdtb for all ARM machines that uses arm_load_dtb(), regardless
> of having 'dtb_filename' or not.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
> Reported-by: Markus Armbruster <armbru@redhat.com>i
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/arm/boot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 50e5141116..9418cc3373 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -689,7 +689,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>                                         rom_ptr_for_as(as, addr, size));
>
> -    g_free(fdt);
> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
> +    ms->fdt = fdt;

With this we're now setting ms->fdt twice for the virt board: we set
it in create_fdt() in hw/arm/virt.c, and then we set it again here.
Which is the right place to set it?

Is the QMP 'dumpdtb' command intended to dump the DTB only for
board types where the DTB is created at runtime by QEMU? Or
is it supposed to also work for DTBs that were originally
provided by the user using the '-dtb' command line? The docs
don't say. If we want the former, then we should be setting
ms->fdt in the board code; if the latter, then here is right.

thanks
-- PMM

