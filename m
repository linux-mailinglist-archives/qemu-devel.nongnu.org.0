Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B1BE584
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 21:20:33 +0200 (CEST)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDCq0-0001wv-4Q
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 15:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCV7-0006W8-VN
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:58:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCV6-0007dM-DX
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:58:57 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:44328)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDCV6-0007cU-8L
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:58:56 -0400
Received: by mail-pg1-x543.google.com with SMTP id i14so167948pgt.11
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 11:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YjMgfxpdQzFt3kH8mjBgEB/l6rkej8XnyzFMto1GxsM=;
 b=TyfgXCOkHVkOufKML6Ig+BQLRLU39PHMmYI6Mb56Rfcl8i7rXMLgbRoC55ej7Ap8Xv
 B9niGwfc7x8zgQ5PudPTPZ6LGdG3jP2714Wj7XyMLmrJYVkb6iAbDjbnnw1+G6lWVGhE
 mOzwPA5jg1mi1FAQvcJLU2Ipws7H8fitphDqM87QR/9TV5cY+NNwvnN8GxDkgdlakK3T
 RQgH1oZr775L6fV9bdj6Z1o4oIqferUx5LveUEcANoTSPTV0MNDIs+X6paj0jz5hYaXD
 JyUQkFAdShc6AgGy5DKMkjmHCPxeD0EIM+Sx5berzycZQQhieRmD+fmZk1nMDeZ2w3I3
 aDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YjMgfxpdQzFt3kH8mjBgEB/l6rkej8XnyzFMto1GxsM=;
 b=nIrk+E8WMiMBPVzt3KAOwmsD9ri7CMbsDJu3hURZJRiWERbFO72fMLC2YYtJ66dU/5
 7RqqiTTT9+JokY6/erNqSWH9fY+Kjon63o5gwAXAGKnK5BqLiKmMWxw5uZ+F5/Q8tIbt
 /boAxxusvPV1q1q8jEnF30pOdJmpzZZQcL6MGRjg4RVU8Oz3DaJy7oS/kmurrzeFPUaa
 6dSVuVWiIkbQXIdaZ51rhnRy3BxuFFMEn7I7pjTWUslvzsGXeTZ6iyNRMM2HENlS/aJe
 G2NJiwF25MoY3tm0HoLpWKD+noDtpk0QnsLMvZXuzxn069HVjs6YyR6G8lScvAJr7bM3
 j3Zw==
X-Gm-Message-State: APjAAAV7R2MC32ZgvdzY3KmiR0QijMqFxCHLXCqOXokynx9cT2pfFY7y
 P/Rsi9MGxmm/e9b4hHbCRzD3iQ==
X-Google-Smtp-Source: APXvYqzq6U+do8pl8gsRXTgFUoZDD/g7Y2WnnTGsTaDZEJ/T7iWNUYLZNEmAUD2ODGfRJF884ddWLg==
X-Received: by 2002:aa7:92d9:: with SMTP id k25mr18866pfa.155.1569437935323;
 Wed, 25 Sep 2019 11:58:55 -0700 (PDT)
Received: from [172.20.32.216] ([12.206.46.61])
 by smtp.gmail.com with ESMTPSA id k15sm313026pgt.66.2019.09.25.11.58.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 11:58:54 -0700 (PDT)
Subject: Re: [PATCH v3 23/33] docs/devel: add "check-tcg" to testing.rst
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190924210106.27117-1-alex.bennee@linaro.org>
 <20190924210106.27117-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e45424fa-d0d0-1457-ce44-8e382ec0b31e@linaro.org>
Date: Wed, 25 Sep 2019 11:58:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924210106.27117-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: jsnow@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/19 2:00 PM, Alex Bennée wrote:
> It was pointed out we haven't documented the check-tcg part of the
> build system. Attempt to rectify that now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/testing.rst | 62 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


