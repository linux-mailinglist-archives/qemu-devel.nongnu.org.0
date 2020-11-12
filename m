Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628062B106E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:29:43 +0100 (CET)
Received: from localhost ([::1]:41120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKA2-00081j-Dd
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK7m-0006M4-LI
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:27:22 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK7j-0001DV-VB
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:27:22 -0500
Received: by mail-pf1-x441.google.com with SMTP id a18so5744469pfl.3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lUnH0OpJmB4BnULpfe5pjyQvwLmfOnAY/6Zjlj3seGQ=;
 b=J3ohO1DUp2+iMh5nbVRlYFV2djw5+jwZAtAxhbX4cvbyq03BIJKW8VoYqwju/dWkZ8
 GaO8fof1QXe7C9qGxxTV6kr5aFJQK5D8NB2Tjch4pujM3IQ+WodS70jvmQY5sKxEIsXT
 xYk+yLGggBl1dRyHLgTV4vJaSltvjaNoCi7TyQ+g1z0IYOpOPwkGIJrGH6XtfcqpjeO5
 buJPvPs0NXZvyeL3bU4KnUkLtNNopnVYrUXQAuToHjj1J9RiMf/5PZolcIc/LkJe6PIf
 6cZlN/Iz4BkZZ7T5roy60xA0Is/MXJ7T88TU7it16GMxxAGXKkstcGww7jVr2+Jaz68d
 9s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lUnH0OpJmB4BnULpfe5pjyQvwLmfOnAY/6Zjlj3seGQ=;
 b=QNZr0mBtqt+GLSuRfmRmNmOLOzEClmMPRVaL3wbM4oahO8uVpO6iWoNrQdcdwbwTEi
 Kl4ve22GL0FpNUg7VIyCZdbnTKb9bQVS3l7ZEkU/f/2Pb9iuraU3+Knfk11TVCqFERs3
 IFGpuYSYKx5ZGjSOVA4M9Qwb4HYRwcDb7AKRbgLZiDlyyLK+WiP4nnFCDVpQPw+vMb2k
 YSIc0bODyOGQFTa1EhvcBOEACkVE0oxrZZwqlMelI4AXLNU0im0bmVrxOBYX9kDelph0
 ScKX/W/HhufV91BC72SEpGSVfwOf96b54Ze+OTPWUIjMp0EBhLU8/Z1SfkL2n/gcKhXi
 KlJA==
X-Gm-Message-State: AOAM530sCnnohGcZiTI42qC2M80JkHj8omkE6pELaNmEI2IpR1rnAn85
 4XIV1Fx329HuVDwP00I7FSAvOw==
X-Google-Smtp-Source: ABdhPJxdjiJnvKkjakRfYCRzhY0PfpVXNAl1Rci5RWSyQwSdJoZ/wAZgpixhPPVtJaczRXosFRYCGQ==
X-Received: by 2002:a63:f611:: with SMTP id m17mr1163185pgh.178.1605216438749; 
 Thu, 12 Nov 2020 13:27:18 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g7sm7701768pjl.11.2020.11.12.13.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:27:17 -0800 (PST)
Subject: Re: [PATCH v2 2/4] ppc/translate: Turn the helper macros into
 functions
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <20201110105321.25889-1-thatlemon@gmail.com>
 <20201110105321.25889-3-thatlemon@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a9af095-9e5a-8993-9caa-6604c1956931@linaro.org>
Date: Thu, 12 Nov 2020 13:27:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110105321.25889-3-thatlemon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 2:53 AM, LemonBoy wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  target/ppc/fpu_helper.c | 220 +++++++++++++++++++++-------------------
>  1 file changed, 118 insertions(+), 102 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

