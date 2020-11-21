Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7882BC1EC
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:09:07 +0100 (CET)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZBy-0002jE-Gd
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZAo-0001og-9W
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:07:55 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZAk-0004MB-RF
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:07:54 -0500
Received: by mail-pf1-x443.google.com with SMTP id b6so715969pfp.7
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+hKI2B99bBkZ7WpVKcS0MLdjOVmJRelg5hW7fwwJOAY=;
 b=Vm98vgxb+UeS1RRq7TVrJbWz6We+9Bi+xbhT7m+jwKYz17SWhadRDEQWpmovV9XSsk
 eFapgXKwXcg/DYFTSnoo1KFeIif2GYecrtL5ps2DspKCpsUwFe+Shpzph/N5SZw5ZeyW
 9bUwZzLqXvm0Nz3n5kzxE+JTJnfOLZSq1d0S7JRX2l1pjaZb/FF+0NEG7+2HLJKj6gqb
 SPsRfrKYQB43vjHsXJcz61TaiMao9PrwlLbAJJ8hTlq3vp2SC9eskD0EokmgA6Mgi4GM
 PC0rZL40aJIWANa/oQmD3qZQyFTU6DPdbgI0NArxpIlS8STEss4gjY2HLBh3Ddufbblz
 gOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+hKI2B99bBkZ7WpVKcS0MLdjOVmJRelg5hW7fwwJOAY=;
 b=XJmaQusFjkSvPxV0TMSOmkAA2JBWGmyStN9y8L2JN7VJiCCG1qDQQP0eP3Ovv4RBXZ
 FCzFL9zyeVuqubhk49PYXZvt0kVPd0EkYbcN7qRQwqSeGvKcgHsKo/o+I9GjqJHtnN1B
 a3EeMO8G4Su/4pH/JVTbTQVV117UBEl/BDVWBQsPLPxcZEZMpDiA6V77bVQ6gi7rbWsV
 sTEhHlei4zoNOK9UTLzYBsKJmhByTYU33X/S/9Lr/7zjsb5J6oTPsrv8swFZaSvfcYQP
 QRob13lLuYOSC1QPR/TOqNARxSm/mNeRV8j3Ct+ybfPdRn8fE2fxRLRDXLmTd5QCSX1g
 ibtw==
X-Gm-Message-State: AOAM532eHTJuTeK0j1jo+sK/gBIRGBpDXq7dXkKdSCJUr54r4dROxpRT
 a3J3fvnZE/KdKL2hIlcYsKDckQ==
X-Google-Smtp-Source: ABdhPJwtx1qJyiPkn/si1n7EtF0RnyivUpVsVjtt9vB+Rj0s+B8aYp//UQzZfSWEU2lxbo4la647GQ==
X-Received: by 2002:a63:67c2:: with SMTP id
 b185mr21527021pgc.102.1605989269568; 
 Sat, 21 Nov 2020 12:07:49 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id c203sm1183672pfc.10.2020.11.21.12.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:07:48 -0800 (PST)
Subject: Re: [PATCH 17/26] target/mips: Extract Loongson SIMD helper
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0d518a3-cdee-481b-dcd8-4160cb04ccae@linaro.org>
Date: Sat, 21 Nov 2020 12:07:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract the Loongson SIMD helper definitions to
> 'vendor-loong-simd_helper.h'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/helper.h                       | 60 +------------------
>  target/mips/vendor-loong-simd_helper.h.inc | 69 ++++++++++++++++++++++
>  2 files changed, 70 insertions(+), 59 deletions(-)
>  create mode 100644 target/mips/vendor-loong-simd_helper.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


