Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C624AB56B9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 22:12:48 +0200 (CEST)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAJqB-0002rY-UF
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 16:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iAJoj-00026l-UW
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 16:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iAJoi-00006o-RP
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 16:11:17 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41867)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iAJoi-00006M-KA
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 16:11:16 -0400
Received: by mail-pg1-x544.google.com with SMTP id x15so2571661pgg.8
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 13:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yvDNz/CfsVN2nOjCgSmHOHSwMQxl3elQAvk29umyFD0=;
 b=A9WUHSF7kya0VlRrKOqLn7tpJWuztq5tgHK+rimnSEOqQmsh/zwrdreaL78L0Yyl+1
 jFNSQSR6IKYDzN+muqc3hLFE0DzHyivrHr+fZKEiLmozlimNjJ5jE4/EJID90D6GKQZJ
 05qBOibBRmZzwXEjPQazN0JQ/nfTp3Lyq8ZlmgGPlARGmkQBWQePTde/NfPp/8iES3kz
 l2cSYUvjEyDYqiXPVUs4hQLpwChqJlPtnk2Z2SmgHp8NusGDXy/tk+5mBiJPtstJpP/W
 Ntw3Nh+BM4FexHWwCcq1EBLQd9OV1k5QIzgisULPl20IQy4+m6Flc8cYZR2u4eBkqzGT
 nZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yvDNz/CfsVN2nOjCgSmHOHSwMQxl3elQAvk29umyFD0=;
 b=flsCKYV1ZdoFkt0B7Y/2DxJLpTxG+YDRk09gDWH7ZXnMMrr+yWRsqKr1uuSNUcWN3l
 OLVjJax/vcc2IWU7UHko1MdS6w3YYBOoNbNUZzE6hwrB95/LWeIW2TmYSwrfHMb9U1vr
 pfTMKCiY1VMHOFYnBZjKwR9N5EIWBDbSJqIjI6GR9uB3V518q/RfYGo/ovjE5zaZ31Ra
 DgfBRijaWPUOPjexJ76m76SfObshLph9bLv+vTbNYoc7oGj+beaiqTdC8pNlg8qxz30f
 3kB+8u7O1vmf50aq4UJn6JgSyIon4srJY2luvJek+10xZFkS6qAy1LxGXkj429wwR4kY
 FSLg==
X-Gm-Message-State: APjAAAUiK6U4xpg/52dZwvdPi/L9CuKsnzv+TrQWdTMUpAAVQbC6qaHh
 +A4gwUUU9oJMXxVKu3CMGtWfXg==
X-Google-Smtp-Source: APXvYqw3ZzR+68lSp6JqAKxCY1/YK591owLloxIdFu8TrvaeTS2xZtNnwkrme7Xbv1ccPpdYh9/hpA==
X-Received: by 2002:a63:e745:: with SMTP id j5mr549436pgk.302.1568751075522;
 Tue, 17 Sep 2019 13:11:15 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id b18sm3449513pfi.157.2019.09.17.13.11.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 13:11:14 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190916135806.1269-1-david@redhat.com>
 <20190916135806.1269-17-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <acf5a560-d5f0-2242-62e2-eb8a892244e3@linaro.org>
Date: Tue, 17 Sep 2019 13:11:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916135806.1269-17-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH v3 16/29] s390x/tcg: Fault-safe memset
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Dan_Hor=c3=a1k?= <dan@danny.cz>, Cornelia Huck <cohuck@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Cole Robinson <crobinso@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/19 9:57 AM, David Hildenbrand wrote:
> Replace fast_memset() by access_memset(), that first tries to probe
> access to all affected pages (maximum is two). We'll use the same
> mechanism for other types of accesses soon.
> 
> Only in very rare cases (especially TLB_NOTDIRTY), we'll have to
> fallback to ld/st helpers. Try to speed up that case as suggested by
> Richard.
> 
> We'll rework most involved handlers soon to do all accesses via new
> fault-safe helpers, especially MVC.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mem_helper.c | 123 +++++++++++++++++++++++++++++++-------
>  1 file changed, 103 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

