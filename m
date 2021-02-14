Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291F731B36D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:33:07 +0100 (CET)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQt0-0004li-3p
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQmS-00057C-CL
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:26:20 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:37591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQmQ-0007wz-A8
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:26:19 -0500
Received: by mail-pf1-x431.google.com with SMTP id b145so3133104pfb.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 15:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8xdPVWuGPzdI/5f3O2HTMaRq72haBg6YXY0PhC14shg=;
 b=dCVzPcMQwTpJ9Fu/75dPytbq25IWRT6rkUaWREAUBNgaz9Wj4f9umNnFr4YJPFwq7o
 30SOrcU0N6BUVykLSHQP7GIc0wIdjQ4q1jIpHrvYlk63oPQSAsp/F+Zn4xYNKtYRvepr
 tiBsFHRTqvSPq0isDhKQURu95Dc3abCN9waiqmp813p+zx2JqOD7A7daq0+ItOfdIOyz
 3qrQWdB9Ac0RCoVpf7ORB90Y1w3EZP1WzPQ9HWzTRduePUBRq0wp0bY6iZHZ0dcK85G1
 40WMD/68QmZD6N+TtAAYCp9oFLOVKoomH0Y85AI4fN1Z7YbAknOJslSVGkNELul+qu8M
 VsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8xdPVWuGPzdI/5f3O2HTMaRq72haBg6YXY0PhC14shg=;
 b=E9P34sXJmJ3jrZ9dNDLDYQVbXXG670xfUTtfb6PpgonPGyVvKWr5lG5NoeqieamxBY
 rUT2SdTAKXzdHkWB23x6obFpL5lL7qNLvWepKm1CWu0vibmT/S72PELeaNee/q22z2CU
 DpHBHE/3s+UklAWs3mOpwwBz0x22I8dg4Xs9TQucajJ7F6D6kwW1IzUiaY5bJ3iqv4Jd
 YnhXAey/tuDCTZwAwcAHqzX9HDp4NGtHpz75IJXyS8/DyLLcuyeiRpalEcL+cBJSEMne
 TSMxuMfybVaHXUQNsL0hCa1/qLw9uMSUPXn+7cOejo+YmS1xbUGuNqb0/y/WP4ID7eiY
 1j9Q==
X-Gm-Message-State: AOAM530KAtek5LZqVeZIftzURHtDpE/5O9BFMqS7PwX1+xaPeW9oJSqA
 JmUDS/7UyOy9ZaIEEG9JqhfiLg==
X-Google-Smtp-Source: ABdhPJxXZaKTtIxTxh8uFIgtCQShFCKp0kkvuw/u6RCW0yX4rUQiGw9jTlmfFvCAAbsOxcITq7uJzg==
X-Received: by 2002:a63:3686:: with SMTP id
 d128mr12483841pga.240.1613345176363; 
 Sun, 14 Feb 2021 15:26:16 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 q126sm15804964pfb.111.2021.02.14.15.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 15:26:15 -0800 (PST)
Subject: Re: [PATCH v8 22/35] Hexagon (target/hexagon) generater phase 4 -
 decode tree
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-23-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36023201-1fba-a1bb-8bb7-6f3ed974d905@linaro.org>
Date: Sun, 14 Feb 2021 15:26:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-23-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
> Python script that emits the decode tree in dectree_generated.h.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/dectree.py | 351 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 351 insertions(+)
>  create mode 100755 target/hexagon/dectree.py

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


