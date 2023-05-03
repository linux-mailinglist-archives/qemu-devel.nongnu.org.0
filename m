Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9A6F5633
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:31:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9kn-0000lE-C0; Wed, 03 May 2023 06:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9kl-0000l2-9l
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:30:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9kj-0004qA-Lg
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:30:31 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso1681995e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109828; x=1685701828;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ov8yZhBWh4Rj40XoTJRPTHa2EE/A+x1veBxLiVG9/Vg=;
 b=p1rNTknMR6IEc0EIQ/BG1YvO9ahaf1DIFeROWRuRnyeQJUdL69bnu3/DeLm3EB70BL
 IZUvki4Sr2qxP1TL5mhE9O94eNF8pY4kQ+QJ/RH5+gzYi7YH0wbgPnXYSU/at+eUJ4W8
 EGcY42OPWCmG76m/6pd1tRdg+2xOBKiGYBUYKhfJBgQVCAG03jXmfWfcv7oHiSgPTD3O
 rwdXgGccjN2MPWYRe0ZALlWbEV7aI6zbuUqn6HEyygOb5q9Cq7JdDaP6Z/4cnrBLcbl1
 lOjF34dkU6SG3z4gDR4EM2IrhNe1w41ZeIW+7SXHq4iPI3fQdzk5tJVAX0F7HiAFGmSN
 MN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109828; x=1685701828;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ov8yZhBWh4Rj40XoTJRPTHa2EE/A+x1veBxLiVG9/Vg=;
 b=CzE0kAAH+p4YLZnuPWFFSmtqzh0a/nW3DwYhwi0bA3dK+ejg3y6krvSqOEaXqSpxch
 eI/7GuxZK6XuftNgk4G0U1AKgUJhU30uoZ3OMqfVYGnZ9C5e3eu14EWRGQHjKRZSJ6Ms
 EduJM6junkGufAN4VSSKu572Orpn+Cw3G6xSFgQPnGPgALiTbsOxekzGA61qgir3H5Vf
 Cn13GSVlcJGrWvt486baR++/it6PFo81i4DXRfLbAeElvIbwocPDk8MQZhbalt/CltN3
 dIFjY+eaC+1PhkI3BTqReEATTflIv9iYIHjI69y+ZwIPYGjOIM7sNYvCe6nShOOxjvOl
 ZA+A==
X-Gm-Message-State: AC+VfDw/iDIFl1FNtaxuj2Q1VkFbqxp2lo/sz3O9NxTSS8B5Ig99v9eh
 Bf4L+Net2NDJtW38LUxkSqqLJlTVvJCAiX8dse8vBQ==
X-Google-Smtp-Source: ACHHUZ7+Ctg2JeJY3+MAeecZy685LVEx2XCpkzW1DeyFbmNskt76I7V9fFhp/m5g/ZtfQkF0XFDBLA==
X-Received: by 2002:a1c:7c18:0:b0:3f1:727d:77a6 with SMTP id
 x24-20020a1c7c18000000b003f1727d77a6mr15385079wmc.3.1683109827837; 
 Wed, 03 May 2023 03:30:27 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a1cf307000000b003f18b52c73asm1446932wmq.24.2023.05.03.03.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:30:27 -0700 (PDT)
Message-ID: <1a8d75ef-fee8-7843-21ec-28f3eb8151a8@linaro.org>
Date: Wed, 3 May 2023 11:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 20/22] gitlab: enable minimal device profoile for aarch64
 --disable-tcg
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/23 10:12, Alex Bennée wrote:
> As this is likely the most common configuration people will want once
> the --disable-tcg patches land.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Fabiano Rosas <farosas@suse.de>
> ---
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Typo in $SUBJECT.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

