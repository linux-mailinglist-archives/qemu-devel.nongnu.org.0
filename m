Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72235571C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:58:29 +0200 (CEST)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTn9w-0005RR-Fw
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTn8n-0004uu-F2
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:57:17 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTn8l-00033T-GS
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:57:17 -0400
Received: by mail-pl1-x636.google.com with SMTP id v8so7636246plz.10
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oispWkNDsIc062/KAagewBcewbY86P0WF835Cw+20fU=;
 b=g8/KDzzm8c8tzisUNERsmNHq1zI7Rc0IZ0k4Y+9Tf6luUlLvXOn/lch2dbzlg90r7t
 JRz3x6Dvdd1hzYDLzSN+iRS9Fd87/Gkf7GohnfgmTxN7VyxYJqMERrAie+Zcef6UmIL2
 dGOVxVYwgIYZ8WHV8NgyiEpbNkcgTQJeFjUHDhlFIAQlVVdXbY2zZnDXaWYGmX4N8uAJ
 jzdmoh0mdmaOY1vgNuEVbTDxRGfcw1jqN8O1CQVWAkIxd+bo7EpMy30p1k4q8o3gL/yE
 X4zaTYgViQfbHxIr0CyykY5X3AnUiQav54xk9iH3JCgCI+DtsUXVsVMsguMYo0OaIfJV
 qlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oispWkNDsIc062/KAagewBcewbY86P0WF835Cw+20fU=;
 b=Ogu6nJVwvNtKAOnmA3xrItWRag2iGOxAJf8sqwnG7qR5zYbL8j80I8lxDrV0Z1Cv+o
 OoGlDVKZQ3S/FNbsuIzK7l47fy4R27Vt9/xyrjiCj3WcgIA3N2v8hX7hz4s79X0L5ete
 yJnD5A8xo9HXqHV2m3Isy0xm6EueyihlizFAIRsA2vjyDpa4Rj8LZc6U5jeNmD6x5seK
 9Ta+0sz9nJI1issM2brmse6bXgiGyzfarISzR83k5Mzz5F4TJgC4yUnP1BL+m7s2skFl
 mJi/wCxE253E3GJXgWCqH43YvHFoaVsvxPEzD7vf4I+Tm+Jac9dNhXiDfE8OWIPRjmVi
 IFLA==
X-Gm-Message-State: AOAM533vHtw0y9gW/hpLg6cErnqHCNZCQOm9a2MkAJimVgIPBKFNqkrR
 9CiWWycY+ukh2xBdCLMs42tX0A==
X-Google-Smtp-Source: ABdhPJwO+QoHC1DKfWl3P/q3KK9n8HS0D1+clev2ehjGthlDqXXm0wlvqwiXSnztoFvqyNbIX+iIGQ==
X-Received: by 2002:a17:902:525:b029:e8:e347:b07f with SMTP id
 34-20020a1709020525b02900e8e347b07fmr13709979plf.34.1617721033168; 
 Tue, 06 Apr 2021 07:57:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y12sm19465200pfq.118.2021.04.06.07.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 07:57:12 -0700 (PDT)
Subject: Re: [PATCH v1 8/8] target/riscv: Include RV32 instructions in RV64
 build
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <1c19d0112fae5ec6087cfc415f0d6cc56495220b.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7aea1ab9-ac9b-5245-7b3a-b6d87bef6c0d@linaro.org>
Date: Tue, 6 Apr 2021 07:57:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1c19d0112fae5ec6087cfc415f0d6cc56495220b.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 1:03 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/insn16-32.decode | 24 ++++++++++++++++++++++++
>   target/riscv/insn16-64.decode | 31 +++++++++++++++++++++++++++++++
>   target/riscv/translate.c      | 18 +++++++++++++++++-
>   target/riscv/meson.build      |  7 +++++--
>   4 files changed, 77 insertions(+), 3 deletions(-)

Having these split out from the main decode file was a cool trick when we were 
sure that we never needed to support both.  Now, I think it would be better to 
merge the patterns back in to the main insn16.decode file.

You'd begin by adding a REQUIRE_64BIT(ctx) macro, much like the other REQUIRE 
macros in translate.c, using the translate-local is_32bit() function as 
discussed earlier.

You add this to all of the trans_* functions that are currently #ifdef 
TARGET_RISCV64, and merge the insn32-64.decode bits in first.

There may well be an issue of missing helper functions, particularly when it 
comes to RVF/RVD/RVV.  There's a suggestion that I made for Claudio for i386 
that may help here:

https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08595.html

where you add stubs that allow the gen_helper_foo() function to be declared, 
insist that it be optimized away, and reduce to an abort with -O0.

Only after insn32.decode is complete, do insn16.decode.  That's because many of 
the insns here will need the REQUIRE_64BIT in place for correctness.

E.g.

{
   ld          011  ... ... .. ... 00 @cl_d
   flw         011  ... ... .. ... 00 @cl_w
}

Since ld already has REQUIRE_64BIT, for is_32bit it returns false, and we fall 
into the flw code.

There will be one extra helper required, when the 64-bit RVC insn has a set of 
illegal operands:

static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
{
     REQUIRE_64BIT(ctx);
     return trans_illegal(ctx, a);
}

for use with quadrant 1:

{
   c64_illegal 001 -  00000  ----- 01 # c.addiw, RES rd=0
   addiw       001 .  .....  ..... 01 @ci
   jal         001     ........... 01 @cj    rd=1  # C.JAL

}

and quadrant 2:

{
   c64_illegal 011 -  00000  ----- 10 # c.ldsp, RES rd=0
   ld          011 .  .....  ..... 10 @c_ldsp
   flw         011 .  .....  ..... 10 @c_lwsp
}


r~

