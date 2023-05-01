Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326C6F313C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 14:54:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptT1U-0008Cg-8K; Mon, 01 May 2023 08:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1ptT1R-0008CU-MT
 for qemu-devel@nongnu.org; Mon, 01 May 2023 08:52:54 -0400
Received: from mail-108-mta156.mxroute.com ([136.175.108.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1ptT1P-0006dV-MZ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 08:52:53 -0400
Received: from mail-111-mta2.mxroute.com ([136.175.111.2]
 filter006.mxroute.com) (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta156.mxroute.com (ZoneMTA) with ESMTPSA id
 187d75f723c000becb.003 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 01 May 2023 12:52:49 +0000
X-Zone-Loop: 3ce117a16f8bc9e8cc970029344879a656f5388042c1
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aw8dvNc7CsTSnQcRcbKswxX9BgoVVI2AibHvKhQIugs=; b=K+tidiT531LptoRUeAd5ayiwJ5
 231tur+3qWnZar9s585U6L3odtfZYerDzb91Osh12CFGoj1FzvzUJoufa1/ib/CAM2QzoZfKB0lbQ
 3ODx2o8RB2/sOAWgsq2c9aScSayutRtqI7T+cRX3YEqTPxtK7qWY0HBZnHPt/RccwYe74pra1YLeY
 WyyUp2EJQfSEAZlMSFz/qI0Cc9TcKN2iZ2iPLaD/ph93v8X492IHYE2046FoV3glkgt7mh5k+yvGK
 +YvQDuAtXeOLfS3El65VkfBKhxu7l7EcuRVKT5qZMuFQ+RioQPsdWOFx0uGrAPKxowrsLwl+mPctw
 /jzMdtpg==;
Date: Mon, 1 May 2023 20:52:49 +0800
From: MkfsSion <mkfssion@mkfssion.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Canokeys.org" <contact@canokeys.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/usb/canokey: change license to GPLv2+
Message-ID: <ZE-2IYTyVSn6Cvqx@MkfsSion-LPC>
References: <ZE5z+2WbvVpTa82H@Sun>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZE5z+2WbvVpTa82H@Sun>
X-Authenticated-Id: mkfssion@mkfssion.com
Received-SPF: pass client-ip=136.175.108.156;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta156.mxroute.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, Apr 30, 2023 at 09:58:19PM +0800, Hongren (Zenithal) Zheng wrote:
> Apache license is considered by some to be not compatible
> with GPLv2+. Since QEMU as combined work is GPLv2-only,
> these two files should be made compatible.
> 
> Reported-by: "Daniel P. Berrangé" <berrange@redhat.com>
> Link: https://lore.kernel.org/qemu-devel/ZEpKXncC%2Fe6FKRe9@redhat.com/
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Acked-by: YuanYang Meng <mkfssion@mkfssion.com>
> ---
>  hw/usb/canokey.c | 2 +-
>  hw/usb/canokey.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
> index bbc5da07b5..b306eeb20e 100644
> --- a/hw/usb/canokey.c
> +++ b/hw/usb/canokey.c
> @@ -4,7 +4,7 @@
>   * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
>   * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
>   *
> - * This code is licensed under the Apache-2.0.
> + * This code is licensed under the GPL v2 or later.
>   */
>  
>  #include "qemu/osdep.h"
> diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
> index 24cf304203..e528889d33 100644
> --- a/hw/usb/canokey.h
> +++ b/hw/usb/canokey.h
> @@ -4,7 +4,7 @@
>   * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
>   * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
>   *
> - * This code is licensed under the Apache-2.0.
> + * This code is licensed under the GPL v2 or later.
>   */
>  
>  #ifndef CANOKEY_H
> -- 
> 2.37.2
> 

