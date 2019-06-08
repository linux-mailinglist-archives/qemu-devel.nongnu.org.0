Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148153A185
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jun 2019 21:36:41 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZh8o-0003Js-9R
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 15:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37251)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0V-0005sQ-TV
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0V-0006cD-1J
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:03 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36565)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh0U-0006bc-RE
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:02 -0400
Received: by mail-oi1-x243.google.com with SMTP id w7so3720458oic.3
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AqWTO84CoZZqQVo9Gojt18pAYy8RmxrkX+dffa758ww=;
 b=MdGMpXbjGasSHbUx2av+qS5L6S1490xPlmwyURp1VLqW2LGEEFKwifmHBIJKB8b7bc
 LANDY7GSdzlQiOC99rTxfXxkTEbhXUm6moc8cG7+vKFV1RCsdGd2vwt5vNi2u/6bNpuf
 hh4FnegvAmMttrIo504B0bVXoJX9uzauPSlUmxbJWs3TtCi17pHA9wyKZxnu3jKqjZdV
 vxxdrFibgsSo4b6YhLlALSfRrv668xbt+HsCfVCuhsPIWwKOmu+wmHcv9krXFGnL+lVD
 NGnlIMBrPKZmeoPI6rLp467QXZX79y/P/kRdDsnTlj2aALfrLYLNylbwB8n1XjaIzyJY
 IAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AqWTO84CoZZqQVo9Gojt18pAYy8RmxrkX+dffa758ww=;
 b=j7WB4+SSfkG2gdqJqH6HOHLomK5rn1Yt9jNXQ7ydivbLLAhYCl/elIMPBPdtpwyV+Y
 r7Z741HWCdhEt46mgVGDm2yzs7PWQ2oD3U6oLlytYj8Us75h9fp6xgSlxAv3r6vh33t0
 TpqvqXd3vI8MGEer0n59PWRyrcRDUPI4VWwG18M04IRi2LiCrgLFqB+6QvLm0IRqxX7V
 BwA1fC1FjDo06XoXu2yGiC0WMtlvYBKtiz6cDBqSWbZgAAgO6HXIfGup+7x6k2kao6CY
 2XZ3WUtuKBY+AAnfqvQ177KO3jPcJNh+miOPC+W8bhUCX6wRHBJUkqsxutzAVFrJg2aA
 ozDw==
X-Gm-Message-State: APjAAAVmvEV9xhsdQp2YLHDW/kYmcFKj2giUddNuKGtI+maIlI/gCjuc
 q8mInjuDLyu67zK8HbK+yQHIaRSeN0LZHw==
X-Google-Smtp-Source: APXvYqzVXtWP4O1Z5LjQsAtRc1bnpXjyF3vKHPoSRdV8PcIcMRb6OSl705lXa8KdpeJFytQ0hsQPug==
X-Received: by 2002:aca:bd89:: with SMTP id n131mr7683054oif.91.1560022081441; 
 Sat, 08 Jun 2019 12:28:01 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id 3sm2123833otl.42.2019.06.08.12.27.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:28:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4d24eff9-dfaa-ccca-9fc1-e324b73f1133@linaro.org>
Date: Sat, 8 Jun 2019 13:26:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH 21/42] target/arm: Convert VFP VNMLA to
 decodetree
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
> Convert the VFP VNMLA instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 34 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 19 +------------------
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 40 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



