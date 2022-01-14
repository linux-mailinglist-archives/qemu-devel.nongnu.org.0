Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422D48EAFD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:44:07 +0100 (CET)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ms9-0005kU-OW
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:44:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Mki-0002Gg-NQ
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:36:28 -0500
Received: from [2a00:1450:4864:20::430] (port=37657
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Mkg-0005JK-9i
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:36:23 -0500
Received: by mail-wr1-x430.google.com with SMTP id t20so8196159wrb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 05:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXeczrebqr1CReSQui3MDBvg8FbgokiQHliVx2/ZlF0=;
 b=uBWDIF/bQzJWEEXBfs798BCxi2Gebj5Ft2f41aJAhbXUUKy0KcsKUqLgeW6XdfLNpR
 97EajO0pZ3xR/VpZgDMSoBU+1jsK1duDKCRp2oiV807aponp947hr4mpkOrBZhJKV9VZ
 yqHmZem2GAnqQA0tbXQTVRU4onKMDdp7NsdDBCUNDL/YmJu4AVI6cCB3HtUmXG7BbSgx
 f4EF70Q6f+wc1T0yqXizK6h0D0P/l/X8/l/KPV++OnxSphGEMGcXOnkmN04daX5mqCvE
 8k8gcW63iuf/dzFbf6tMgwKblOP7caiMTX0KPEL6Q0ZqSEPlFYkqkprvHpEE77YgLG3g
 APyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXeczrebqr1CReSQui3MDBvg8FbgokiQHliVx2/ZlF0=;
 b=Mcykzq1qOLGhnExUckBJvUY56qHJkvV3NyRTLkfiYDpKS5zMbhHgYMVkFLvFtDUIte
 KayuBCTNQgQ1MO34B2BFMOaVsxJJ2857MHo/y/3ooMWm2kzgINJW2ISwCg3iq9d+85r8
 +ZPrkvae2rGZjVgrHJO74jgk4+Wdlv8kauoovcrL2PW1xNBJi2XIe3cMdZ1eUFx/nndJ
 3zvGVBS8RPjnbOk78NU+149I/PnUXZ/B1bjismA539/LMAYO2+UxWJDtzpYxJfQOdxpc
 Shcv2bCMl4wNHB7b0bwMHogNMoirqPiazyEqei896D31Sf81ZQOU9D+NEIA/lmlnFdMi
 p1yQ==
X-Gm-Message-State: AOAM532+Q6pwE43SNbTrvboy2czf55Dso3AikqcNerILtXqVzSvUt7+k
 D4XbEqcFALBZn/+2MUqlqOuIfJqvor78Yuqa18ujfw==
X-Google-Smtp-Source: ABdhPJw6rTYGf+7ZccnYmi6Xr9a8ex7AUQEUusJlep/LPxK/mIIw0pFZ8gTL6xN6/jdZOWkqvkBGA8dv9SZ5Hmmmmf8=
X-Received: by 2002:adf:e907:: with SMTP id f7mr8316697wrm.319.1642167379028; 
 Fri, 14 Jan 2022 05:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20220112213629.9126-1-shentey@gmail.com>
 <20220112213629.9126-4-shentey@gmail.com>
In-Reply-To: <20220112213629.9126-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 13:36:08 +0000
Message-ID: <CAFEAcA_HE6UCaeyM7+5n0O+hFKLGk=Sc6Mpr_VBD_RJR=WJg=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] isa/piix4: Resolve global variables
To: Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 22:02, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Now that piix4_set_irq's opaque parameter references own PIIX4State,
> piix4_dev becomes redundant and pci_irq_levels can be moved into PIIX4State.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/isa/piix4.c                | 22 +++++++++-------------
>  include/hw/southbridge/piix.h |  2 --
>  2 files changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index a31e9714cf..964e09cf7f 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -39,14 +39,14 @@
>  #include "sysemu/runstate.h"
>  #include "qom/object.h"
>
> -PCIDevice *piix4_dev;
> -
>  struct PIIX4State {
>      PCIDevice dev;
>      qemu_irq cpu_intr;
>      qemu_irq *isa;
>      qemu_irq i8259[ISA_NUM_IRQS];
>
> +    int pci_irq_levels[PIIX_NUM_PIRQS];
> +

I wondered how we were migrating this state, and the answer
seems to be that we aren't (and weren't before, when it was
a global variable, so this is a pre-existing bug).

Does the malta platform support migration save/load?
We should probably add this field to the vmstate struct
(which will be a migration compatibility break, which is OK
as the malta board isn't versioned.)

-- PMM

