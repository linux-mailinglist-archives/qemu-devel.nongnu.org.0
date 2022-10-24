Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE860BE6E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:18:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6gC-0008MD-0t; Mon, 24 Oct 2022 19:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6g7-0008EU-7R
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:16:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6g5-0007M7-MI
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:16:19 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d24so9733942pls.4
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XVon5DHILRbuJvecoizaCWg2xrmICIr7n4KRdk6Aa4Q=;
 b=SMtWBKdFzjbE0FaqkXltNfjuu+neVropZZKDyyUfzV09ztwH6h5NjpSZutG+yBB30v
 Tf6Bt/pTPxapEW0JtU6VZm0B1zkRhkc35WucnxgLcubt4Cx2KWKFgL0ZOgqR696GNkbx
 tdZxfOENnf7YB+S+OK/laUA2Y+vfxS9snyX4oPPYFDWNstBhs+1pec5wKr3ZQxM5IhkP
 EbwHcDCmkTmu0qXzAgZxAyhkuEEMBlYOCZTMN3LQ0JBqPy/161ew8RaGy8RhitYcYOLg
 ok9/UWfBDmoq9h2SprcVCJE0/sWDAFpnwjm7gLfbkcHONzA9dXRASQasxHqVW6hJ5ojH
 0RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XVon5DHILRbuJvecoizaCWg2xrmICIr7n4KRdk6Aa4Q=;
 b=jxfI3rYaIzQKWAYFFuu7GU5JVGXqFRItA1S1ADl1rTkJNKGf7a3FGHGtCLCKcpWF35
 yWHXolZIssUpt1eKmaLq2DwZgwiWjqW1oqLBde/y8hFJz48n1IhraabG8o8rO8UKRX/3
 sUoMYJ2gakNpr77PwXSoBpBA502IXDxrY9OSpTaj6KjTQ2FkgYti+nRkUYzAi6wmfaCp
 LuDjPKTsoztM3i8y07USs9X4TcrttmTIwvEKKX5enm73r+uYY3+Nl8brwczirItUWJ5y
 F5WDKDPnryRszusHyu55mbd59tVx8oMHJ5NHMHhE/+TZJql4E2XclwdB5NG9IySzuqxX
 dBrA==
X-Gm-Message-State: ACrzQf3PaRwfXJM+47mxchMvlP3MBk7Re/g9PehmMSydaHnk8j0L5Y4Z
 OHV2AbA1vhP99OKYgVEyrod5rw==
X-Google-Smtp-Source: AMsMyM46AAzKrx1Dg+EUV0T6v7QpZ3OytL5TvmkYYgWQU7ibeKzlOZbx22NJGhLGJ5GHzF8/hiy7XA==
X-Received: by 2002:a17:902:d486:b0:181:33f0:f60b with SMTP id
 c6-20020a170902d48600b0018133f0f60bmr36611904plg.174.1666653375519; 
 Mon, 24 Oct 2022 16:16:15 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a170903018100b0017dd8c8009esm237786plg.4.2022.10.24.16.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:16:14 -0700 (PDT)
Message-ID: <cf37bd41-a7d2-d988-989e-bd584d9e7235@linaro.org>
Date: Tue, 25 Oct 2022 09:16:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 07/11] hw/intc/xics: Avoid dynamic stack allocation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
 <20220819153931.3147384-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819153931.3147384-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/20/22 01:39, Peter Maydell wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Use autofree heap allocation instead of variable-length
> array on the stack.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Acked-by: David Gibson<david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz<groug@kaod.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/xics.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

