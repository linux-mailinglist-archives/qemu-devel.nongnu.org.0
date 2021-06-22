Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3652F3AFD31
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:45:38 +0200 (CEST)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaAC-0004tB-U1
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lva95-0003q5-Gw
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:44:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lva94-0000H2-10
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:44:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id j1so5026451wrn.9
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 23:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=//JtJrY4KSrwDonCR66BvwFMKz52dkJHLLrKF9Ui3Gg=;
 b=SjHv1MOeXKYfmcsL89HdY1l8wjjexsReszugaB58SaCRBK9R/sEPSUw9OyAUOUANot
 j4pbVtcSMwmYvqn5m99jNEKcbxP7gWd1SmPL+NZN6WFma1s/XjhH+71m13bw3OsfdFDk
 5tVgB6qos1QO1CjZh6AZH+u/u0e6z6Z29ztTgM3cIzWbKHwmcSXWrWBCv43F3mvttXsx
 kXi9ycDGzME6I/Q/jA9EGrdbbwwyF1snPvwHB0RrUahLzgohPtwWzpHOdqLQHalpxWT8
 H4ytdPjMz90CvgaiwVitR3XfTdx5CQwpeinsQvlcJEuGdR2sgwM5mNSUdHF9IajpgcIi
 oRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=//JtJrY4KSrwDonCR66BvwFMKz52dkJHLLrKF9Ui3Gg=;
 b=ewZDBPuZFIywjs1WwvtPoBq7uHJplTO5F6cbDSIZYBsktfW9ksPFhJjPg3Pr0R/USR
 MQ79aG5oTKe310qQozWU8t5VhbV4QaaS4ied080B6IRq06sqqxjcJS44tIpAjxLny1wI
 JOlt4tTQVXviBGRu3EfpUEh5+5cDmhv0Tppf5OCv1Cy5X3qP5QaKKpOR2P9ZdU2TshlH
 5eruMGqsqUhAiaoKNK3mbDQDYoalyPF4R7bf5tUxhpuG61Bs2zHh4wvXrLONX+CrdXDj
 FsfUGL9FCD3Yt0D3+tC4xQd68KNS/Y0k2weslzBpIH0up/Qp8eq2Nzd40WpBz5nprI5E
 vgUA==
X-Gm-Message-State: AOAM532e4HaTcXYonWO0csChBvwixibU/xrG2MwUvffjIddSh9CXMWTw
 lQ7VBn7ZdAsKXldWFh0X/gs=
X-Google-Smtp-Source: ABdhPJzGO4gOP0/QVmgUbXxsBmmNZ7n3CFCvpsZpSXXwPqElhiLxSLueo40SXdJbXM1dz8N075//kA==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr2759196wrs.420.1624344264499; 
 Mon, 21 Jun 2021 23:44:24 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n10sm18964660wri.77.2021.06.21.23.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 23:44:23 -0700 (PDT)
Subject: Re: [PATCH 21/28] target/arm: Improve vector REV
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2c571726-b1f0-d6e1-37c5-a271eb0fd3a8@amsat.org>
Date: Tue, 22 Jun 2021 08:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:37 AM, Richard Henderson wrote:
> We can eliminate the requirement for a zero-extended output,
> because the following store will ignore any garbage high bits.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

