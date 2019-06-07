Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78889391F5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 18:26:30 +0200 (CEST)
Received: from localhost ([::1]:49352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZHhF-0002RU-Ls
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 12:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39723)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGC2-0002ME-Dq
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:50:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGC1-0000iS-3k
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:50:10 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44733)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZGC0-0000Kl-VB
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:50:09 -0400
Received: by mail-ot1-x343.google.com with SMTP id b7so2056643otl.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oHzHXPzXYlWN69DqEELeV6l5D1ewq4CPbBpdr086xKQ=;
 b=pDKEQrcRtCeBpPN2En7vgEXeLf8WNQS6mBmsrD2/yoMT869VF5HXzLcYqypICrDKtP
 Vnqh//8/ejxh1iZ3ErH6vLHlmjlgaNfcmvmYd+sH/iF7Xog4NrTMeAvXdru5Ggnoi78J
 7RFzmLfsOBDX46SzSAZXFmnPvwJPWOnkUIiIfgKWwtBs5rAlrburQ3hJ3DFGO2ou5zNN
 w4FdBdUr8wSRSGdkNbJYgbJBQUOX2KKidqt6WCrveP1huKmWdcZFXBiJFdFz0b6AiAm7
 FefJE8671jCQ8IXN69I/o32CYKxgEMC89j4NgAOyDp8Dpu71Hf3zkQ/XCYAgDLj0CpNr
 DLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oHzHXPzXYlWN69DqEELeV6l5D1ewq4CPbBpdr086xKQ=;
 b=ta67rqw8cmb3a7QYnJ3AuzQEtKuLnHwFgwgZfZM3sHfhmlBQpX7JNLgZgvQWGms+VJ
 zZg22qLl+AyFHBklGBYNEWS2KQ4FSehXudewxEBWPqax9YG0/6eX/ac87W1iFTI62VNN
 oIC06H8b29af69z1hPA4/dvtL/CXz0rOdreYzT5Z9bm67L3M0n0hjUAIzr+jab2zTQ9o
 jpuFc4COmXbBuFmCMSdIxerAoYaYH1U1vfQQWW0jp49UGBsK1dN1ePOuh5kZsFhYH6BK
 TmtxCJgMMqnocS4nHRIHUOl9yEK3Mzq9LSBZLdz4XXzfhWUfJ8tuiEycEEDwW+cRTV8R
 xdvA==
X-Gm-Message-State: APjAAAW6F2InLwHpBmy9LhXB/Fco672ra4XZktkSHqdXtkYM4/PmBU2V
 ke+i7kqos2T73JzJdc5CXINxedN0MBTh5w==
X-Google-Smtp-Source: APXvYqys3hgg2+nHupNsO4O+j2QLKAGCRT+WAoUFiVQgtvYjeRJehiu5Z2fVQJS6ObG7lrM5QUcCGQ==
X-Received: by 2002:a9d:a0d:: with SMTP id 13mr20031406otg.238.1559918997692; 
 Fri, 07 Jun 2019 07:49:57 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id x21sm805430otk.4.2019.06.07.07.49.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 07:49:56 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <94c6b711-7944-e2cc-a8a7-9a653409a6b0@linaro.org>
Date: Fri, 7 Jun 2019 09:49:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 03/42] target/arm: Factor out VFP access
 checking code
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Factor out the VFP access checking code so that we can use it in the
> leaf functions of the decodetree decoder.
> 
> We call the function full_vfp_access_check() so we can keep
> the more natural vfp_access_check() for a version which doesn't
> have the 'ignore_vfp_enabled' flag -- that way almost all VFP
> insns will be able to use vfp_access_check(s) and only the
> special-register access function will have to use
> full_vfp_access_check(s, ignore_vfp_enabled).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 100 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 101 +++++----------------------------
>  2 files changed, 113 insertions(+), 88 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


