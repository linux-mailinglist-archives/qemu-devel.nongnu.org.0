Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80722AFECB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 16:35:55 +0200 (CEST)
Received: from localhost ([::1]:51670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i83ir-0006nl-PE
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 10:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i83gs-0005da-91
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i83gr-00083U-2S
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:33:49 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:41874)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i83gq-000834-T5
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:33:49 -0400
Received: by mail-qk1-x741.google.com with SMTP id p10so2996234qkg.8
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 07:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x3iyPwle4tJSzlcqPqOvcVP9WBz+Qjb7i4mIGZc9glQ=;
 b=WbCb0yjPRrFaDn6ixON9zexQQdWK8o73RcVHXGKkY58b/zUGHI9SsD9rRg2533IaOf
 Kn445AiGUSGFY+Fvo3wdolW2NpRW1UAmThQLn4yHooiqxBfw0jjqkvqctvs4pVoHfKOs
 VBIKJSYvtO0OXtOT24KmX44Nd0qkuudPXPokIiV17DjjNu7oKTLJNg3CpsASV9+Scdcm
 GhtIChy+LPxIt2t1cM3TLcwOT31oQDa4vbFGxB9ncJRHEEfwwWzBdir//teckkfMEgBs
 L6YSYD493hF9v1wnwQ2FUJHmET/CJXITR+zM/C+nc6Pceeyox/A6uIRkUmQII3yYBTPl
 zDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x3iyPwle4tJSzlcqPqOvcVP9WBz+Qjb7i4mIGZc9glQ=;
 b=CGHX4HoTeThAIhs+a/GA9zB/u1lRHK6ZUGMLyJPlSrnaLLn258IqPQIPcIJhqGo/jn
 JeTZK2DGznxG4b/BKQdEiLKwF3lzjgjW15nd5uEdWmOUNeDjWLRSvI6Bbgif71ROqBAg
 KQstoY3WTezKVq4B+D375znAPycq4C8DscoELKaRJFYKTZJv50DqlGY/Sjsc/d4HGs4Q
 +cgYAvMCVbq1zJsq++q3QADv766sQGDzTF2n1yoF9SSUVL8p/1WwVdzP2NHpzOHxQzzt
 0Rn+jTlFl3gXUpOdA7OpexKZPK8XFLVjuoG5HK2rGTJvV6ILLMuFj/KvZF3l+ZtkMrcO
 v/7A==
X-Gm-Message-State: APjAAAUb10eVFP5sQdpTmWUIPEi51dEUDoLLNtoWwRYY4f9LNpGnzyDN
 0GQCIJsazGH126x4rNX3Dtnwkw==
X-Google-Smtp-Source: APXvYqzrH7uUhX4Mrr4YVzlaOyqasX0QedSD0PvIbWbQqnWkcp4xdje7BqmgTXN4YrOBpNvWzsXGtA==
X-Received: by 2002:a37:ef16:: with SMTP id j22mr31050565qkk.198.1568212428056; 
 Wed, 11 Sep 2019 07:33:48 -0700 (PDT)
Received: from [192.168.5.185] (otwaon236nw-grc-01-64-229-69-35.dsl.bell.ca.
 [64.229.69.35])
 by smtp.gmail.com with ESMTPSA id v2sm6762158qtv.22.2019.09.11.07.33.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 07:33:47 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190911093951.6244-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8f76ef47-0cf8-c662-0100-d416f5f2e0c1@linaro.org>
Date: Wed, 11 Sep 2019 10:33:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911093951.6244-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-devel] [PATCH] target/ppc: fix signal delivery for
 ppc64abi32
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/19 5:39 AM, Alex Bennée wrote:
> We were incorrectly setting NIP resulting in a segfault. This fixes
> linux-test for this ABI.

Perhaps better:
We were incorrectly using the 64-bit AIX ABI instead of the 32-bit SYSV ABI for
setting NIP for the signal handler.

?

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/ppc/signal.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

