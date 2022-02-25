Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EAD4C4FB1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:33:15 +0100 (CET)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhH8-0003Yj-U2
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhDH-0001It-2z
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:29:15 -0500
Received: from [2607:f8b0:4864:20::529] (port=38583
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhDE-00036m-V2
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:29:14 -0500
Received: by mail-pg1-x529.google.com with SMTP id 132so5616293pga.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=UlZKqpYTL5W3qKjYU35tLGjDJd8c9HVJH4OUgD1WjWg=;
 b=WT9ZYefAlKxr+RMKN0U3e3B8NbTwk0aQPHelzHRW4FoqN69GhIVrLFgLGc3OtgTgkG
 Uo9Rm2aC+Xng0MhLHRf2HEJpKFfFEoHCTtnpz4mEFt1zxsxAUhnSxrxoi1Z+Q1XENrek
 b5W2KlwFemJVldNx4PeivjJDoJCCE+Ek6353nqoI3SZ+rm095scOnXVwRZ+8rCZPk4Pi
 i6swnM4KXmvI5dXdGaWTer+mA3IwSILN8Kg2N71LhtMzTID1YnGwtHsSTOIowV98zS+W
 Y2B1aqao7f4wPjbkN/ZwwKSC5XyTUelNQrj2BBl+wBLuu7k6Zk7a7yke6PlW5Lzo3TwX
 PAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UlZKqpYTL5W3qKjYU35tLGjDJd8c9HVJH4OUgD1WjWg=;
 b=tTzfVvlP15h45Hepy1ZgNoNBE1uNxltH/e9mL3xJ9W0IQiMlvr+TEiV2bJH9+W2L1q
 iQbjVNYJOwJaZ3KkMr+QQtQajTPgZBRhIVWbmDQj6eB8tCeA6uKHys0lG7nF5BJYM4Ko
 w1pNfdi6gPqA3VFLqYgDsu6E3AgcnBkDmbatbwI7KFapXjLI3Fg+6y/NJxhtSrXVS6AM
 NDRT2EtFAZA0AOc2p7KczM/Ew/KyzmgsVQ0h99MMkw9dp8daoqN1+y0udXllQhqWZSzW
 ugHy2TTmA5Lp/tOCaWMnhqBimKUtfcrguyaBdbd0eZ6WWoZyMLTjI0kRWclsQK5QUWh8
 ARqQ==
X-Gm-Message-State: AOAM531yG7g6y9VJsZfnjMZVlgIjTQ4bjZXRaleUonvlcNCVFcGsmmwh
 xCLSxGm82LevKdzIWfKtH4IbJg==
X-Google-Smtp-Source: ABdhPJzxerlQkWWfuI9uiOPMHIYb5TUZ9w9DbSoxX53NQl9dlgvpB41k/E9iYKtuYuCrSSUmeBpj7w==
X-Received: by 2002:a05:6a00:148f:b0:4bc:fb2d:4b6f with SMTP id
 v15-20020a056a00148f00b004bcfb2d4b6fmr9290408pfu.62.1645820951410; 
 Fri, 25 Feb 2022 12:29:11 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056a00244300b004bc9397d3d0sm4105791pfj.103.2022.02.25.12.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:29:10 -0800 (PST)
Message-ID: <646ce3cb-6320-92c0-fc6f-c3c6e2581266@linaro.org>
Date: Fri, 25 Feb 2022 10:29:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 16/18] tests/tcg: completely disable threadcount for sh4
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 2/25/22 07:20, Alex Bennée wrote:
> The previous disabling of threadcount 3bdc19af00 ("tests/tcg/sh4:
> disable another unreliable test") just for plugins was being too
> conservative. It's all broken so skip it.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/sh4/Makefile.target | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

