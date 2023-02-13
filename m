Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA56950C4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 20:37:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRecM-0000pv-6D; Mon, 13 Feb 2023 14:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1pRecH-0000nv-IQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:35:57 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1pRecF-0000l0-Hv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:35:57 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id AC863C60F70;
 Mon, 13 Feb 2023 20:35:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1676316947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qr414lAg4mxKceioWTJjn2Y210VX/l4DAJSiBJq/Ggw=;
 b=Wo7VlIXRaxA+bmH7j6q7bGvt9y1Rh2RA8WUf4AbICnUyNt1h5KrAAQ5ENTSPGQUBIN5cXw
 VQGynmAKf7llRHc25nmWQLeNKKmCxiJPw1XEicKf1NyoP+CjeHFkmcjP3xMJBRg+EDX/Q1
 7c58Y1KiGtfPAgr+il7QYe/2CLylbjIXxIV6Y2kW6Yc/5A0Jnwl1w26Ta5xkGxnx1ethG0
 DsHtOM4UeKjKFAMvo6/AuTUMGETSRol1oLSvwMlEvT4xceb8j4940a7bz1U7nOLJ8blW6J
 peKt8uQ7darXCDD1aSY/MhLsaNWf5++JEfC/R/29w9BfJjVDN9CWNVZ2PC9m9g==
Date: Mon, 13 Feb 2023 20:35:47 +0100
From: Luc Michel <luc@lmichel.fr>
To: Damien Hedde <damien.hedde@dahe.fr>
Cc: qemu-devel@nongnu.org, mark.burton@qti.qualcomm.com, philmd@linaro.org
Subject: Re: [PATCH] MAINTAINERS: update my email address for the clock
 framework
Message-ID: <Y+qRE6Lp6FYOGh8W@sekoia-pc.home.lmichel.fr>
References: <20230213105227.2357-1-damien.hedde@dahe.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213105227.2357-1-damien.hedde@dahe.fr>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10:53 Mon 13 Feb     , Damien Hedde wrote:
> Also update mailmap
> 
> Signed-off-by: Damien Hedde <damien.hedde@dahe.fr>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  MAINTAINERS | 2 +-
>  .mailmap    | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96e25f62ac..ceeda49d49 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3321,7 +3321,7 @@ F: .gitlab-ci.d/opensbi/
> 
>  Clock framework
>  M: Luc Michel <luc@lmichel.fr>
> -R: Damien Hedde <damien.hedde@greensocs.com>
> +R: Damien Hedde <damien.hedde@dahe.fr>
>  S: Maintained
>  F: include/hw/clock.h
>  F: include/hw/qdev-clock.h
> diff --git a/.mailmap b/.mailmap
> index fad2aff5aa..7677047950 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -56,6 +56,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
>  Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
>  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
>  Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
> +Damien Hedde <damien.hedde@dahe.fr> <damien.hedde@greensocs.com>
>  Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>  Frederic Konrad <konrad.frederic@yahoo.fr> <fred.konrad@greensocs.com>
>  Frederic Konrad <konrad.frederic@yahoo.fr> <konrad@adacore.com>
> --
> 2.37.0
> 
> 

-- 

