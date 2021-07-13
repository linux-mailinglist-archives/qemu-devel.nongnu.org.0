Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A33C721D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:25:10 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JLR-0005KK-QM
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3Irs-0001VJ-NP
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:54:36 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3Irq-0003zJ-WD
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:54:36 -0400
Received: by mail-pj1-x1033.google.com with SMTP id cu14so6874984pjb.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iKExeXRawWuutqBao5avDgZqGNuHn22p/KbPoItNd38=;
 b=SH6lHj8Qnu+jCfKwyAnCpP02nxLv6OowU0AFVCEUTN53c0/RYf7Y5Cnzl96OLVF+pz
 JvbbJM4sLt6/fD27RO43/iqGsRXQ99qad6T6LOIV+HX7fPC8Gq8OjSUlao/Wg1Syr1Ba
 6ojQ8vVKULhEdGgRWXySlFvS42q2UD5AopxNPYqOkFW39M8w3HNwtgov+vCrlVV4Hc77
 lN6sJograP99gWAxovGCvsPOJBG8Z8MImXH2GLbfT/AFr/7XLeZ01OlPD81iqu4FJ7tp
 XZity/Lh9M2w/a8QGHvKTvIK0itTU5A8Hh8MfusvJq7ci1jCUsvH53ZhOAn9EfNgvoOD
 yCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iKExeXRawWuutqBao5avDgZqGNuHn22p/KbPoItNd38=;
 b=guBiHj+o3VUUyzZy77w2ygT4OCXdqZXms8TsH0BhaSigvUjJUoM76PBSdEp6H8XwlJ
 QaKEtuQS45Hj84zTbCFwG4cAFdMCO9BnNhj12Ofv0W4EaMsij0Hs3qMTuesHtK8fVz2F
 IiTHJ04FJEoZ3s4qYznPK7R0Cu0opeE9R5CO/JDAomGpZWu7PRpmJeKtE1aVCEPgENfN
 ncnxz6Tp+X/Wiq6PBz8QW6qv9+Bnl68YgM8SWQyCqkzG8EBnDrxRbcoUk059LQcEiz9J
 KH/nmMGNpcGscDNOJBY4iHFG/JUkNZ8D5pHO8bgvsfWZfn93AP4uy2drwDywbY3rKSX3
 0k7A==
X-Gm-Message-State: AOAM530KY0++kiyb21urp7SZUq/CvLgBm3Atb8UFQpLKM1keL0KKBOJl
 ACyQ/B5YPsQIxDJQ6TGxw3caIw==
X-Google-Smtp-Source: ABdhPJysfgeyO58ZxxLVkuKjPi4UKoxDtV9d2qwsuDT7pE/PRgei9xhh+GRUlJr84ElxYcIAo5dXgA==
X-Received: by 2002:a17:902:b418:b029:12a:edee:a7ff with SMTP id
 x24-20020a170902b418b029012aedeea7ffmr3600520plr.59.1626184473331; 
 Tue, 13 Jul 2021 06:54:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g27sm21515411pgl.19.2021.07.13.06.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 06:54:33 -0700 (PDT)
Subject: Re: [PATCH 01/11] nbd/server: Remove unused variable
To: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-2-richard.henderson@linaro.org>
 <bdb476db-6e95-b90e-f218-85612009a7aa@virtuozzo.com>
 <20210713130134.zfti7sgxcw4i3dbd@redhat.com>
 <20210713131438.hx2gp6v2jc2qvba3@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d431966e-de56-02f5-bec8-5fa3a7091b19@linaro.org>
Date: Tue, 13 Jul 2021 06:54:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713131438.hx2gp6v2jc2qvba3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.368,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:14 AM, Eric Blake wrote:
> Hmm; in glib 2.68.2 (on Fedora 34), g_autofree does NOT include an
> attribute unused.  Thus, does this silence the compiler?  (Even cooler
> would be making the comment a link to an actual bug in the clang
> database, but I couldn't quickly find one)
> 
> diff --git i/nbd/server.c w/nbd/server.c
> index b60ebc3ab6ac..393cbd81c57a 100644
> --- i/nbd/server.c
> +++ w/nbd/server.c
> @@ -973,7 +973,8 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
>   {
>       int ret;
>       g_autofree char *export_name = NULL;
> -    g_autofree bool *bitmaps = NULL;
> +    /* G_GNUC_UNUSED needed to work around a clang bug */
> +    g_autofree G_GNUC_UNUSED bool *bitmaps = NULL;

That works.  I found

   https://bugs.llvm.org/show_bug.cgi?id=3888

and gave it a nudge.


r~

