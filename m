Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C414731C341
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:52:05 +0100 (CET)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkqi-000799-Q4
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkpm-0006d9-DX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:51:06 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkpl-0000jC-1B
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:51:06 -0500
Received: by mail-pl1-x633.google.com with SMTP id u11so4317526plg.13
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3UWQXHqEB9LpeNNdpitqrD4+YQIbwdLr45kc9sXSA6I=;
 b=KmjRxTXKeestHQhs8jxzt1Ee/HmigIwp1kqa7+y3jpWhwHDY3Y2n3yLm3eq8AWvIqv
 rCgDRWth4cVdjOs+RxdTPXp/MNDd5B/HINX9Fze2+bZT9cGWGG+tylCFA4PHYz6HgCvJ
 v6GystwmbesqsXhpvBRpVnAOlNXCkeACRHVv+1o5evyIoSoNiGM/7fkH1Jz+8UT8+JOR
 FRn5pd1r0cNaQE4xug1gf918ePQJCNmDRypZlrNg/kl8RGQyv6lVKrCXxBtiOnn9h+Wl
 sN8TL7oU+cbHyYhElbWZBqpddbMx+GHHPyVd56kcbvcQj0OsC3P2ZHCugmD6RRC3xzNZ
 d1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3UWQXHqEB9LpeNNdpitqrD4+YQIbwdLr45kc9sXSA6I=;
 b=L0ij1ZBPoWBCf29Um/q0n6Rxe9jFvmLOaNOb5anc6CAhJpz9JSLYUPjEfSbFPHCCdp
 FZYhjRu+UysZVnalHZuIureSOeK6s7yCb3kwx1scI/9dxwv6mTu3ByZ6rGa72DDKSVHm
 GQqKAIHMx6QT+cW2ipOyG0YSG8r3YTpEB4M5djaZ6ZuAFH77qhIdTQRSP0DFPcASqe91
 d6ZtUgxK4UJzkoYO9BV9ad14QBWsqbhN9SFfP2yRuiMFRjXT0tl49F/LLANI98VUIkFH
 kPZuRaoMvYsWveBE59uz3vtOITwxMXCEKfJ2SQhPffZ+0MIrTrWh2vwkXfWEtdPJmGtg
 38GQ==
X-Gm-Message-State: AOAM530jwZMt3LptK0n+lms0LT07SVql7Xwp6xk0lvUlepvx6R9Bpp/G
 GcjV1ANkeogKkXI86bei6xibVg==
X-Google-Smtp-Source: ABdhPJwt863tUGCgWJM34zGEDcjRJ91XtscQl6DQpnDw6ZmJJcfGA0BaALUOfCNM+dsDIwRe3qqrnw==
X-Received: by 2002:a17:90a:fa09:: with SMTP id
 cm9mr635742pjb.160.1613422263322; 
 Mon, 15 Feb 2021 12:51:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v4sm18633569pff.156.2021.02.15.12.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 12:51:02 -0800 (PST)
Subject: Re: [RFC PATCH 25/42] target/mips/tx79: Introduce LQ opcode (Load
 Quadword)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-26-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <679afbcf-feff-5cb3-ea03-1f691ea327be@linaro.org>
Date: Mon, 15 Feb 2021 12:51:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-26-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> Introduce the LQ opcode (Load Quadword) and remove unreachable code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tx79.decode      |  8 ++++++++
>  target/mips/translate.c      | 16 ++--------------
>  target/mips/tx79_translate.c | 35 +++++++++++++++++++++++++++++++++++
>  3 files changed, 45 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

