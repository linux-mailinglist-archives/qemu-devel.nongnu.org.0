Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC507559E7E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:27:09 +0200 (CEST)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4m9E-0006gg-24
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4lvd-0001N7-Dj
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:13:06 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:39789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4lvb-0005Xe-PW
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:13:05 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3178acf2a92so29452107b3.6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iC0gjzLo/+NeCxUooWDkYLGFZYMI378klxjabIannsQ=;
 b=K8sEoSyBYqMDhct1wWQSdQ7WMnXZvT+3aFa9K5bLJJJzPfyK1oqKmuMAF0KxAD45t2
 O3uTzQY6YSrgmvwB1scDkKuLCydIySEOGHkxd9qqL30Wnp7c4tFftfi6ZlSzGt+rt2Bi
 RToOHE7mMRz232936in3xBirb7NNkRR44HLKKq/sYcbvYwdZisSQCsERJop5tHw/Sjxp
 ziS25MryBgzJLNJ7HyFd4DMCJGUUcdPmurmvKU61wCC7ukkgRGfki/VtzXn9UCHyrquf
 N9BJpNqBl4Ngd8jenkFlIJS1pw4vWQ7dlnJh74LYH9PTR5L9usuZXmMKqCYX/Q6ZKisP
 oM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iC0gjzLo/+NeCxUooWDkYLGFZYMI378klxjabIannsQ=;
 b=gFrB0KfzRPV9reCrI2LyFlBFxHwPJOOrX1ZVfr9PnC3mgYkW/acp9lLyorwZfVR87C
 PyK9kRUw96v6AdhrblOazaGmMtMlWErTvYGs+5621ELrF26/Qjif7/bnerpGsq6cAvEt
 CcUh8pSmfB8Uhr98sSJl+ePaE+SptLgWRgjJ5Ztfw0w9PdSlBJjsRo5HTRORzvgKE/Kv
 yj2ksx+v8wcf/rY4BBc9YvXf953fExgleHYB7nnIt2ZZhXYBzb6jUNt25d4iy67yMZlM
 9Fsn6JeUPiDlJOM0/ZDG7rZ8UJOLjfb53AdSPCIXS1iUk571x2tsEnb4vnhFwxAYlyFd
 Xr2A==
X-Gm-Message-State: AJIora89m375oMVbEiQZATErqIare7fjqOjqCM9u0DDJSuDbOapxrnep
 LCl+xo8RfyuxI4O4sRuIYCxbAhanVzaEVZgUaJzD/g==
X-Google-Smtp-Source: AGRyM1uW1xfzgnRrf8c/H6yT0nn/HC62aGIxuPAVkf5Cn0RTTHUzwThcy5suDJhylW/v8KYTIsR93ohlCnSQmFR2Z3w=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr17919466ywf.455.1656087182563; Fri, 24
 Jun 2022 09:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
 <20220616141950.23374-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20220616141950.23374-3-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 17:12:25 +0100
Message-ID: <CAFEAcA_tck3fG67qO=4QiTHY2ST3jvy7-w156XkMKMv38-aN9g@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] qtest/cxl: Add aarch64 virt test for CXL
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, 
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 16 Jun 2022 at 15:20, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Add a single complex case for aarch64 virt machine.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  tests/qtest/cxl-test.c  | 48 +++++++++++++++++++++++++++++++++--------
>  tests/qtest/meson.build |  1 +
>  2 files changed, 40 insertions(+), 9 deletions(-)
>
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index 2133e973f4..1015d0e7c2 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -17,6 +17,11 @@
>                        "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
>                        "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
>
> +#define QEMU_VIRT_2PXB_CMD "-machine virt,cxl=on "                      \
> +                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
> +                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 "  \
> +                      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> +

If CXL requires booting via UEFI, what does this test case do?
It doesn't seem to be passing in a BIOS image.

thanks
-- PMM

