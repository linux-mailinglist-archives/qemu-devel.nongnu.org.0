Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0237CCFA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:07:31 +0200 (CEST)
Received: from localhost ([::1]:33570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsKY-0001Rc-ST
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsIM-00089y-10
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:05:14 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:34602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsII-0000q7-5C
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:05:12 -0400
Received: by mail-qk1-x734.google.com with SMTP id v8so4935473qkv.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hrTueZdc9nbNNuIPqB1eOIRHav1xsXvyBhMc7WZaJ80=;
 b=vCRQHoPn+wi9jPhyCG6eOQ43bwuwj7t1QsuKqKlqrBCPQu7BuKsV6f5Rt+ojx0a5Ib
 4jzjj6tQiSUNaqHReUgXW+U0ARS47QeCJCBgF/lxLtodHyu2srEh0n+t94nJ5Is/Ry7B
 9MUEKNRcXCm2W+r34hY40+5VTqTXG7D3GLw82C873jF0Bf4f8pmKAbosG3TsdqwYG2td
 y4yea7JXB/WbJQ31/hkI9H6bS7LXJ8jiVE+2gBZvWbr64a9KR5MKtDiqfwE+22WyJ+Ff
 d1IDzBqg0pH0+3EShvj3IOBPb2/Iz6/35wb97okYMW6IVS4P9bV0z5lEfBP+IcurZcPI
 PxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hrTueZdc9nbNNuIPqB1eOIRHav1xsXvyBhMc7WZaJ80=;
 b=BDDugE8Cocb8m3hG28YU9R4JvcTy1gD9DStueWlycl3NgXD63C9AtioyYTUkh/4OH8
 B6ZNrFkC8qMxECKMFYOKkH79hNc5ymdIVUUf7hwL0lM21feTFBkCVmlH+8G6tmCGFmp6
 ZHiZy6yh1OkLQNDsvhwHfZthO30UM8M9+EC7ozUJ648VyGuB46uvQOWpBDENzsydssI2
 nOUPKwzutHtyu9YmsZehkWopLRsemauBPFEwC9BDGhqMm4N52hru13scWMBruUCEPFfs
 AzX9wr5DCsNynFxDGB9ZyVyl4Ot2HmPxHigCZ5TBJCf4WUv/PntAXeAqfvh7Ho6h0FLx
 EfXA==
X-Gm-Message-State: AOAM532A6f+LhLqol8CafxQ7FvlkFMjZ7pH7tz+WHVayKTL7V6H81zdJ
 Xok7cItCcssgahi1N3+c5yL63w==
X-Google-Smtp-Source: ABdhPJzxrVFv+yeKKP8D+E2GdbrstFBegH2WS5/ihSlWBymzjXoTxZxrwmLbr1gCceINbXOil0h/og==
X-Received: by 2002:a37:7d84:: with SMTP id
 y126mr33711124qkc.155.1620839107844; 
 Wed, 12 May 2021 10:05:07 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id t203sm458154qke.83.2021.05.12.10.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 10:05:07 -0700 (PDT)
Subject: Re: [PATCH 04/11] target/ppc: moved ppc_store_msr into gdbstub.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-5-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd6f164d-8c06-a261-649d-3c39384929df@linaro.org>
Date: Wed, 12 May 2021 12:05:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-5-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> This function is used by !TCG cases, so it was moved to a common code
> file. We chose gdbstub.c since it was the one giving us grief over it.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/gdbstub.c     | 7 +++++++
>   target/ppc/misc_helper.c | 6 ------
>   2 files changed, 7 insertions(+), 6 deletions(-)

gdbstub.c is not the only !tcg user; e.g. machine.c.

I think this should go in cpu.c, next to the other special register read/write 
functions.


r~

