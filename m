Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA98681FCD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:44:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdok-0002T8-Cy; Mon, 30 Jan 2023 18:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdoi-0002SP-Gu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:44:04 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdog-0002ff-Si
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:44:04 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so9394552wmq.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=27kJVqXtOGJfys2yelyj4czbCiPg32P8R0o6ycwSgjc=;
 b=E2P9Cct91zJLzdfpZ8pC3HRrzq8cI0cI7BoRVWHogZdvJO3Zb96BI36QGNegw8v9C6
 xb1gLoF0BrBK/+ErE4rBjmH/iil85bnJYYIGJdQW+FAJWqLbK5mgKGSYUW59LqkuLU2k
 qWACJznSrrYInF8jXyvR3t84sOBrkEbt2JIp8jKAfZsGoyjxENy4BpKv2x+F8Wew1N16
 9aEjb5gzaKpuGfmR9gdIRf31CV8PzSCLeiyHbikpTTN+70p3mOR1KJ6tCLT4jhn0Kqc9
 23GedIuRUXmcIBKBUkKbzG3rIZA8YN0OHUaNClu9QnrXuRQzQy5g8VH0qS+9OxtY0vRi
 83CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=27kJVqXtOGJfys2yelyj4czbCiPg32P8R0o6ycwSgjc=;
 b=rjQKdxXbjQIHB9AmqOgY3z23RTRyl5U0jo3QEI01xTx9qq1oVgXP7H9n8Mu3WKW+n5
 S65ZKDJzbjkIN0965UMcavKCfOKSiTxa0DJnL+W8EvR5BxglwmfzCabxyWW50XqPCzat
 QMEv5a2EzcGkgoob3wqGeY4IKx3rnc1+PQhUaUiNIdxRzK4r4vjIuCLM4kSYZplqp6xG
 lamfF4m0cQxjp0uXuFViDGCzjRSruFfQfk555cgtyv4GfgeJHCgqJ5SIUSvZzmjuP3um
 ZfFaKqNbdmap4fqAQ9KXDhlK0e8fsaZHX/CG4g30rloRIkGwqdswr/ARxmeNlhZ37juF
 TXAg==
X-Gm-Message-State: AFqh2kpxZNuHtlL1aUVYBiZxA8BhIO3fwUsO0X3SGSrBekuNYTQCYDy+
 1pG57zI6DU4Hd+6nN/xEuUChoOPO51aZDF07
X-Google-Smtp-Source: AMrXdXs+eD0wgrwzNzTaHN6YPxguNCqloFUQfUICXGgPzFYEE85UfA9jfYiBC+0N61SGQ1UcGS9k6g==
X-Received: by 2002:a05:600c:a54:b0:3db:887:8c8c with SMTP id
 c20-20020a05600c0a5400b003db08878c8cmr49125264wmq.27.1675122241192; 
 Mon, 30 Jan 2023 15:44:01 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c00d400b003dc5343188dsm6352627wmm.24.2023.01.30.15.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:44:00 -0800 (PST)
Message-ID: <8146f08e-cce4-99c4-28bc-a8222eaadaee@linaro.org>
Date: Tue, 31 Jan 2023 00:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 18/27] target/cris: Don't use tcg_temp_local_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> Since tcg_temp_new is now identical, use that.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/cris/translate.c         |  6 +++---
>   target/cris/translate_v10.c.inc | 10 +++++-----
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


