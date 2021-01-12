Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7C2F3BE0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:37:48 +0100 (CET)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRMJ-0007VW-LL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzRJd-0006nj-Es
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:35:01 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzRJb-0002nv-Or
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:35:01 -0500
Received: by mail-pg1-x529.google.com with SMTP id n10so24950pgl.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dZj82sEVov6fXBeIcSncP+rbxd60wMDd4L6xpNDC9XU=;
 b=QJbp4V7zptML935Ur08IA4JS17+5FhBZfp12df+RnmAR5KcyyUDNXg9kXb/8hfi4nG
 ZzeE4MN/4hDeiM2xN5vYUSn8zemSq8v1o4WdY0WpF7KF22gqktw2Vajw1Qo0AoVg2KOw
 RRX/Ecb1iAactOkZM8RIK6kZGIdPUg50NWQPS4SgEATyOzTUeGO0dwFBAgg8vk5ntp0v
 QGLDypVa7vfIS/l9qtmjiwod1bDc+/DhzMhL6hqQ+qYQpuY/Gk7JPHgX9R34OQHcNioD
 INGFkRLsneTPZZNZTZHhjHZvcjm6FXLVsMoQKcQ2ZeU77XC/Ajy+wZP0/C8tiYAubs2R
 qDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dZj82sEVov6fXBeIcSncP+rbxd60wMDd4L6xpNDC9XU=;
 b=aZxbJg4GYt79D2e9fh3gJXIb8BioOcZbZVwUMLBFqrjk+0hSNdOf2KIkIqc3dRh2HS
 FDGFXN7Kwzf/L3Bftxh0nAXc15B0HNbecynG+0/wgsnezF9RpwpetioLth7WU84SUSkW
 MBQhfdYpBGpxd9edhTNdikjuKxfblToneu2Mvb0slxoTCTwVeLAkQJV19pCuKk7HmTZX
 P56ifBhI98rpWg1fBTMuQ4uqE/rVbC/hz64FvJDg5XjKgG9OK9XDFHScZJzYjc3IxS6x
 3Rjt6SMyxL8CuL82d+cUdOu/1LM+neQbHrgfXhRkaYPttR2o1V8s6uzk/jHBjab9/niN
 dv/Q==
X-Gm-Message-State: AOAM531EOYsAJXb7glsxnn5BhoCg0YuqgsQAkOQakx5WgBJP46JiVZb1
 PKeFaVB5uz3KDA7/FBJhAV1wNg==
X-Google-Smtp-Source: ABdhPJx34jO9ijOJW0NU5Z0knATRasCcu+DdERtGp5WxwP5KNEqasmfIt6Pi3LMbpt3z7hIq/RpYsw==
X-Received: by 2002:aa7:8749:0:b029:1a5:63e6:56fe with SMTP id
 g9-20020aa787490000b02901a563e656femr1112489pfo.32.1610487298307; 
 Tue, 12 Jan 2021 13:34:58 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id e24sm4417796pjt.16.2021.01.12.13.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:34:57 -0800 (PST)
Subject: Re: [PATCH 0/3] target/mips: Remove vendor specific CPU definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112210152.2072996-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afcfe36b-93c6-001f-52e4-094fda87e89a@linaro.org>
Date: Tue, 12 Jan 2021 11:34:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112210152.2072996-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 11:01 AM, Philippe Mathieu-Daudé wrote:
> Trivial patches to sanitize MIPS CPU definitions.
> 
> Based-on: mips-next
> 
> Philippe Mathieu-Daudé (3):
>   target/mips: Remove CPU_R5900 definition
>   target/mips: Remove CPU_NANOMIPS32 definition
>   target/mips: Remove vendor specific CPU definitions
> 
>  target/mips/mips-defs.h    |  9 ---------
>  target/mips/cpu-defs.c.inc | 16 +++++++++-------
>  2 files changed, 9 insertions(+), 16 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

