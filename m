Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4924378FC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:23:03 +0200 (CEST)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvRm-0003en-7c
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvG0-00040y-IH
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:10:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvFw-0004Di-HR
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:10:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 62-20020a1c0241000000b0032ca21cffeeso1444816wmc.1
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tia4/4JOIITaPHGpTpzl9FXDIIH2ZMtU2NP/mbrsgxE=;
 b=jKp9THBFBocD38vw/474KqYMCKzrFDs4r8yZyTMHpR2aXty2kgr1f+FxNyNdKGHF/P
 sdwPjsxENzcFX3i5YcR71wCpeF/208Q1AnmJdZhTLDn1iYzA4fzxFZJK340IdB+7ewmM
 J0Sd8XL7WAfap+iELStaXUCVJClwVsIYqMBradfw9dYjW0DVQM7rATwkkmUk5RBI8QCD
 ZsQGhVqpyomGuO7wEfalPMSLH5406Gcr9k5GHrY2Yi1jjkvqtmzwHNiTsR78cr9+f2I9
 WNtpUYOnz9d/ZLrFFof7XNrL5eVf7EvbA2gGazz0MvL6OOCdoj0fEAJpiHsF2EFWMLCX
 c17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tia4/4JOIITaPHGpTpzl9FXDIIH2ZMtU2NP/mbrsgxE=;
 b=s4mezTw7pywWikDRwuL76mZE0JLDa7BD9UBkhNBWWBjqAyZua+HmdxJoE25BOCDCYg
 Ki5l/joORA3ADx0loJGu4DfUhu8xEBolHDiwJK0LlQ2AVkGZwrTC7YV+TShav31NQbAs
 rq4AosxO0XpnsI6HIhTJEoMeItTCUjdFuIgMdpIdZOMjzIx2TX/RcuoKv/w/SVGefm3E
 B5LuRbtIbFPMbFFZ0CYWqvknbgyw+frTITAeH0Zmj5E6OgZNTG6lio95+0lgRh1G8Z9h
 Q1upvXnBrQL+8lEQSEmUb2f0Qn+CQ6gf8dZhenqiwOrdKvdrqj6MQ12wWLEBGW3hcThQ
 pXFA==
X-Gm-Message-State: AOAM532mflsMD6f4YTf0Gm8NgXVxssh+9LjQbK1X06q3H/T4xb3UTauv
 KUFre8PbwU8IgzfHrzArp1c=
X-Google-Smtp-Source: ABdhPJwn3fwAnfBHyzDptPNOWP0cNtTK3nFUQixNd3fI/AC1FAPtLJ5zziuGD+47w7dDS+nvB7d/jQ==
X-Received: by 2002:a1c:7206:: with SMTP id n6mr10990441wmc.78.1634911845551; 
 Fri, 22 Oct 2021 07:10:45 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id n7sm8151316wrp.17.2021.10.22.07.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:10:44 -0700 (PDT)
Message-ID: <64387ec0-896d-c1f9-e3bc-19059802a287@amsat.org>
Date: Fri, 22 Oct 2021 16:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 26/48] tcg/optimize: Split out fold_count_zeros
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

