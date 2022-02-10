Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB0D4B0C29
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:19:30 +0100 (CET)
Received: from localhost ([::1]:43390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7U1-0001FE-G1
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:19:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7QD-0008OC-Qj; Thu, 10 Feb 2022 06:15:33 -0500
Received: from [2607:f8b0:4864:20::436] (port=41755
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7QB-00085y-Ki; Thu, 10 Feb 2022 06:15:33 -0500
Received: by mail-pf1-x436.google.com with SMTP id i30so9595207pfk.8;
 Thu, 10 Feb 2022 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k09n8+8FHHuY0lQRChijzRExEBMMBkK0+iAxH2STtfU=;
 b=egs0O9CKwFy01kmt75D0oxwqOafyNM5Tf1E2Ldz+7SFlskbuxcC9ZIO08i5E6xA7Rn
 VOX2S11GtK3NkzxTkAfW+DlStUBiark5SiTsDbBjlxpUiNZQQOEgI5CIb8r7MEGns/Yd
 tv4LdQRH6PhebFWYUemTWnoW8DEUPE9f18QN7LDFzjr6e/XY7p2e0aWL7oTC6vb3GjxX
 UdD+ALXSqslj9QqdF0nDtQDQ3t7IAjDSRpRyK0sU8r2SIxH0TM4Tin0yJVBQpsr4HGBK
 FdE4Z9gJxWRsxHiwrSE7lciS57khfkFd/ycsokg62Nlnp2fh7OVbqcJCFDfFCQIymm1l
 A0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k09n8+8FHHuY0lQRChijzRExEBMMBkK0+iAxH2STtfU=;
 b=6wokqQpGwfPda2RLF+Lm+KfUjfj9+qdO9+wlTPQZ0Szb2QoI/8wlFnNfYX4kyGdBsr
 FUZqYnAlpR9G120EJUhyjush/M90RXNX5tcby1lDRx7zRDgp7be8LeH4+TJyEFAi8bFO
 p0QkBrPeVz2jUYjeuoIcWspKtHs6NPUo86j5zYtnlWaCjzkeSIJni8xVW+3xjufNsRPm
 xwXE3g8WLVxaLaEOrDUPuEEiju6N1XN90KicAiLwg+NivAPNm5Cn47lHmiYcpqz6EzQb
 c16qLLx4YosPu9cP7Ye/OOkSuiJaApomGKo4MJOPxxDnF/RMPPCBVx8A1fEViphfzxlE
 +Iag==
X-Gm-Message-State: AOAM533hD1SYflFdicCpu7AoaMseBD3ga98qGrIYETjoY7nVi+2ftvCk
 akraqOqqv8sYiQ1xdcrzzcU=
X-Google-Smtp-Source: ABdhPJypfpoNalKDsYc4kC5T6CM5OdsQPDfo+BHhD24ioZQR4J1iK6GSWHH+Q1rENPi6+TsjlEUsmA==
X-Received: by 2002:a05:6a00:1308:: with SMTP id
 j8mr7018515pfu.34.1644491730116; 
 Thu, 10 Feb 2022 03:15:30 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id v9sm23592325pfu.60.2022.02.10.03.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:15:29 -0800 (PST)
Message-ID: <0db34d17-faa8-1355-3580-c0ab1e4da82f@amsat.org>
Date: Thu, 10 Feb 2022 12:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2 01/15] hw/registerfields: Add FIELD_SEX<N> and
 FIELD_SDP<N>
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-2-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 10/2/22 05:04, Richard Henderson wrote:
> Add new macros to manipulate signed fields within the register.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/registerfields.h | 48 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 47 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

