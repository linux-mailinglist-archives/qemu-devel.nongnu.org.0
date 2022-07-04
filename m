Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2155658EE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:51:34 +0200 (CEST)
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NQD-000079-Fi
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NI5-00074T-0O
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:43:09 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NI3-00019n-1E
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:43:08 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id l11so17203792ybu.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 07:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8clzcU8QgOhHSh4+/QTsEdC4xKPp7FMJtRi4ncZwoCc=;
 b=dLHbheL5xYCaqXCDFn5743oymNW400KeHcdqmp3dp+YsM7kD5DJdGhemq+5jwYSHei
 JMdJEmNyK0SQkS5OUeNBtNLFwg8468OisOlXsJzsxTRiDtQUZTiKRIJJ3BkopxZj4UVO
 EixDr32dufAUg59msaNzBZAbS5Mi2DcMNd4kEtZMtGVDStXh7HFz+oERgT8XwRs3e16/
 ZmJEWIMvUDXkLnZjKtGsTcxreCDBuEs2mPbJglj7Yxna8hYZn/KZnWBvkMM8A/aH16r2
 VlifIgIxmKsy6BTdupVBCrmvybplG6sviaHB1pN2GdLq00rQaz96LmmEc+ux7jbgutEd
 lMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8clzcU8QgOhHSh4+/QTsEdC4xKPp7FMJtRi4ncZwoCc=;
 b=MfaXNm0qFksOl+ytIy9PYN76qyREuP5AXcvSI7AdEMJY2fNI2/DK0ojxSMnicrKdx1
 3QM6R3njYU5g8kp2dhSd1pVUizUXPwK6HZbSR0AcpT6jrC0r1xxhCTKqNhKbbxqleBRt
 b0Rn9ME2h2grIa+EvgpTEAi9weflcMbR6tT96HwIjRzpsKMqwwhUW0gZCDGhmh7kpq44
 q0aWxAYHaK/gdJAnupNmUFOqWwNFsj9fdP1iJXfWSzHWJ3egJyTqy9Jjj1oDBd1NLckr
 af6yvfzbxQ7OZ6qobO4Yz8GTSF5qvV2Pd8F0we2iXLwaaCA5xaVQYfXJ8OJ+DqFcjRr+
 ceqg==
X-Gm-Message-State: AJIora+UpxVVm7iv2vw2l645z4R24zFcEYtMby+mvL/HXsMJT1h1Aufj
 4dunnTjAfa5w3e49C+/oiRXTkziB81z3RZos+BTjtA==
X-Google-Smtp-Source: AGRyM1vr7orUC+89sxd7G8zIzOZuC4uX+Y0JZRTaqRkLx6OkiHrqjWMUSNA3GhLesNDLTtzL3un+uhR5cmwPt1qZBPg=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr6452503ybg.140.1656945785923; Mon, 04
 Jul 2022 07:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <Yr15VHaAVQ11wlw+@zx2c4.com>
 <20220630103739.1727346-1-Jason@zx2c4.com>
In-Reply-To: <20220630103739.1727346-1-Jason@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 15:42:55 +0100
Message-ID: <CAFEAcA-mb2Y1MCWEOw8fgue6DsQuLXwCoCnd8DjfE2561ayiZA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/virt: dt: add rng-seed property
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Jun 2022 at 11:39, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
> kaslr-seed property was added, but the equally as important rng-seed
> property was forgotten about, which has identical semantics for a
> similar purpose. This commit implements it in exactly the same way as
> kaslr-seed. It then changes the name of the disabling option to reflect
> that this has more to do with randomness vs determinism, rather than
> something particular about kaslr.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks for this respin; I think this is the right way to go.

> ---
>  docs/system/arm/virt.rst | 17 ++++++++++------
>  hw/arm/virt.c            | 44 ++++++++++++++++++++++++----------------
>  include/hw/arm/virt.h    |  2 +-
>  3 files changed, 39 insertions(+), 24 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 3d1058a80c..3b6ba69a9a 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -126,13 +126,18 @@ ras
>    Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
>    using ACPI and guest external abort exceptions. The default is off.
>
> +dtb-randomness
> +  Set ``on``/``off`` to pass random seeds via the guest DTB
> +  rng-seed and kaslr-seed nodes (in both "/chosen" and
> +  "/secure-chosen") to use for features like the random number
> +  generator and address space randomisation. The default is
> +  ``on``. You will want to disable it if your trusted boot chain
> +  will verify the DTB it is passed, since this option causes the
> +  DTB to be non-deterministic. It would be the responsibility of
> +  the firmware to come up with a seed and pass it on if it wants to.
> +
>  dtb-kaslr-seed
> -  Set ``on``/``off`` to pass a random seed via the guest dtb
> -  kaslr-seed node (in both "/chosen" and /secure-chosen) to use
> -  for features like address space randomisation. The default is
> -  ``on``. You will want to disable it if your trusted boot chain will
> -  verify the DTB it is passed. It would be the responsibility of the
> -  firmware to come up with a seed and pass it on if it wants to.
> +  A deprecated synonym for dtb-randomness.

We should also add a section to docs/about/deprecated.rst
noting that the old name is deprecated in favour of the new one.
I'll fold that in when I add the patch to target-arm.next, to
save you doing a respin:

--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -225,6 +225,14 @@ Use the more generic event
``DEVICE_UNPLUG_GUEST_ERROR`` instead.
 System emulator machines
 ------------------------

+Arm ``virt`` machine ``dtb-kaslr-seed`` property
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``dtb-kaslr-seed`` property on the ``virt`` board has been
+deprecated; use the new name ``dtb-randomness`` instead. The new name
+better reflects the way this property affects all random data within
+the device tree blob, not just the ``kaslr-seed`` node.
+

> +    object_class_property_add_bool(oc, "dtb-randomness",
> +                                   virt_get_dtb_randomness,
> +                                   virt_set_dtb_randomness);
> +    object_class_property_set_description(oc, "dtb-randomness",
> +                                          "Set off to disable passing random or "
> +                                          "non-deterministic dtb nodes to guest");
> +
>      object_class_property_add_bool(oc, "dtb-kaslr-seed",
> -                                   virt_get_dtb_kaslr_seed,
> -                                   virt_set_dtb_kaslr_seed);
> +                                   virt_get_dtb_randomness,
> +                                   virt_set_dtb_randomness);
>      object_class_property_set_description(oc, "dtb-kaslr-seed",
> -                                          "Set off to disable passing of kaslr-seed "
> -                                          "dtb node to guest");
> +                                          "Deprecated synonym of dtb-randomness");

I was going to suggest object_property_add_alias() but that
works at the object level, not the class level, so never mind.
This will work, and eventually we'll delete the code when it
hits the deprecation-to-removal horizon. So

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next.

thanks
-- PMM

