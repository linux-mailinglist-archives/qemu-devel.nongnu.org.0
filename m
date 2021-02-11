Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FAD318D47
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:24:48 +0100 (CET)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACtj-00019c-2c
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lAClV-0006yS-Jt
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:16:18 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lAClS-0007Q0-4J
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:16:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n6so4323283wrv.8
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8Z+P2uGRNTTkpW4Qu+7hKhfNB2mbjWXAeHY/eUfSzw8=;
 b=H3hW9vgo9y42hN4hjoZMuYNjeCYtFdG9gM70mSDG3igGIZR86Dq5Yh8nPN9KW68isw
 Qnom5SxSHJ6ZZJy5vBlu42NWel7mu/649IU3Ssh1RBkHjMrEQNRB8csEB4ch5jX4L6Jm
 JGCibRmYeJkCkzDquV8zBT80scXVD7vKifWXFlRkC1N9WnUPCJDnaduu9ojje0jwdZ/3
 CP30RKLLABDOpImwkssM6+VYLclH0Nd2cgNRkKFDCYn6sQ2QkUWjfDS4TCtgxhwL/okM
 ynjoO8rUeBZUJpyJSg0LD9z/Cv9H1YAUK7fdTJP0/GxZk1SbLkvbgHQMIyNcdXm/yF0B
 7dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8Z+P2uGRNTTkpW4Qu+7hKhfNB2mbjWXAeHY/eUfSzw8=;
 b=UV+7XDkhT36ufwZd6FogO4MLzlV/9yQcL7uhJet9CX08jCRkxjlmsxVsxGsIXsdsMi
 97jasXj1ubs6x57W1pEvnvfYbH2Aur6tgnJSSo32/7TONKOmrpb/uagxMLSITFjLZMDU
 mn4c05677GKN1PIEbxDFTRxMZ8WmQecaWW3QdsPcCSkBuv6fuy14AxWOwYoW2UrtRq1x
 Gt2nDicMwvyoLWdbESgwsaqr+mFdm0fI8UP/HaYCfe6piKPCOlEQgZ7NCRPcOkuo+hT1
 MPx0GbbLaS40qdZSJTQUdF6rNlTHCahGXgibkOdvuP/5ZkqFj1u3WmJVSeSOtns5zPnB
 4t/Q==
X-Gm-Message-State: AOAM533EGYzk03YdR6UV7xqfLQTQ/2wfAJcx2qTA7UlENSvre+tJilAJ
 J8oeInUM4QC1/0kGC+iv8TMhVw==
X-Google-Smtp-Source: ABdhPJyEJw/nENu6670TaxGH4i9Jt4PUBmv45LsP8Wm8CEAjCnGjUI+l7ftk98G4j+dq5Y22c5a3sQ==
X-Received: by 2002:a05:6000:1ca:: with SMTP id
 t10mr5985392wrx.45.1613052971604; 
 Thu, 11 Feb 2021 06:16:11 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id w8sm5097192wrm.21.2021.02.11.06.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:16:11 -0800 (PST)
Date: Thu, 11 Feb 2021 14:16:09 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH 2/2] sbsa-ref: add 'max' to list of allowed cpus
Message-ID: <20210211141609.GZ1664@vanye>
References: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-2-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211123638.1820482-2-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42f.google.com
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

On Thu, Feb 11, 2021 at 13:36:38 +0100, Marcin Juszkiewicz wrote:
> Let add 'max' cpu while work goes on adding newer CPU types than
> Cortex-A72. This allows us to check SVE etc support.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Acked-by: Leif Lindholm <leif@nuviainc.com>

> ---
>  hw/arm/sbsa-ref.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
> index 276243d122..88dfb2284c 100644
> --- hw/arm/sbsa-ref.c
> +++ hw/arm/sbsa-ref.c
> @@ -147,6 +147,7 @@ static const int sbsa_ref_irqmap[] = {
>  static const char * const valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +    ARM_CPU_TYPE_NAME("max"),
>  };
>  
>  static bool cpu_type_valid(const char *cpu)
> -- 
> 2.29.2
> 

