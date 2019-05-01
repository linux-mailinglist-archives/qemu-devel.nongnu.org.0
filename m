Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C974810DD9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 22:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLvhw-00017t-Pd
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 16:20:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLvgv-0000cN-E8
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:18:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLvgu-0006BC-C6
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:18:57 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36015)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLvgu-0006Ad-2k
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:18:56 -0400
Received: by mail-pf1-x430.google.com with SMTP id v80so4499273pfa.3
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 13:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3wIBTFOfM06wCjbYumHhumaEncB5CotptKbheOQPwww=;
	b=KBryzJ98SCospX6ukCegpa4xYEerbStXB/eE1/5nWC0zH0RDZn9SL7XnxJdWs/I0X4
	Kw7hY9fxobRcpVty/cvFGUy9WRiXqRzl4yCI/CVflJ/kkXXJT0IZL7oK9raegWEXNRkS
	gJdTM626FQPaA3Lm8n34urr1m1hZlFbA9kk1zB5SuzBVLhORnOJ8n0fRNR0eDT3ESSiO
	MK3Serpf16hJjk9i9GsrLcHxF4IU//A72COUpyVwb1A4Dx47vsT/d/8BISMG7t6jsH0/
	zEM62+XDQ9yuaHcglGXviBleA9H25SNpjJHS9cQUrykn5UKkcCxCVGmYYY3G+03YzMCV
	ipiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3wIBTFOfM06wCjbYumHhumaEncB5CotptKbheOQPwww=;
	b=uT11qz5gZEcsjUWTkHmORKrEoTPEB2FiCdcuErWBb6Gt20fXNJoLtFQfXrvsMH5xHx
	KKBl7F/SwZMT77QAID4O9+Z6KWPY40AQDUfpLurdIb+4eGWlNIFP7TKh8XA51imEdhf0
	7PwcVWx2SBm5ZW6AYJsAR+g1dUiZzIwh3kpW3noonJ8qL2arQQeaLXGJilAb0P/+/Yqo
	APl7weMdDf9yhqjIa1uqvzfgwMTtwPiPy6VTINJF7Z/9h6fW14Xf9kd8Z0XvbUa/9/EJ
	LU9PjRnNnNT41aqifBA0rVgTOKIgtWuAG3sLr9Ydik+V9lYztzeJJY1PhZnz0tQ1Ztlf
	ql7Q==
X-Gm-Message-State: APjAAAXLs11Jh0bNT2Yy+qG96LmK5G8TM7z57lR1Rz6G97Yj4Ysuiy4l
	DN/VPJ/tHgNDVJdNeWOysGKmAoPD9YE=
X-Google-Smtp-Source: APXvYqzy3VJsFvggLFZSRLWnw7gvLSqc2DqjxzbXkzlEP0WE+hjLueWgxPSw1n7YlW7Lr3SD1Yc2Xg==
X-Received: by 2002:a62:be13:: with SMTP id l19mr31552064pff.137.1556741934473;
	Wed, 01 May 2019 13:18:54 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	o66sm49286407pfb.184.2019.05.01.13.18.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 13:18:53 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190501050536.15580-1-richard.henderson@linaro.org>
	<20190501050536.15580-8-richard.henderson@linaro.org>
	<87muk65bat.fsf@zen.linaroharston>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <12699c3d-3c5e-33db-ba6f-53f533f8ecf8@linaro.org>
Date: Wed, 1 May 2019 13:18:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87muk65bat.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::430
Subject: Re: [Qemu-devel] [PATCH v2 07/29] tcg: Support cross-class moves
 without instruction support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/19 10:34 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> PowerPC Altivec does not support direct moves between vector registers
>> and general registers.  So when tcg_out_mov fails, we can use the
>> backing memory for the temporary to perform the move.
> 
> I couldn't see where tcg_out_mov fails in this way for ppc, it is still
> abort or pass:
> 
> static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
> {
>     tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
>     if (ret != arg) {
>         tcg_out32(s, OR | SAB(arg, ret, arg));
>     }
>     return true;
> }
> 
> did a patch get missed somewhere?

No, it's in another patch set that depends on this --
adding host vector support for tcg/ppc/.


r~

