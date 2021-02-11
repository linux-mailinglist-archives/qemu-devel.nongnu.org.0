Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5872931869D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:11:39 +0100 (CET)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA80g-0000wY-8r
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1lA7vY-0007ME-4l
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:06:20 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:53914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1lA7vS-0002QV-OM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:06:19 -0500
Received: from [192.168.1.83] (lfbn-lyo-1-486-109.w2-7.abo.wanadoo.fr
 [2.7.75.109])
 by beetle.greensocs.com (Postfix) with ESMTPSA id BD94221C36;
 Thu, 11 Feb 2021 09:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1613034369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmAqzq4e3yV8GKYjQaZNDZp5HQ5C6EClKxLvnlMiZxw=;
 b=gTEAtnU2aDWnZKbAvJsfguzWoqimNUvK4pRr1kNmwWeXgbewD3vQWu+Pns21LIJvU1JZNK
 z+5V46y29yJi7x+0SUIpZ/g6U537ceJA2a1e0eNnc635FvjwNV6zLS8hBgWKyboKtwDA7J
 8q/pd9IcukTKaHS7hemqG3p+VBxNy6w=
Subject: Re: [PATCH] MAINTAINERS: add myself maintainer for the clock framework
To: Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org
References: <20210211085318.2507-1-luc@lmichel.fr>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <19cf6133-4032-b15c-4ac5-283f823c7086@greensocs.com>
Date: Thu, 11 Feb 2021 10:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211085318.2507-1-luc@lmichel.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.211,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by: Damien Hedde <damien.hedde@greensocs.com>

On 2/11/21 9:53 AM, Luc Michel wrote:
> Also add Damien as a reviewer.
> 
> Signed-off-by: Luc Michel <luc@lmichel.fr>
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6f1eca30f..67ad14ce14 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2850,10 +2850,21 @@ M: Bin Meng <bmeng.cn@gmail.com>
>  S: Supported
>  F: pc-bios/opensbi-*
>  F: .gitlab-ci.d/opensbi.yml
>  F: .gitlab-ci.d/opensbi/
>  
> +Clock framework
> +M: Luc Michel <luc@lmichel.fr>
> +R: Damien Hedde <damien.hedde@greensocs.com>
> +S: Maintained
> +F: include/hw/clock.h
> +F: include/hw/qdev-clock.h
> +F: hw/core/clock.c
> +F: hw/core/clock-vmstate.c
> +F: hw/core/qdev-clock.c
> +F: docs/devel/clocks.rst
> +
>  Usermode Emulation
>  ------------------
>  Overall usermode emulation
>  M: Riku Voipio <riku.voipio@iki.fi>
>  S: Maintained
> 

