Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B8147BC08
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:45:22 +0100 (CET)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzalt-0007KM-Ku
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:45:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzaki-0006dH-4Y
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:44:08 -0500
Received: from [2a00:1450:4864:20::52a] (port=33476
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzakg-0005ER-HK
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:44:07 -0500
Received: by mail-ed1-x52a.google.com with SMTP id m21so21889628edc.0
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 00:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VK/KxQIp0sjIXfuTWf26EdWXni+5pVFfFQ4nftbLMf8=;
 b=FA+U6uGsW5jIzhUTYi9geGD2gNBBp1gICmJZtpZgHRRCufauqcfrLJen7XAxBKS/R8
 bANKJtQl2NChMITK96Veqzjfo61/OiKv5RCUyMOBTObhqMxFXEtHoGcLb18ZkGPHHkAq
 j/01KXqCg4ZHJJ+3y1cYJ3viEm6IBXRFw2tucP+NrE4DOwl3UhjHpGlXDSZJiDlIm0v6
 yivskjxY7NYYp3AZ7MDEItqsoF4kU1zI4nE+to+XWrqJ9qd8qgHsHUDnUQGypYct4hXY
 h9Jou4JXTcZECABteGJLC5FR/dyGEavjX1ery0f/kmVl6RxFwG7Dmwsk3j3zhNAN7PtA
 eWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VK/KxQIp0sjIXfuTWf26EdWXni+5pVFfFQ4nftbLMf8=;
 b=tlNG6UvhybX9wfLkTGuhY2idokEEkATG1zfho3tnUvhhXUfcD1ZNs8AX0/gIR6NJgf
 pGv4rK4B79qU+ExoBpUWuXLT0OnDZYrRcU5M73HdUoHT/M43GvZRBlKwTVrqxrSaAfdH
 IX1BzkgYrGojR0ynaUXVNWBMz26WEd3Od4MBZRBiwZD7fEV4tHBv4vQjjKDICiwf4Spj
 k2nn7QifsgCeTeH/M8U6d499cmVHOI9RxLkz6MoJo1AbHoZ0ogQAYSe1y+yO7ObjH/yD
 lGOCM4IFZE3Q79R8g27KDYnby0prBEJC/OCVItMMNcPpFh3b0GwcEyC/uPwWSTNCstvl
 c15w==
X-Gm-Message-State: AOAM531Vjk9Ye7pHlEG3TN0LgPhPBMICUVR+rtYb/sKcaWioWkd5OPRu
 SSUhz+Rah4f8shpFjUUWl28=
X-Google-Smtp-Source: ABdhPJyn/y3kK1Zb6t3r2NimLmCb8iy9KRDSv8AfQ+62wAxrI31YEshShXYNrcA/6Lje/aCwjmYHdw==
X-Received: by 2002:a05:6402:8d9:: with SMTP id
 d25mr2193382edz.283.1640076244106; 
 Tue, 21 Dec 2021 00:44:04 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d14sm7820791edu.57.2021.12.21.00.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:44:03 -0800 (PST)
Message-ID: <e0e4f331-6c40-bce4-fa7d-898fbe74f962@amsat.org>
Date: Tue, 21 Dec 2021 09:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v11 00/31] LoongArch64 port of QEMU TCG
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20211221054105.178795-1-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211221054105.178795-1-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 06:40, WANG Xuerui wrote:
> Hi all,
> 
> This is a port of QEMU TCG to the brand-new CPU architecture LoongArch,
> introduced by Loongson with their 3A5000 chips.
> 
> Everything is tested on real 3A5000 board (system emulation, linux-user,
> make check) and GitLab (CI jobs), and rebased to latest master branch.

> ## How to build and test this

> As for the hardware availability, the boards can already be bought in
> China on Taobao, and I think some people at Loongson might be able to
> arrange for testing environments, if testing on real hardware other than
> mine is required before merging; they have their in-house Debian spin-off
> from the early days of this architecture. Their kernel is
> ABI-incompatible with the version being upstreamed and used by me, but
> QEMU should work there regardless.

I took few hours to translate and read all Taobao contracts before
registering, then got blacklisted at my first login... Maybe others
will get more luck.

Having someone at Loongson helping with hardware is certainly easier
for the community.

> Lastly, I'm new to QEMU development and this is my first patch series
> here; apologizes if I get anything wrong, and any help or suggestion is
> certainly appreciated!

For a first patch series, this is an impressive one...

Regards,

Phil.

