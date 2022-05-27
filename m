Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC394536681
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:21:08 +0200 (CEST)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nude8-00066c-2l
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nudcg-0004DR-Ki
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:19:38 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nudcf-0002ut-17
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:19:38 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so4892359pjt.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 10:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rk0CxKhLdf7E2zms/XAXhxoZwTNKnkAX0baUlvVPGTU=;
 b=soFIPHOJKrTw6RkEEgz3G2JFM4dyVKRpvB60ln7YgBsT6WBLgSEEUL79KtCmLAFloe
 lZ4RbqBhdQhLpMb3V60RBranL06cEJXzKoVi/EztEb87Sa7qxvhcNwrNWgPLhBaiPffT
 WHkJRBTdxaBHaTxzpidA9VBU6Ay4iTUz7l9+JPnEOD2hNcDj8IFrN869CyZqlIpeBe1Q
 1wuKenqkh/1XmFUbhP+lX5cIlMgemSAC98zJy3sHjGPpPFm/sNsM+G71XfZ//gy80Wmt
 ZJtfHO+0LXxwWecxMHYcvfr4XsV7hURZhVGGQkyZ26Zt2ma+jHxWUMfBvSugzCfeyscu
 WgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rk0CxKhLdf7E2zms/XAXhxoZwTNKnkAX0baUlvVPGTU=;
 b=TJBjT2AZ/8Z/GXF2A/Ci7GdGtoCFq0FBOYQI2RqbjpJp9rcPk0vXbcKtORzADsIoFd
 8EyBzBHdqvUhMrl5onACeSn8QqfH9+zJySkUelLgshTK99+CuS6WQ8B27PmBeDesA2xs
 GU03JzyMXtAzKBTWR2x8NYRhWpqNvOaPs/ZltutgqJPzd7yvtE7wAt36BgV5OWH9OOWI
 msU4TbXHNBl05AXy944RhX+2s5N1WaYWFyj0ug+MkyT5aNOBDA/uauQ955c2FLtkZvwm
 Er4C1zfRQsZJGumB/62W6Q1iSSjBvdEW4EMbNsoYCFsYIUniyHH9eXg2HAWUtNdLiG0o
 Ik3w==
X-Gm-Message-State: AOAM531D79wYOg6+For/pwSF4lWszhZQPBM+p0m6DdIyAW3+Q2HMnTHh
 rfMH8e5RZtWmowCOlD//De0oPQ==
X-Google-Smtp-Source: ABdhPJwmDlaLw1RAsApGgRBQqhpkxCRstyvIxYgD8Z+GSlFbnMU0jYsHUSygsb8hwgvRmoyiqR1+4w==
X-Received: by 2002:a17:902:da8b:b0:163:6852:39cc with SMTP id
 j11-20020a170902da8b00b00163685239ccmr11811691plx.71.1653671975031; 
 Fri, 27 May 2022 10:19:35 -0700 (PDT)
Received: from [192.168.0.4] (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 22-20020a17090a19d600b001d954837197sm1877640pjj.22.2022.05.27.10.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 10:19:34 -0700 (PDT)
Message-ID: <56d78e1f-1608-116c-a7ce-5643f176a12d@linaro.org>
Date: Fri, 27 May 2022 10:19:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 04/33] meson.build: fix summary display of test
 compilers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220527153603.887929-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 5/27/22 08:35, Alex Bennée wrote:
> The recent refactoring of configure.sh dropped a number of variables
> we relied on for printing out information. Make it simpler.
> 
> Fixes: eebf199c09 (tests/tcg: invoke Makefile.target directly from QEMU's makefile)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   meson.build | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

