Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B2E5FE132
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:28:34 +0200 (CEST)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2wb-0000YG-2y
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2sf-0005bp-Ao
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:24:29 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2sd-0007Oz-WB
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:24:29 -0400
Received: by mail-pg1-x531.google.com with SMTP id f193so2297315pgc.0
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 11:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gGlG2vonrikxV8K7dGpH3cXisfW5K9cshPI+B/4k4kU=;
 b=Ssid8zQSc2Qghc6N4EIGWNffHkUX2ekCToO5bbgRzuxHno39HZg75RU2z3sOn5ANrJ
 9cvnNNI6vZJlf4VjiJBQzyCOCuxFDKyjZVLjiGpA5Ahds0OUh7x2EZxRxqvCYxodFWhW
 aysnxRCIHVyCMMe5zoJmKSe0sEzz0MuwgWaId/LSkXSa3U9/NPHLAtMOVrPw5fHFO5L+
 e8zgLUGZiVPXQn1ZR8t67LIljRjFvYRstU4ad0loE9rBYY1W74nDBEg90qieNpCGkKPK
 8mmmFlTxOFgIbyjqkgMtIMzkgmv/EeqtpwjJswWofuaOu6hkJEKS+tdKg72dyMB2FbYX
 PgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gGlG2vonrikxV8K7dGpH3cXisfW5K9cshPI+B/4k4kU=;
 b=MgPktb25YsxYLu2nCgID9XYgWx99F7iZnyD/X+l0/3SMJFfeoFt1vmE0PnJLpr/azJ
 NWNdCxpmeM2njN+ViH9x6kS5oUlPRt5Xxw+OhTrIqbyFdtq7oYCW1h5CQ71k/fDhzqXj
 jxNVaxTCUhAEJw5cutK5tx4MroOuwlUSQ0zW5KCneI/fjcM9QvmRBI8zp2YJdCKtLU4Q
 yt3AtOttj7L/e9D3lpop7s5FJZSChdmW3dTzSRJjqTBlRxzK7pTXU2edBxNqByaYHlch
 Uuqy1LpUVrInz1X4aT4x5yHPM+P/5PH6/T1ENae6bCYweohMIOIBmoDijmBg0K3wQT39
 lfPw==
X-Gm-Message-State: ACrzQf1S1z/fBqoAkQ8H/uFXBDG1I9aLJ+QNbhH1rSMmP0DF5hgWt3je
 KdLuSflo8TuJcPEu76dXJB1JNQ==
X-Google-Smtp-Source: AMsMyM5DFhZ5yl22ZD0ZvV68QRBnoKirovWVW4Ui9ri+H6VjllRlgD/ak2nGE7w3naketAtcCupDeg==
X-Received: by 2002:a63:1b20:0:b0:464:a9a6:571b with SMTP id
 b32-20020a631b20000000b00464a9a6571bmr1014350pgb.560.1665685466575; 
 Thu, 13 Oct 2022 11:24:26 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 p189-20020a625bc6000000b00562e9f636e0sm41840pfb.10.2022.10.13.11.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:24:26 -0700 (PDT)
Message-ID: <08208bd3-1aae-406c-86cb-ff75bb718861@linaro.org>
Date: Fri, 14 Oct 2022 05:24:20 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] tests/tcg/s390x: Test compiler flags only once, not
 every time
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20221012182755.1014853-1-thuth@redhat.com>
 <20221012182755.1014853-2-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221012182755.1014853-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/22 11:27, Thomas Huth wrote:
> This is common practice, see the Makefile.target in the aarch64
> folder for example.
> 
> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/tcg/s390x/Makefile.target | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

