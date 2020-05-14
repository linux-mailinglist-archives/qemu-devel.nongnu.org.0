Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624131D31FB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 15:59:20 +0200 (CEST)
Received: from localhost ([::1]:35002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZEON-0004f4-EL
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 09:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZEKM-0006Bz-Hh; Thu, 14 May 2020 09:55:10 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:44523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZEKL-0008MX-Ng; Thu, 14 May 2020 09:55:10 -0400
Received: by mail-lf1-x143.google.com with SMTP id d22so2682160lfm.11;
 Thu, 14 May 2020 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Fwa9E1kynr3Sx/7kJs6FRrjoDiyCspTyloxodGW5mYw=;
 b=l6TdBuId8hIyrCRzvz7NaHT45pPR+eDTeYHYszd6VV3L0lBzs1jThUFr4GNp1vEoTB
 7OjOz8fAvHixh8VsbMSLChToBzJ4Q7eFmIjjeKYdy2yGleTrb40/oqdHa7fXT1eV8j/S
 yd/Oqupa4knrqVK9VJjPP/UG+IQ0I0FJ1cV/sRj1VCUTjcgqo7suuDhHx1d+5ZDFClRD
 k1cugrC7jb9fWoybjM4BqD+bx/O3Iay+ooeKnN0m2t8VHwrnNunVEXfCZYJf3w9SBKIo
 Bv1wMOy9WbU1jdZFBcvnOwaGeldSCw0yx8wJOwwFu63n1NdaQwQRf2yz9IWLF8WMHbhC
 C/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Fwa9E1kynr3Sx/7kJs6FRrjoDiyCspTyloxodGW5mYw=;
 b=VBUyGbuM5QCt2VFLoOubfgXn0IKhNuNQ8o0nVdDxq2kaYOuu1NWmkQNpZjmdzYQo28
 JXfEOLk0vEwhzs6+2s5DWFaSTzSkhD+EfARvVa5sC6IE0LcdvISEMJhDslF2CY3kCIue
 4Sp70Zcefb7rVbynfqoZlKkQx/YF2yWFHZli2QT9Yw4Wrccb9LqdmulapW1/ifLVSwHj
 ojPkYoeezrS+6xVyb/3WyOcGJ7FOcE6Y3PSO0jQCONbd70SUoN7qFvSxaEqYLoainXj1
 fG4wrcFN5yvfTmAK2R2hRwvZdoD8IpWg2KlrUSeM5cIGrSPo6zSSN6+2nlNl13OJkpi6
 N0nA==
X-Gm-Message-State: AOAM531RWFe6ObLqWvnw3vrnoaBc4Xn6WCi4JKEDqgGo30vk1snLd+Bl
 Ct2M2tAa9sfbzwIoLK8v0LQ=
X-Google-Smtp-Source: ABdhPJwefx0JwhQkR2MFChjYKQuHV0COHhCRYLtaPksJAe3r7DrTGXM7ca8S2uvjI7oNzWxZiyIxeA==
X-Received: by 2002:a19:84c7:: with SMTP id g190mr3009309lfd.69.1589464507348; 
 Thu, 14 May 2020 06:55:07 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id d22sm1876291lfi.31.2020.05.14.06.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 06:55:06 -0700 (PDT)
Date: Thu, 14 May 2020 15:54:50 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/5] docs/system: Sort Arm board index into alphabetical
 order
Message-ID: <20200514135450.GX5519@toto>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151819.28444-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x143.google.com
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

On Thu, May 07, 2020 at 04:18:16PM +0100, Peter Maydell wrote:
> Sort the board index into alphabetical order.  (Note that we need to
> sort alphabetically by the title text of each file, which isn't the
> same ordering as sorting by the filename.)

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/target-arm.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 324e2af1cbc..d1196cbe01c 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -71,15 +71,15 @@ undocumented; you can get a complete list by running
>     :maxdepth: 1
>  
>     arm/integratorcp
> -   arm/versatile
>     arm/realview
> -   arm/xscale
> -   arm/palm
> -   arm/nseries
> -   arm/stellaris
> +   arm/versatile
>     arm/musicpal
> -   arm/sx1
> +   arm/nseries
>     arm/orangepi
> +   arm/palm
> +   arm/xscale
> +   arm/sx1
> +   arm/stellaris
>  
>  Arm CPU features
>  ================
> -- 
> 2.20.1
> 
> 

