Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81369F202
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:42:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUldH-000134-W1; Wed, 22 Feb 2023 04:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUldC-00012L-9G
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:41:46 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUldA-0007JB-Mn
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:41:46 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v3so6994408wrp.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 01:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vY+IDOaZOk+/+U5lTJS/PpCEdxN3eTBnE9TGeAWFaUU=;
 b=oB2Uoc14QKB2WL09VuF6O5NPJHG77sPNzsQiVxb7H+WGp0W56LX3jZ9/wuduz5chYV
 GMyT2T0igIzJgfCkPKPeiYs7TuEcnk5PJxJ4e3Rd1gYKZPQn5TKyMzBKBzCYF8pCM0sF
 tQ9PhlIlaj+VWdocLPxCAQZ6Hb8asNvNiN5oqZ+H1SJtZ6LCecrWNIo2L4kWfewHOVna
 E5HidHsNHiQC8t+4onC2DvJQ3OwZUYanwpl8ppNCg5dGnEnmV2VhEbCxRtvGBubVZORk
 XpyewtEzYP3nOqsUplZD3FZ7DPmlJoKrQz0IQ6InM3r4oolHFASYOkUXCbiaFsy1Qic9
 uroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vY+IDOaZOk+/+U5lTJS/PpCEdxN3eTBnE9TGeAWFaUU=;
 b=tVVhYFSWPxeSqls6SrRkpWvqNUvvoixjUUDns49KlQrmGlRhPLb3JxL5+CYjGoNtnp
 CsPONsBm7p+VG6MfCIJvzx6IlaNbA0y1ea25Eu1o2EF2O8wyeDvLsZGm+tKUv+RXGASJ
 ciTxB7cYvAe86e5Lcz4SUsQTxVJoW/ex7GNWYC0DMfd9WGZ4MBO2reCXhk/25fumKww+
 0lGO+x7zesijs04Xg6hGuGf9U5Djc0KqIsHWP/E1em7xQz39v67EtJVPrtPT7GAF7YI6
 E49EcPqLed9oqGq8u95S+wG8r7TYgOULudVZxBS0bEzA/fG7Au7PIywXDi7iJyZ9wB1Y
 cN5g==
X-Gm-Message-State: AO0yUKX9Br0kso9ACJSdeRy1MqwwElugA4eNRYaeoI5QKqH9m+NJ68DH
 Cd5IZFz3J3zeuSenTQcWebDg3Q==
X-Google-Smtp-Source: AK7set/+k2yU6JZWlAd+h4o+mdVNKF+iPd63KC3hQSXbUduAe1z9p7devL74I+R2C9b06hZlZDC7EQ==
X-Received: by 2002:adf:fcd0:0:b0:2c5:4a20:cad8 with SMTP id
 f16-20020adffcd0000000b002c54a20cad8mr7408103wrs.60.1677058903203; 
 Wed, 22 Feb 2023 01:41:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v15-20020adfedcf000000b002c70ce264bfsm699253wro.76.2023.02.22.01.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:41:42 -0800 (PST)
Message-ID: <320b8f7f-efb7-26f6-d0f8-d9e1cca0124a@linaro.org>
Date: Wed, 22 Feb 2023 10:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 05/25] target/arm: Add isar_feature_aa64_rme
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 22/2/23 03:33, Richard Henderson wrote:
> Add the missing field for ID_AA64PFR0, and the predicate.
> Disable it if EL3 is forced off by the board or command-line.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 6 ++++++
>   target/arm/cpu.c | 4 ++++
>   2 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


