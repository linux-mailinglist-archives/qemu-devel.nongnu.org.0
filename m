Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B057F746
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 23:57:19 +0200 (CEST)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFjbB-0008QV-Ln
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 17:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFjZb-0006zb-Ch
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 17:55:39 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFjZY-00013Y-Fe
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 17:55:38 -0400
Received: by mail-pl1-x62a.google.com with SMTP id g17so8824871plh.2
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CWuVwRkVonJzXeLaiW4R83ca99/rTHSZbI+JUqirLws=;
 b=HsudXQgJ3PqU4uHDzw/DGudCTWkXJCvHKbEEmzsbnJmJgJi7/l1rIS64TJUv30keDc
 zCUP1SNW7M8TlZqQald0x4jgXe1+CUhUnc/K4QG2kZLVFmCR5MWD+iO9OHW3crFdMCwR
 Z49kzW4vlmq09wPZYlUugrVqQjuVOKOIyhux7YGbqENrlCv74jKGcwixRCB68vC/+FnD
 wbP9rX0WGlk/QWE3TaENkQrRyxIKS5DMhXfoFF+M4kWolnWc70PDC7LuKwFxKhF9lGow
 iCb5Kb57n74kJQtJP6rlDVCj8fVOsxpDNz+f1JztVWWjL8MBQBvJub8d+F2eSOqlO5b2
 /NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CWuVwRkVonJzXeLaiW4R83ca99/rTHSZbI+JUqirLws=;
 b=d2p5idPf7GptBOYdLgD01S4azg1NaxZlmH+UpiaVL00CfGoEJSnAm9QbOrnQaaonR7
 iWOY+rldw0gb/tH2lKOK6CybGuSl+yFpnoXH/9iMzdZ7WPnXEt0LksMCmSd0Ulq0iuyl
 nOwsvdYh62T4ycLkBjFvGIi98bSLtjlvb6ihxBOkZhVn3N62PRo2qQSw9F5oVR+Qdy1l
 GDH9TKKUyot+JBeOfJx4m0QBHc9weWQokkaLrcTCzGpBNiAwLlLlRcYYL+uww0pnZ/sc
 fClGGATinedvsM/izHCke71vE2GH3r6Ut8V9mA5M1iO5y4QVG4T+KGg5KSGe8NGRjOZP
 xINg==
X-Gm-Message-State: AJIora8uQ/0Yu6nWKhViEi4VNc0eOldy6YE6wfsV/EiBgCc83moK+Q33
 yhhks1Ff6MvSKn7PDTQxRPmqoA==
X-Google-Smtp-Source: AGRyM1sSTV1vEiaYm2gwz5JRbnocpYHDQre9rXCpU0NdCywi/8HIm03jj6x2bUVL7stBGoXuw16jyA==
X-Received: by 2002:a17:903:2347:b0:16d:38f3:f373 with SMTP id
 c7-20020a170903234700b0016d38f3f373mr9329779plh.138.1658699734128; 
 Sun, 24 Jul 2022 14:55:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:ef1e:c8e:be06:74d0?
 ([2602:ae:1549:801:ef1e:c8e:be06:74d0])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a170902c94400b0016d773aae60sm779542pla.19.2022.07.24.14.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 14:55:33 -0700 (PDT)
Message-ID: <02731234-fe4c-508e-0cfc-c41918e2845d@linaro.org>
Date: Sun, 24 Jul 2022 14:55:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] semihosting: Fix handling of buffer in
 TARGET_SYS_TMPNAM
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220719121110.225657-1-peter.maydell@linaro.org>
 <20220719121110.225657-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220719121110.225657-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/22 17:41, Peter Maydell wrote:
> The TARGET_SYS_TMPNAM implementation has two bugs spotted by
> Coverity:
>   * confusion about whether 'len' has the length of the string
>     including or excluding the terminating NUL means we
>     lock_user() len bytes of memory but memcpy() len + 1 bytes
>   * In the error-exit cases we forget to free() the buffer
>     that asprintf() returned to us
> 
> Resolves: Coverity CID 1490285, 1490289
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

