Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77C42A2EE5
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 17:02:06 +0100 (CET)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZcHV-0005WA-Oh
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 11:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZcFh-0004yI-E0
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 11:00:13 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZcFf-0004gG-Lb
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 11:00:12 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t14so11165132pgg.1
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 08:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dQedmhE/rVs2bGMNC184XqOK5wwEh0atV90jh0W/nBo=;
 b=GzkKUC8oT49pHOSFe5ihQcapQw6NUPl9BmV2nyK4aT6dsCaL3jbOOGxVPXU8p+lcCH
 13W/0ZL7CJC0luxLpypMpMB6UM/8QxYGw/BeVUteAWKL+1xMPePvT/lTmDr6dW8tmWMB
 e58kc8s2UhAfly/qEvavMUJgWGymqHSquGO2L/p2yZwXqpxc8XO7/Yje4VSARAxekB7I
 D5fLILdF6dMft9gdBa7fkKEnUOt+3RBhrTnlJFZcunu0uHxnU3uGfx4ZAGhBNHhMdzfW
 xhWVPFqdqaT0cAR+7D4JeVJkI9RVDsPcDV9hfoi+2aHzzWxOlcb/MAzALhkJ3KT+zOLK
 mGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dQedmhE/rVs2bGMNC184XqOK5wwEh0atV90jh0W/nBo=;
 b=fidX9xoQOzAhfddptqYAPsDD5kQ7IUHO18Oo2RQW0Xyuo5EJfh5wTGCFVUEwoENJaS
 reiu7bVy+TlRWB7dw/7s6+PxrKq1qfPdywKkOyp/YQRwuwSOYHVdixhfO+G+EurdaxuF
 SKwyItw6xBrykuGjT7bmtZCt1dd2v32Kmp9PmybkjGLDja+Ulo/HoSuIxyct8ZL45JoY
 j5lgthMrT9Y5xB/JiMxclJsyftpF4ZND5o1WFc6YbVks9qR2SOSzIwDZdWMml6U9IQyN
 OcY2DtABYKTHeYZnvdwy41xeD71dmZWl1zc7g2alhx4qaDridCDx2s3ZZZatN3Xx0EL5
 gKdw==
X-Gm-Message-State: AOAM532pFeQbaUZThNlwcd3yF1Zf5Nsa0CncsJGtgVTW0Z7yJTjMM4B8
 d+QPAA5jR/FjSJzxs6imdcSRIQ==
X-Google-Smtp-Source: ABdhPJx6u/HZg/gvjPQ64Zf9bX6EbjygcO5xGFQCdVo33AhrLDl3M03S4hFEdcfvg5kAZU1Ig2jKTw==
X-Received: by 2002:a17:90a:7024:: with SMTP id
 f33mr18175611pjk.114.1604332810065; 
 Mon, 02 Nov 2020 08:00:10 -0800 (PST)
Received: from [192.168.101.174] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id y13sm14420907pfr.209.2020.11.02.08.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 08:00:09 -0800 (PST)
Subject: Re: [PATCH-for-5.2] hw/mips: Remove the 'r4k' machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201102102631.2058219-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f505244d-2433-2032-a90f-5d2a5ee024a2@linaro.org>
Date: Mon, 2 Nov 2020 08:00:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102102631.2058219-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: libvir-list@redhat.com, Aurelien Jarno <aurelien@aurel32.net>,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/20 2:26 AM, Philippe Mathieu-Daudé wrote:
> -mips ``r4k`` platform (since 5.0)
> +mips ``r4k`` platform (removed in 5.2)
>  '''''''''''''''''''''''''''''''''

Header underline needs adjustment.  Otherwise,
Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

