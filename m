Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9B407EAC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:38:20 +0200 (CEST)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSUl-0001ei-E8
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPST1-0000FB-Tc
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:36:31 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSSz-0003ua-6h
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:36:30 -0400
Received: by mail-pg1-x533.google.com with SMTP id r2so7070619pgl.10
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Saf3nxNiDN9Nxis8DOQhgqgU7a1IYAtaDA5VdsnFqlA=;
 b=EzOciquT1Q43KAr+UE+cZI8FFOnZitNAWz6RRZFaZyzxI7Fm9ZA902pIFisIia4ZWA
 tlzH8nK7KDNnq/J2PP2Z2hfPIR7C/VVvu6iuHJ5dled0JWpRG7OzDvUTP+Viar5O2g4F
 gGrJ1RdMJtQFVeDuncUk6rLHhMjoXvCMqF1aKIKIWfOvpgppb7tI2vOj9nJw9gALCiOx
 2dsBFv9vl1LNLUPbi7WKuThyDSP9YAFG+w/sd8fAjkqVg+FM3rv4WRQRohg7k1kk14MU
 3cN+mJKowhj2BhV1fn1kA5Mw4CKIauAqdj4fdY2/7WV/LhEzhGQjo3iDLAcujCvEs+0E
 08+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Saf3nxNiDN9Nxis8DOQhgqgU7a1IYAtaDA5VdsnFqlA=;
 b=e8PSU5PCQWoETgBEJtE6qvSIwj755R88Epc/zIJkrjtf/5ahwMLZSJXY79QNWcK6Wn
 g5+cPSlqn7WULsOuYroYeWbIhVezTv+d9CkjsepZ1j3poJPUqtOX+/tulMcLw5ycdT9Y
 B2XxQfxn0pBcNwPuJj9t8hhn2XL/liSmNeEW3iITfYZ8PA/2dg8MKNS1+DCXcMVxjiFH
 D7K9M9fTUFeU+JVCFqV+vhDkd1iPWYlI8LugTx5pFbL/ef0567k+M2ZeILtSocJE8Y4J
 3dwV0EzDYU8QPVEl+8iRF6FMPJXs4s/Jdy6+b5qvipq0qGxm2l/aXqYzroX7dTHmbdmO
 um3g==
X-Gm-Message-State: AOAM531k1muzgEkGs5FPHkqPKuFdeWp65e1z1F/KpptELkK3fcgGPUnA
 3hdt1C6YBNZxRJsa0OTRx33zRQ==
X-Google-Smtp-Source: ABdhPJwFFs0sK3zPCpO7itQpSsccCJbnO6WeuQ/213KU8+/pKB2HMzLl5Dl48n1WEqBxytgfI7rQrQ==
X-Received: by 2002:a05:6a00:2352:b0:40b:2031:4827 with SMTP id
 j18-20020a056a00235200b0040b20314827mr7271553pfj.6.1631464587630; 
 Sun, 12 Sep 2021 09:36:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n3sm4440384pfo.101.2021.09.12.09.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:36:27 -0700 (PDT)
Subject: Re: [PATCH v2 9/9] linux-user: Drop unneeded includes from qemu.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4651b8c4-2c77-64d9-67ce-6f49cab245c3@linaro.org>
Date: Sun, 12 Sep 2021 09:36:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:44 AM, Peter Maydell wrote:
> Trim down the #includes in qemu.h where we can, either by
> dropping unneeded headers or by moving them to user-internals.h.
> 
> This includes deleting a couple of #includes that appear at
> weird points midway through the header file.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

