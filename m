Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0D1EB1A0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 00:19:56 +0200 (CEST)
Received: from localhost ([::1]:56768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfsmg-0002bF-9p
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 18:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfslL-00023J-Do
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 18:18:31 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:43247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfslJ-0007kw-DH
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 18:18:30 -0400
Received: by mail-pl1-x642.google.com with SMTP id g12so485287pll.10
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 15:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=An14sIGzSpbFgWG0PXrY9PWzJT6fDYxa7R5qY1qFmgM=;
 b=CbAFNhKAMnCehCjUksLZifmll7TrGyL2dDrV0oJud1cArwknzWnW0L/O8VX8OLKXp1
 ruCwxRKf8r6fLh9aJGUi4CoOM8893gOtJ3Xy1+MIyxEv5wmPdGvsYlakdqllzNIwT6c8
 Gy4lVRRGO8yjNpHu0O9DKAqY2IzpTbtNFqGa5to81Apgadbw5p4RfOHa7eoH//SX14uy
 5GxuYXZvYM+tpzdm3vCSfO9Ejd42QMSIdlUn8kFNkUNNl5HOatbHBWh+Aotwv2CQeq5c
 JK2Ke3/r4aSLhx9knCd8BJ3OMVqHQoDAURJ9NPCV7Xu3ITCahVlUqmmap5Rm8SLWrjOY
 uZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=An14sIGzSpbFgWG0PXrY9PWzJT6fDYxa7R5qY1qFmgM=;
 b=WL9Yhkn0vxKveQGCTg/wdjD62a3dnJQYZRLfFDH5Fkz9SnF/bL5Ac1TTL8ib4F0Gh4
 oEsYvW+/idQvGQPTLTqRI+vg59btpsVFWQzwAjot4zv5q+Bh8Cj4zd4F989man1SKEBp
 xYYqAk7hUT4n6m5hlK4UA7zV4VRWB4Sd4QBispPrqHQLpzKvPmCdN3TbS/d4j+4Ptb3X
 3j9oxcLjcBHRUbjXQqphpgaPdRIpAIXIhkIfkWKRyY5cqF2AyY1yIhEEwTfYL7Zp/cyo
 IFmHyFQt46tb88U6yYDbw5YKUQ9z0b3f3X5uoDuaw6DbKgSHMNspjVkdGWim+eqMZ7sb
 b2dg==
X-Gm-Message-State: AOAM533DTRxopYeL9GqCUdpq5JVgGnYm3pAuIgm82X4uookGFbmt2is7
 X3h/GJ2fBiQ/N1Wg2paPSVEYt6KhXRo=
X-Google-Smtp-Source: ABdhPJx/5fpwa4t4JmizbLvhi+zwEPz6YUHliNUm7Rn+8oatSOKHovKKNXSImrh24Y9+jVAEd3DDIQ==
X-Received: by 2002:a17:902:b18b:: with SMTP id
 s11mr21432520plr.160.1591049903691; 
 Mon, 01 Jun 2020 15:18:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s75sm406795pgc.13.2020.06.01.15.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 15:18:23 -0700 (PDT)
Subject: Re: [PATCH] target/m68k: implement opcode fetoxm1
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20200531131951.631902-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <968951a6-0f27-9cce-8a06-75b5be3a2ad9@linaro.org>
Date: Mon, 1 Jun 2020 15:18:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200531131951.631902-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On 5/31/20 6:19 AM, Laurent Vivier wrote:
> Example provided in the launchpad bug fails with:
> 
>    qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>    Illegal instruction (core dumped)
> 
> It appears fetoxm1 is not implemented:
> 
>    IN: expm1f
>    0x800005cc: fetoxm1x %fp2,%fp0
>    Disassembler disagrees with translator over instruction decoding
>    Please report this to qemu-devel@nongnu.org
> 
>    (gdb) x/2hx 0x800005cc
>    0x800005cc: 0xf200 0x0808
> 
> This patch adds the instruction.
> 
> Bug: https://bugs.launchpad.net/qemu/+bug/1881450
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target/m68k/helper.h     | 1 +
>  target/m68k/fpu_helper.c | 5 +++++
>  target/m68k/translate.c  | 3 +++
>  3 files changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

