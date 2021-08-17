Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A643EEA37
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:47:34 +0200 (CEST)
Received: from localhost ([::1]:35586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvgz-000332-Tf
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvfa-0001GR-Hp; Tue, 17 Aug 2021 05:46:07 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvfX-0005mI-TH; Tue, 17 Aug 2021 05:46:06 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 3851AC6019D;
 Tue, 17 Aug 2021 11:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629193561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CViNIE5QNPJQkmjNcsvtBZ6czIIwa9Fny/6BXD0hwaY=;
 b=SdxVt3MqjL1WLgl6ysSVRoziQOBGQ3ODmA7wJZNZrbai3Ml/QeDiRhwW/bbz0CoVuubkVF
 dCnRVKCj2waVTavnjgWmrN/AmvvxlA1ML4szHiyB2dNT9XXGtCo21sHHE+2t51tCQgeehV
 TqIyiNR+GpWDpkiWbV424ENDiBPAYQnaNi0aW9h4uGUOkDvh1kwt3ldhgZpKVm37mZ1c9g
 XlyQhYCdLN4vFApdHeu99/DpmMM4gjC/rkQ4K/RSVYi74sGTSZFsjW2J8VRN8/1X6NTMpJ
 LltmUgacraMMlrROd8q5Eb+gGMLRq9AxgehQOdL0Tj85WWt1kNm50COFlyjv9w==
Date: Tue, 17 Aug 2021 11:48:13 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 14/25] hw/arm/stm32vldiscovery: Delete trailing
 blank line
Message-ID: <20210817094813.wkkouxj3zi446z7q@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-15-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-15-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> Delete the trailing blank line at the end of the source file.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/stm32vldiscovery.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
> index 07e401a818d..9b79004703b 100644
> --- a/hw/arm/stm32vldiscovery.c
> +++ b/hw/arm/stm32vldiscovery.c
> @@ -65,4 +65,3 @@ static void stm32vldiscovery_machine_init(MachineClass *mc)
>  }
>  
>  DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
> -
> -- 
> 2.20.1
> 

-- 

