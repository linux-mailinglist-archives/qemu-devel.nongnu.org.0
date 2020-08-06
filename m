Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24E623E4B4
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 01:41:32 +0200 (CEST)
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3pVr-0004yS-9x
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 19:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3pUa-0004PB-6I
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 19:40:12 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3pUY-0003jy-EX
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 19:40:11 -0400
Received: by mail-pg1-x52e.google.com with SMTP id o5so9806581pgb.2
 for <qemu-devel@nongnu.org>; Thu, 06 Aug 2020 16:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Pu5JVFagrRVBjr/hibm2XKkPJpvwuFmYkoVZXrjX/M=;
 b=W57kqSl3I/MAQ4LDdaWxmNRyV+xX7VY6N1yTuT9hX3sgBATWgDIQ50CRu+b+arKmT6
 lyissyESELgnIzoEDTf4urZlWjzQ+9DXPi65HwLtgGdsYrg10WRRlhpNBC5m/iSRURiU
 Y8KFd+zEj80aDwsnSDl8MKQ1JvgSeGJskkh3nxBrWbnWiycx7xTdajZt+06n+gW+iKc5
 kPJCyrOYU7UZQ+zfeFwaXly7OLa2ZDBm7Qs0+TdJYfbWtmSJr/6ZKhnebI9SEkTSA/rM
 H+Rc5ICrZus8UHcGK//i6XPD94/kUzXL6amEopCjZZXDpSdKdLLQRfaFWQjlyS8s6I63
 SGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Pu5JVFagrRVBjr/hibm2XKkPJpvwuFmYkoVZXrjX/M=;
 b=OoCEQYUdS9RK54v09lx9QIMdDbRvNGsCE1tjGHI4oflsTGLVt4zfetKmGzT7IZRyHn
 bo5g4Gk83F37tGIuwYkOvCE8jUh8gPjb/ATcKly/FrqBQ5ziR4Wr4uhAd7OUQps7u/uf
 eNNDsd3n0qGETndgLrO1Slf17ISGL+SH2fdDTLXiln3YMYaJ+cTKWXkXtuFuXZCri3Ph
 cU6zsrtJeii3iXmWAJ8KmU+DXigpvENRKbThwPBuyHUdw+vUYlvX/M1YYmXAmhLCdFsg
 NbSxI6fT+l9/P1PV9lmUqZE1sGoU3VlIiP5VzIelZmtcVGMnKeSb9XgEkKhK8JloOGqb
 VB5g==
X-Gm-Message-State: AOAM5306i1H/V+WafUUmawFJJwGnuqga12qAQzcRMPvxWTxmCOt+KWAO
 qn820hSjkXEQ/xHrDsk6YtkLew==
X-Google-Smtp-Source: ABdhPJwbZ1/1TuRq12GAgYo6KIjR05Kut928Y5OcCYtKTrt0ZjIONyo2g+UZ2R7ubNF0LjXptOGT4Q==
X-Received: by 2002:a62:7ac2:: with SMTP id
 v185mr10691206pfc.277.1596757208773; 
 Thu, 06 Aug 2020 16:40:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l12sm8244892pjq.31.2020.08.06.16.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 16:40:07 -0700 (PDT)
Subject: Re: [RFC v3 19/71] target/riscv: rvv-1.0: configure instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-20-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11ad5e9d-58be-510e-d238-5404e239182a@linaro.org>
Date: Thu, 6 Aug 2020 16:40:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-20-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 12 ++++++++----
>  target/riscv/vector_helper.c            | 14 +++++++++++++-
>  2 files changed, 21 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

