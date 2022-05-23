Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B65530996
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 08:40:39 +0200 (CEST)
Received: from localhost ([::1]:40134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt1k4-0003rf-7z
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 02:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nt1cx-0001vd-8C
 for qemu-devel@nongnu.org; Mon, 23 May 2022 02:33:18 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nt1cv-0004EL-5W
 for qemu-devel@nongnu.org; Mon, 23 May 2022 02:33:14 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gh17so13526353ejc.6
 for <qemu-devel@nongnu.org>; Sun, 22 May 2022 23:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uGqwRFkVHtYMVe8PZB5ERLKlhkVKMBbfz3Vyxg1AhIU=;
 b=3GkdLab/B2yvxCAa/w9/4suXvgys6UR/A6taxX8ho2mPx8VDu1vqCqtLZj2/kjY0d4
 1N/Fv4aNIRmTxtfsHu0ZqokFlzXxtCayF2XjhbqDm3eZC3vCxMRmri4vBnL/s4C4YCYM
 8EkYWYfoEy4Ze2s3mWGXl1Zf1DcS/M6gWvRQM1PZRmddJwtrHTXnZtSKulb+nGgpcwij
 LF0Vr0Fp+BUcxMBzswzLJbAUQEJkq+eEipATxUuVwXTVeFLvJyO9sJFYO3xse6gI4GAo
 iPK+IPVR5eY3TKKdRgaBYDp3rmX1qXBLMHIJ7CXfu6AQr9akyBCmJzAxsRuLf7578TGk
 Dxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uGqwRFkVHtYMVe8PZB5ERLKlhkVKMBbfz3Vyxg1AhIU=;
 b=VRYzM8tpY6KXjFc2Y++8wMqkGRTrR1hWZE5vI6fP7kNux/DC7+7bsoYuSpVF/tqpk+
 bdoA5WDK1Pyjk9e62M0D05eiteCE4ne9CcFhVTbNowKDnHfLGcUdxO/xY9Dg7xyvlfP2
 SNQVToCe/so4Eis/gXd5ykz7vTnCuKLOaAMGr5zl67tY2YTgLWDuTOIseoPHVRoZlMYs
 wUXM0pLuCw96iMD7tlyDKiQK4NL0BqiBrV9Ef1KjXI46Xb1jIuP6kYA67VKL43d31w8v
 0xCte9IWWFDg/r1eUt/EA6mvB5EPlpG0ncGSJlOVa3AZt+4PvGd6qJ8pKge+olooLBnW
 x+4w==
X-Gm-Message-State: AOAM531ZCRNownEPXvV09nErcBGlk/CLt7vtVVW2obtZ5kydB9WaC1yC
 mHrgcIilb4yDyFM7cgF0ter6UOwFyWNqbYRF71BTnA==
X-Google-Smtp-Source: ABdhPJzAEtBcRhiTd4evYPH//Yc15Xq96I4VDCyURNDw8dTbQ1Fme+Wd8REgKIPASkIlKwPyuOg91G6F3ntemfZuuCE=
X-Received: by 2002:a17:907:868e:b0:6fe:293:e7cc with SMTP id
 qa14-20020a170907868e00b006fe0293e7ccmr18017606ejc.716.1653287588754; Sun, 22
 May 2022 23:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
 <20220522155008.21832-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522155008.21832-2-mark.cave-ayland@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 23 May 2022 12:02:58 +0530
Message-ID: <CAARzgww-xZL9-x2QHdCDHs5hv7dQUqh56WmbFFMvXfWfs07dPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/acpi/viot: rename build_pci_range_node() to
 enumerate_pci_host_bridges()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62b;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, May 22, 2022 at 9:20 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is in preparation for separating out the VIOT ACPI table build from the
> PCI host bridge numeration.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/acpi/viot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> index c1af75206e..a41daded71 100644
> --- a/hw/acpi/viot.c
> +++ b/hw/acpi/viot.c
> @@ -17,7 +17,7 @@ struct viot_pci_ranges {
>  };
>
>  /* Build PCI range for a given PCI host bridge */
> -static int build_pci_range_node(Object *obj, void *opaque)
> +static int enumerate_pci_host_bridges(Object *obj, void *opaque)
>  {
>      struct viot_pci_ranges *pci_ranges = opaque;
>      GArray *blob = pci_ranges->blob;
> @@ -78,7 +78,7 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
>      };
>
>      /* Build the list of PCI ranges that this viommu manages */
> -    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
> +    object_child_foreach_recursive(OBJECT(ms), enumerate_pci_host_bridges,
>                                     &pci_ranges);
>
>      /* ACPI table header */
> --
> 2.20.1
>

