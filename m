Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB97D1B7FC7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 22:07:18 +0200 (CEST)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS4bV-0003Mo-5O
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 16:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS4aQ-0002lo-N4
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 16:06:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS4aP-0005dc-E1
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 16:06:10 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jS4aO-0005XU-Pl
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 16:06:09 -0400
Received: by mail-pf1-x444.google.com with SMTP id f7so5310429pfa.9
 for <qemu-devel@nongnu.org>; Fri, 24 Apr 2020 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EOai6Y7Bud3CLp0tY8BMjTTGW/H5DO96v/dRgMwf5Ho=;
 b=FWwMcNG2mL48GLdRZAxvszXkTvz42Kpj1X8BOcyuQhcmT3LbW9yWL1GedAqTtHRokh
 YvjcZZOHpcczJr3Buch0xUvUesZddJn+OShFLkUmPf9GqBZm/jYNk943YIHULc+1f39Q
 wqUN06YSD09Jh/zgw3C6Ex7GWBs+K+CoecmyN2T0mFVUtlF+zPyRi+JWMBTYFk5N2ym3
 JWzJHuA5J2TPttze3ae7GYTEyg17Nxfh4ovSmhVdiL3sjz7O+eNZ3apPhVwfKXoZE3p7
 Ykkvrc1O1Esd+yt/Ome88MNQjDY3Tsh8MNxpyhP8z/5nB0XkIq0xOHiS+0M0DArEcYKD
 83Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EOai6Y7Bud3CLp0tY8BMjTTGW/H5DO96v/dRgMwf5Ho=;
 b=OhDXnnbHkR/skWYZK5iAjqh93pfoEKc3uT4DyHo4T20uEHqDUhLb7K9B+NUJhGWhlL
 HaOgZthfXuL9pawGNBKvifQD0CvxygLNKLAW/F5fkUKmbom4FtK69B0CkvZn4id9KkP2
 zveOQtggeWF2bzZxnUiOHg6/nyS4NSCLg3xa/FPHujcIeLYAIcMtbjCkRCgUzLNP2fjn
 IPk2iQ2boCDQq9G04Pm3H1giwsP2HTg/rCE/yt1M9urYJWTeytR0o64yrWmnAWq7RYN0
 lgEBiZSz8liCQ386sh1QYrHylZTfGfWU6OfF77WOTVWK270SSbpfCzmTcEYc7XRJgGsc
 kUzw==
X-Gm-Message-State: AGi0PuYgEmufy7bJ37ZT3QHejBeRekewClVOIgIDCQO97Ezi+FB63X9w
 BgW+ah5XSleNHfP2FXn0HVmiUw==
X-Google-Smtp-Source: APiQypIHekcJ2dLViEP8RNBA+yGeCDbADzNo6iXl9ycZMTzje4lZLSwZlJK3WllzCNkUmsblqhFIzA==
X-Received: by 2002:aa7:991e:: with SMTP id z30mr11736833pff.243.1587758767114; 
 Fri, 24 Apr 2020 13:06:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id o21sm5240530pjr.37.2020.04.24.13.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 13:06:06 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm: Implement SVE2 scatter store insns
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200422141553.8037-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fa86c71-90a3-6410-c53c-93658099fb59@linaro.org>
Date: Fri, 24 Apr 2020 13:06:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422141553.8037-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/20 7:15 AM, Stephen Long wrote:
> Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal store
> insns.
> 
> 64-bit
> * STNT1B (vector plus scalar)
> * STNT1H (vector plus scalar)
> * STNT1W (vector plus scalar)
> * STNT1D (vector plus scalar)
> 
> 32-bit
> * STNT1B (vector plus scalar)
> * STNT1H (vector plus scalar)
> * STNT1W (vector plus scalar)
> 
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> 
> Cool, it seemed to typedef correctly.
> ---
>  target/arm/sve.decode      | 10 ++++++++++
>  target/arm/translate-sve.c |  8 ++++++++
>  2 files changed, 18 insertions(+)

Applied to my SVE2 branch.  Thanks!


r~

