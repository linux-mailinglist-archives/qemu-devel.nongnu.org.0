Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46512174EC7
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 18:49:36 +0100 (CET)
Received: from localhost ([::1]:50572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8Sid-0002mB-BE
	for lists+qemu-devel@lfdr.de; Sun, 01 Mar 2020 12:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8Sho-0002Bv-6m
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 12:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8Shn-0007mG-9T
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 12:48:44 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8Shn-0007lv-3r
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 12:48:43 -0500
Received: by mail-pf1-x444.google.com with SMTP id i13so4390588pfe.3
 for <qemu-devel@nongnu.org>; Sun, 01 Mar 2020 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jSlNKAMXmss8EhwJSP52lcTwTCKmOg/RvpndiWjJpRE=;
 b=j+uXBj3kH31K9Dh2+SunVrj6mgli2QKyvg1WLdnKJicNr7kKxTvI9ea3MWb2NJiRyY
 nTIxE8B1ZXLMe8aU2EZHsWKPsAZVn//cPbpxCRcXXpwOt/q2kdoYdC0CJbykDyWh10lV
 BSlejWTE7cgovW5h0DQQyPYfNqTDO3fxeBRjnCjv+wruJxIHi1p4Q0QmU6naDQWS2Rxz
 qf75KeBslqMlMpMlJMsz3IN8fMNTXHmzL5Ne9lzwLSOMxYNFK9kCrdnNXq1074FoVVb0
 uWqCoAypHLMKqmM2YhSMXbnx8NlQLuz9RLkoJwVocRawsnuCjr0LsltwRKJwu+mqWPQw
 2Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSlNKAMXmss8EhwJSP52lcTwTCKmOg/RvpndiWjJpRE=;
 b=DVV0lP4cHzq3xkXzx3fTR0WJ38zuqckM18JLlr5jBiZ0Ti7Mhpu9YWJqIQid6Z7Pfo
 2Sg2fdqxPjoGVcElEnAs1xbXsj/lswgcGT6Jz4oOO/Tpw3y1h3kgy+SQ/mS2KzP2UX9H
 q8xrNac1ORgpv32Wz2il2/uQVbitxGfhC5D8nQcdNQTFtCHourlHzeg22r16GXwByHJJ
 EGYwev9d9ORF7jMXc1yKn58FQFL4VloeQ1CIqhzP7qjaP0+IYhho2PY8w7SeMHts1Qan
 xw62SbKBAmKS12wIr89sPCXCiH3a+3kIhhJaARpsVvgkqB8N/d2fHcdSrf/Jef5+Tz/F
 BiJg==
X-Gm-Message-State: APjAAAVYMboFoGVCcb2V8JR2s2JnELToQVMEwhF6NpDuxjXNmUceLHDk
 /rsr1BWebPSI/BNZ1yuvhFNb9A==
X-Google-Smtp-Source: APXvYqyJy+1te3U1BALuZ1xLj/fIzvExcpXrwcNG9kEo+ohNIMLoDNb/SjbWb+Bp5akfK6SyuoBa2w==
X-Received: by 2002:a63:a052:: with SMTP id u18mr15616653pgn.210.1583084921874; 
 Sun, 01 Mar 2020 09:48:41 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 y1sm14596637pgs.74.2020.03.01.09.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 09:48:41 -0800 (PST)
Subject: Re: [PATCH v2 3/6] hw/arm/virt: Introduce finalize_gic_version()
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-4-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d887a5d4-8142-58a7-b500-c18ac3b78905@linaro.org>
Date: Sun, 1 Mar 2020 09:48:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/20 2:40 AM, Eric Auger wrote:
> Let's move the code which freezes which gic-version to
> be applied in a dedicated function. We also now set by
> default the VIRT_GIC_VERSION_NO_SET. This eventually
> turns into the legacy v2 choice in the finalize() function.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c         | 54 ++++++++++++++++++++++++++-----------------
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 34 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


