Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4274C3A07CD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:34:12 +0200 (CEST)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqlEZ-0001tq-C5
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlDW-00010L-0N
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:33:06 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlDU-0001tB-Iy
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:33:05 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so289110pjz.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CUZTVnY7lLlstnGgY0dxFO+o86r4EUiQP53gXzFV09g=;
 b=Lg9tyWO2Lc61vlT6/K0E0xbODGFkImV20q5uH+VAiBpsOqF7TnK8y0zFcbgp+z2TEo
 G3wBaZho52wF85tpuI/0dW6u6PeLlV1yzM+20ag3qbjzKVeu3QUEYk8CjjIQNfmbLYCb
 wU1j5XTCoGDfuycFw6PuQk/e807BvquNWbKD4rVKzLdNSQRBGCzPbVNFAWpvIOobwAB0
 Tc8MXiZxULYUCzoWDTiBYGz+Rtv7DOwL6pSoWL7lQDj4D39L2gZyF0Uvi9kqCVqzxASu
 7wNd2as2Nr8no0Bi6Bfo+p38cn6Tc7TeI5M/CPnbOQyxf+Dz0AkXV6lqz/Kh6xQDTuyp
 zAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CUZTVnY7lLlstnGgY0dxFO+o86r4EUiQP53gXzFV09g=;
 b=ao3KBNf+tO69uDRruSp8Geu0q0Jr88f8lg8fFwrIbEBRsMRqh3OLIhvSEl4PNgR1gE
 M40ocprKBPIfjdMeUoDAWvrqEn/xAyQXlUZn+IhV+O/spYsoKQ/zehfjHdwZDIrIBdO4
 sKkpmUjD5uRNlbxN6pykoig6Y5CRJRlDaFUCpIb4OCr6cJCXsaeyF4zFKax0iJQkcGSs
 M4sIKjd1H0qhydLZ955Un8Xp76PLpqYNQACtNZeAE/8PScR1vEMWKXSgP3F0F33YOay7
 Oa+qg0hloZN3aUDz2J2ukyBL3MHqPO4CgTuSO/lJOdu54kzf2e8MAGnD0uc8wdOjBf1R
 Kmiw==
X-Gm-Message-State: AOAM532cvXall4ZuGRccrLAGco56i0Hxn/bPOd0TgQ/8Way/XrtUWQhc
 uiXyEuRbZmVHYZjWl6ztxFLVAyCyzeIK+A==
X-Google-Smtp-Source: ABdhPJyjwcA6fiwzxOz7BniHv1JmOp+U3S1GAkuveh8bjYjJSIPmEKGcRYdH0V4NX+TCZ4rvcLdf0g==
X-Received: by 2002:a17:902:d2cc:b029:113:2a1e:2b5f with SMTP id
 n12-20020a170902d2ccb02901132a1e2b5fmr2149260plc.43.1623195183030; 
 Tue, 08 Jun 2021 16:33:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j16sm3102980pjn.55.2021.06.08.16.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:33:02 -0700 (PDT)
Subject: Re: [PATCH 24/55] target/arm: Implement MVE VRMULH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6e085c3-b8b5-fa7f-f578-788e05cf5f87@linaro.org>
Date: Tue, 8 Jun 2021 16:33:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VRMULH insn, which performs a rounding multiply
> and then returns the high half.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  7 +++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 22 ++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 34 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

