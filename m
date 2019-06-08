Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B043D3A02A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jun 2019 16:06:31 +0200 (CEST)
Received: from localhost ([::1]:58648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZbzK-00041Z-9O
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 10:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35466)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbxM-0002Vo-6B
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 10:04:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbxL-0001Vr-7B
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 10:04:28 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46282)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZbxJ-0001RO-4d
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 10:04:25 -0400
Received: by mail-oi1-x244.google.com with SMTP id 203so3356067oid.13
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jvhJ4tk5f4ohh/VfmbKP87KpI47MJN8SdJaeIi966Hc=;
 b=hG1RAwntqQmAmFHt5qhrho6H9CWK0CTmaKy75S3V4KNXwHX02RVSgK5+Up6KBkcZLO
 +/CRQXazr1bpVK+AY0q90WG+kHADqlvYIVV4G2yeQbKfenuNtbQGXGJ+gzl8cSe9Q07n
 xwrO88ac+HDgFqb8iN/KazKLzuzoRhiR0j8GIWNBhwFQBRhrFnAopMJyqUmXvqx3rk8b
 6mmucj3KaagVi+EEc1RVepuMVseUZKCzk2wZbtbLbb1NWMDzwob5ga4FN9z3CcP35YeJ
 mwot5yKKz93Kr5psEM07ovKI4o4cASkpMnXo5ICqptxBcltLq2M9ZCEG/DcCN92aJoex
 G0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jvhJ4tk5f4ohh/VfmbKP87KpI47MJN8SdJaeIi966Hc=;
 b=peTzTCVyJ5HfKv6ZTcgLJLdh/pzzOHklVtaqg/5q6tCXuH7k/1SLr/QbEBp989r2tP
 XVrKJPN8OJXwxfa6MKT58xB6jfRIhmz4wHN4sPMLvsuaQgPT9uXaR+CP+lf8sayEc7ZX
 CfMFAd/jldJ2FV2dBS8fx+3MKYaFnIFSVbooWPF2TD06AVbLLdrcNHGXDEaBfLGFeg/N
 0dfrhF3zd6FJRVzMlxp9EruLumVQSIOM7kS089Pr4IDmfsTXGnvP0SWQugyOjLRvdFFl
 WMzBUMU/MiyitIe+/MX6BnuOCVcRps/pvu6+k/DlnoAXcu8TtYa5C1dNr/mSu41SSUKb
 IlbA==
X-Gm-Message-State: APjAAAWpd4zgKWlUFrOi236b5ngmjauWZFAIyWW5x9u9qEHiDdSpOXoj
 MKY7uxl59cC6tGJcWSQrVRj/HrIQbGINYA==
X-Google-Smtp-Source: APXvYqw1TN7W5aFAziReoe08suaPboV43HRmlHnfJk5DoJg/Ts8mwY2EPNd0sVHWNVgEmFbws5aJ7Q==
X-Received: by 2002:aca:3645:: with SMTP id d66mr6635253oia.64.1560002657470; 
 Sat, 08 Jun 2019 07:04:17 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id s1sm233288otq.28.2019.06.08.07.04.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 07:04:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <30a408b9-9419-cbee-5abd-7b0354ba53cc@linaro.org>
Date: Sat, 8 Jun 2019 09:04:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH 16/42] target/arm: Convert the VFP
 load/store multiple insns to decodetree
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
> Convert the VFP load/store multiple insns to decodetree.
> This includes tightening up the UNDEF checking for pre-VFPv3
> CPUs which only have D0-D15 : they now UNDEF for any access
> to D16-D31, not merely when the smallest register in the
> transfer list is in D16-D31.
> 
> This conversion does not try to share code between the single
> precision and the double precision versions; this looks a bit
> duplicative of code, but it leaves the door open for a future
> refactoring which gets rid of the use of the "F0" registers
> by inlining the various functions like gen_vfp_ld() and
> gen_mov_F0_reg() which are hiding "if (dp) { ... } else { ... }"
> conditionalisation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 162 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c         |  97 +-------------------
>  target/arm/vfp.decode          |  18 ++++
>  3 files changed, 183 insertions(+), 94 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


