Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08632CE4DA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 16:14:21 +0200 (CEST)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHTmG-0004r1-3o
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 10:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38141)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHTlD-0003z9-K8
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:13:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHTlC-0003W7-LB
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:13:15 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:44787)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHTlC-0003Vq-GB
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:13:14 -0400
Received: by mail-yw1-xc42.google.com with SMTP id m13so5145517ywa.11
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GxEeeercCVRTVZXh0L1Q3s3YB+NxLMfba7vvV5P4ynI=;
 b=MybxXpBrUsrhJpoGfyqUuV2XGa1ie71ywSbEAwieJfHUsPFMJgndseCjkD7T2YwJx2
 uqu2lJ9nKpNK2hj9XFPrnS/j5424yqEK2lTO8etBpciAWrbLX04H43Ky11fSBjFamErK
 9C1Tb5Ci3AXATugXcDcbJ2HmpML8gsrCTuvIkbCFf3/L8SiDmv18/diXx4nNvwh4HOuA
 xp7bydBNId8r+EjcBssbnSh42kLP9ScPJUY8j9gPcu0X5caOvjqyKKYdPy9C83Kz/HZB
 /xZQHPujCLUSKMk3+4aR5G70M6AdwX4Qoavhi1o7OZtSetN8Zhaq9F8yDxabvSPrF+fL
 XBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GxEeeercCVRTVZXh0L1Q3s3YB+NxLMfba7vvV5P4ynI=;
 b=NoCh/okV0t01Rbl+B7ml8QJufrVF0G37nMeXDuamBmmg/4v+ZBhEtGbo4VRPTeHzwz
 cL673tC30CT6RYpmyvspG5SVtcsTwJBVBWfWmOPKF5JaM3es0x4sDgSzXHtPeDJXbHMR
 ASDxj7/Ng4LOuqMoG3mIPJSWt4PBr06FhvVEPYRLHQvzcObN2Cl7LVfnTbAZzHLPOqDQ
 HenXV89D0QoevuzSvs6EPwKakZn0+6okQ9bStoABHEf+uUGiGYfaSTHX4gstqYIJmIiF
 N7VRA7PRbl/Tr/mFtYG+YLnPPwQeqe6XKpunJ5nR4xIoyVd4a9sPOd3D4LLpJ85bZ744
 X3Iw==
X-Gm-Message-State: APjAAAXh4GGStGkBXx9YSqD6jcNAuqnyt3qtbYBYZgRrVIXwiln3Vte5
 o6OknTJKLF42G97KMroymafDF3IkYA4=
X-Google-Smtp-Source: APXvYqxg3nXKlElmebUnG4AP7/ZhYYWQ+cKHMkERpgLzE+UVnTNMytWvUnpgmZVqX0gcHnobvauCiQ==
X-Received: by 2002:a81:7703:: with SMTP id s3mr19454673ywc.382.1570457593665; 
 Mon, 07 Oct 2019 07:13:13 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id y11sm3923613ywd.84.2019.10.07.07.13.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 07:13:13 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 06/15] target/arm/arm-semi: Use
 set_swi_errno() in gdbstub callback functions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9015f172-7e7b-e60d-e273-c4d3cb4e21ff@linaro.org>
Date: Mon, 7 Oct 2019 10:13:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
> When we are routing semihosting operations through the gdbstub, the
> work of sorting out the return value and setting errno if necessary
> is done by callback functions which are invoked by the gdbstub code.
> Clean up some ifdeffery in those functions by having them call
> set_swi_errno() to set the semihosting errno.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/arm-semi.c | 27 ++++++---------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


