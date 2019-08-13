Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABFE8AE09
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 06:47:58 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxOiz-0002FX-Ik
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 00:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41082)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hxOiB-0001Xg-3c
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 00:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hxOiA-0001iL-8A
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 00:47:07 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51622)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hxOiA-0001hP-1F
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 00:47:06 -0400
Received: by mail-wm1-x341.google.com with SMTP id 207so225749wma.1
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 21:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4+G6JiIYr8r2dtoxsbssZMd1u8xHy/3PjAPQ7Rm+328=;
 b=bE3MZMcwJ4qkqnKbffuN9Zf9EB9lhFEAsX4ZFWCWHAcRAJVZX+sauLY9sYVIznb2Xt
 2gScDaQG8JLDDWJhCSDAcDY0/a3OX5T5q9hTKyRx26+KxqhqPW3nV2mM16mEVbC1ZeQp
 l8l8gV1+H95tGdxzRqkOczdzr0sSU4t+5U3gQ7Ik+zWZDNmHtq3dor9Kt5aKyg18D7LB
 6dNVHwPsY/l2iBHQO451/PR8Kz2xnZHHIE+OYrM9mej3d9OeWo3wZCny/4kPGr1Sn5Pm
 gVIg4Uvxq+h0mnYvshtsG2rBvje3v5Up64zPEEB9ljeTg+iRmQCclxOxphLYWJ01Q5G0
 dMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4+G6JiIYr8r2dtoxsbssZMd1u8xHy/3PjAPQ7Rm+328=;
 b=EgvVAv5eRQP3XYt6iieyov+PrMNXPYC9Ux/IEu3RARZVGyH8qMrPhhMfTTf1Itdoly
 PGRRno8EI7kAmJXnZnlLkQl5F1N1IHQOaG6GYrXoyqv4h1D1qBljPQMOelFY4D//1gQe
 GA2bBxZdAEvqq1Gp3kdLlfyLV8VhlIER2Vyr8cD2d/6D0VBS+DAqKFb+2L3lMWyTuz3k
 xi1b6dFMvarxp6ZUSr9n6HoUmrDUzXaHtMjrtXQXvO2J1IQWLkESLsSnVjG3INtN4hTQ
 BYNdAhOsWy/uPouXzxwno9LgsaGL9MySQR1ZLXG9GNpOyfcG/ctpBEAneKJ38H4Vj+tk
 nJkw==
X-Gm-Message-State: APjAAAVH094lXratIl8GN1ymV7/hdbKgnqrLCT0B7ul5AoEpp0j9C4wG
 WvEJDifJnQCRTWea/52QVfpcLg==
X-Google-Smtp-Source: APXvYqzRKyglwS9N7uK8PFJrUyYer3hnBxs75jZNjWWfPPPGHouJ/iejHAV99FbYvEb7Imi/laihgA==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr635570wml.25.1565671622997;
 Mon, 12 Aug 2019 21:47:02 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:a69:1700:8897:9507:94c2:b98d?
 ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id o11sm254164wmh.46.2019.08.12.21.47.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 21:47:01 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190810041255.6820-1-jan.bobek@gmail.com>
 <20190810041255.6820-8-jan.bobek@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <32739af1-d162-45da-43c8-b5263bffe67e@linaro.org>
Date: Tue, 13 Aug 2019 05:47:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810041255.6820-8-jan.bobek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [RFC PATCH v2 07/39] target/i386: use pc_start
 from DisasContext
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/19 5:12 AM, Jan Bobek wrote:
> The variable pc_start is already a member of DisasContext. Remove the
> superfluous local variable.
> 
> Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
> ---
>  target/i386/translate.c | 131 ++++++++++++++++++++--------------------
>  1 file changed, 65 insertions(+), 66 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

