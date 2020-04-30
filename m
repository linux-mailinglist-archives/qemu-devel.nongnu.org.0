Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0183D1C0741
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 22:02:50 +0200 (CEST)
Received: from localhost ([::1]:57582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUFOS-0005aM-Vd
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 16:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43698)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFKd-0002Pv-L8
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 15:59:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFJy-0004P2-D1
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 15:58:51 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:38244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUFJx-0004JO-Na
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 15:58:09 -0400
Received: by mail-pj1-x1041.google.com with SMTP id t40so1329680pjb.3
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 12:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bYlvKgEzmRNDYFEqNVZita7PZO8B9rfPaCVow3Q1i/g=;
 b=haoKsyGuKRoUN628rdJJxNVSDEBwbpcG/0qwMBF0Am1rVEUgWAEQ5ytqvPLllp95ho
 K06QELd/ndUaDqjtCPmqVhJDX2UCXrFS6Tl62sthl4PC2OSe6le9BgmFZV/7arE7yAz2
 jWR2da2CTnC09saBw0s+7qxOAPf6kXVnNt565VosumRQ8jlj4D18kdMVBZALY9jEPYlT
 vS53dvxGZrk9tVjyXG9owNcPQitQxfQs+KVy8C6pymCSxQmrZ/Vhsj21yNA0t0+ocwcO
 E7N+u9WrvZsqn9utVd6kMBFRSWz4S9LuvWvXQ6lsDfA3yxqTh4EpaA6cF3G2d2I2sE3q
 t08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bYlvKgEzmRNDYFEqNVZita7PZO8B9rfPaCVow3Q1i/g=;
 b=hQI+uMzhuaqi6mK8jxfsMQ+oel3FYcfxAStbZHr9h/AdtQW9GSLdJbozvKwkiweU+L
 amjlbzej/JhkXhEtHcXfyAjMSx+w/qBPJ77eZ2q2INyyl/8Z07nwZOqdFp2BAqAch9Ef
 e3S5jj5CyX/4shNXXbhwdtdw7Q5gEfNUWVgfA7TXW6aVw1ojmXRv9YsGUf9x/wQ+HLW3
 OtaWKM+Mwq+hLpbrLsyEDD0pG/orxcUOfj4LqnIQiCH5AI6nWBghNkgxDJFuIEVM0S34
 zMAlp8qLQXc+GPBRcW27moEu6mbr2heCCPFR0y1cocRZU3PBJaVu41SZpEzKoDiLu/+c
 V7pw==
X-Gm-Message-State: AGi0PuapxXEYkvjgdI+zbrYwStQOfzwcuyjZ272qFL8emeHDJapGsn3C
 CFyhjcM/d3kpXCAhfF+BCI8cIXWu4NU=
X-Google-Smtp-Source: APiQypLeAjiOMyxEHeKA3dm4INa+QMRsgL2w7/sLi3WROStF3RSlfnVXCm++AJlFXl8D15ydN0bIpA==
X-Received: by 2002:a17:902:d203:: with SMTP id
 t3mr670808ply.136.1588276687700; 
 Thu, 30 Apr 2020 12:58:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id c4sm486857pgg.17.2020.04.30.12.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:58:06 -0700 (PDT)
Subject: Re: [PATCH 19/36] target/arm: Convert Neon 3-reg-same VMUL, VMLA,
 VMLS, VSHL to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb7fa3df-362a-1e3c-1fd8-00eccafd4968@linaro.org>
Date: Thu, 30 Apr 2020 12:58:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1041
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
> Convert the Neon VMUL, VMLA, VMLS and VSHL insns in the
> 3-reg-same grouping to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 44 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 28 +++------------------
>  target/arm/neon-dp.decode       |  9 +++++++
>  3 files changed, 56 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

