Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23DC406038
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 01:48:08 +0200 (CEST)
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOTm3-00036y-44
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 19:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mOTef-0000DE-L4; Thu, 09 Sep 2021 19:40:29 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:44859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mOTee-0000m4-7U; Thu, 09 Sep 2021 19:40:29 -0400
Received: by mail-oi1-x22a.google.com with SMTP id c79so325961oib.11;
 Thu, 09 Sep 2021 16:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q0DwtzJZoFa0o9DewcKwoBbaeDz2YL2bNk2v55TqprE=;
 b=nSq+S2Cb01/gvY2vvhUIuBXJAIuT0DIgwoMpqSch+3lKrL877kxpZFHmSAJJgH0/LX
 g/kwkZZqA3lceN8LVlKlEdAmw9LMrubXVP90RuMatvLyqWvUHhQkHHgvNuDgNfuMSZvB
 R/5Q/AZK4NuF/g6oteZQl0InqzX3mxZcGxjrblwg5g/3d/FQIPnnhI+LIjsC+xNRTkSQ
 +bQMxim0Y+J6i2qgwDLYu0jpw+dfdvNk49iA30Pbl8PXMxUBBV2Km7Ee8kQF9isCzTST
 r98DMDGkbmKKjfrzUOo4OJgyvfNkzGngA19C6kQCaiM3uDuD05W/GhhyEKfGE50Et1+M
 xMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=Q0DwtzJZoFa0o9DewcKwoBbaeDz2YL2bNk2v55TqprE=;
 b=B2SpiKUaSIoteJYRzPRVGUl8T4gNcIsQHqhuNCITekVTkKEkOPh6T1ZdRgWeW7Kkgg
 QBLRfW7bzShrMViYPq2wvfiI47RCkhf8AymYZO7x6lZZdFbsIS4m/fl9VPEIp+uUnVbX
 jMcEEi+T/VN0pGvnAbsx64G20fftM5w0PkyjWXKSiEWvJEDmwo5yG4aJMFcdEZSiR0nx
 Pl6fSYHhXORltlRbVu+K4MzwiGZZM6EHoFrlAjzQMiORHit9yvAUggWptnHyRdiFYcWZ
 9ukVP1ZF7kLrYr81QpykugXMngcjbYeem/K4TnpubCpWdgKYl6f0pnZsjq7OD0Mmj588
 k9lQ==
X-Gm-Message-State: AOAM532txgTJY39JVqmGAFtzrSTG6D6HUB+l6hIESQ3KqkLBhxhrKZqC
 JWq+u6aRyQ7uV4wZCTsjDQ==
X-Google-Smtp-Source: ABdhPJytPa+dg+XANFuSoyIh4Lh+a+SVTCz038/o5QhThfTEWhYuCUWHQ5t3SWcGPzp9sCRSds8IaQ==
X-Received: by 2002:aca:ba44:: with SMTP id k65mr1853034oif.131.1631230826173; 
 Thu, 09 Sep 2021 16:40:26 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id z78sm751299ooa.29.2021.09.09.16.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 16:40:25 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:615a:3062:83b4:c204])
 by serve.minyard.net (Postfix) with ESMTPSA id 2A13C18000C;
 Thu,  9 Sep 2021 23:40:24 +0000 (UTC)
Date: Thu, 9 Sep 2021 18:40:22 -0500
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 1/8] docs: enable sphinx blockdiag extension
Message-ID: <20210909234022.GN545073@minyard.net>
References: <20210909230620.511815-1-wuhaotsh@google.com>
 <20210909230620.511815-2-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909230620.511815-2-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 04:06:13PM -0700, Hao Wu wrote:
> From: Havard Skinnemoen <hskinnemoen@google.com>
> 

Can you add some reason for this?  I also can't approve this, you'll
need permission from whoever is responsible for this file.

-corey

> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> Signed-off-by: Hao Wu <hskinnemoen@google.com>
> ---
>  docs/conf.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/conf.py b/docs/conf.py
> index ff6e92c6e2..ecd0be66a5 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -71,7 +71,11 @@
>  # Add any Sphinx extension module names here, as strings. They can be
>  # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
>  # ones.
> -extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc']
> +extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc',
> +        'sphinxcontrib.blockdiag']
> +
> +# Fontpath for blockdiag (truetype font)
> +blockdiag_fontpath = '/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf'
>  
>  # Add any paths that contain templates here, relative to this directory.
>  templates_path = ['_templates']
> -- 
> 2.33.0.309.g3052b89438-goog
> 

