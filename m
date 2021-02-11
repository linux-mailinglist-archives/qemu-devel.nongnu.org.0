Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21195318827
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:29:50 +0100 (CET)
Received: from localhost ([::1]:45534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9EL-00026B-4k
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8y9-0002gQ-1t
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:13:08 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8y7-0005wd-Nd
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:13:04 -0500
Received: by mail-wm1-x32e.google.com with SMTP id j11so4963923wmi.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ERdSWkNGYUXbEx/VMFSBUuPGrIYmYXedLOVQsbLuLc0=;
 b=MVpLpZuPQRSe2NJFbSR+hYMzFem95XpRAaV/Dr5SyjVvFIcUbg//MeagWqUiXwSoBI
 G2jX0NQam003eD8wxuTvP5UgRqPO51Sqi56Sx8NRcDBJmeW2cr8mFQQ/xPJFWVB98Zaq
 N46dcfumhvQkiT4o42KaTi9GKtWH+fgb7y525f8Z9NErWFvN3TBuoIAZ0KIRgB7gCVDM
 kaM5OqQr5A6gBi3vqFzjE6GMuEDrlsARBTzZkbZaDl2Nl0ByO0mDvxSQDKBh9kWGeEFp
 B/SK5BabPALP++N7GoK6Y7dDm2YcxEINAjea6OqZVxUKfKPfssV6IGn+qlkLfU250XNv
 iRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ERdSWkNGYUXbEx/VMFSBUuPGrIYmYXedLOVQsbLuLc0=;
 b=qUCRph5kzoLFMTpVlJGOqbWoP1571j8cITYRLd90RUtUXY09jNrofuBt/zOHjuoFvs
 Y7dA68LFsmsjWLsbXloLq2J5PPltb1qFBQ0+Yo+V/3SVA0q7szTgaSDFU82/aX7e3cI0
 KLxfJBpnPm00satXShPfsxHh5wlSkD35ioT2bhgGtMuMNbL2jhFe8dx5jrNmX8uoMR5V
 ysKvRR6y2Q59YPvYt1SBzRNeDGOWFV+VoX73KtVqOHPZP/wN3WSEU6tUM1oYdGJJlIOr
 +eGSUpR49O80xOba5u6x9rWB6sG0xgQx6OlAmm0BcwIZeieJN/wul31t/4XRI5JBE0dW
 C4gg==
X-Gm-Message-State: AOAM530AIoFjvh5gEgNSoZfrXqEBTV7kP+Sd2GMPXZ9mJwiog2wtESwi
 NaZSJ6FtDeJV8Qt7kBzJIVQ=
X-Google-Smtp-Source: ABdhPJx7eQAhI3tUS/7ivhj1QMyyXJTswwzrn22/AsAWoq8O5XOr5bGfjbQXuT3IYKSbwMcrF53s6Q==
X-Received: by 2002:a05:600c:1552:: with SMTP id
 f18mr4372476wmg.46.1613038382340; 
 Thu, 11 Feb 2021 02:13:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j185sm9895548wma.1.2021.02.11.02.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:13:01 -0800 (PST)
Subject: Re: [PATCH v2 13/21] target/sh4: Create
 superh_io_recompile_replay_branch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7a77214e-9411-5988-f25c-e7ee59cfb7c0@amsat.org>
Date: Thu, 11 Feb 2021 11:13:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 11:10 PM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Move the code from accel/tcg/translate-all.c to target/sh4/cpu.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210208233906.479571-5-richard.henderson@linaro.org>
> Message-Id: <20210209182749.31323-5-alex.bennee@linaro.org>
> ---
>  accel/tcg/translate-all.c | 12 ------------
>  target/sh4/cpu.c          | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

