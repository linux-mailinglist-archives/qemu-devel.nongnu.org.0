Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615B440B93
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 22:06:09 +0200 (CEST)
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgucC-0003x8-7y
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 16:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mguaR-0003CK-7O
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 16:04:19 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mguaP-0008IX-Lu
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 16:04:18 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g11so1177522pfv.7
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GrdbmrfHztQaed9IR9I8HdFaa5BMMAH19qW0HT+vziM=;
 b=ShLus1upsriCSpa7TT4/0se/RwHi2TijFg/P5doAHv6e2mjiSOQTY3341Fd+c0YX0Y
 jU/VZ4NHwkHphyLzzzD0oRwll1WifQYFAtjaj7tQKpzt69LEARf7SRclE0D0sJRjt40e
 fJDDa5e+gTomOs1Im2mFvfv0b9obgaLhLSZwbDQKAWFSSyOV38+F5KQxop3Y+Qnwl7hy
 mCXmRm+N8gfGd7GsgZ3aUWOpjtpu7cwzSF+5jBdY3RxeHFwXf39XIXFZ0g7xzBBJjPAw
 K4SF4Wr1pkCeKNlnCiHXidm4Z5CoU/JJ8fbcWjyKKU45E+thpUXEdHqxjnwS9hOTB94u
 lyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GrdbmrfHztQaed9IR9I8HdFaa5BMMAH19qW0HT+vziM=;
 b=LmWmjmpBB7OI2RgpjOEcVdRd359bzjOCHGBS1ZT5u8VwWyvXEy9na3XJ3hgIr3/xmc
 K4f1XnwmUe6NRIXDBACk4EmJwVQGXtT3o097PNwevg75RaXEuIqjUSDW5TEuvo46aMEq
 j1ZrwQdHZ9jRpOmkPL5yMbHDsYNt7mP1YoNXAC+AgduxICsiKHb5bJp961+WcxX5ZRZz
 bPS3oxuIK7yZ3rS5xk5g9Odshb5P6rjJYDtepMvnox+Z7a4n7qC7XVmgGLXKjaKBrff7
 krM0TDkxGVxzx0eOlMEePqADT9hYv6oentxV6F5vgbYDlkd69u1t/suTCPA87q+oM/Ze
 euKw==
X-Gm-Message-State: AOAM530bfuYoT3L6LfCGRJu/dcNr2cd+1no8mCxKUo0wPsai3R7xh8N1
 k0ACU10ELtGfnw6q//goDDtKlQ==
X-Google-Smtp-Source: ABdhPJx5G9UTrCq8RNZUIkJdZQ0Vy3pmEZAYzjUkgERryDC2i4fahabxUrBwPEFD2j7QXP61jOJfow==
X-Received: by 2002:a63:af4b:: with SMTP id s11mr14171044pgo.185.1635624254808; 
 Sat, 30 Oct 2021 13:04:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k13sm11945907pfc.197.2021.10.30.13.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 13:04:14 -0700 (PDT)
Subject: Re: [PATCH v5 01/30] Hexagon HVX (target/hexagon) README
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
 <1635556849-18120-2-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <375e75c1-261e-a4dd-495f-8552697d39b1@linaro.org>
Date: Sat, 30 Oct 2021 13:04:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635556849-18120-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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

On 10/29/21 6:20 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/README | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 80 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

