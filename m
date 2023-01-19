Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95346673529
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:11:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRrm-0007By-2A; Thu, 19 Jan 2023 05:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRrj-0007Al-Qg
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:09:51 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRrZ-0005nd-II
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:09:43 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d2so1316272wrp.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/5uH/69r4gxYhXZwrcoSyTmXyAQxgZ9LGnHw3DVt+Zk=;
 b=Wf9CCqJ7bCUxoFtdtBapFvBp83d7f6ljMaKcnCXKEF3VK3K4OF82k/sHRkL4b3HoZF
 PtWbjM12nH8gaiXw5jl3S7sdUhG2IzCrbBgmfM8MhY38Iq/+is+W3lZsXoOiCdcZokas
 yQIK70yVhJu5zSfxOhfB2Q+tQ1T5txbOYOf9YxO3ABYk3pj3evYvU3VANByD7f3a+Afm
 HnbkRyWaRs9/y4osd+2vqHLh5rntFoy1h4n5BfCWrGKSMWXmbF3cjwKdO8tv2pvdKMqE
 xDOFYDlaREmANjgKsUpbEJgJhM0WWk0K9YVbP2NrJ6jmwO1evsQ+QMpNb8uB8bzFC/G8
 NEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/5uH/69r4gxYhXZwrcoSyTmXyAQxgZ9LGnHw3DVt+Zk=;
 b=CISsZvywBZD5S8uLp24m4nYIjfHKGsH6Ffvr9mVEoYLznM3Jwoqp4cQVgwwW0T1lI0
 I86i6qhr5+nrdh0wSFg82L9hiDqthHiVpIsHTTrGWJMryaice0FpzW4h3P6i43qc9uo0
 FxyTdGLPAozB9PLUOjYj/TOG+m7ii0EO7npnJpl+l91mLpfzlDQxo1RQ0tZ6EwJ5eMo4
 zzAhp02nnMCkpLpYOUGDm2CwqdsUqngN21YQn5oHqFwKogKXpbvAgfJN9wDkxF4GtdNB
 opI0OKekFYzIcxTwZPVIr2h3oAfkZZwDIxSSv+od7qDvN/EV75mFLAlliLpA9CB9qpzu
 EXnQ==
X-Gm-Message-State: AFqh2kpZH16BiLwAe9CEJ4qw7aTvmBeq9THtlisGToan1JeHvh/rf6Fq
 UVevpjvb4thqtjjsa8NwE/WGdw==
X-Google-Smtp-Source: AMrXdXupPubSvWjGPYL0b1UXItEjfdjkNPPEw7Hd5ORMQPf/BpdMx3/ZMAumLUKVm+E2fcugrogN6g==
X-Received: by 2002:a5d:4d89:0:b0:2bd:ebac:dcc1 with SMTP id
 b9-20020a5d4d89000000b002bdebacdcc1mr8539491wru.31.1674122980004; 
 Thu, 19 Jan 2023 02:09:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b11-20020a05600018ab00b002be2279f100sm7529381wri.96.2023.01.19.02.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:09:39 -0800 (PST)
Message-ID: <aeeca0df-9923-b98a-1a03-0270fec4e7d1@linaro.org>
Date: Thu, 19 Jan 2023 11:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/5] target/avr: fix interrupt processing
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, richard.henderson@linaro.org
References: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
 <167412018478.3110454.5407396471034616682.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <167412018478.3110454.5407396471034616682.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/1/23 10:23, Pavel Dovgalyuk wrote:
> Interrupt bit vector has 64 bits, but interrupt vector is found with ctz32
> function. This patch replaces it with ctz64.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   target/avr/helper.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


