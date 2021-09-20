Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAC1411DCB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:23:09 +0200 (CEST)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSN0W-0001Tf-BR
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMyX-0007sq-LI
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:21:05 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMyW-0000pe-16
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:21:05 -0400
Received: by mail-pf1-x433.google.com with SMTP id q23so14787560pfs.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=w7Llf/VhcVqFXmP9dcKcVYZ/WY5aWicdAY12V4fdRuM=;
 b=zAUCPG/WVX+AfdSMq6XdvYpBEYdQ8QdOWn99yvY+HNNJ0W5vxD3BqExOz5Keta4DEf
 +ERH8r8T7/VCAEwZmwhgiA3rAc30u+5elsitX6ytiletRXlEcvFuILMRvelEiGOyk8kT
 XD9RFGifkx2ZRKwza85Bg/yV2MBtRBqBcYarCJ2yhHLhWNJpOtbxkkSUjqEH3lMQc9ph
 Qf6QPDAX2ncN5hjOxo88xnqp7xjvq6fZTZfCxFIWsvkr5VNyh5xe+R2tRUjLm5h6kBal
 ZvbrAGrBiD82v9kZAlBcLfuOuZvoze8HTZTcH/WfdEmsOfVGEGwUXArysuJl9ZMnVnwa
 6eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w7Llf/VhcVqFXmP9dcKcVYZ/WY5aWicdAY12V4fdRuM=;
 b=ycudmUEUmf8FG1IkRYsU5Ix8Tcg//nZ+6/vd/a17wUSRuU8uU1TWJMQG5zsbIOKM5e
 WseL3G4xW+6ocQ2koSC+HWvfaNCjFez7Zpm56qk6ZJC+9RmqcwDSZH8Y4lE0Mep65bQB
 4UD/VzN3d5s0MOnDuIZ1PLCqi/IUgohF2kZYC2y6hQ+ZDavncw/JcDvIpjUMs7tdLrqg
 fGGznjn1FaYfFF623MbmD07cxXLAxWgUvrVrkQ7Pt0owrg2kJiIIlvOKCyY6pJB9L9Xt
 mifjux/T8wxrRaYPdIexRJNB+7RFEcUTPo1CIPClQ6q/Ug0qTGfI2Ggqep7MDpb93Drg
 nrpw==
X-Gm-Message-State: AOAM532adObSh+6ZYJ50xfZORH+VT/ve7wK9bGJ97y/1XlpZDVFsb1vF
 /kRckwDWsEziJuwoGLmur1qHG13XJZrp6A==
X-Google-Smtp-Source: ABdhPJwwkSuMmfHq+HNF6boC7ZtFogo8HGu7Q5xvIWKc3VNYUuV2jRPFp9mwe788rJ9rW4VlIug6ng==
X-Received: by 2002:a63:b147:: with SMTP id g7mr24854528pgp.478.1632158462407; 
 Mon, 20 Sep 2021 10:21:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm15341604pfd.211.2021.09.20.10.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:21:02 -0700 (PDT)
Subject: Re: [PATCH 27/30] tcg/loongarch: Register the JIT
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-28-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83861503-b82e-e323-2924-aca4570fd066@linaro.org>
Date: Mon, 20 Sep 2021 10:21:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-28-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch/tcg-target.c.inc | 44 ++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

