Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E10491AD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 22:50:45 +0200 (CEST)
Received: from localhost ([::1]:51894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcyaS-0004hZ-VP
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 16:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcyXi-0003NG-PY
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:47:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcyXh-0001Qe-UH
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:47:54 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcyXh-0001QA-O5
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:47:53 -0400
Received: by mail-pf1-x442.google.com with SMTP id i189so6292209pfg.10
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zTomyDU1mctbIQBnfTHAUSOcVt3h7VxXYP5Ilh3Q2GE=;
 b=cmzYc7qqneJHf44qi4LYwPzaw2d07Ow3YcFcpGOoN0luq9uFfEyv1Hu7WStdCbeZwx
 hX9j8evJX/ZO8eqgT4417smZb6zOh/pO9SfshzUlBPA+RlC+fHG/VUIhy1UX7Txv5gUw
 PfhHn0tXbhzptkk4VKXZq4TzyCqsOSaNrAMG+kvTL6qiNrvxHloua+pLec/LI2crNXvg
 G9RYQ0a/NjxMkHXJdU40dTRDlRFbu9P8hvhXUVrakVgrVo+KOp2DBzHK33EDtxQlL5HU
 VW/1en6zhwx0PbYwdKeukrzzpmOb5/Sb7XS5O2YdQ/P/PLuK9iBYQ1jRrf6s48pyaA3L
 DNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zTomyDU1mctbIQBnfTHAUSOcVt3h7VxXYP5Ilh3Q2GE=;
 b=e9Pc2lQYknE8aKZj6Ah6U7KLfkDAHnX233JK+IIK2MYUzuFauZtkLVOtRzvj+9K1l8
 HF+ZBApi7k0eqQCXltOKen0LUIr/eaRao/mVIhSM+zwJeEAsuNEqatqOpzjOO6d6Oa7C
 tBHSzjsOMPC2a7nZFQUiOdp2b0ECRywb1dFvmQS8yCiVkF9BF1NZ+q/qY9EcA+gilek1
 Frrjq7xO2sRzRukYUi6T/gx57sK9U9vOlit2lO2VCWhUU56Dx00pTWwMVdQQdu6w9xct
 wOqoT5YD5Sh4pTizkMXYPjfEMWKXv5Jg/1w7RuKrmw0kB7NoTAv8YvP4hzQifkxYUqSs
 HaXw==
X-Gm-Message-State: APjAAAWovnJ9G9YKbFzFkC4EvQnRofuU1T0WjHoRtiDtgUJHITHc4+9l
 Z6f9l5p4cvyODiEqcpy5RwGJOQ==
X-Google-Smtp-Source: APXvYqz9HF3W/vqYxzmX/Mu1h8Sv1HWJeh5jRAsVKeEd0+ep1wdikI23caRJzd5pj6xizDpfdX61Wg==
X-Received: by 2002:a62:e20a:: with SMTP id a10mr30468683pfi.64.1560804472660; 
 Mon, 17 Jun 2019 13:47:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id x129sm13180834pfb.29.2019.06.17.13.47.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 13:47:51 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cf1a31a8-d4b4-cc4c-a73b-2afbe002d788@linaro.org>
Date: Mon, 17 Jun 2019 13:47:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v3 18/50] cpu_ldst_useronly_template:
 remove redundant #ifndef CODE_ACCESS
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 10:11 AM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> This function is already under #ifndef CODE_ACCESS.
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  include/exec/cpu_ldst_useronly_template.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

