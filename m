Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874E318D4E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:27:18 +0100 (CET)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACw9-00043n-7l
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lACmD-0008Dx-V5
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:17:04 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lACm7-0007pc-Og
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:17:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id l12so4369100wry.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=29ocy0CHrcUlYFE4fjk2O6DQXg3oSmFtyDv3hmlanSg=;
 b=YwVzJEtfDgWQYz+mKrGJB8U8OeniMyeccOVBymr+aJfLEZxh4KXFpJDJ1o8JOH77JI
 VO+DEHsiPm7gxnuMGLxg3HPdWrI7kdh590h5IxePab2kxxKBARNBKLl0CSZbRA/dsAJS
 MJVpXptAPbB19k0/0wNLRosx6NUDlMqMBy13QSIEcijbrfczavQmsDuTDUnSQPjTSqD3
 evyLbom9vHIE4Snw7wcP7piVCrtEElMpMpRFXwRE8gsQgFEqT9LYYD9eYj6QpT7MxB6n
 v3w9f3wNyonSEUVaFW5m7pjOwDsJPHWZZs22VufuQKNX4x6QbWVR9l+7c+RT8rqOb2BK
 il9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=29ocy0CHrcUlYFE4fjk2O6DQXg3oSmFtyDv3hmlanSg=;
 b=nwGISP0NOTzxEIdKyOOf9e4jVbtbcqCh8s7fbbDVTHjiJfuDGMOv3zXuidTxV2ulDN
 kYl3lT793wc68FNKI0/8JPVUfaSzwR9fQ4vPr1wCHEYvyIRT6iiKKoH7ZLl0ShePuhe5
 L8UiISRbNB+yuoous1dCh2xQpS3ROxT/SQlyhUGKk1iRSLbB33fMcjvmRnmHqPPTdJuQ
 Hdorv2kiKvef/4w+Y9kw4yO4bnjN+OF8crjQ+mhbUBuz/ufL6gUSX4XbHqrNrHNWsMzy
 WcGRHt4vH14Wm3HGWTZvaHU2g4hK5YlGw4Ij8flFxJ1t2r/jnYTw9+umUZjQGINEu/Qs
 M0oQ==
X-Gm-Message-State: AOAM531Ctx44vb2eeLZ6f+awfr2o6il/ybYFGqNsmcEaWcXGVaqEqQ0s
 MCA2VOxWHLyu+LAs7R6xk3BQHg==
X-Google-Smtp-Source: ABdhPJw34oMvyQXHa7zOGl58WkUbVexjeDr0mYMBs8cVqsmTpQQvCwVkmKLBrgQG973Mo3py77ZwAA==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr1021651wru.384.1613053014691; 
 Thu, 11 Feb 2021 06:16:54 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id y63sm10295495wmd.21.2021.02.11.06.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:16:54 -0800 (PST)
Date: Thu, 11 Feb 2021 14:16:52 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH 1/2] sbsa-ref: remove cortex-a53 from list of supported
 cpus
Message-ID: <20210211141652.GA1664@vanye>
References: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?utf-8?B?UmFkb3PFgmF3?= Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 13:36:37 +0100, Marcin Juszkiewicz wrote:
> Cortex-A53 supports 40bits of address space. sbsa-ref's memory starts
> above this limit.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Acked-by: Leif Lindholm <leif@nuviainc.com>

> ---
>  hw/arm/sbsa-ref.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
> index 9f70735153..276243d122 100644
> --- hw/arm/sbsa-ref.c
> +++ hw/arm/sbsa-ref.c
> @@ -145,7 +145,6 @@ static const int sbsa_ref_irqmap[] = {
>  };
>  
>  static const char * const valid_cpus[] = {
> -    ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
>  };
> -- 
> 2.29.2
> 

