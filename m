Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE75CE4B0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 16:07:47 +0200 (CEST)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHTfu-0001Q2-D7
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 10:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHTei-0000fM-9S
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHTeh-0001Qw-3m
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:06:32 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:35807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHTeg-0001Pa-Sn
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:06:31 -0400
Received: by mail-yb1-xb43.google.com with SMTP id f4so4706846ybm.2
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 07:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=53CnW+BOwoF1SDSWxo0eJusDqToFk5LjiZOAa/Of/tY=;
 b=g6vfBbcJXQZOozLQsHpIZYwJQdE1FCOfXcVr9Lqa0aZqPYPiR2BMYsP+uhWw5I7Y5B
 ngcQa/4ZC8p9GzvShVYEcSIHsBMqxnNIIX0QMQI/RrrrTwDgwHZ7nViTqJGbslc7MEoc
 FepOvc4SUeD2GxKqHnlAd96Lw1k4lrSBjtPRykbexFifoVP5T4eRPCntf0Glg3j7xUHI
 45KIk3fUErehvwGMpR0fyPxY8w/2AJLUEsmxCqLsu/1ubJ9x88Q68Lj0CwVnpRXiyH9a
 Fv4lIcys0KWYYJBv/roglhJo2T0I3bCoiXiQX5kbea1myWyj0XU0r5GrBoR9F84eY+w4
 5Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=53CnW+BOwoF1SDSWxo0eJusDqToFk5LjiZOAa/Of/tY=;
 b=O/QdFan4ROJ4pUAdKmtzUMKXQKE3Ch2lLaugjqFbZAl14DZZiOOlLmS+B995mr2puL
 +wy+FLU14qIreniMVWuvno+mD9yWp32q4wpwh9MC6UhYV/OhCm/8zpbxyI8cz7fOknRG
 0upUQV/jV7ww/FLxs17vq/K3UCTz5jCPeeBg8S9K4t3qffKUzGJCI52dEJ4OXQfa4Ke/
 vgcxORNw7NdxUe/+Y9ZLtwu/uVuWgWcXcDoQdTc9K4R1qqFdNu300o1weeBchFUG0Bjr
 pCS1TRLXl8wZZOnVnNSDGxBy371B7iDSDzNeHun13+EsABgDhujxn6jylnejTJxMgz6h
 FN0Q==
X-Gm-Message-State: APjAAAXEKCOEvhCge5Ut2MXFxvG3hVB8aUhzC3yVnTAwlQAuDxPSCNeN
 kKNsv30hMysOS6SrLSv5w7jLbg==
X-Google-Smtp-Source: APXvYqwvcvpdSBcm8ndI14T4NunkgBPyQx/IO0hoITp02OQ4UABg+bToLT/kH85W5RMZbDFAFaTVGA==
X-Received: by 2002:a25:7691:: with SMTP id
 r139mr10929429ybc.303.1570457188677; 
 Mon, 07 Oct 2019 07:06:28 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id h3sm3774892ywk.40.2019.10.07.07.06.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 07:06:27 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 03/15] target/arm/arm-semi: Correct
 comment about gdb syscall races
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <91e47043-8cd6-ed6d-eff7-6a742e669138@linaro.org>
Date: Mon, 7 Oct 2019 10:06:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
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

On 9/16/19 7:15 AM, Peter Maydell wrote:
> In arm_gdb_syscall() we have a comment suggesting a race
> because the syscall completion callback might not happen
> before the gdb_do_syscallv() call returns. The comment is
> correct that the callback may not happen but incorrect about
> the effects. Correct it and note the important caveat that
> callers must never do any work of any kind after return from
> arm_gdb_syscall() that depends on its return value.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'll come back to do the cleanup later, but I preferred
> not to tangle it up with the rest of the refactoring in
> this series; I also think it's probably easier done
> afterwards rather than before.
> ---
>  target/arm/arm-semi.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


