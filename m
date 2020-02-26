Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3A170BE0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 23:50:53 +0100 (CET)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j75W0-0000BJ-Dc
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 17:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j75Up-0007SW-Lp
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 17:49:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j75Uo-0000VX-Gz
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 17:49:39 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j75Uo-0000UL-9f
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 17:49:38 -0500
Received: by mail-pg1-x541.google.com with SMTP id 6so392834pgk.0
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 14:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lddS2VlumpXeIp7BEym90o4BZfJeiaqlF4g1shtDhd4=;
 b=BzxxtR6lBtU0rxgUmDoIOyhez1+GDm/WOtTrkjIOwXf5ZgaGRCxNy/08AhBRDmUBmz
 huQI/uQRUJ54/iEtCYot6ijxPrZGiNYtw9Fd7zep7kCa2xZ5K7PcoSEEyTWLcNDIGeP0
 vvH3XbUctHsm4U3KalU/nwXq9DzqL74Obq21lA0EdHAf/jtt3Y5oUa8kPZnLST8M7w+H
 tzJPAs2e3oYPTSXnN1xPnO6cynnd6/Y65jMknYWgQ/arlLdyOES/yvhfmu1c6M52CGpq
 XhgXj0R0wYNQhiNA9uI/+YhdKOaNkh9FIHKOa9LifXENdj0ujJ00H8wA44aCscYn8V3g
 rcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lddS2VlumpXeIp7BEym90o4BZfJeiaqlF4g1shtDhd4=;
 b=VjkpU++QO4nnsMVft3TF+MuulDYIuu1sXkHXifFUfNMrQgeoArtx4iEPFCotFMxwWo
 VJ6ptJ+VKh/a7SFJZPqiLQ+jqtxVIQ2fAJtYkAMRl8vGFk4b2BBSdi5f8XsVFlf7QyBD
 JNo5lL+vzOlZtE7Zf9r5QrANv3QOiwMZAWKtxKUc0OBbBP53wKR6SsOF5lHHy2d5ZpUq
 yxBtKKwS9vP2qjUe35XqwnIclLXt+bZr/YnMa8N5rJoIkfHmJh0dqiInl4Y3EcUhGdCW
 15k9RmzyKSJ5taflJtcnsTaXADdwRM9ifQ/op+piZ3/Xn8UJXvWjGqvLh81KFVRMcUa1
 I+IQ==
X-Gm-Message-State: APjAAAUS4+FCShsRvjyiKLGd5MHbmdm2mvatxN1br1AZNsHT9tehfrVa
 zGVNZXgT3SBQ0tDKA298E5Bp1Q==
X-Google-Smtp-Source: APXvYqxRMvdw9toXsMeeX6Fel4mkiOUUFcPK5SbJTC7/vR92EcDWXymf+9mbDJVBbvwCVnn7AvbfKQ==
X-Received: by 2002:a63:2e42:: with SMTP id u63mr1014320pgu.137.1582757376627; 
 Wed, 26 Feb 2020 14:49:36 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z27sm4379589pfj.107.2020.02.26.14.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 14:49:35 -0800 (PST)
Subject: Re: [PATCH v1 1/4] accel/tcg: use units.h for defining code gen
 buffer sizes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2260450-93c6-5e49-b335-699cb2a43677@linaro.org>
Date: Wed, 26 Feb 2020 14:49:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226181020.19592-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/20 10:10 AM, Alex Bennée wrote:
> It's easier to read.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/translate-all.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

