Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E49F89F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 05:12:03 +0200 (CEST)
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2oNO-0004fg-RA
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 23:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46465)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2oMK-00041X-LB
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 23:10:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2oMJ-0006UE-FA
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 23:10:56 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46117)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2oMJ-0006Tn-60
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 23:10:55 -0400
Received: by mail-pf1-x441.google.com with SMTP id q139so681572pfc.13
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 20:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I+QiUqgQsVXZ/r/D2tHrlqgwKL18nj0KcCB57zun25k=;
 b=UUxqW/6BwnInCs1XWRl/+yxST8ctOnYqNfHGCIDZHEwwoHjwY8PA85T0jxb/XS41zX
 6iZT3k/lemX8izQhRhz8aUR/NzRshGw8bxdZ1JU9N++xm9CPnRLoForr9zyqFpoesicR
 w5RKLWFXL1VCmDFOF3fmvVPeeO8Dtc1FUn9Nt2FpzlG5CW+GRY9z9n+6q5fyDoPnbvFU
 BXVsdbAOu98MWo3FCBHAA1KyoPqV1EUjShMvG1bhDkPJIW6n4d/fxYc7KX5DEcRf38N0
 XD0YSfLImfrVCeUKNIxZvjc5BZoETZxXDogVMQHfIGUwLuDr1/aCM+MEhDU7OErg/a1B
 X88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I+QiUqgQsVXZ/r/D2tHrlqgwKL18nj0KcCB57zun25k=;
 b=ebZda9wzxQzPY+v28sI/67k1/165x/M58bNLdcEmknz0iEiV0dihsm9pBzU2D8sUa8
 HYVWWNmspGbwL9bHUDpjiDUllk4hKS+VlARSLHlqurPWojKjDPYzgU7DKCw2hsUmznBn
 XdrH6n9X6+XdVdAUU22n/30KW8Sr0CBnbg304y5MmLYmWpBLN7/yMfElGppf1iiuUhRq
 UK+9SP4vyTgIY0dGrypORwAEyTtpyWNcnjt6faZ+6bz1bfQseK7C36TOwkrworY3iWmE
 +SnFa1bS12hsoZ/RHFReYuln53Cl08qmPXiFhy3IbP047K16jHmJwMRAGO8QwEGRuaFP
 d82A==
X-Gm-Message-State: APjAAAV9xITRAF/FXFfvTaqHRZLpHmQZDz2JEheATnQ9voOayA+iQ5mP
 oo23HYlixJgh2Qhwmi8cIIUr8g==
X-Google-Smtp-Source: APXvYqzw+WK2anWraW5tqFy8rX5iEtVNIy+HjdgYENNba7h9jChmZ0sV6FKNf7zPGdX63SZWehZBOA==
X-Received: by 2002:a63:b919:: with SMTP id z25mr1492730pge.201.1566961853769; 
 Tue, 27 Aug 2019 20:10:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r1sm661219pgv.70.2019.08.27.20.10.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 20:10:53 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190827121931.26836-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9a489815-8cea-02a3-d890-38a0ae0c486a@linaro.org>
Date: Tue, 27 Aug 2019 20:10:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827121931.26836-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH] target/arm: Free TCG temps in
 trans_VMOV_64_sp()
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/19 5:19 AM, Peter Maydell wrote:
> The function neon_store_reg32() doesn't free the TCG temp that it
> is passed, so the caller must do that. We got this right in most
> places but forgot to free the TCG temps in trans_VMOV_64_sp().
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

