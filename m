Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C943C10E438
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 02:27:35 +0100 (CET)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibaUw-0002tF-Ka
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 20:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibaTv-0002PD-1D
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 20:26:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibaTs-0003Us-Nu
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 20:26:30 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40890)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibaTp-0003TL-Ab
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 20:26:26 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q8so1800762pfh.7
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2019 17:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DSDnJQRm8/Xsa6TMJHDHoSk7ozREp7nXxct6oFQ8fbQ=;
 b=nOyFpCykvN3q2nqEdPdWZF8Nyk/0MZ8BW/Mxq+DM4mWBwAzAZIQT6qkKxQzQpzlAVu
 BcQC6rVjYUTPenU8Y4SBDeN+T3ooOyfTpYsjrx03DJ5FGO5vxyGEOzivm9xQ5DvNRZrL
 BvR5ffkJtmcdLHQlMXCAbqABABpLCDhMApthoBFdLiYYw+JZRgHgDzv1A/oQMkTbtXyv
 aOue0lyw6Vbss+2DWkCTS9+QB1twIhNDB0QTEEFXCepi8MctUGv8C3wQAAlOh6IhF4/p
 10wIvmGVodA8q4DTMzRRnI2SehwyO+qYsX3/N6Ex8VJn9+hMc/I7zAWXH4rFh0hJYVbr
 asMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DSDnJQRm8/Xsa6TMJHDHoSk7ozREp7nXxct6oFQ8fbQ=;
 b=nr9k7dLQltzD60nfgqI6a0qwRNK/2tEVStoCbpdTnjPeXvGeMDw4WkUpNRXdjvCEbJ
 lyRrWVd7GXLaeZE5GGp8xHlW0l6HDT/2U7HnW0t4KjpENfg1/7ATtGvyGqwzBtDtaASR
 aPjj8J64woy+WVGm9wbNvjZOcRVG19n+Fu2L1KCnvGv+Lfg1/7ooVj2MKyp7ntcAilHM
 qnJX8c8rUqm5Du45j1gYNDMzywTcwCQt2yam5HPsVuRPo5MS+82SgAuySmvLfaVcl0SU
 ORCY+caF1Pu6tYlgcZtqvcCxM330sXKRD6SgOUYSmrv8YfSDFCxeGWGKlMtwjsU7VwyW
 LINQ==
X-Gm-Message-State: APjAAAUHNfcMzQoWHiidHGKP0q3zN9j9/M8bWQAwZ7E2b93buJ4GQTwB
 kaD6GFZ41kM7gOcD+9lp1cBKDw==
X-Google-Smtp-Source: APXvYqyf5Q2bD9JMMY6votMhAvRe7R0zJH1qoUtYDq4UCKwG5vVRv6ANb4lQCLoWdYI13aeIXAoifw==
X-Received: by 2002:a63:fc13:: with SMTP id j19mr28390539pgi.327.1575249982860; 
 Sun, 01 Dec 2019 17:26:22 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r7sm15631309pfg.34.2019.12.01.17.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2019 17:26:21 -0800 (PST)
Subject: Re: [PATCH v1 4/5] linux-user: log page table changes under -d page
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191128194603.24818-1-alex.bennee@linaro.org>
 <20191128194603.24818-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55396b80-3bdb-c15b-e1be-0a4b8222ac82@linaro.org>
Date: Sun, 1 Dec 2019 17:26:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128194603.24818-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42f
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/28/19 7:46 PM, Alex Bennée wrote:
> +    if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
> +        qemu_log_lock();
> +        qemu_log("new page @ 0x"TARGET_ABI_FMT_lx" updates page map:\n", start);
> +        log_page_dump();
> +        qemu_log_unlock();
> +    }

Hmm.  The language used here asserts a change, when we don't actually know that
for a fact.  It *probably* adds a new page, but it could be overwriting an old
page.  Can you find a better wording here?


r~

