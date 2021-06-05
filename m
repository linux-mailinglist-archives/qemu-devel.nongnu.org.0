Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3539CB7E
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:44:27 +0200 (CEST)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpf1m-00015S-Q6
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpf13-0000B5-FW
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:43:41 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpf12-0000OT-1S
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:43:41 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 l10-20020a17090a150ab0290162974722f2so8050628pja.2
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1fzCTVj2OFU1+Ln2ryp4HC89w7XBy7JHTQdlAeMMRq8=;
 b=O/3/6hdBLSdUHSRsY2VIWTeX7Aafss84pEsj67mF3kDIXqqcjmqoCmsFnx0M46YDes
 gPBxOvlds+Lk/dgvzWckJs3PEZER2V+At/SKO7kFsAzMSDYdxj75eeT77RQsmO4dd21R
 JqPDql5tumZ77eaHF/Bf+bPEc67NhT2T4QfVup2sqUSwbqOvEcNCSn1ORTf7C8uYq7sU
 HGHvrD4vVeYIfWgdRcaq6aw+b/xrAbWM3gLayIdLsz2FZx+jqmkwUOvDzjf9hewmtPbK
 kwJ810fmxcTXUD1pk1aFMzBWeZMXwf3Cxpd/S3qgyZf4mPv0w88fmKlzNJltDtifPFca
 OiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1fzCTVj2OFU1+Ln2ryp4HC89w7XBy7JHTQdlAeMMRq8=;
 b=EmxfndNDz25pkywzaTu85RKBhjYzyMSlNSUVr+9EZFO7Ez44F0FcPtL5WZVdl/Asfg
 yz9SZFyeAbmxrS/leUwwhB216nm9iTG0Ji2kd2yri5Ra0sUAi9fP/XxDP0yglpRB//Dx
 1LBh0WKL3ORjFMhAwMaRxTRfH3eGbCvilmFsNRiOExYXgkeD5wqCOIZE7YdCuIo6v8Pb
 XPmoSleBrgi5RI0k9boS88mKRGc5lTb9npxwriJEmLLZRbsg7Dk5QNu3LY1bAGnhe5pd
 8Ju1yPlOot93RXhXwd9DeyJLMJtKgwvulg2yW8kDJzSy3222c5TiubRiZtSCWjPolpiE
 j4nQ==
X-Gm-Message-State: AOAM533bme3Wv7D+jv34gZC/NTz7fn/xkuOHjXh7jGbpyvkTI2CU9Ysf
 r3Kt2OeYlaiSQlC0zo3ELLyBHg==
X-Google-Smtp-Source: ABdhPJwaUHXxdCZlr2j17TK6p8Q7BDbVgBl7wgnpH8+wiKVsJdI9HU7fMPO4ypEeqhOKJ4qyqk/fYg==
X-Received: by 2002:a17:90a:7c4b:: with SMTP id
 e11mr24919323pjl.73.1622933018654; 
 Sat, 05 Jun 2021 15:43:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i21sm4662080pfd.219.2021.06.05.15.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:43:38 -0700 (PDT)
Subject: Re: [PATCH v16 95/99] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-96-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8097a8b7-d530-4199-7419-28bec27d2ae9@linaro.org>
Date: Sat, 5 Jun 2021 15:43:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-96-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:53 AM, Alex Bennée wrote:
> We need this functionality due to:
> 
>      /* XRAM IRQs get ORed into a single line.  */
>      object_initialize_child(OBJECT(s), "xram-irq-orgate",
>                              &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

