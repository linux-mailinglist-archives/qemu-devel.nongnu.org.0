Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266F1D31FE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 16:00:25 +0200 (CEST)
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZEPQ-0006cd-1O
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 10:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZEM9-00015k-5S; Thu, 14 May 2020 09:57:02 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:45727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZEM7-0000Nv-Kl; Thu, 14 May 2020 09:57:00 -0400
Received: by mail-lj1-x244.google.com with SMTP id h4so3573268ljg.12;
 Thu, 14 May 2020 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LhtvcWxfYjGugdFY3l7eclUrSZkEkCzjO0DAj0NIx48=;
 b=YMikLC7kFHDdQADArSb3Tjy+V32MlPZzGN/vJrjkBDjNoUU+wIOH2R/LKmHEwClKXR
 LFfbKFmLBp8cILxG3T9w8PKRIX0uqwH6zVjd2jj3eItW6E3vPo1AXgD+GLf6772/EwKC
 UKhDg8ofgXVQ5UxkTtffzgVaE7kxgLYRA9gy5SP7+oIHZOisoplEFimbjD39xN4hRaif
 bf3bAYtAmso0dL6eH2YESVco8poQKvWYgAic03XK9uUGPYUOqhUAVmBWeW7l+4/tgQc6
 ydIpVGEhlIT1mOy8qA+6WZB8grcCVM319z/KfU660Ofr9sqh3NCXNeMCq9USkgA8uxo1
 /5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LhtvcWxfYjGugdFY3l7eclUrSZkEkCzjO0DAj0NIx48=;
 b=m7+fe9aN+vJIJfXwUEMU8CCLJ95HB6zQT8NrIrdUGYCgy1yqQOXFUhVf8nqbZWZ/JD
 kp5jK2TGNHeMj0Am3W5HdJe2WeeAXuATIA+x9oxK/BJwGqAKs0CzxjnQ6CDs0RyDLsmN
 xTQUmegL67XmN3+9Ua99CwiFAvzcCd2tBIaRjszLQyZHAiFCtQn9NtDz5MUY+O7XDT06
 wHGN8lSc9u5okRqpJ+3IZCklWydtRBQbcRLtLZl0gTIP6McAt+PV+WszpFlV6z3w8tPG
 O/Gtk8MXVndipSjQgdnSUdq7DVdpxo3p82sSM1VE6svnIR4RjjZAbeeOHLCbjli4wJ6T
 jYfA==
X-Gm-Message-State: AOAM532bQdFkOM30l6clM98QiIM1JBwsY5Eqz2yZ3lBQM8ANOkKoyUlZ
 CL8DQt18J8vxjcBCpe5RljDzBP8ZKFA=
X-Google-Smtp-Source: ABdhPJxnXf6cpRjwEMBpCL+XuVfaZQSakmOpHLWRkS/0dWOdokJB0P76zg2gg0U8AKnFFLYzbG6H9A==
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr3098336ljm.58.1589464617804;
 Thu, 14 May 2020 06:56:57 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v12sm1550353ljc.37.2020.05.14.06.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 06:56:57 -0700 (PDT)
Date: Thu, 14 May 2020 15:56:40 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/5] docs/system: Document Musca boards
Message-ID: <20200514135640.GA5519@toto>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-6-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151819.28444-6-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 07, 2020 at 04:18:19PM +0100, Peter Maydell wrote:
> Provide a minimal documentation of the Musca boards.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/musca.rst  | 31 +++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  MAINTAINERS                |  1 +
>  3 files changed, 33 insertions(+)
>  create mode 100644 docs/system/arm/musca.rst
> 
> diff --git a/docs/system/arm/musca.rst b/docs/system/arm/musca.rst
> new file mode 100644
> index 00000000000..8375c5008d5
> --- /dev/null
> +++ b/docs/system/arm/musca.rst
> @@ -0,0 +1,31 @@
> +Arm Musca boards (``musca-a``, ``musca-b1``)
> +============================================
> +
> +The Arm Musca development boards are a reference implementation
> +of a system using the SSE-200 subsystem for embedded. They are
> +dual Cortex-M33 systems.
> +
> +QEMU provides models of the A and B1 variants of this board.
> +
> +Unimplemented devices:
> +
> +- SPI
> +- |I2C|
> +- |I2S|
> +- PWM
> +- QSPI
> +- Timer
> +- SCC
> +- GPIO
> +- eFlash
> +- MHU
> +- PVT
> +- SDIO
> +- CryptoCell
> +
> +Note that (like the real hardware) the Musca-A machine is
> +asymmetric: CPU 0 does not have the FPU or DSP extensions,
> +but CPU 1 does. Also like the real hardware, the memory maps
> +for the A and B1 variants differ significantly, so guest
> +software must be built for the right variant.
> +
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 15bcf9f81f0..1b86b93c346 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -72,6 +72,7 @@ undocumented; you can get a complete list by running
>  
>     arm/integratorcp
>     arm/mps2
> +   arm/musca
>     arm/realview
>     arm/versatile
>     arm/vexpress
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea7bdd359e0..f8e0fdb4ef2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -706,6 +706,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/musca.c
> +F: docs/system/arm/musca.rst
>  
>  Musicpal
>  M: Jan Kiszka <jan.kiszka@web.de>
> -- 
> 2.20.1
> 
> 

