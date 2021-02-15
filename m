Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C0931B3DA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 02:12:35 +0100 (CET)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBSRG-0000JB-4L
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 20:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSPE-0007lH-GR
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:10:30 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSPD-0003Fo-4H
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:10:28 -0500
Received: by mail-pf1-x434.google.com with SMTP id d26so3229833pfn.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 17:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tRDttT9HPvlTanM/rzCfJV8lva0wIFyrAlGgboNs9l0=;
 b=VZMWgEcCAMgiX4Al1q+tvcyOxP9Yw1YMvFnMpRA9UueTZTa/typQiKJWPgxXV3VrNe
 WqhPcjkokadlGeLlohPikG0yYiuvXwXxjmP2X6XyOpW2WBuyLqfFywyPLvy/oX0qfPwl
 ZBBvDvW1HH8x8YdEDURmv5Nj14iYPqmxDa6AtcFRXLTl3AAunhKqb6Wi2yx9ODGm6NfG
 RGlvHdKtnNbl+I13s+542GilDS2pdwrl8YARiy6DubWy/j9qUluNLE4ZdvlsrZLO5lVd
 BWZn647ULbNClrhW9Z7Ek2XF8c1cKWv8oFh+FJo9MfQM3DhRGdBrxPjv7p7DVF+zJRPS
 y4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tRDttT9HPvlTanM/rzCfJV8lva0wIFyrAlGgboNs9l0=;
 b=D1nxlzG/Gpi5vebl4W4XLP5xk7JUhNVXw4DD4lrkyYgXaTbWh4WVD5Gmc1vMS1wDpI
 Kcs+l+YfN69kzU/eV9D2KZzDmQB41BfmL0Zy31EsOzByQij53Bmj4YCd6h9G5ynynfGi
 ayuut95kCtpj9e2ivtxOHFu64R4sELO5rv9Kod+2kr8xrz3k0+nlt/ouEZ30mr+OTr19
 1piBkkX3wDP/fmS4aMmSM3j9E1tOFz1axP6R1o1QKGzYkMK4clsZtrvWNNLJEbw2D5yn
 FNaN+Q2TpF+BXqgNnHcDAyaHz6GcYsZVgTtSeLqpxuNQhCn4q99KV8w5o5Ab4U22tHzF
 I7AA==
X-Gm-Message-State: AOAM530gDy4OunEW9LlstEa+A9LlR85sXpWRya3VdBae5O3Q0TiMk7H9
 N5/w1Nmq2fHdOK+3SdiQksbulA==
X-Google-Smtp-Source: ABdhPJyRpw0KEETJRZcP/+tJxNW7ca6PD4PQQOlQnR/jfNl+z5bXirxZhXhne/l9hJE7itIlg5oLwA==
X-Received: by 2002:a65:654e:: with SMTP id a14mr13113357pgw.265.1613351425046; 
 Sun, 14 Feb 2021 17:10:25 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 ke13sm15132050pjb.44.2021.02.14.17.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 17:10:24 -0800 (PST)
Subject: Re: [PATCH v8 33/35] Hexagon (tests/tcg/hexagon) TCG tests - floating
 point
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-34-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a0ac9c2-c9f1-f770-677f-5d07470ec50c@linaro.org>
Date: Sun, 14 Feb 2021 17:10:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-34-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
> ---
>  tests/tcg/hexagon/fpstuff.c       | 370 ++++++++++++++++++++++++++++++++++++++
>  tests/tcg/hexagon/Makefile.target |   1 +
>  2 files changed, 371 insertions(+)
>  create mode 100644 tests/tcg/hexagon/fpstuff.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

