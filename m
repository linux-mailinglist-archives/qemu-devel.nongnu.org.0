Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7136A4B953E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 02:09:27 +0100 (CET)
Received: from localhost ([::1]:40842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKVIT-000688-V0
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 20:09:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKVHT-0005Qs-6N
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 20:08:23 -0500
Received: from [2607:f8b0:4864:20::52e] (port=41605
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKVHP-0007M8-R6
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 20:08:22 -0500
Received: by mail-pg1-x52e.google.com with SMTP id f8so3591449pgc.8
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 17:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wk5GwAEn92AhNtHexLGSoQji9LZyDgHKd1e1OhndGvw=;
 b=PdwhqoqrnUsVQq+LmcMC/I4hEiGht4RYYuUL/6DCtlIVHA/BWGaV07o0T/IL2xs84I
 wlq6CDk2LHgr6ZUCIS06bXNrWV41QQqyRAuRIOBVwNE6SFGD2oD8UGf29BHZkLux69hS
 5IG+msTxZCH5QXYLKB6WtafHM+5PmHmi25LkeSYgOqLuRLTR7/HIQ6fROF+VI8UEo7H/
 vtekNKISml5cDFIaVTjIdxNTlXcu/gcVTz8vHUgy8+eSwqsz+V7tdf/6vjlsDF2saFHX
 k6h5FkUAz9Bt3LIJpBqR/wSNJrjoyH+jqjpB0wfBW+KRYQOjuehNVCPCcGhEvQkdR8A6
 mvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wk5GwAEn92AhNtHexLGSoQji9LZyDgHKd1e1OhndGvw=;
 b=hjL8IBIIqYZWfkuvuz+1HrvwjR3dKJ8+Er77DqzzvHZPgul809R9HpKJtYyLLYwWYM
 sXRphJ9yVygK/QNa5qbuIiEMV9JD9hmSYadSmexnv4yrMMnY3x3eJF6o+RR5gjJR4h1f
 X9KMd73Ec0ri9aiBiTBe3e0naMeivdyOW4SbD8Qu3GQgcgFZFzDOn/qUiZdcAPQLS8+h
 0rj3UIjvl1fTads+OYb2pJpk0lHfeYe+yja0pIMGMou+5gZWohlAvi412PQPM+MnB/WT
 q1bkpzF4woXGjYM7Qtm8kTmKcCC+RvNhMZ82TEt1UkzrSmMHe6TgNrcuFycFROtoy8Gx
 pBNg==
X-Gm-Message-State: AOAM5303b/8vLBrkdtc/HgvAL0To6rlnUeMnG4qkcB9wB4TQK6qKcxQn
 +kesZVSqiYctiyY4IOpDg+4CEg==
X-Google-Smtp-Source: ABdhPJzswhHZ0YAbFjwrH81cVMhz9z82uBtGvEumxw7Xq/FxMJeA1D77OHx6nlkS73a+KKvxAR4Czg==
X-Received: by 2002:a63:4347:0:b0:373:8e62:5a87 with SMTP id
 q68-20020a634347000000b003738e625a87mr532707pga.288.1645060093098; 
 Wed, 16 Feb 2022 17:08:13 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id q32sm6681210pgm.26.2022.02.16.17.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 17:08:12 -0800 (PST)
Message-ID: <9d21dc04-0010-2ab9-9bc5-d42fa2f06fc0@linaro.org>
Date: Thu, 17 Feb 2022 09:52:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] Hexagon (target/hexagon) properly handle NaN in
 dfmin/dfmax/sfmin/sfmax
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220216043939.25339-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220216043939.25339-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 15:39, Taylor Simpson wrote:
> The float??_minnum implementation differs from Hexagon for SNaN,
> it returns NaN, but Hexagon returns the other input.  So, we use
> float??_minimum_number.  For double precision, we check for QNaN and
> raise the invalid flag.

I'm surprised that the behaviour for double differs from single, but the docs are light on 
the subject.  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

