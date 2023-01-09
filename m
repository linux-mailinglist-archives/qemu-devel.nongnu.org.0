Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96CC662196
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:30:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoTb-0005Wl-9T; Mon, 09 Jan 2023 04:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoTQ-0005TY-V3
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:29:46 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoTP-0007uh-2r
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:29:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m3so5806174wmq.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hBlUJ44Oh9WLfFR1ZERviiOLSvWR/WNjWxMzKjtf5Ow=;
 b=jDj8EEbpfNzOFNPoctf4POE21E3pfejeXgh0uoKJNZ9Ezqml1hej3nhGCxklTp85if
 NKYfGf1SR2t61jjw8AOlDWleSKNOktCLQQcMt7EqQccB/QQXKdfq+kHww5mHpN8kMJsv
 F573MpTINy0COZzgQMN768LOZG2eLeqWkGCxgiOrUYeZLmNjonamYFo+B4V6H+PiajZk
 WkRwi6HgB7fSJfye3R8ruM4x6YY/EuRVplJQTTh8vfx0FgUSn7vRNbe2ylfqWBKJc1Pk
 8GK35xMU8rNP5P3UgHv/sMmtG2SUiTgQTTF1zruXNoSNSEuKK175Y3eSWijcgJdZP/b4
 CvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hBlUJ44Oh9WLfFR1ZERviiOLSvWR/WNjWxMzKjtf5Ow=;
 b=VMzTLVePNrothrT3Lj36F1gvTvPGK7saxZPHpiWj/uLGu3w8TRyKqJInZxWJ46NDuG
 s6xYVl+bG+fQr1DTt1R3Mx01D7jVqS3dkvwF6AUSbn9uNi0Pd0C20ifXEDudkMRsnaHH
 EESI0WkiCTy+AqmURt33gOWgtwxnJpZszht0emW0+1qJrU+pFiX+UHeXDA3gD03kleWv
 QSYV2RB79mThUJwtONNQBoG3kxtFuCPMtc9JiW5d211JtY5pePQrfpXRiaBw7j+JywJv
 PvjQOTwMxbGcFmCrEM2812vDohUi9laJCdJZg775cTs//o5s7as/d2yWUlThSKjK4toI
 ikDQ==
X-Gm-Message-State: AFqh2koMPCkY6+L/hzHa/DGt9+s42i4SmGCdWk17m5Cbsv56wWUwHrDL
 ZPmqf5IGx+G10PYnN7spwY2+qfv5j83o9Wtm
X-Google-Smtp-Source: AMrXdXv3eOQC0JmVTqlvuvp9ipbU9e+UobuimfPEF3RyE9clo+MOKffAWBwAhPIaoVJXJ+pjbTX11Q==
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id
 z24-20020a05600c079800b003d357373b0fmr55871873wmo.36.1673256581389; 
 Mon, 09 Jan 2023 01:29:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003d974076f13sm11431298wmo.3.2023.01.09.01.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:29:41 -0800 (PST)
Message-ID: <e901bc9d-1c3c-5cc0-7a59-e55816babffa@linaro.org>
Date: Mon, 9 Jan 2023 10:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 5/5] hw/i2c/versatile_i2c: Rename versatile_i2c ->
 arm_sbcon_i2c
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-6-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109091754.79499-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/1/23 10:17, Philippe Mathieu-Daudé wrote:
> This device model started with the Versatile board, named
> TYPE_VERSATILE_I2C, then ended up renamed TYPE_ARM_SBCON_I2C
> as per the official "ARM SBCon two-wire serial bus interface"
> description from:
> https://developer.arm.com/documentation/dui0440/b/programmer-s-reference/two-wire-serial-bus-interface--sbcon
> 
> Use the latter name as a better description.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/Kconfig                              |  4 ++--
>   hw/i2c/Kconfig                              |  2 +-
>   hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} | 24 ++++++++++-----------
>   hw/i2c/meson.build                          |  2 +-
>   4 files changed, 16 insertions(+), 16 deletions(-)
>   rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (81%)


> diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/arm_sbcon_i2c.c
> similarity index 81%
> rename from hw/i2c/versatile_i2c.c
> rename to hw/i2c/arm_sbcon_i2c.c

Sorry I forgot this hunk:

-- >8 --
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a40d4d865..a3c7748505 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -940,6 +940,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
  L: qemu-arm@nongnu.org
  S: Maintained
  F: hw/*/versatile*
+F: hw/i2c/arm_sbcon_i2c.c
  F: include/hw/i2c/arm_sbcon_i2c.h
  F: hw/misc/arm_sysctl.c
  F: docs/system/arm/versatile.rst

---

