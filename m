Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA6412923
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:58:55 +0200 (CEST)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSFS-0001Pr-22
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSEZ-0000kc-F2
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:57:59 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSEX-0001lR-0t
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:57:59 -0400
Received: by mail-pg1-x535.google.com with SMTP id w8so18877178pgf.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 15:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h5dd4FL8bcqD2eCqtBhHm2nMWfaDiOp1s8+pijYIZuA=;
 b=sbPQacvE9MRblRXA7OwUhA55+6Du9Si6RzAdGppH4eqc3zKR9Do/kDfrElTT+ha6mB
 cnQwc7xN8CnHjnnvrMtUiJVb95eW2ZzK0uEqTAsIVsr3vSLm/31DRipnq0cNEnUi199x
 4LC12XqIROhhbfRaqu8z9cXY57qZsu0aaGuJjopArA3DdDy+3BzGSFu6Sh5DQvJkjlZS
 liMRdNTZ1QXA/gEyFmNKd8YDAw9mDycK+PefK3GnRs2mvZYUzPI0MclDj/LHJxhDfuOR
 jY0RWA6sHvvCdZEr2747UD2B2047XR0P3dmqr7aZ55YtBzxlS+CUZnjkShUjOSB6mx9r
 hdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h5dd4FL8bcqD2eCqtBhHm2nMWfaDiOp1s8+pijYIZuA=;
 b=6PUVTy3V1HSPkIe8nAeCl0EUaJVJLK6vriDt5DfUqZEEY7h51BcDdmBE7KE6edUvzK
 MFu5q1lpux4MfUSgQ7wI9PgPShxpMArt+vzoratoTXRx6OP/UY+8QeC3Boaq4gXJ6Eeu
 /lNo4YHz28+sn2WBDwpmuocMDXSwL9k0TQSsgcAEXWa12xflEfKX2mtvg/Dg1pbdwewZ
 E4OaT54M1hWfTnMNfIRcHNPz0c6m6rBXUk88w+Kqtaj7jZ4GPBz8MJ2obyH6tzPoDJBH
 CGp2thjD//U0MJNVjtH/V9HdJJfXO/2kGwGzmqxJKQ6NDuhJGGHVe3d8lmbxxEXjkGFd
 /7uw==
X-Gm-Message-State: AOAM530iuaDjvP1uv3KA7MtbEDB1dGH8s/sIqr5bScttjeVmxTMnJiy0
 kH0kvVQjWAg0oAR40D/ahcsxug==
X-Google-Smtp-Source: ABdhPJxzocZ/GZXb3YhtuMwE9Sj/JiZMijWumCGw89J8tOn+jRBLE2G5gUHl/k4MrUdv7WVZU5aSUQ==
X-Received: by 2002:a62:dd53:0:b0:445:9e38:4ab with SMTP id
 w80-20020a62dd53000000b004459e3804abmr16939991pff.41.1632178675284; 
 Mon, 20 Sep 2021 15:57:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c3sm16635961pgn.76.2021.09.20.15.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 15:57:54 -0700 (PDT)
Subject: Re: [PATCH v3 05/30] Hexagon HVX (target/hexagon) macros
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-6-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63b0dbdb-a022-7009-ab20-772e6c1ac951@linaro.org>
Date: Mon, 20 Sep 2021 15:57:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-6-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> macros to interface with the generator
> macros referenced in instruction semantics
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h       |  22 +++
>   target/hexagon/mmvec/macros.h | 341 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 363 insertions(+)
>   create mode 100644 target/hexagon/mmvec/macros.h

Just about unreadable, but ok.
Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

