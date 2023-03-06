Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233246AB723
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:35:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5Lf-0007XW-5u; Mon, 06 Mar 2023 02:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5Ld-0007XM-5J
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:33:29 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5La-0001Ad-Hb
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:33:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id bx12so7729986wrb.11
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678088004;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pFgr4Nbsv22ZecnydGVeeSOR7+/D83Z21iUJ9hZheTM=;
 b=rvdk2ufugU22IIMn1GFLqGkGAPIgt6kzznEDOhCV/cO9EYZJ16Q6qKbIrhtwANiC2Y
 tMbvKifSTC3943t1T9K+GCMwqq47QrNetVY61pL9H6bdcYGpsYlk7d/0QUxaL4EWulby
 WaWrb0yNEnVeVvB4SEeoAaFHTu0zG1829lBx38v9aGTZWOFRc/vdOViHTHkzckVtbku8
 aIojV/HV/A2piJw5i6e2DIeHbF+DCYtredbvIfsF/bATaiyLD0t2Mta1D2RgOkjluiUV
 uyqOxwTpB5op9XCwMCsM1HY2JA2fXQa7qWEH3OiJ02uTaL1EkkfgLc6fhufssgItxnj5
 UH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678088004;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pFgr4Nbsv22ZecnydGVeeSOR7+/D83Z21iUJ9hZheTM=;
 b=hMCn3zrHN7jLonTf1WhYYOFVVc0UAiX39bH8ukG973/XqGZotDu466lsMnodJqGv4x
 xvREek/AyPdLNvMXAjobSwSKLHlRTWqUujbyfb43Zm6PaJ+W8G2b5HzAAGBT612Zupc2
 w2y0ZtJyrAa7HgMmonc2l22YInhYo+Sf44V+KxwYODAPQlCy9GFMT+iASkx0HRVsiPZN
 bPqL5BmD/SRaxLaZ4KtgIV2R0xm50fsIJxIpKfslWy3pTDrQaRENpNDN7VCtolfGlCcq
 lIYQxNR9w38NBEAtp3FqirgK3IlWnQAtjZ6lYN9wPqXp5Xkcx0/avt3fA7EdatTfOqZi
 o/9A==
X-Gm-Message-State: AO0yUKUeRc4vI76EnCW78aekfWcSMxm95cruxFQbFs+m0Pc3e7PcqqNr
 Ey+eYxuj+hU1glaZESVx7cKcLA==
X-Google-Smtp-Source: AK7set8GiCi+D367xUbRTDGGcUEEXX3NSZQRYlaUlznZPpBAC1m2jwSJFmt76jxWMy2KahL3sRquNg==
X-Received: by 2002:adf:f408:0:b0:2bf:d285:b787 with SMTP id
 g8-20020adff408000000b002bfd285b787mr6637244wro.56.1678088004531; 
 Sun, 05 Mar 2023 23:33:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s17-20020adfea91000000b002c6e8cb612fsm8902119wrm.92.2023.03.05.23.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:33:24 -0800 (PST)
Message-ID: <d6646e6e-51ac-0f3c-9ffc-47efff3a74d9@linaro.org>
Date: Mon, 6 Mar 2023 08:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/9] linux-user: Rename max_reserved_va in main
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306021307.1879483-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/3/23 03:13, Richard Henderson wrote:
> Rename to local_max_va, to avoid a conflict with the next patch.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/main.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


