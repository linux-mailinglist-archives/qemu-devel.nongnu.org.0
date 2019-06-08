Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEB33A008
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jun 2019 15:48:37 +0200 (CEST)
Received: from localhost ([::1]:58532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZbi0-0005q1-8T
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 09:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbgD-0004tR-6b
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 09:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbgC-0002h6-9o
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 09:46:45 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39306)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZbgB-0002gH-IO
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 09:46:44 -0400
Received: by mail-ot1-x344.google.com with SMTP id r21so4445540otq.6
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vZo7nzAqRjAizPJNgAsuN4rXu4QrALKrYOTntgEhOZs=;
 b=BSl3HNDz9VtOsubWVBEpzAMLCd/B0xNZ/+zvhOEv0MG4aaRBLhkLVX47kELYG7B2jM
 4Y/KyCONn+9NdXuVCxrYuEAOdgKeVn9Y/kqlZoP4Vw3slnNLN9ofbpbQbRo0Y5hx1vLp
 izN/sWWxPZyJyUDQ7OWc8F8NXobto0HCJIAHNajuFoMHInKUxLhaeuj8pzdaRSp17DHX
 VxLUKBtHggfbO/I6CTmD6T9Mn3l2Dt8Qyrq1v8uLrvLfI7YtAQ1zIKzbDaS3WhVpDpsp
 EVsC2TV/oXxFrjEuau9qoXQEebl6rdV1wypWYAfWoEx1hNG3W90CFtyzgydP7IXya24Y
 nL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vZo7nzAqRjAizPJNgAsuN4rXu4QrALKrYOTntgEhOZs=;
 b=RdishQfLeu39YI5lGD8J3l/0UnvRjbdtxRXK9suBv2uhkkT2URgjmolat9SEUmNvWW
 KiODtAWzIBMI68cevZnJ9zZ7fmpckI0qax7Q7I4PK8PxktIfLXLE/cREIyLHi/ILuqeH
 T7hgFP4DN/n+x94UzzY/NYzLzgaB7sOZ8yGKKkphYCvil0pVH9jE/BKQTJc4/iF7EHuv
 ER7D2etg2MMoULT8RJ3IUcwGEC96wm06liqPf7jyfYnh1qtY4/RP0T64uYWvOKI57ghg
 qKxs8k1L1LB+CEEdhFKNdLyjsPR1PTnQuq5i3Ta9XoI01HFLC+UE8KxARh6DBqYHPfeQ
 Cn9g==
X-Gm-Message-State: APjAAAXfSfUrgyQNcd3Jgcg8sEK3Isvd7oAa8vi/GgGb+9G0eK7hdGQg
 4zzAJjGNgTLW0tZmoyWafn82Wij/aeM1ww==
X-Google-Smtp-Source: APXvYqzjr7mp5/W5hNqoneYPRnXtFES0UVMqTdn4ovn8zBl4MRq2+4Xw4j9PGpJpSRLkhMy1QCBGgw==
X-Received: by 2002:a9d:32a1:: with SMTP id u30mr22464552otb.371.1560001602335; 
 Sat, 08 Jun 2019 06:46:42 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id w14sm1900239otq.1.2019.06.08.06.46.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 06:46:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8648d40f-7418-c3ea-3f01-c11dcbd2bfde@linaro.org>
Date: Sat, 8 Jun 2019 08:46:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 14/42] target/arm: Convert VFP two-register
 transfer insns to decodetree
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
> Convert the VFP two-register transfer instructions to decodetree
> (in the v8 Arm ARM these are the "Advanced SIMD and floating-point
> 64-bit move" encoding group).
> 
> Again, we expand out the sequences involving gen_vfp_msr() and
> gen_msr_vfp().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 70 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 46 +---------------------
>  target/arm/vfp.decode          |  5 +++
>  3 files changed, 77 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


