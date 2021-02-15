Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1731B39A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 01:34:52 +0100 (CET)
Received: from localhost ([::1]:59776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBRqk-00088V-U8
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 19:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBRpi-0007gh-B3
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 19:33:46 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBRpg-0001dn-LJ
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 19:33:45 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gb24so2736565pjb.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 16:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RaN1I5yOCwtCiuUZQdCZAvGD3tv5XaN9mdUEwc4Y6IU=;
 b=F43kiq9qLxx30wj4ahr+dD9PWEY0miKZKzbTxyINPfJyTtkYXoj1fXfYqYmkpIniJP
 +jHw7o6E+QOtTiPTdjIcWWumUxQiWrOwKbrhDMxhAX5/w4GFmyIv+1GQFsYp4VmbhF0+
 SUTvwL05t6YNF8WDHffKWH2rVe5PwaLHOvEQW74bFmA0udn+UAr/LineGhVa/TzCVuoz
 5FChs9bMhYTorhdoYy8WhKDgUxibRoCxyMW+l50y3v7GZIWKPzHW2xNk24Lwr5/lGW8v
 XI4FyaWLhkWf/WpkZT10gLrtcnNNMRrk4sdQJZ1NvtPCmwvqSwVHD301WmvANdsnrMdT
 U5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RaN1I5yOCwtCiuUZQdCZAvGD3tv5XaN9mdUEwc4Y6IU=;
 b=pT3uYU1B+eszWVcYAZL1Aipk2WcT8JwEAzd1Y03kVqnuEhPkeLLZUrqbmAeytqcRou
 pFovqzOD0lx/YmI2Og0WVkQIG4pLwHeoaN5MzFS9mwiHz61bQjuH924rnxYbs8oAIh6g
 2cWXyafiXNxdDhjjDejFsU1IJ2ye1PSX8JB20mna43Ou4Pvgay/wuB//whbl5NysB1Yq
 TAnL431pc/WdHFLyI01ybCZdlKwy6Zmhm1nKPyxCkJyG6hAn93gvIzSCpG9nU2qNLft8
 XuMUedCU0hFU5hIcUNs5Eh2cHHBBhmYDRBJgZEdTyN/3vS2WxO4MCdh+C1N0mJEqnegg
 iIgw==
X-Gm-Message-State: AOAM5300yyf/SIJIfgAnoqZGL80176WNoUBhnEcNw1+b2VTVLYRxDSjR
 bqnG7f4tgdocBGi6ErWjVDVz5Q==
X-Google-Smtp-Source: ABdhPJwukwqkc9euAnfUND3CBBF9pYV1KNVsNsXbvshsJs7L6u99HbLDO2OoJyQw7arQENqGmMdYUg==
X-Received: by 2002:a17:90b:368f:: with SMTP id
 mj15mr3256596pjb.139.1613349219568; 
 Sun, 14 Feb 2021 16:33:39 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 f2sm13736418pfk.63.2021.02.14.16.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 16:33:38 -0800 (PST)
Subject: Re: [PATCH v8 27/35] Hexagon (target/hexagon) TCG for instructions
 with multiple definitions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-28-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d08c59c0-4cc5-0ffd-a1fe-11fe919a3394@linaro.org>
Date: Sun, 14 Feb 2021 16:33:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-28-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
> +#define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
> +#define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
> +#define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
> +#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE;
> +#define fGEN_TCG_L2_loadruh_pr(SHORTCODE)      SHORTCODE
> +#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE;

Why have some of these ; but not all?


r~

