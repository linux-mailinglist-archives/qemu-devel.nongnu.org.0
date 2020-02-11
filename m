Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1518159764
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 18:57:27 +0100 (CET)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Zmo-00027j-TY
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 12:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1Zlu-0001Lh-Ll
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:56:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1Zls-0002u5-Kn
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:56:30 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45852)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1Zlr-0002rC-4m
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:56:27 -0500
Received: by mail-pg1-x544.google.com with SMTP id b9so6094592pgk.12
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 09:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+F5RQ9fdxUNhxmaGL+nDnRhByg+Lsi92qLto9aGj4xo=;
 b=GyhrzV66LmpzSvvlk4inzqPxzZftu3ND9epSxyGFwRfhZa0l5ez7WfXNerGWO1zRRZ
 cnN9oyyH1oRRWVzAoU9couDgOQpdOlZn0Tm9jS+qFqbfToVaUWFd+/lTVBeGC7PX0uvp
 spUavsB5maKPAo2pZX5gLklb243AcU//7rPtm8sqT5Z140KU0FMaSqH/K9HGFtBzz9XB
 Gqh5HkIoStDc34YFsD4jFzvWSSOu6BXRwkrFq3ZDBhfjL9/KO7SFZDKqlKefBjd0LJ+f
 p+Nq+uKmn+a2ZW2uwyaYQfKw7vM/A9DyYtMRocI0ifa7CuC8jzKkc8BJeEXV/UXO0CCD
 M9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+F5RQ9fdxUNhxmaGL+nDnRhByg+Lsi92qLto9aGj4xo=;
 b=owQdmYEG789eXXfOQ5SaVGaMNMqvTw2ezyXNl/x9Sbj2WvBIzz4J3MF2ii110JJLcS
 o9L8S5Md21Ct6sG3BAsek4Y2ZChN6f0CTUVclj5d34iNQy1/DRRPs1d6/Z8j6H6KUZsf
 wblcxi1V2JEY40ngaw8AYDGntT+vVnaXJ6180BguiiijWGmYTLQT8OIaWviokJpGzvLi
 leqffnKk5yi6CzO0v1XgMYyvwhGfHD1RuRmZH1uJF5lJhksY6ItJhKLQT9iCN9ic5jiL
 7Gt0oCHYKpnYkF7SSJnMiSrHywUkDOn5DQpx8bAsfN1/dyP89+II7LSOWkBw/eLrsoed
 XJ0w==
X-Gm-Message-State: APjAAAWBAW+U96Z8AsSJz5gMS4gQhiaQ5kEn5IlZIPgN6tddmxy1RC/e
 AGOWVAXra9PSf67qufHPSYEiWw==
X-Google-Smtp-Source: APXvYqxKThj+KlzdSRZd1YQUmo5z4yDp2QKZCkfo9/BMmaCFfNmKNSIWV2Cd4NqjpqF7Nta2FijadQ==
X-Received: by 2002:a63:f54c:: with SMTP id e12mr1613797pgk.181.1581443786010; 
 Tue, 11 Feb 2020 09:56:26 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z16sm4773212pgl.92.2020.02.11.09.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 09:56:25 -0800 (PST)
Subject: Re: [PATCH v1 2/5] plugins/core: add missing break in cb_to_tcg_flags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200207150118.23007-1-alex.bennee@linaro.org>
 <20200207150118.23007-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b4406c7-41e0-dd55-1e04-ac79c3ba72e5@linaro.org>
Date: Tue, 11 Feb 2020 09:56:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207150118.23007-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
Cc: robert.foley@linaro.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org, peter.puhov@linaro.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/20 7:01 AM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> Reported-by: Robert Henry <robhenry@microsoft.com>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> Message-Id: <20200105072940.32204-1-cota@braap.org>
> ---
>  plugins/core.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


