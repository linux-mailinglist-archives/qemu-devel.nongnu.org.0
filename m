Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D82D8DFE
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 15:36:01 +0100 (CET)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koSTg-0002PD-4i
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 09:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1koSRl-0001I3-DD; Sun, 13 Dec 2020 09:34:01 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:40320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1koSRj-0003E1-Nz; Sun, 13 Dec 2020 09:34:01 -0500
Received: by mail-lf1-x141.google.com with SMTP id m12so23651728lfo.7;
 Sun, 13 Dec 2020 06:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7RlZg7BDHPaJV7qFqfhPQsTg1ELbdjv7xcZHkUbzg8Y=;
 b=IElsxOz9aX7IgMTf0BeHjn7z4ggYFJ/0Pu9eO62Sbik6uHFR88IClaW/umdJrSXPdi
 eAOrJwS1oAh9VT+N3dIg8x8V1LS4ZHD1g2f+OV545gr33KRmr/b+EUE1ItkSwngOkbeK
 6jePTb2oxqRP2TDsLAi0Ek4kkYxrFe8pm3dXA1LOFl3cVHwJ+AMM6eZKmfOISDhfByGp
 68covnjptnAoLMyiFJXiwBxqlkvPR6EFO69u71VNATPD+U4o79GRub7b7zQxL/GKz5nK
 /Hw/HI1MtdQMktZWk1ForJabe6Dfh7k4UvTe0zOJHmjgwfFRdPysgzfiSLxGQNih+oon
 /SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7RlZg7BDHPaJV7qFqfhPQsTg1ELbdjv7xcZHkUbzg8Y=;
 b=FQW2zhpE2Zo90+PQwUK7lye8Xgsz3AOdSTafqLSnTAx7kiCCY9vvq7EaTdV9NlBDxQ
 QORuFH79F32r1WhZuwnoo4TqKtXQUp2vUmP56QeDIXB5LKuqTxazq14NWE5yQ5i8fTEN
 SHuMkbmBPFka8Ms20LD73ncpBEeS0EXixd9FO8VgxoCPzO5lNbhVBkUaYdrKpauP5fqz
 Ds89EmgcunJXInU4dJJrNiIsOuKBsRSKR2nIeHmhQx9wuhSB2bxd2KNlRMslqVl890Wx
 h/0iO3P1zp3v8hsSLus/YoCfh4xbmz47z93LIb4j2m541UW+FatNrqd62aIrG8QCrLFp
 pNag==
X-Gm-Message-State: AOAM533YF1ghsp8T5/4YWGB7HL6omDH1lhcv96W93i/O45KJuBhMvmNA
 GfESzeRJ6QrGq81MSnulpt8=
X-Google-Smtp-Source: ABdhPJycFKVw69EDjoc8JvnE+5iqG5LumkzcYJBUhR7LF6zx4/1M4pKidmp8Lk/3AcllZN52n5HgGA==
X-Received: by 2002:a05:6512:287:: with SMTP id
 j7mr7996463lfp.541.1607870037489; 
 Sun, 13 Dec 2020 06:33:57 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 84sm1149607lfd.131.2020.12.13.06.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 06:33:56 -0800 (PST)
Date: Sun, 13 Dec 2020 15:33:56 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/8] hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
Message-ID: <20201213143356.GB477672@toto>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212001537.24520-2-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x141.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 12, 2020 at 12:15:30AM +0000, Peter Maydell wrote:
> In a following commit we will move the PPC UIC implementation to
> its own file in hw/intc. To prevent checkpatch complaining about that
> code-motion, fix up the minor style issues first.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ppc/ppc4xx_devs.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index f1651e04d9a..f2f9ca4ffec 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -105,7 +105,7 @@ struct ppcuic_t {
>      qemu_irq *irqs;
>  };
>  
> -static void ppcuic_trigger_irq (ppcuic_t *uic)
> +static void ppcuic_trigger_irq(ppcuic_t *uic)
>  {
>      uint32_t ir, cr;
>      int start, end, inc, i;
> @@ -156,26 +156,28 @@ static void ppcuic_trigger_irq (ppcuic_t *uic)
>      }
>  }
>  
> -static void ppcuic_set_irq (void *opaque, int irq_num, int level)
> +static void ppcuic_set_irq(void *opaque, int irq_num, int level)
>  {
>      ppcuic_t *uic;
>      uint32_t mask, sr;
>  
>      uic = opaque;
> -    mask = 1U << (31-irq_num);
> +    mask = 1U << (31 - irq_num);
>      LOG_UIC("%s: irq %d level %d uicsr %08" PRIx32
>                  " mask %08" PRIx32 " => %08" PRIx32 " %08" PRIx32 "\n",
>                  __func__, irq_num, level,
>                  uic->uicsr, mask, uic->uicsr & mask, level << irq_num);
> -    if (irq_num < 0 || irq_num > 31)
> +    if (irq_num < 0 || irq_num > 31) {
>          return;
> +    }
>      sr = uic->uicsr;
>  
>      /* Update status register */
>      if (uic->uictr & mask) {
>          /* Edge sensitive interrupt */
> -        if (level == 1)
> +        if (level == 1) {
>              uic->uicsr |= mask;
> +        }
>      } else {
>          /* Level sensitive interrupt */
>          if (level == 1) {
> @@ -188,11 +190,12 @@ static void ppcuic_set_irq (void *opaque, int irq_num, int level)
>      }
>      LOG_UIC("%s: irq %d level %d sr %" PRIx32 " => "
>                  "%08" PRIx32 "\n", __func__, irq_num, level, uic->uicsr, sr);
> -    if (sr != uic->uicsr)
> +    if (sr != uic->uicsr) {
>          ppcuic_trigger_irq(uic);
> +    }
>  }
>  
> -static uint32_t dcr_read_uic (void *opaque, int dcrn)
> +static uint32_t dcr_read_uic(void *opaque, int dcrn)
>  {
>      ppcuic_t *uic;
>      uint32_t ret;
> @@ -220,13 +223,15 @@ static uint32_t dcr_read_uic (void *opaque, int dcrn)
>          ret = uic->uicsr & uic->uicer;
>          break;
>      case DCR_UICVR:
> -        if (!uic->use_vectors)
> +        if (!uic->use_vectors) {
>              goto no_read;
> +        }
>          ret = uic->uicvr;
>          break;
>      case DCR_UICVCR:
> -        if (!uic->use_vectors)
> +        if (!uic->use_vectors) {
>              goto no_read;
> +        }
>          ret = uic->uicvcr;
>          break;
>      default:
> @@ -238,7 +243,7 @@ static uint32_t dcr_read_uic (void *opaque, int dcrn)
>      return ret;
>  }
>  
> -static void dcr_write_uic (void *opaque, int dcrn, uint32_t val)
> +static void dcr_write_uic(void *opaque, int dcrn, uint32_t val)
>  {
>      ppcuic_t *uic;
>  
> -- 
> 2.20.1
> 

