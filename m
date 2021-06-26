Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ADA3B4C4A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 05:54:51 +0200 (CEST)
Received: from localhost ([::1]:57962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwzP7-0007K9-Tr
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 23:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwzOG-0006fS-Ab
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 23:53:56 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwzOE-0001Fj-Hg
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 23:53:56 -0400
Received: by mail-pg1-x529.google.com with SMTP id e20so9919744pgg.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 20:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+xBWa7rg9zt3G30rIwNM2hVMZIi19bPcFIrgMOK9Te8=;
 b=q2X/T/wuihHYhW6ku8Sarg2P/iCyEm1LI7LQlHrp/yV8LYMD7FDoe8EPxkQNUrr/pG
 NXvaxhOy/b/EehABhDXhSJ58X+FrmuyB5JY3G8C+xiS0b7uI9bJjljUuRh0Sv1difnxQ
 KETiVaoYn745O1+WsKKl68D9Pr/H8apeNTWjxDPK+D58MhLY/PpiONbIvWzQv4xDeFE0
 zYi+A+j2637H537/KmxiDhm2fpVM1FiUdd0Av1V9IEY37q8FgWsc+zIdrQxD7RNTm+OJ
 ylkEMB4Ax9/6nC/hkvgR8IfYi1soT+QiIFxBDO0M61BN6+fyudqk5yJAX8QKtvJtsVpS
 Gbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+xBWa7rg9zt3G30rIwNM2hVMZIi19bPcFIrgMOK9Te8=;
 b=D4mo7Jz9/9pTGd6wRmnNrp6nxJqIiMaXYpQhBQypYhbUavEztVB6X/9ViQhA8jMSs/
 3du0M1TjsqjP61H4MqjB9GpgbIg1pdKxwHVk45dPCiWY56WKECDctLovWaEdgZhMJ/zX
 F/69a9huUzhiu9UXDAavlpNEOP9ogrQgUU8gUAvj+vYvLGqOEkdzXyRqzFTBIViazWNy
 HiK0izZL72v6rHOY/tg9UnXb0Cw7Cd+F8ack+QaTIOOKrqOjeTdjmdOlluVO/hUNQ3Bj
 35HG7a7dLgH5Dhns7MPRkKj6zOkVwjgc9ivkmhSQ15tBVrsp/DA7J5e3FSdWaMNhNU7a
 38NQ==
X-Gm-Message-State: AOAM533TQ6ALyHJcE81x4l8aqAGByTnfg1t2UXD+9tXKAXow/jyH8gex
 8SeBUZNg6dVdsmHzcR0rFiea7F0hGODxXQ==
X-Google-Smtp-Source: ABdhPJxHI9oHLr09sIEbOb3IZEI/9NDRfpz4F8t6ZmsRKGdufOA5pHv8tnXM7Q96HLqftc/KhBXPug==
X-Received: by 2002:a62:2b95:0:b029:2ff:2040:4f1c with SMTP id
 r143-20020a622b950000b02902ff20404f1cmr13760428pfr.49.1624679632767; 
 Fri, 25 Jun 2021 20:53:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm6888631pgi.21.2021.06.25.20.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 20:53:52 -0700 (PDT)
Subject: Re: [PATCH 0/5] tcg: Add 32-bit vector operations
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20210624105023.3852-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3b2d25af-1c32-716d-1d43-73d007d963ba@linaro.org>
Date: Fri, 25 Jun 2021 20:53:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624105023.3852-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 6/24/21 3:50 AM, LIU Zhiwei wrote:
> This patch set is split from RISC-V Packed extension where needs
> some i32 vector operations, accorind to Richard Henderson's suggestion.
> 
> The original implementation is on
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg814538.html.
> 
> LIU Zhiwei (5):
>    tcg: Add tcg_gen_vec_add{sub}16_i32
>    tcg: Add tcg_gen_vec_add{sub}8_i32
>    tcg: Add tcg_gen_vec_shl{shr}{sar}16i_i32
>    tcg: Add tcg_gen_vec_shl{shr}{sar}8i_i32
>    tcg: Implement tcg_gen_vec_add{sub}32_tl
> 
>   include/tcg/tcg-op-gvec.h |  43 ++++++++++++++
>   tcg/tcg-op-gvec.c         | 122 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 165 insertions(+)
> 

Queued to tcg-next, thanks.

r~

