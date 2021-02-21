Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08305320A98
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 14:38:07 +0100 (CET)
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDow2-0005Ud-1s
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 08:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDot0-0003Qa-DD; Sun, 21 Feb 2021 08:34:58 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDosy-0001jA-Sh; Sun, 21 Feb 2021 08:34:58 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v14so16206084wro.7;
 Sun, 21 Feb 2021 05:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ju2Gh6n0ew2AK80HWk9mSXJ9DuDeA7+Kr59s88BldaU=;
 b=U1SLwtk+9/K3b+KoycxBepCUB3nG8h3AiNs0To7+/T7rSr+DcECKrCtStjGZEK0x0C
 fPOULP7XUvDu/2GWzabCQ1870IIkJnSBEg83mvCDIEnVwUtioNyaFYhDsUufbZ4UKdsh
 /TOc5PY1XFiFNPAu1+nRkvnuUHnzqaf25d9CFHZbmbciIFWltgk62whywBnZdtLRpncW
 QOir+HF2eVnWy00qLgTP1otNVq1IlfDdPQykdy9Wqlg49X9wiTX7uUo9hDFeCbbUsRsb
 KaDhQF0rEgaYIAttlZjctOO9IaKKTRb30rvWcNVrATlmIDfGoYxPYNM/BF8hfgWA3KF4
 8YfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ju2Gh6n0ew2AK80HWk9mSXJ9DuDeA7+Kr59s88BldaU=;
 b=rL6Hw60pgbSOFutYkxvi4AgY0ETZbDCjuHm6M1hgBqX46fZz/ta4IKsB4BrjUibYBd
 8+2MAbK5eftjRaAexZMpoMGkjVLH7nc8JiiEFfenAYQvA5u6PW7ukWXeHV1ktf5dM50A
 gkMlPiPClJ4oDtM5L6LPMBvIMHqF0DLPKK3vv8WeHpy7S8+MYIlpmLYC9hZTM7SfhBdf
 jLaV/T0U+1UmJgC5Zv2Gx8TDGCPJs3hxxwAW76UlbA3cFFnGR8KN3+wbyG4p5lU9pHaZ
 9hX3E/MUH/fTS2u01b5uS/cW49mMT+X06I6oQCBP6rPgBcZBur1lGfu6ZweQ4pFVx+I+
 zSkA==
X-Gm-Message-State: AOAM530IC2ivvxOX5HraA92EKwYKLrSJNLdwvESZFik47j+FSw+y2Yu2
 JeenZv4hbgdQSDhzSy3fhOQ6AIgS2Yc=
X-Google-Smtp-Source: ABdhPJysWeskZ97y+aybjZjiiIKREhau5d40hIQyjC/r0M5XX7VRZGNhoslx9ROtbySo/M3Kv0wThA==
X-Received: by 2002:adf:dd42:: with SMTP id u2mr17537450wrm.309.1613914493809; 
 Sun, 21 Feb 2021 05:34:53 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm22350467wmb.33.2021.02.21.05.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:34:53 -0800 (PST)
Subject: Re: [PATCH 22/44] hw/arm/armsse: Add a define for number of IRQs used
 by the SSE itself
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-23-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d1086b4a-4681-7f52-cf59-4819343d8625@amsat.org>
Date: Sun, 21 Feb 2021 14:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 3:45 PM, Peter Maydell wrote:
> The SSE uses 32 interrupts for its own devices, and then passes through
> its expansion IRQ inputs to the CPU's interrupts 33 and upward.
> Add a define for the number of IRQs the SSE uses for itself, instead
> of hardcoding 32.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h | 5 ++++-
>  hw/arm/armsse.c         | 4 ++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

