Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AFC31977C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:32:41 +0100 (CET)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAMO0-0007vb-6t
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAMMp-0007UL-PK
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:31:27 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAMMo-0004DM-79
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:31:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id g10so6076613wrx.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nTPagmmFDjX5WaNZC5mmty2Wuqho1Eb/9TtumVnpVKg=;
 b=kUPUdIrGI4UHQ/pku7TGKBtw1CR6Tv4+BgEubhHFKtHM+E/qjqOB4jQ5eQp9Xu5XXd
 Zsg5ww9x1CsnJ/YteLnceN7cO604bN8SZefaeAZqGZhEg4jp7g91QB0AdMRphok83xKf
 Gg+t4kWWPmLT9KLAwCssMl/oEPKtbqVksDwHfVTP4d7pH3owjQ6thh1wQcky+xB7frZY
 WZkNVk6g6sCM7Ap1S0rL4fwP9TYGh2aV3tB8NJovC6ZaS/gZbBmpvZSGC6/mjKAdfb7u
 45GTG+337iPIvVOUBsOdNyBJHpAcv/+VSd4RtTkhecTghksGp3324gBfPBy82vALxnYg
 P7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nTPagmmFDjX5WaNZC5mmty2Wuqho1Eb/9TtumVnpVKg=;
 b=ZgHvlsVTQoVsC4YMbdsZ51Mj8yGC42Wq1mfCMo+fbhF8nvfRbMoDh05C1hlrSiB+l2
 0nlIzY2LEhQdqMmia0qETTVltvAB4y322f8A+srUlUTXdaRZ0hEk0XGKCqFATD73M+2p
 ML0iUzYCPPCQBAVT0caFZX/ownOOcsGJ1lXyynWf0Oi+8jI7GkQ2dUafawgaYLhJ5bch
 TtryEBjeqVkCaNvCe73z7LEtdAIjiDlGUqeChmRo4moLPq+Cfc0gxfAzgMwHmxVB7OzG
 HcBmmIAHCjli1358vlxmwrmExLGHxCmc9wAn0uXOLaixUy3eob4FCpMkdMoUr6EK3dBx
 d+ng==
X-Gm-Message-State: AOAM533u+mZvH2jmIXfe873by33Yj68umquA5NJ10yqfpB9wmkYYIfhj
 t69P0Wyn4hftgvXu0nokIFM=
X-Google-Smtp-Source: ABdhPJwpg4UyhvUk5RSfuvKVYgkIPnwhBWOETthm0KSMFk0W0Vc0BbkmxhTvQcE3F7SQ+wrKIXTOKQ==
X-Received: by 2002:a05:6000:104:: with SMTP id
 o4mr378289wrx.419.1613089884645; 
 Thu, 11 Feb 2021 16:31:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r124sm12454722wmr.16.2021.02.11.16.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 16:31:23 -0800 (PST)
Subject: Re: [PATCH v8 17/35] Hexagon (target/hexagon/fma_emu.[ch]) utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-18-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6521c5d4-f56d-30a6-77d6-18a838dfe0a3@amsat.org>
Date: Fri, 12 Feb 2021 01:31:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-18-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 6:46 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/fma_emu.h |  36 +++
>  target/hexagon/fma_emu.c | 702 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 738 insertions(+)
>  create mode 100644 target/hexagon/fma_emu.h
>  create mode 100644 target/hexagon/fma_emu.c

I'm not a floating point specialist (Alex, Laurent, feel free to
review on top), however this patch LGTM:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

