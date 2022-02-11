Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD84B1AEB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:05:27 +0100 (CET)
Received: from localhost ([::1]:58412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKNK-0008Ra-FN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:05:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKLV-0007EB-EG
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:03:33 -0500
Received: from [2607:f8b0:4864:20::62e] (port=39869
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKLT-0000iM-4S
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:03:32 -0500
Received: by mail-pl1-x62e.google.com with SMTP id w1so3359552plb.6
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jHqDMITaw3kANKhLqZNkwAtgVhgTHD4HEu6pKeP1yE0=;
 b=x/SDLNgUhHzarfspJWgmTkB8sNJ+4mMUnEHGWy6v8txWr+1EhpnGsBl0WbKEb55fvv
 WmKRjQd/Hpi6gI0jk1pk7gEJmC0xZRS1ScxgSrlbUap6E2rqICzqZAPxJ0spjSqY1Kra
 uYr1r7Y8+nNx9kO56hDr58rdwu/SsCrgCAyDEa5IMWXkQ4rUEIL2hhRfFEeuEe8AGhE5
 g9qlI8rEie90skaFxdIFVXm+tFt3x6hAtTfgBzdEn+MfS0Qx10ZzlmuhUhrYFK9fRia+
 Kz3WWDwtL9HOSXvIErvqB99zH1fUa6auhQKbpRXl72cghu1HdIAeGZlNszQnSDDMzSVs
 uSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jHqDMITaw3kANKhLqZNkwAtgVhgTHD4HEu6pKeP1yE0=;
 b=Er4YjS2gSYzP/UKe0SjvwzyIUkp4OAsbuxFUunBbg8oTI7uPv8uGp1Fzon+bKYIX2P
 gOSalyxMXTg8XI1UC9VWZZ2LCSJ21TGwG0qJrRuSl6XBgV8CDYRXV5LRU5eI7Yqn6A2y
 WVG3dtHMThq1AFwsql6Dca89I/L994V+ZhqfIxCorW9YCVrfg3ekbVaLwklhA4fGHx9W
 TbdydjW5KM5legM+/Nymq+AsufMAmQM/yTxLj7YzrUKXtGtXyX0RTpyDh9pyZa8NSVMq
 0KHTFtZB39CFyj2oDUjAF5nt7rrpRXng1DgZkrJ0WJ5QGWMXgL7LxSqXc97eQyH4BCwv
 jHSg==
X-Gm-Message-State: AOAM5306IMKQEg07OJcEWFZWN8NoS4WdiRMyVfqRFy3o9I2gnkt3zLcB
 o3nWuiu/YGvoKoUc4H0F8Dn8Vg==
X-Google-Smtp-Source: ABdhPJzN2wML+L3gux9QmeY/YrGT5ze0K5c+1eqsXRBGu1/EdRyEr1N7gq13qN1tfpysIuIqTseWMA==
X-Received: by 2002:a17:902:ce04:: with SMTP id
 k4mr10427852plg.153.1644541409138; 
 Thu, 10 Feb 2022 17:03:29 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id x12sm17386215pgp.25.2022.02.10.17.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:03:28 -0800 (PST)
Message-ID: <c8f58005-0431-5640-13e6-b0ef889ec49c@linaro.org>
Date: Fri, 11 Feb 2022 12:02:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 06/12] Hexagon (tests/tcg/hexagon) test instructions
 that might set bits in USR
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-7-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-7-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 2/10/22 13:15, Taylor Simpson wrote:
> +#define CLEAR_USRBITS \
> +    "r2 = usr\n\t" \
> +    "r2 = clrbit(r2, #0)\n\t" \
> +    "r2 = clrbit(r2, #1)\n\t" \
> +    "r2 = clrbit(r2, #2)\n\t" \
> +    "r2 = clrbit(r2, #3)\n\t" \
> +    "r2 = clrbit(r2, #4)\n\t" \
> +    "r2 = clrbit(r2, #5)\n\t" \
> +    "usr = r2\n\t"

It's just a test case, so it doesn't really matter, but

     r2 = and(r2, #~0x3f)

surely?

Otherwise,
Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

