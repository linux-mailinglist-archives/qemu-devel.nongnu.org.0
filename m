Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CF843BF4E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 04:12:05 +0200 (CEST)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfYQ7-00068N-PW
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 22:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfYOn-00059O-4K
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 22:10:41 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfYOl-0006io-4V
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 22:10:40 -0400
Received: by mail-pl1-x636.google.com with SMTP id w16so913482plg.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 19:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=14NEhk/WydtOVhOi6Xs9OuHCiUXqa8gPSKz1dJYc/HY=;
 b=GFMMTkuW6UA1ukUhoD0MpnPeqyIUGZQ1/bPEe0mus1eywrFSJHe2z6nYad6XxbFiVp
 QCwxMAFT0vQCzK33nvhZ/Tu1wAPqTXXIZipGSOZo4rVYRDZGYnB0/dAYJYPJcrvmfODa
 GsNQe8C/ggpX510nS0U9Zfh0FYY+bhrR+IJ29IWchuHieqXSAH7BjmIXQKYeYxZ7kTLk
 n1KnCQNCnciCIn5FuKCAVqRJFkoMmuifF71HIs1+VmOBcUhA+c59orrBcnc6kTFo8273
 GMhkwy3hoTQIa76HpR03q39GD9g3GtMp4IX+6gdxAydNG0m0Bfd2TPywwGzFEgqwpM1Y
 djig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=14NEhk/WydtOVhOi6Xs9OuHCiUXqa8gPSKz1dJYc/HY=;
 b=obBXxTvZitWnfVM04rvhYM7JqIMpl0X5jjD+HKaFEBEirftR+YtBP1JZKoEaxmYA6o
 o8idl9skmd4B/qr8My6gMreuuVySpaigoXrOscFe0IMQrDuYG3qWaboLrvVK/0XICjVv
 LW83KHmUm1rYF7LNf/3FCLhcr3TnFJKmklkhsVUg4Ux2IqntYnOrgq/tZOdGPE8X/Q7P
 lidG81Q2UXmujqECUBGYFhNcw3fELBsoNas/J4ge8thD2AemrI+g4qzqzvwGP96y4oXS
 77b1E70041V1u7b1FMhIEYE+0by3ZJwL0uAH22f9VvwY46s/p1hOAd1Fl9/bow9uS0kz
 X+DQ==
X-Gm-Message-State: AOAM5319PGBYpTEeVTdtPEULHMVG8HfIOHDxA/yP/7vf/M98ULQVWPPN
 JecFxR5m1RMfrTlTEZh3FbNOpQ==
X-Google-Smtp-Source: ABdhPJxl5+qdR2VMyI+eIGQWzvRhMF14nq9XazHJKi8MnsxTM3E0oPn0xmVhWwn9Z0RYqlY5igQldw==
X-Received: by 2002:a17:902:8bcc:b0:13f:ea68:a135 with SMTP id
 r12-20020a1709028bcc00b0013fea68a135mr26222699plo.41.1635300637449; 
 Tue, 26 Oct 2021 19:10:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y14sm9938168pfn.80.2021.10.26.19.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 19:10:36 -0700 (PDT)
Subject: Re: [PATCH 1/6] hw/sh4: Fix a typo in a comment
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635298341.git.balaton@eik.bme.hu>
 <f03f38eb6b70b8586f33868b0ba4839f3b214fc9.1635298341.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0cb048a1-429f-b57d-676c-70b743dc5d8b@linaro.org>
Date: Tue, 26 Oct 2021 19:10:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f03f38eb6b70b8586f33868b0ba4839f3b214fc9.1635298341.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 6:32 PM, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/timer/sh_timer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

