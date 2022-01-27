Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C2849DCAA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:38:48 +0100 (CET)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0Ip-0007k1-99
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:38:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCziI-0000oe-KF
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:01:04 -0500
Received: from [2607:f8b0:4864:20::1034] (port=51757
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCziC-0001Xc-EZ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:00:58 -0500
Received: by mail-pj1-x1034.google.com with SMTP id q63so2152823pja.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 00:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MoiqRCTIu1Oricnd/PDV5iPMGlLB4wA9dNWxk6F9Ejc=;
 b=V0+C7cwEjyi2a8jt6qDKSZujRXxefShSXV4EkC+j2LKGZUhMaDgZGwckbji8Rl0XOl
 zYEumUYyUuvPNulCxhCzyaHh/mDjP54yhDu1JB7NsCVpHD+tLxv8AG1+RAtK1Zsu8N+M
 iJ+wkIEDKqchWOMkc3XWwc6lVQp4aaAfPRTZKhd6C/0QJ+mcrm7R5/XthWY0zJcOAHDF
 3tjiUmlUqoH1zKRk5K/DYh9kmSWV4/LgxqNMu2adVQbaCuM6U/41qDv6Wr5vpELWS2Y5
 0gpHeCH4CjYu49+AXHRzsgiaybO+/6/Yrq/buhZ1ZYPUha67mZPl2SsDuQwWRRvh5I5Z
 yPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MoiqRCTIu1Oricnd/PDV5iPMGlLB4wA9dNWxk6F9Ejc=;
 b=sXOP0rNDuzzhRb8DxWW96xOPyRzIUyuHVjnzJgTuwa7aGlT4lFpOeYTrHCsy9N7NRS
 7VqZTXhRACfIlvOkUdTfTZqE75pYCbEgxx2LFg1IlDDya5Mlm9wTi/sZndpVKh4TTGcB
 NWlhtCVGLY47aibHZAJkQmEXeR7Ah6ycEye6wJqisWvMebITKZHsb+03ciYZGtCPrp8z
 9rd4w49JoXQDRVJBZfEMNE14BDlprTAdU/x1gCSkyZ/rfSSiSmQGXOPGWH+dldKP59mt
 ut5O4J4/OrXQnJ6vdfFwmSnboOZ89rVyoQISOYW3eyzELPuWnQFNbXYleMiEACeUjwHX
 G2iw==
X-Gm-Message-State: AOAM530JfmfrKQctZFg3QcfIXyCv4/Ari7fz+nSI3KCOnJrjl9p111UT
 9k2m43Y6bVdy4tH7ehMqlElO+g==
X-Google-Smtp-Source: ABdhPJxZ9AUbOunHx3NnY9nagC8PzRzR3W/Nul+rPnNYWdsbrDfjItVi9p7F/LJrOOOeh1jXlJJ82A==
X-Received: by 2002:a17:90b:17cf:: with SMTP id
 me15mr2992867pjb.158.1643270430545; 
 Thu, 27 Jan 2022 00:00:30 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id bt6sm5197082pjb.3.2022.01.27.00.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 00:00:30 -0800 (PST)
Message-ID: <96fcae04-1719-3834-cdb8-8fa13f5fcf0b@linaro.org>
Date: Thu, 27 Jan 2022 19:00:24 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 38/40] MAINTAINERS: Add tests/vm/*bsd to the list to
 get reviews on
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-39-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-39-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> tests/vm/*bsd (especailly tests/vm/freebsd) are adjacent to the bsd-user
> stuff and we're keen on keeping them working as well.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

