Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE1F36275F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:02:46 +0200 (CEST)
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSnl-0005p2-VH
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS6x-00038N-QW
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:18:32 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS6s-0005bK-Fr
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:18:29 -0400
Received: by mail-pg1-x530.google.com with SMTP id t22so19674523pgu.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c3DYTZBvV6swFK3vz+GEyG8aP+VSchBb7eH8pGgdfes=;
 b=pg/grxdNZZhznUKwo5lJmSQiRG/YaQfBpbyyCA8NhZGlRmuPtJSFcuM72n8S7AVjta
 yJ/9jUvgmH9+JLO9CJOr6u53ZcP5wxGUIuw1ynTFDT93n2Ml7xNJ5+XX6ZHZE8mrLaBV
 oaFq4spArW59ENu9PI9OD5+278DWFcRq7HyUrBETkPubk7qFMes0RKpaHMzUF04WCFzk
 pqL726YZxr62+VtGG+9U13XChAtZKO8WnNe/PDrRvDxy66nZk1vUZAuBQAo7BzvY+47I
 ZR5u5Q1TMAMH7ZY9xwtI88v6hRNpfP4SpmRBNLveVMliic3KU6m8bcETIOPxifhWquMw
 FrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c3DYTZBvV6swFK3vz+GEyG8aP+VSchBb7eH8pGgdfes=;
 b=I1JKwZ+Sag/OE/Xiy+rW5e+wG25Nac40qYt/HwmEnRkwAJWmA1XHhfM98BZZe+LXJ1
 mY6J454i+Pv4yGmZiV7rzqgWWBF2NbfhCXwRDkc+dd+CXnFR+3Dp8Feyq84FTr5Xg4MQ
 dSjXtKsCdt+6aGfdsugYhFflH26Ew9Wk7Z1hwInv8iR4qzLH/jbKRcf0ynqsrDJKKE7F
 hlMvJd/2Wy2lgj0t5JZY9s5ECKjYL5Ubkm293xk9ZtP9xnutECfnHA11wu7t7xDZAWPb
 lqOB6YWVedX2PUzVVTji39w2vJQ9N8SRcfErQC+LwH1IPalmGEx+Ao14duxEv0neNa+a
 gFRg==
X-Gm-Message-State: AOAM530NCG9BxHtYo+acdC2RHrbcVF9wVLEnK0xifA89ghBLCZD7uX0I
 nuOwm3jlP31jo3S+IFKa2oVheI6RaSUsaQ==
X-Google-Smtp-Source: ABdhPJxapzLqNs5VLMjp8fGORzq8+3hz/th6dylwDqKyIHinD7tX1FeB3PANcc1SBMYbIObgaeKdPw==
X-Received: by 2002:a63:f651:: with SMTP id u17mr150404pgj.148.1618593505108; 
 Fri, 16 Apr 2021 10:18:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id gi6sm2686084pjb.54.2021.04.16.10.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:18:24 -0700 (PDT)
Subject: Re: [PATCH for-6.0? 5/6] include/qemu/bswap.h: Handle being included
 outside extern "C" block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <20210416135543.20382-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38b7de66-2fcb-1fcf-d249-4c3558d393cb@linaro.org>
Date: Fri, 16 Apr 2021 10:18:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416135543.20382-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 6:55 AM, Peter Maydell wrote:
> Make bswap.h handle being included outside an 'extern "C"' block:
> all system headers are included first, then all declarations are
> put inside an 'extern "C"' block.
> 
> This requires a little rearrangement as currently we have an ifdef
> ladder that has some system includes and some local declarations
> or definitions, and we need to separate those out.
> 
> We want to do this because dis-asm.h includes bswap.h, dis-asm.h
> may need to be included from C++ files, and system headers should
> not be included within 'extern "C"' blocks.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/bswap.h | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

