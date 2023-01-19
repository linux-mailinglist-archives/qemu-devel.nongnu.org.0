Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31004673AB3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:49:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVHT-0003h3-FT; Thu, 19 Jan 2023 08:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIVHK-0003Ro-Ku
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:48:32 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIVHI-0004OM-AL
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:48:29 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so1302007wms.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VjGBJqpR99FrJW9Q1eGoDtDK/LjXiiboItATnzbt0MQ=;
 b=uIlpHz54UCzFwofQcXfPn88IWJnN0/FS5f629Xacrv6bK1+GWLcBoJJY6dLadEdypt
 4THuPIyAqnYAg4lPPkpOHrMTGb5IQ2MjGgiH/PWrJVF4LK8E01l47+zDEphdrK1taX78
 zYUvXpKvMy/ABnbQm35vTF4KEBzLpW8otaPSTQdn9gErl+lL5CeBXgGVv3/eqZoTKSCY
 YZdlMuJBm3UsiENZdBdrEohCes5nZJ6OyWwmxX4omu/TpEti57VkhmAHUYMo3JuVWBM4
 PtdhJ7HpyjT9Ua0bG2yGo+YhVlMgApCrNC5jPdZxKRhVEg6B5mUjuyOEwH5XsGXMwFhN
 MDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VjGBJqpR99FrJW9Q1eGoDtDK/LjXiiboItATnzbt0MQ=;
 b=TBUnBwEyIm95d3Nl5epJEiwx9zrV8kitQqk2RedLkZudLZpO3qjO7wTmREQQo7cSI/
 C4mrdM55H0eU+RUCkJlp6vOsBASpPxxx12/RvVA40J0LxuHR07ws3WAciW1su64jWehs
 W37Any3LGYIWs2L8BLtQI8EURWXLBomIJP+LI/7iJcyp8VVRHx8ashtqZeRpPVXjIgvs
 Abi0I5ZfHRY7TaTrlOjWrlHgOorv40aqYDAwL6SKikPw3dX0w9dR5y+ajYzk460wOrDE
 LppPwLdu+l1E050x+iZEnrrfN3knzJHi9FsYkfTdUo+BsDkYiXyLrWtO9W+t6z1J73f1
 oUdA==
X-Gm-Message-State: AFqh2kq3lCpBGocdVB0Up59ZdyzuIcv1Bq/eiCKeOhNOAuJyuDKOjID/
 YiBsSpl3XTiUgAMyzo0cVXR39A==
X-Google-Smtp-Source: AMrXdXtQ6/BfaVuVrTH8tXVtvL0ecydV/HxHWvPs0YEZWHijTBgmeJVqtppbPTDi+msArRJK9dqMCg==
X-Received: by 2002:a05:600c:a29f:b0:3d9:f42c:56c5 with SMTP id
 hu31-20020a05600ca29f00b003d9f42c56c5mr10509114wmb.4.1674136106928; 
 Thu, 19 Jan 2023 05:48:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v20-20020a05600c215400b003d358beab9dsm4732124wml.47.2023.01.19.05.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:48:26 -0800 (PST)
Message-ID: <6b48d4b1-fae4-b0a2-5948-1963ec775ad8@linaro.org>
Date: Thu, 19 Jan 2023 14:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] MAINTAINERS: Fix the entry for tests/tcg/nios2
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230119130326.2030297-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119130326.2030297-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/1/23 14:03, Thomas Huth wrote:
> tests/tcg/nios2/Makefile.target has accidentally been added
> to the Microblaze section. Move it into the correct nios2
> section instead - and while we're at it, it should also cover
> the whole folder, and not only the Makefile.
> 
> Fixes: 67f80eb4d0 ("tests/tcg: enable debian-nios2-cross for test building")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



