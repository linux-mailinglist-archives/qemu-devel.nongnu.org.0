Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C492CFE381
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 18:00:20 +0100 (CET)
Received: from localhost ([::1]:41974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVexG-00065f-4V
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 12:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iVeik-0005fZ-HT
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:45:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iVeij-0005Z4-EJ
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:45:18 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40002)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iVeij-0005UO-4o; Fri, 15 Nov 2019 11:45:17 -0500
Received: by mail-lj1-x242.google.com with SMTP id q2so11398297ljg.7;
 Fri, 15 Nov 2019 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8rQd9wkOT3z4gv2iSrFoVz4BoDXIKpVxdcmv0n2/Gps=;
 b=et1OSnZbVxGWfUpZao6goM/hHzoMOMqt9K+5mK1uo6gDxPgZDNUZYjk/Ag7Ee1y2EF
 TxKLvctalmd0NPDpPaNTjfQ+JuC7S/SBHs11AhzJ+yIoBZeM6IbY2SXGKRhRC9//Fb3n
 ww9c/8w6CbEKpo4ncbcU7C07ErWwT3k9IGvd6el6GutnpGMVZtOGI/Nr91dAdoUlwvXO
 WE5CX/Gkv+Ovf9G190mScsG4LKt9mcntUhfjTBOqSDlwQT8WwdUzEg6kWYlDQA0POL/k
 6jqNECGhuVQNHkQsSUgp2kwe4H0rv/fH0nhqtFxg+qoKSlGOcOq/HHnPnLTHkPz7Pch4
 4bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8rQd9wkOT3z4gv2iSrFoVz4BoDXIKpVxdcmv0n2/Gps=;
 b=qGJlx5VE2RJwb9bgiSEGKn22nUu43dH3eAmlUWEIlheD3I6bwiORnJAvkYTXEcHPsl
 eKlJ+ItVyFjHaw1Qj6gyOiwKz31eyUUSOW2/LdjyX1Lvdrvukn50YzH2+MtWZ5b7Ljg3
 8ehoXW5/kIcOj779N7Ur92DkmemR+R49KvV8hoC1Y33xzsJlGugCtq7Dl7d2VlmRkm3e
 sTG7kNVO1AisLFkZl94x9WVirueJ4pw7OzJWZzKEDdT28783MhkgUpVoyCx8/jXY2+b0
 hl493a0sUTJ+IRsKfT0QCzs4Zg6Du8tzgpf734tL4116Pjuu9U6hIm0tDbvF4h9IwWLb
 GvhQ==
X-Gm-Message-State: APjAAAX1Ierbe5aq83zn3i5eW5Jxp4uJO2FhNNKqxkUP/sZf5mmlNPf1
 DmNDvumaAwwRFURs0PEmIF0Ge4Ca+umfknecHWQ=
X-Google-Smtp-Source: APXvYqwvFIfaT3iTG4v4YJLarWJCZID983pu+YKQ/A800z/hAWLUtqS5wTsZPmjwG+7sMTdRXdhIt7vaLMHP5rrbwgY=
X-Received: by 2002:a2e:9151:: with SMTP id q17mr12266979ljg.156.1573836314050; 
 Fri, 15 Nov 2019 08:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20191115154734.26449-1-edgar.iglesias@gmail.com>
 <20191115154734.26449-2-edgar.iglesias@gmail.com>
In-Reply-To: <20191115154734.26449-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Nov 2019 11:44:47 -0500
Message-ID: <CAKmqyKPdVTN97of+7=khcGpXes8gh1Wt2TTy4ipdaNU_f-ZhSQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/arm: versal: Add the CRP as unimplemented
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 15, 2019 at 10:50 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add the CRP as unimplemented thus avoiding bus errors when
> guests access these registers.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal.c         | 2 ++
>  include/hw/arm/xlnx-versal.h | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 98163eb1aa..8b3d8d85b8 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -257,6 +257,8 @@ static void versal_unimp(Versal *s)
>                          MM_CRL, MM_CRL_SIZE);
>      versal_unimp_area(s, "crf", &s->mr_ps,
>                          MM_FPD_CRF, MM_FPD_CRF_SIZE);
> +    versal_unimp_area(s, "crp", &s->mr_ps,
> +                        MM_PMC_CRP, MM_PMC_CRP_SIZE);
>      versal_unimp_area(s, "iou-scntr", &s->mr_ps,
>                          MM_IOU_SCNTR, MM_IOU_SCNTR_SIZE);
>      versal_unimp_area(s, "iou-scntr-seucre", &s->mr_ps,
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 14405c1465..d844c4ffe4 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -119,4 +119,7 @@ typedef struct Versal {
>  #define MM_IOU_SCNTRS_SIZE          0x10000
>  #define MM_FPD_CRF                  0xfd1a0000U
>  #define MM_FPD_CRF_SIZE             0x140000
> +
> +#define MM_PMC_CRP                  0xf1260000U
> +#define MM_PMC_CRP_SIZE             0x10000
>  #endif
> --
> 2.20.1
>
>

