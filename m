Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DC72BB0F9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:56:17 +0100 (CET)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9ho-0007IQ-Hy
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9eR-0004yi-RI
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:52:47 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:45590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9eN-0003Zn-VY
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:52:46 -0500
Received: by mail-ej1-x641.google.com with SMTP id lv15so7940599ejb.12
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jltkLnxSDI/ptimzMYmJWl3aNPpbLtfHw6S3ftiOACc=;
 b=v2tEFTqTd+3lSQ2hJgQDyESn18Cg8hkgOf0dYnWP0+50pC1BOcDiZmmCsHwCZwfgl0
 Wxm7GkLmgL3fijvbrb1u33mPafpEo18jsGBDzvb23/Wz+4A90+gRlpBBmrB0Zfe4zZks
 B2gEoUfo/a/ufCb9OX1Kwv1pmEP35rdfRlTKMw8qsqcCNIS4yqeyLfYRLC2NYS+OTKm3
 r2uuM5hVvWRs53wOp4O/0uB1ncPv8WBkAD1FyH3CFuJjpDpDHAkiTBoYqJW3urehsxLv
 YJEgdwqWyBjNHffN5FcxjB7qMjE8CRMo5lH8vTUoQNjm0hip8cyXSLa/m5ZnRwbr0WI9
 TMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jltkLnxSDI/ptimzMYmJWl3aNPpbLtfHw6S3ftiOACc=;
 b=kPWol/mTnWYxm2RraWZPbBI1s/qG1B3x3Qb7ifDeTsmN+/RtcBMjtAyVQlJ55Q6GNA
 L3YAH4bMdOH6N5schyZ2yhSkeNHVj/KLk5NKSRhA8XXEvUk8NRhOACROqwTCA79JCKE0
 fDYH070qi5ioMvbdNZtXXmX6pNMP+0+TgADTOXN+kye27Y13Apaezl1ZBoGep7zcHtrZ
 vRjvSUZqKgdbPs7FoFEuQKYT+EZjmIUosOtdH2AzobJt9XKTeivO8XZKUqlb8Nx4P8rU
 gTPaQfYSIbRTWpv+/7GpSAqT/nCvT3UAKmhtrLNBeDjHPvDuf7zdH12abRAKpudFdfHF
 /INA==
X-Gm-Message-State: AOAM533JqCeXZH88Cfmow44OluvwdrF7prAKGa3aLXdc/rB0jfQnbeeh
 aCqGMFz4/MsfZs2YlqvX3jKT4CaKRJmc5H8loX+Yog==
X-Google-Smtp-Source: ABdhPJxm7WDO+mVSbaXzQfHQRjFPd59891jI4vfkAcSJiMv0QzMEaxpqfiQThEemy+q7KlzTguGOPpe4+ToARlSZLSE=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr35256186ejr.56.1605891157263; 
 Fri, 20 Nov 2020 08:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20201120152140.2493197-1-f4bug@amsat.org>
 <20201120152140.2493197-5-f4bug@amsat.org>
In-Reply-To: <20201120152140.2493197-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:52:26 +0000
Message-ID: <CAFEAcA-YV3d0u1UymuOw3+XbUz7aV8=U3T23pYFb0eaHxXz0aA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-5.2 4/4] docs/system/arm: Document the Sharp
 Zaurus SL-6000
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 at 15:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> List the 'tosa' machine with the XScale-based PDAs models.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/system/arm/xscale.rst | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/docs/system/arm/xscale.rst b/docs/system/arm/xscale.rst
> index 89ec93e904e..2dd2f8f9a56 100644
> --- a/docs/system/arm/xscale.rst
> +++ b/docs/system/arm/xscale.rst
> @@ -1,16 +1,19 @@
> -Sharp XScale-based PDA models (``akita``, ``borzoi``, ``spitz``, ``terri=
er``)
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Sharp XScale-based PDA models (``tosa``, ``spitz``, ``akita``, ``borzoi`=
`, ``terrier``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

These were in alphabetical order -- why the rearrangement ?

> +
> +The Sharp Zaurus SL-6000 (``tosa``), released in 2005, was a PDA based o=
n the
> +PXA255.
>
>  The XScale-based clamshell PDA models (\"Spitz\", \"Akita\", \"Borzoi\"
>  and \"Terrier\") emulation includes the following peripherals:

If you want to add tosa to this file (which seems reasonable) then
you need to rewrite this para that introduces the bulleted list
because it currently only describes spitz/akita/borzoi/terrier,
so that it is instead a suitable introductory paragraph that
covers all of the boards.

> --  Intel PXA270 System-on-chip (ARMv5TE core)
> +-  Intel PXA255/PXA270 System-on-chip (ARMv5TE core)
>
> --  NAND Flash memory
> +-  NAND Flash memory - not in \"Tosa\"
>
>  -  IBM/Hitachi DSCM microdrive in a PXA PCMCIA slot - not in \"Akita\"
>
> --  On-chip OHCI USB controller
> +-  On-chip OHCI USB controller - not in \"Tosa\"
>
>  -  On-chip LCD controller


thanks
-- PMM

