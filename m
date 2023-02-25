Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E96A28AC
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:57:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrIn-0007Zf-Ez; Sat, 25 Feb 2023 04:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrIl-0007ZQ-Ap
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:57:11 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrIj-00041m-4H
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:57:11 -0500
Received: by mail-wr1-x436.google.com with SMTP id r18so1599627wrx.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=268TKzeuZbtbJnuXhy+HnY+Ellf8vHfOPqCvDlKB/jQ=;
 b=EaH1O8RsL+7gwSpdPrCBlKityGzltJobsXXWSZ9ahNCIVG4IdASpqsrlRla0VqrMQK
 KvhDha5Ve8rhGpk3T4aXqYkFI9qqI60RFLiIMCjKLVzhSTYYGgF1jRSrTnvJdlqgqZM4
 VWpb20sSK9FGZkF7/8uXALO0Cc6vxrJ/mhqKkwQHXGoJSP7PylWfsXEcY7rP0OkxZS/4
 4bKkIzFQHWyEodUgCKUsxLepudOD4HQTP3OW4x4y6WpCKkekF5xGsyAw0mrlBI8wvk1G
 3KkZ2Ji7tCWgso34XtbGnLELLWrMlSl81U2IFuzHiiAsKDXDfmFGY+4hnLIgBzXdL2Iq
 xZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=268TKzeuZbtbJnuXhy+HnY+Ellf8vHfOPqCvDlKB/jQ=;
 b=YECL3kYONsECY7gzfqAeCBJTDJnzTukA4HNJN8/vAN/iMyTw6HCr2rlmheCj41L1Pt
 iHCymJ136ASO2kxJdcQPjve6pfaRlCw5Ggxg1YYvpQl6C/+ZsjWJDLhJCtaRUzSejuSF
 r2vrayhN10ExQtnCV4cYCtapqdqdx882u++21iZRZ7OCIDJbGb0dqGcoW0suj9NXlbyK
 OwX/55oNJbGxLCaZfkqhrOizTEad1MeHdh2i73QrF2pK3KqtuMZd6E6XHhkEl8um/Wm5
 JE+7yw32X2lH8aMShui9QQzPW+BrVkSLoUEk5s9PQ9i9pLjrGt/FO+uHe76RRMMbM8e7
 /Gow==
X-Gm-Message-State: AO0yUKWuvfGcXlAGbb7pM7itoo+Ryl9ei086vJOFEeKCDynbr5nPtwJU
 k0OxyE/HxkDoP3U2Nex826lsfQ==
X-Google-Smtp-Source: AK7set/Y2QS3O51b8AjxSgJGEmBWA8w3oZxru6e2WCcBpR791J2I1r4nm59a9p4ATKJwQm4iz4DgGA==
X-Received: by 2002:a5d:5309:0:b0:2c7:1b6e:5a9c with SMTP id
 e9-20020a5d5309000000b002c71b6e5a9cmr5232696wrv.2.1677319027520; 
 Sat, 25 Feb 2023 01:57:07 -0800 (PST)
Received: from [192.168.136.175] (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 r14-20020adff70e000000b002c567881dbcsm1310533wrp.48.2023.02.25.01.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:57:07 -0800 (PST)
Message-ID: <5ac37cdf-e05a-ea36-3cc9-257ad001ece1@linaro.org>
Date: Sat, 25 Feb 2023 10:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 10/30] tcg: Use tcg_constant_i32 in tcg_gen_io_start
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
 <20230225085945.1798188-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230225085945.1798188-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 25/2/23 09:59, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/gen-icount.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


