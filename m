Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E21C07FD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 22:35:11 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUFtl-0002SV-Pp
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 16:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFpi-0006hu-RH
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 16:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFpe-0002sF-RD
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 16:30:58 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUFpe-0002pw-9n
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 16:30:54 -0400
Received: by mail-pg1-x544.google.com with SMTP id n16so3431824pgb.7
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YErNcQ7OHQhvw8MS5JYWDwdtcZ9JepAj3kq5zFzWVp0=;
 b=dzHq/rZSJVpNhL/+jo4A+EvvyF2rtaTSUyDZ3pAe3DF9k+elPW+i31sbip5EDQp7NK
 rPII/cp6TmWLM0jySlNqlmAClCzAq7cg2uWSVCcJySFM94XT6YCw7XyA3XSfxJ/9prGW
 vBzwN3adzSYkYD40uXZCZsmMIKJEnSvvyU3/uGPoYCRc94/aCvbAm59OpB5Txe3nsMo/
 NpF8RC2nh7ntCI4JSMnoGeS/bSZOb8M7s/u2N3ZdzOaxRob7ojJMF/0mi54aG4gg0KdO
 b5bI5lVfZhaGgz/YMWcWAOHYfzOUnK0W9awEvr3Sv6GWW80dPevybl+fZx5wzzD4rMbJ
 cLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YErNcQ7OHQhvw8MS5JYWDwdtcZ9JepAj3kq5zFzWVp0=;
 b=C9JC6fqVnLJfmF9MF5JJGzvmvqjXGMPOGhwRFqZOYUoVoRf7Onmo2fHJVs7iT193EN
 7TSuvJiLkWxL8OA8PNCS538holZreKyHc8VEhpcuHRDvWHUTx1ArxGuNiVwubNnMj6xO
 n7o4PhDntvS6jK60tEFY9O5c08fJciUlrI/9A4KU3Ait0+PbyoDQx8vF5Ox80YMxJBYa
 AMifZOPWwLsLexK71AmrvdN+ENYcp5hXpgi/B9wdXJHPH/1S96xB6nJjxHv/kTll+CS1
 +Uan43yPkkvI5updRbwKfYc7PI++W0ITWfLkqRiACV3CiVvzSFjrkCldO49K2vQPDQGL
 kRkQ==
X-Gm-Message-State: AGi0PubN3F/uvgEzzbB7I4U5WzYmduzm4GAb27IkxPghha0Jhdo6PM0g
 kzf5bRvtqFz9cCRjCpPEyDsXGkEtMGA=
X-Google-Smtp-Source: APiQypJ3IHOb6yToLfmgxYgWyx2RFPp62GyX9jGI/lpxgkk+KdVwzjlC9zYbhPfswN3+QZ8qrjVwFA==
X-Received: by 2002:a63:6f07:: with SMTP id k7mr799755pgc.274.1588278650108;
 Thu, 30 Apr 2020 13:30:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id g40sm528068pje.38.2020.04.30.13.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 13:30:49 -0700 (PDT)
Subject: Re: [PATCH 21/36] target/arm: Convert Neon 3-reg-same SHA to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6249cdee-9815-83f0-c15b-0441d59904dd@linaro.org>
Date: Thu, 30 Apr 2020 13:30:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::544
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

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon SHA instructions in the 3-reg-same group
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 139 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          |  46 +----------
>  target/arm/neon-dp.decode       |  10 +++
>  3 files changed, 151 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I have patches to convert these helpers to a gvec prototype, which will let us
re-use do_3same.  I'll fix that up when I rebase on top of your patch set.


r~

