Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC252348EA
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 18:08:45 +0200 (CEST)
Received: from localhost ([::1]:37684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1XaO-000704-Ul
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 12:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1XZV-0006W3-Uh
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 12:07:49 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:56084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1XZU-0005mY-8G
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 12:07:49 -0400
Received: by mail-pj1-x1029.google.com with SMTP id k1so7639550pjt.5
 for <qemu-devel@nongnu.org>; Fri, 31 Jul 2020 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JqusPMVwspv4Mbzv6MdgywMMzdu2xeyDveR9bZ1l81U=;
 b=kpt9EKsMnbdviHMolUdAom6AmCbBNcP9hiL2xUM8fKQWSR28QCooaQSNTtcBnmmmbE
 nLIo6OVb3S3MTxg3HB0djaWifIqvNbssJ+Bx6IczGFvDjXCXmllZtDMJso45MRrYOUmq
 vseWnhroC0aj12jvmJwnjfIjtdcNQs1or/LGwvVbCOCFzxZ6GYCzuWUAcYZ9hlzb32Ba
 UzlRg7oEhqUIqvIr6iiRT/iqIKIRcGSl5SuotkYnIqtfDg5z6Yf0CCUZkR5AqHZS9l98
 Obw+81GdqVKIG2YOD3rFt0dy5qY2BOybipVO1OZlNpAcaIwsUFLxCSF73t9s0Y+MzcdE
 gXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JqusPMVwspv4Mbzv6MdgywMMzdu2xeyDveR9bZ1l81U=;
 b=okRB4aY+IfGYfvWYo8ed6cS5NX3ipVZEwfSZkTIHo3AZoLeD4y8Gc6TiFZTLsFaU8V
 XqiMzwU6RafaAZqoO5ROTONr8pytH+a3TvkNLbRxlMxNlI6/4JExu6PbIXVb3UzH7TPq
 PISh5EsoasTXx+Ig/GvTPTwpGSJx4Y79yc5GNwuYJc84folBV/RKTxjh8dTrwBk7/+AT
 McHD2ps9/pv4rC13uawpAguZXSD+CWu9o/OhRhOFiTdCh9mMLaKZfHObuqgeIPf8Kndb
 Mpnx3tmZvuiN5eG4B8lmDx4gF113E0M0pflTH2bkjTcfQFJfoucnQ+YEUM4h/eDhJvjN
 Fnjw==
X-Gm-Message-State: AOAM5335P4Fzn+Yid1O+dBqwzfmuatfcwuXi3Arc7RcfK8kEooLGWJ74
 C5VxmfsX1ePxF4WcdSHFGPXaSA==
X-Google-Smtp-Source: ABdhPJxRRgxX7SAQUsB9zDoebUrxdAv59vZNHge+kTWMirVIuWwzG0L3ZMLf8IaK0W6x80R0WjY4fw==
X-Received: by 2002:a17:902:d303:: with SMTP id
 b3mr4335863plc.101.1596211666776; 
 Fri, 31 Jul 2020 09:07:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id p11sm9566582pjb.3.2020.07.31.09.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 09:07:46 -0700 (PDT)
Subject: Re: [RFC v2 60/76] target/riscv: rvv-0.9: narrowing fixed-point clip
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-61-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7dffddb-921e-7156-a3e1-030615ff1d28@linaro.org>
Date: Fri, 31 Jul 2020 09:07:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-61-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   | 24 ++++++------
>  target/riscv/insn32.decode              | 12 +++---
>  target/riscv/insn_trans/trans_rvv.inc.c | 12 +++---
>  target/riscv/vector_helper.c            | 52 ++++++++++++-------------
>  4 files changed, 50 insertions(+), 50 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

