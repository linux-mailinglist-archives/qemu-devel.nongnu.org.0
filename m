Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD0431B221
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:56:05 +0100 (CET)
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMYu-0007D1-6j
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBMFr-0004bu-Eu
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:36:23 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBMFo-0002Yc-AQ
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:36:22 -0500
Received: by mail-pj1-x1031.google.com with SMTP id cv23so2425394pjb.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zv5CLpEFCuhEuE62rMSTi48K+zNvlW8XCdDT7wpnbwQ=;
 b=EGPKxPoUm8FCxHhcY9Jv/0L/2x7bQYii2Kz/ZZJOe/pWCcod6bmWwuD6tWlxF6YZvf
 H/m+3g5zqzFwVxEyZimlH2fjfl3G1wxRoKq3ncSudwhUJVo4536VrL+vFHOcUi/FfKno
 twBe+/LOvU/2SZ42NZJ1psLPwDTTamT5Wj3dbIgBzmym8IxNnYzbuMmAgfQ3nqWlEQEk
 44QHEU2Y7C06wpQ3qSVD6mqU/6gyXbqWRkRC3OKh1ZaPH4Mj8Rh7/LHSIrIdUVxWpR2t
 iyVHur0QomBnfyxy9ueFpXKKr/Akc6ZTmV0LJ7mY8yS1HfubclTTgZhEUKy14GvDUiFC
 Eahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zv5CLpEFCuhEuE62rMSTi48K+zNvlW8XCdDT7wpnbwQ=;
 b=Yq8dLv8kOB7j/b71a91xfrvWldgWtEveLXF+b0vLLkh4A94j9C7Bi3gdUPe9zpNL9y
 qNQeyl3Qzoa/LYvIJJ5zXFRqjcbSwu+uG/KcgEqMssRi04WJn6GXQz4z2vUcckZLImOZ
 08yyZ0JATnXdunVgYAl1lTDPUA5hMdQhkR99gl0eh5GFJwCnE2uSjueuFpEvKShD1xGU
 I5mg29uY2t3ZaGuG/w2moVr34v8/bpYS5uotE2aMnoCX0debdzAKnzhT+41FjpX4ojpN
 i6q9pEfp9ZAjQQZxTGaqumRnTr8LPSROOCneNgsAZJR5CFuoP+DKsr1VhvDmesiTS/to
 hMBg==
X-Gm-Message-State: AOAM5301e6kwHG06G0xubfDkDZZyoWYK13xsJp1hEs2RRvPZAqoICFqf
 6UsYVO0eS5/TMm49kqdrh4+HXw==
X-Google-Smtp-Source: ABdhPJwcCOZTA1j8ASxZZ9bZD6n2ofmUk5Vi2F8NK6t6piFdH5M5zP4o3ooYoEdlSMbrW35ZK3/CoQ==
X-Received: by 2002:a17:902:f545:b029:e1:1466:f42b with SMTP id
 h5-20020a170902f545b02900e11466f42bmr11937856plf.45.1613327778393; 
 Sun, 14 Feb 2021 10:36:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 30sm16097140pgl.77.2021.02.14.10.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:36:17 -0800 (PST)
Subject: Re: [PATCH v8 14/35] Hexagon (target/hexagon) instruction printing
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-15-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5089aeee-dd3b-eeaf-732a-89dfc44ccbb9@linaro.org>
Date: Sun, 14 Feb 2021 10:36:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-15-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/hexagon/printinsn.h |  27 +++++++++
>  target/hexagon/printinsn.c | 146 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 173 insertions(+)
>  create mode 100644 target/hexagon/printinsn.h
>  create mode 100644 target/hexagon/printinsn.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

