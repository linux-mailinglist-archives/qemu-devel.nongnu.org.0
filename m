Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC943E4E0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:17:48 +0200 (CEST)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7A3-0006PA-JV
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg716-0002A2-RO
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:08:32 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg713-0007Yf-E5
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:08:32 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 lx5-20020a17090b4b0500b001a262880e99so4963473pjb.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OfJLN+S5PhxsptRoY0SZqxKvUoHmE2QMKiI9XDEPLmM=;
 b=ygbEhy4B7CffoAHuwdML0tLd8T0CDJI+TCtgQmBQKnEFRi/Z8iHzri6+J6E2aZ66y3
 tNsHw9OU+6sydG2pToqyhaJi0/BrkNMC857gBrc2H172nOaEBjLZ4RqGjoK+pIRzhNv1
 37+v0a6jdDUs59wziKnF3rhURh4+PwnNOexc7tkODkQEIE0dR85dEni/fp9Y4NWGT24Q
 REShVCqEMEIqkgOrULTX93S1qgLWpCl/MX2PLRAVsOdX0PS744UOsSmR41d9esrS7X4u
 a/3IYLX0Iq6wUJBGpNp/kDOgbsExNb67XLx1EiUiS9EGF0s/iNNJZLmBb4gBi3jf22kD
 0cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OfJLN+S5PhxsptRoY0SZqxKvUoHmE2QMKiI9XDEPLmM=;
 b=6718agcZg8mbp9IWrGx6iYQMVrQYBsriCohod889PqddlpIykx2iNQtOTpWXE2csND
 D2XTpucBv6T/kaijxH5pE7G4RmwSCxJ/szLtWG0kSPt3MD/S2WpUcFJVGlG4/LZVAIaK
 e29v93rbN6VLw/shf5bGmYC5LL6rqoSwavWVCuPZlzgxFt/TvNTsjIr38PRtLAcs2yom
 aAsc8/6+T4x5BYySArejNewStoxxVirBq+Myunx9RQzwE4fEjQNZ4ghAW+6b05PtBrjW
 1hpkhOZ6Uwd+mdPSPy7DlPlwCCZn598QOueYd/wCPRwv573xXelw96wZ1jIvr4B8//RG
 pQ4A==
X-Gm-Message-State: AOAM533Lwx47ip3k/uakZgAx8C4++2B63NVss+/p3SG8tT0HYNNBXNnA
 q0dJrKaxdkIvgrpA2S2zykZ02g==
X-Google-Smtp-Source: ABdhPJyIfG+rDCdPTWlIsoA6GCX9Ofq6A0HRG9pEr47Fu0BkQSt/OVaO0Kx/dW5Dki9XAwFmjxUeSg==
X-Received: by 2002:a17:903:124d:b0:13f:d148:ed70 with SMTP id
 u13-20020a170903124d00b0013fd148ed70mr4441492plh.42.1635433707186; 
 Thu, 28 Oct 2021 08:08:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id a19sm3049653pgh.24.2021.10.28.08.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:08:26 -0700 (PDT)
Subject: Re: [PATCH 01/24] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac4ae301-75a2-c233-0ed7-979a52a9ae7a@linaro.org>
Date: Thu, 28 Oct 2021 08:08:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> As part of upstreaming, the include guards have been made more
> consistent. Update this file to use the new guards.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_sysarch.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

