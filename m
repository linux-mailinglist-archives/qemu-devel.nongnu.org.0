Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F82233320
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 15:32:21 +0200 (CEST)
Received: from localhost ([::1]:37652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k18fU-0008If-CG
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 09:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18eE-0007Sq-CL
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 09:31:02 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18eC-0006zV-15
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 09:31:02 -0400
Received: by mail-pl1-x632.google.com with SMTP id w19so1140057plq.3
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K4d2aOJKk6Ll04KZGZoQftP8vTqPy7vZDuRH8215P1w=;
 b=koGGCBSiRk+77ZxUrthUj55QdLH56q5mr9ZEKNAbDzl0ZudYpRhLCRn7+Uox2O1rTL
 d0MSxBRbDxLlT8IEp4A66xJbxRygrlxuQofvipwri+w27S6kWxXBIUsEfknPhOkqB+SS
 CioPr5Kjg/+5KrY/jIhoMI/spw7Sc67/FJPGUNkgsrYxZ29X9KpAzuajK2d6z/0+xAOd
 Inp4jB4d2tdVrjtU+Gl+IV20zJaByUICTlJKaGIw01bnmPXE46rG7CWKdAwKH3tyaspf
 y0zlq/V2hW3rXn8+Ssdly7sjrFL327Kj5u9/8PPW3Ll7aplX/leAj9M5o7aVPuxPLC3B
 k4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K4d2aOJKk6Ll04KZGZoQftP8vTqPy7vZDuRH8215P1w=;
 b=hWeCxceSkaoR5U1x+GT6qLmGFV3vNqPF/YVuxeorvmkA/TlIkpycxuS+lnJxVuyjoE
 D+Ry1CgDVt8JeKhIrRJOFlG/4UgH4dogcfbdyx4LOgY3KhW2RM+CWWEhYblRRAyxjZEO
 YXt74BCGi9366FyLI8EfwoOASfbLIQp/D8nPj/jgMUgPFxWEMPy+mNzHOuY0xJ8r0I10
 Kotg7IVNhRgpAb9T2OzjNInp9tGmPUo47lA2Sf5VZSn45WA55e0H0QpZpe53NahscMbF
 CszlQAFUMr0ZzsjuDkOzlGvfLlQou0+Wg7EPP/uuLzWVtzz7IEON7LX+YvwQ9c4/mPMF
 GwCg==
X-Gm-Message-State: AOAM530/m+JAtpPrTidDdMYdHp5tRlaUiOK8SSTpbxJBEWVUVD0Fmojc
 GZWQmaDdkL6t5cscMOwol6n4FA==
X-Google-Smtp-Source: ABdhPJxBy2dZSuhZK/38uijKWFZFoXeG0RIlabeprb6cSJGS6lgZtDJ3O1J3ANAygAfFposdHAaNlA==
X-Received: by 2002:a63:f04d:: with SMTP id s13mr28530254pgj.100.1596115858666; 
 Thu, 30 Jul 2020 06:30:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r4sm5368918pji.37.2020.07.30.06.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:30:58 -0700 (PDT)
Subject: Re: [RFC v2 36/76] target/riscv: rvv-0.9: element index instruction
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-37-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9e304de-1a28-7f74-ec2a-f8f2d7df7e7e@linaro.org>
Date: Thu, 30 Jul 2020 06:30:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-37-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

