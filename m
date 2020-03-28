Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F2E1962D9
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 02:25:26 +0100 (CET)
Received: from localhost ([::1]:49034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jI0E1-0007Dq-T6
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 21:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0Cy-0006GZ-Rz
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 21:24:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0Cv-0002UZ-0z
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 21:24:18 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45805)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI0Cu-0002UD-R7
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 21:24:16 -0400
Received: by mail-pf1-x442.google.com with SMTP id r14so2912971pfl.12
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 18:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/ONSoa6CijRO/vw2dFP5dXV0ro9LQWScAXQc+H22pKg=;
 b=Vn6+rIW5nuCjsomgNw8uK6e1g9rK1dYqGI00FkAmYlNJMcDlqN9QP+il4aRRH3mvEk
 BLeeJXEpvWTQWcKhP+dtczvYka46UNhI1uJM5D+zzFYnbYOnwooQ7YBzCa7FmlRB4rSI
 iZGz8SKpabLkuoiEbsBE6phxTvABdYeonALIX1vqckTHWicDALWmdT98EHdBzLrI5ybA
 2Gi4aCX34ytCQHT+EiZM19hipMAveOx68W7cA4Ok81M9V2iJnfqZJFAhGsRggesFXkGB
 XmYl8PmuTLxR0OgqZMqKy830B2R5XD40j0RUBnfpGF9ebbuI08W6T/f+VCSWllpXceoD
 KY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/ONSoa6CijRO/vw2dFP5dXV0ro9LQWScAXQc+H22pKg=;
 b=dfqHRhE9WfgJOb6X4miREU5FJk7dm6P72RsovAwvWr5ythz0lWKI6mU2zBa81/a/71
 xghRtDHtij12Vv4KBTelE4Rl4uypGlWVobj+60zPFBos4NMyYbr4VcHie94sG2botOqP
 3A9goAjg6SZ57ZRdG0Xhxd/G1lSuhozuN3ye+bMa9m2TxdRWxJ/CiBXn+R8g4sGl1xu/
 jMhhbJxfguoQIamXvpfBcLFdh+d20vHhArzr1dSOjLCZQ/McMYsOlYwvLRP69NHav1ne
 79COUdAvGhkZNqZpZKj0jR6c30D+OabjAGwwqhhlRmDi/8slwELajoS++aYAraVVpMf5
 +bCg==
X-Gm-Message-State: ANhLgQ2LAXkj6mignOQu2nHRoJOhndaIWooKPlovHJ7CZgtBt91e3kZn
 GASP4a7TL3KBNUXbXZfK4f4OSA==
X-Google-Smtp-Source: ADFU+vsZR4fx2dksZ9yEMcxFJ7iUSQ8VRhnwstEoqhmfASI6adnC95J4qNwu2xZsabvKgfrC2pANdA==
X-Received: by 2002:aa7:8649:: with SMTP id a9mr2068995pfo.138.1585358655867; 
 Fri, 27 Mar 2020 18:24:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id y29sm4694639pge.22.2020.03.27.18.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 18:24:15 -0700 (PDT)
Subject: Re: [PATCH v6 28/61] target/riscv: vector single-width scaling shift
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-29-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <074b3bb0-9815-0083-27e1-56f6c60d2516@linaro.org>
Date: Fri, 27 Mar 2020 18:24:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-29-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  17 ++++
>  target/riscv/insn32.decode              |   6 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |   8 ++
>  target/riscv/vector_helper.c            | 117 ++++++++++++++++++++++++
>  4 files changed, 148 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

