Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9028682016
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdwj-0000EI-RY; Mon, 30 Jan 2023 18:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdwh-0000DQ-3u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:52:19 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdwf-0004jU-Cx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:52:18 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so9442306wmq.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PFYPT8pxjkiEGn89vVqOPspZJHrSaq/X0S2aH8JYi/E=;
 b=mp865CFSfWmYCRtwtzprU7EhXVLcx5XrfK/6Tr2Qc2KkmQN3wGsIFHGj1nvtLuMgxT
 0k/o2zMSXaKhpqI5Xv3VopxRYiABtngTOinV6K8R54IY8HqTjloPGJygQyNNkGR2XrSO
 w/Fak+tmGB3UP5Wj52vZCnNoT9HbiVQhIpXflJhX8vS91Rv1ivAw+ZItT89oZLViIkNj
 6DDTom8Hwpyxm6ELrBwhIbBM9suJvjRYR0u7z2vhbxJAVtRf2TbSpJSfjosiQdcb4O0k
 PbMWPONh18P49k4/i160c1UdtEU2fGkBLhV/TnG0ZxGSsOltzTOEyEmKcE0pGHChOoi/
 jp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PFYPT8pxjkiEGn89vVqOPspZJHrSaq/X0S2aH8JYi/E=;
 b=2IXM+p5SubNtWx9HOBQSORnbJ6HaVE3x3G4V1CZrWgS9bUnflk93f0UAvse+96L5Ch
 gu32PV/5wIktrZFMYoWOhrv+Gv0jW8BQP3LmS+MarQhaSoqZO8ao+zjTV1abASyrxLvB
 jxRxnNf3fvdrnT7NuSnn+eBmJ68yKGCnLP8RDzkQqnUthYkCWdSfqte4MZ/WRJrc46tX
 7qg63gvvJmXXREve8E8IUS2kYooY1ejTltJj7S6KtFAYF6ngiOi/5mPUGGgJwXPhPCHQ
 5FigEjTd3CuYvegwnAXuFn5v4j3FxlXfT0/XErD8ds1csTt0k6prjEgqUEmMMSFNyHJO
 IOeg==
X-Gm-Message-State: AFqh2kq/rJ1wR1606roY771dsVWLXTtbDTOSMjXwiqZm1l9/YCfEHUXt
 KcdXvMInqdKfrOFlz1QcmiRm+Q==
X-Google-Smtp-Source: AMrXdXsAqzk3l0Q/3V911pCN8LMUV+ZIOkP21orz8orWNjULe+UHm8hjwyn0n6vYUoJ1Y+EaZ0o4zQ==
X-Received: by 2002:a05:600c:310e:b0:3db:fc3:6de4 with SMTP id
 g14-20020a05600c310e00b003db0fc36de4mr48556523wmo.35.1675122735081; 
 Mon, 30 Jan 2023 15:52:15 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a1cf70e000000b003db0b0cc2afsm17980263wmh.30.2023.01.30.15.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:52:14 -0800 (PST)
Message-ID: <1d1c31e3-3066-1a0d-6ff6-049234b77e5c@linaro.org>
Date: Tue, 31 Jan 2023 00:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 15/27] tcg: Change default temp lifetime to TEMP_TB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
> Guest front-ends now get temps that span the lifetime of
> the translation block by default, which avoids accidentally
> using the temp across branches and invalidating the data.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


