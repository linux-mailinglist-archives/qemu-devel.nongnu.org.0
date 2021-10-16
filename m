Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6F542FF5D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 02:08:15 +0200 (CEST)
Received: from localhost ([::1]:46476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbXFG-0003f6-C0
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 20:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbXBb-0001y6-Kl
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 20:04:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbXBZ-00017U-Cd
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 20:04:27 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso10424225pjb.4
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 17:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HJPryxf77fdt2XjNeWBCSXh/cg9tY7XwSX028/sqp9s=;
 b=ckaI/cy1ar88YYhInOtrXpa0mu8sthA49WY/+dYpQ4rm/H8HYWBT4EfxWtoIGO+R5+
 aB1hAGfO+HlfmfXWvza/GmdGDEsoM55fryn97xp8Oe1XZr3EUR+BEk5MapHQXGcH4efR
 U3zBNJkrLI5Lz6cKQMJvSiw1MhG2amz8v5ILceT6vsczcLhxih99PWc1zlvBFazrB2N5
 NEQBekKbEPjsLlD6RbvpkyIUBakhUOY3q2svtvGm4HBrNaT0jUSzePTv9uPo5mNGoQA5
 C3I3zy+4dA8rOPc8YEG+bytVPeeMKTrtBzkgTNMwS4a4C4mNgsH/nyFlUlprA+DGsQfH
 OWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HJPryxf77fdt2XjNeWBCSXh/cg9tY7XwSX028/sqp9s=;
 b=VUqtXGeMtDuJRuzRlRXKYjMlCmfrOMFYBybl4UXMDV2SBhY7clyGT1daUl+hu6NAgj
 9kxwnY6ZlcaJ1Ppujsx/uVJsxVrExJB/AzfmwNzNbyIWeB1abxU7GLfn6gfLfm/9RBtb
 dwSylW1SIO+y0na1Fnn8zalE+GNVZ6sthPnYSCXotou31mPIvWwtSJqZeVL4XZmbhHTJ
 02tSKkuI2m8XUjgOL+3zApSLT/o84Gfins9KFGs7h3ZPsmNxAUvP8Sc0apkK94i+h+BT
 wiGtj4B+9PDy/WiNedxROkQW4FptA51mLd7lM5RwgauB+AIZ98p6yqHovZhuLB3Cn8f6
 soqA==
X-Gm-Message-State: AOAM531JFTNqneRRtVXC1NZhFOiE/rF3ELc1cXDXNxp6THnJWwlhljBa
 eKaeNFLbGD42/ooG5flhLhOoRg==
X-Google-Smtp-Source: ABdhPJwpzU/emzxsBpr32jNTxD23J9KVTw7b7v9N6tjWTlwd8AzqPoeSuSYNjMgRfCLIHC8jTmjXmg==
X-Received: by 2002:a17:902:9a04:b0:13a:1ae3:add2 with SMTP id
 v4-20020a1709029a0400b0013a1ae3add2mr13477870plp.28.1634342664231; 
 Fri, 15 Oct 2021 17:04:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id kk18sm6146282pjb.8.2021.10.15.17.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 17:04:23 -0700 (PDT)
Subject: Re: [PATCH v13 7/7] [RISCV_PM] Allow experimental J-ext to be turned
 on
To: Alexey Baturo <baturo.alexey@gmail.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
 <20211015192931.227387-8-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58571939-2bb5-40c7-548a-22ba6222b5db@linaro.org>
Date: Fri, 15 Oct 2021 17:04:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015192931.227387-8-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, space.monkey.delivers@gmail.com,
 Alistair.Francis@wdc.com, kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 12:29 PM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo<space.monkey.delivers@gmail.com>
> ---
>   target/riscv/cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

