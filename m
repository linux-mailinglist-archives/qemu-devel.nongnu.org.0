Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A74310D7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 17:07:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWj7m-0000y0-14
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 11:07:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWj6R-0000CM-U0
	for qemu-devel@nongnu.org; Fri, 31 May 2019 11:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWj6Q-00058k-SO
	for qemu-devel@nongnu.org; Fri, 31 May 2019 11:05:55 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41580)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWj6Q-00056w-N9
	for qemu-devel@nongnu.org; Fri, 31 May 2019 11:05:54 -0400
Received: by mail-ot1-x344.google.com with SMTP id 107so3674486otj.8
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 08:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Mfz6prEA+byB5VGzrN8CXud7UAg4oh0v+4OY4l+LHvg=;
	b=j+ocbAEKZr21W3wjk2Yajk7OnIVDmAWAxIfQP8TseEr1vpEPnhmCQkK7PwoSArdXkX
	ycfht1ex5ZnglxDC0AlCJgHO2IiIDkMYqyqPs+BWmi9Pif+R4SkfXnSZBVq6UltA+AfY
	d/KcvcDRSxvzYZWhfOXyR8xWwkxBYXcGs1hnRGAzDMSIHdwadJQgQuvrZD5qCNSMuesv
	BC6OZqiazFUQhTKBwKe7z2MvdDEic7S6h18a+SUB23TuKivP/m890xkqMMPpj3p8OZ3M
	9nxJ/3Qn2agxIvL+VVoGtGqtmYVygBnYtlYM0bn42ey1wpTCzvzSc6b56Z9kp44j+Ng4
	H9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Mfz6prEA+byB5VGzrN8CXud7UAg4oh0v+4OY4l+LHvg=;
	b=JgeSmDQ9q8Ip4Vons/yd4eOc984az61dA+TH6XP2E9mQifds5MqS6X9Mp55c6rMC9G
	kpbHsnozHbXFspLiXAU5I8gq5S2+wXCXfaUthvez2kE7Do53mW9ZuxNZeLdL7ewRglHR
	DaVk+aJ2lZdePtuu4Njs7swWKoxDuvBmWIytiC1cwIZFTvG9deC4HXi2hHxGQFuJXGJe
	OHjgdCbJMle20I4R4mY+hTX9oxTAX5HH4py0DtZuJOU1LpBfLMRtiqRuUCxdmy9KbKZh
	oFmrSC/tZQZHr9G1EEPVGPNlDIWNEA3XHsXimEuecffpmJ3LNBoqpwP01qaDVZUUpMwB
	ni4g==
X-Gm-Message-State: APjAAAW2OkULJ2DRL83gOVVNaWcFFApRXKzs//kcmPHksSAmEjE3pqHJ
	X1G0clMxawZMtUUd8TPvIQ3bvQ==
X-Google-Smtp-Source: APXvYqy+wQWa+hpyNxtXE3uNk83PBGGg+soUFljUtaFP6B/aD+zDyZLwMWHr/G9wFNc67lqTviBOPA==
X-Received: by 2002:a9d:7b4d:: with SMTP id f13mr2095699oto.84.1559315152675; 
	Fri, 31 May 2019 08:05:52 -0700 (PDT)
Received: from [172.24.12.210] (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168])
	by smtp.gmail.com with ESMTPSA id h12sm908571oti.71.2019.05.31.08.05.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 08:05:52 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190531145608.28183-1-david@redhat.com>
	<20190531145608.28183-3-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <399b78dc-8a1f-65a2-2e00-15460dbbe4bb@linaro.org>
Date: Fri, 31 May 2019 10:05:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531145608.28183-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v1 2/2] s390x/tcg: Store only the necessary
 amount of doublewords for STFLE
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
Cc: Stefan Liebler <stli@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
	Andreas Krebbel <Andreas.Krebbel@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/19 9:56 AM, David Hildenbrand wrote:
> @@ -678,7 +678,7 @@ uint32_t HELPER(stfle)(CPUS390XState *env, uint64_t addr)
>  
>      prepare_stfl();
>      max_bytes = ROUND_UP(used_stfl_bytes, 8);
> -    for (i = 0; i < count_bytes; ++i) {
> +    for (i = 0; i < MIN(count_bytes, max_bytes); ++i) {

Before the loop, please put something like

    /*
     * The PoP says that doublewords beyond the highest-numbered
     * facility bit may or may not be stored.  However, existing
     * hardware appears to not store the words, and existing
     * software appears to depend on that.
     */

with that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

