Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89494A5132
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:13:43 +0100 (CET)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdzZ-0003jw-6K
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:13:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEdR5-00017Q-9l
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 15:38:03 -0500
Received: from [2607:f8b0:4864:20::531] (port=41982
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEdR3-0000WT-Ic
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 15:38:02 -0500
Received: by mail-pg1-x531.google.com with SMTP id f8so13309850pgf.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 12:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dGzpMtZM5KnDPopzwT+F7sKHbyBLlVTK7VRaSseB1Yo=;
 b=WhrS9nCVAnnyLShb0pA5WPF2GAoJWPzAV1D+mnLNQeTqWua9MOnQnnxe7+PmCVM6NP
 Wzy6yf0Gpz4ebPU2xmyt0C2XSrP9MelyubNsNc8+IgPvWXfh2qCkGDFAf+VhtSE7LpNJ
 UjGoNd/kFStl0F97TDcEZHH4GfT4pEh4ttkFkqc40EKU01yc72OWnmLJrM22h6epKqpA
 e36giz5j62ybGzpD6iRJ9nTuBaYkv6fUNid4CYSeFzpRYIZAv0ITg136lCazsbCgBdeA
 n3OCrxAOFQtaCW60w4Y9s+V6S+7ErqumWDZnUs9riecbDjtMiPLGawqZKf0cZgk+UI0i
 poHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dGzpMtZM5KnDPopzwT+F7sKHbyBLlVTK7VRaSseB1Yo=;
 b=ogTYjL2l7DDJ4mufwMPrBC2bWJ5pwup3m7Swcaw+ntfWraqZ3qBJbdfOBY6JdRNJqP
 jLRBVfex0UdHVcuEZLs9IMW03TTEmCiengo30n215whAMX/+dkO/ZdFxWz2XhjqfDsVq
 4rjMNVf4+vB2GFtNTHoWHa3smX4UWGwehxkWOblmfnA2bxaCt7ZLpaFzVzmafXfOCAHU
 QD8RzZ8rt9OfvmAzr0seKTtgBuHEr5u/BtLMkhEYG4WS1xAWyabJNtXxkqE/hcR2ynUb
 0nqeB4nZUZAMWf/E/SLfkTFL07SLGRDGpHXHjU34sGs8IX372wEhvf0nWx8ECML3tmcr
 SvLA==
X-Gm-Message-State: AOAM532f6SdHmMcaIH4nhlDUIO+GVxkacyQcxMpoNJLBfCSn0k/okFUa
 7S8b59cJFHwxkVBtrdONOXhjnQ==
X-Google-Smtp-Source: ABdhPJxEF8UoQf5OOXsxQAvorIp10Rh9AiHz88GkuIT8xP4jqTX3gEJtGzsgpMumT2v7t8+9OaVh8A==
X-Received: by 2002:a05:6a00:2305:: with SMTP id
 h5mr21659622pfh.13.1643661479872; 
 Mon, 31 Jan 2022 12:37:59 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id ce15sm212346pjb.5.2022.01.31.12.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 12:37:59 -0800 (PST)
Message-ID: <30400b29-1791-5aa5-6e05-dd64ed306ece@linaro.org>
Date: Tue, 1 Feb 2022 07:37:53 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] replay: use CF_NOIRQ for special exception-replaying TB
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <164362834054.1754532.7678416881159817273.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <164362834054.1754532.7678416881159817273.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 22:25, Pavel Dovgalyuk wrote:
> Commit aff0e204cb1f1c036a496c94c15f5dfafcd9b4b4 introduced CF_NOIRQ usage,
> but one case was forgotten. Record/replay uses one special TB which is not
> really executed, but used to cause a correct exception in replay mode.
> This patch adds CF_NOIRQ flag for such block.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   accel/tcg/cpu-exec.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

