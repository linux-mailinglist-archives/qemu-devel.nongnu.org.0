Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE91FF945
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 18:31:36 +0200 (CEST)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlxRw-0007RC-0p
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 12:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxQJ-0005dV-HW
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:29:55 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxQH-00023C-Im
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:29:55 -0400
Received: by mail-ot1-x341.google.com with SMTP id t6so4988442otk.9
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p0UQiUF33jF1gDDSPvXQLHMcCRkJKJSj3orBSTxGf7c=;
 b=XP/eBI/RL38Okkr+hQVVjb25R0WueyRFTVACGBP4LqyglGqEA5JWz/aGiOnzilopHd
 /wJJZwKYdWYRGJdGGMsCZsXFzXTKftG88Xk5YL/RvwXyT6pG8V9RwiMdpRZS/fGvsQwc
 y6meYr/xavdXaDeoInAPd27l3HoWC3DrLoz1GWNVp2vmqQMnFBFVn/d3yy01WOpjwOOF
 jBIyPvvsA2B0ODQoKwQEBaq+hITcfCGjcKNT5OoG/l1GyfVr6T7sUNHExP9nENroW5EK
 n/MGipehA7V+M3dFtYCY8aCjiNjA7ujsCsdK0wfTF142J1dOSkY8uqG4a5HSxVB0SkTf
 KirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p0UQiUF33jF1gDDSPvXQLHMcCRkJKJSj3orBSTxGf7c=;
 b=kdHRcVeINvlIFQRsOZtMS0QfJOc1hcXyc/1an6y9zy99kYGEay36A/cq7BRbCamsV4
 FrtjGfv5tRyxq/1Zg8lyFbJTFm8ze6aKsqt4wWESmXT9djibKtsZs5GZRW2DmAUZUmPX
 MRRiHpMUnsRKvWBVOq0W8IxGrvn7sU751+DthIhj+Ey/iu5ip60t6/aHHc4Mhxdcn1rB
 eGUJuDP1/CEF+iJBpk0epk2tB0jbzRFMqbP210ubNtYFMMzaTgwUdIR5ejRSLOlfEwWx
 WGPXEACLbxcN9c/WoyiLhHe2TsUXLF22/DEnDZwKsZ61uy7VQWcmT3euIlfBaLrAQvXT
 lRvw==
X-Gm-Message-State: AOAM531CQlVl8wPIfJOCQh5371siWChgtikh9d9/271uLjStil8a9hRu
 Ifi7l5LoyXCeO6KeYGr3bE00zLGRNk4cWKAp5cbWhw==
X-Google-Smtp-Source: ABdhPJybLSKJv5p6ByftbE2WatS3d7CewEPXJJNegnYd/v0his9YzMLElWudAo31tmFghIvADVSIRLRxnwWPE3FHhRU=
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr4346308ote.135.1592497792307; 
 Thu, 18 Jun 2020 09:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-22-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:29:41 +0100
Message-ID: <CAFEAcA8+bJtVn+tsBr--WBYJ5f0PzhEL_Z4M7eULX3sHm9yWyQ@mail.gmail.com>
Subject: Re: [PATCH v7 21/42] target/arm: Move regime_el to internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly need this in mte_helper.c as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 36 ++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c    | 36 ------------------------------------
>  2 files changed, 36 insertions(+), 36 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

