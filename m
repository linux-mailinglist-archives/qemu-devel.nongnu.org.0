Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50B0400EE7
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 11:51:57 +0200 (CEST)
Received: from localhost ([::1]:47672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMooe-0003fK-T2
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 05:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMomA-0002Tb-Jt
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:49:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMom9-0000Pe-6w
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:49:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id b6so5118613wrh.10
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wnw7RHfdDbU6h8YIjxnjGCM7s42Cmxs2pMcxI1Ygxzo=;
 b=NGv2nVz+YR45nv11Rsc+7wU9MiN49rIwrEkR78yAvBkHTwjUmPc14lx0RNDvFImE2w
 CeIfIyBW2RPBhUy3O+E+JRlPYARhkBoiwPdE2VT5WR2dvTqOcy4fRPPfSuw0U1QHVVmS
 BxmaHwM/j9Y5IOXw5PSuAU/IWBMMYRVeCvhlDloN6DfzvRZKD8IbZad8RohbnzcmJwQH
 6xwfRddPgLxHSagG44N/xLy/nZ23nHevgqtovbUWzjh2LVYaPgstuc2qgtjaNTScF449
 Paldy3DneNsu4/EDTcjaY+jKqv4uCauMdRchzWkaIcSI3e3wJ7lv4JAEgNZMHSuIzXrP
 htWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wnw7RHfdDbU6h8YIjxnjGCM7s42Cmxs2pMcxI1Ygxzo=;
 b=A/ytqWBJ24aEaYJ1G7VxThIYLxiivm6HuzA0Pd1v+f5hNFGYgQG+0cbyIxqBXhUA0A
 GHsiyWSJvGg5U40Di/YEJGhc1e7Ml2HnpZDNGcTEJ8W7c1b58OwlJdlbd0urlCk2ijCi
 mRgdfBI6dpMNLoNGCxuxduJn9damPxKmhG4X3WkfpUEVRTq8wxPuNhLF5eAj1PSEbx3E
 Y2jbcQrEtbz9AqLadj7SMRsS6isGH2aX7h9j2w/L1gmjcXe/KQH77WzUG0bcmQxZ8c9r
 417m2vgDHG8DHrHlkuh7853B6tUU0+YpaTNc9u7f0OQPlVbo5dhfpg0Y9B71KMLU1ca4
 Aa2Q==
X-Gm-Message-State: AOAM532fHERVAPVcp3CmOwerPDLIuhCCqEmqEUE8gBD5r5U203xnRYP0
 VYUbfB3IEaaLhNsM8Wg5jp8ONA==
X-Google-Smtp-Source: ABdhPJzf1jduJ2WRfHXtlm5/cz8kKii8ixd1/HEJ9TJfNfS8ALUXHr8bKueE2dL0DJlq/QS9OxnKZg==
X-Received: by 2002:adf:f747:: with SMTP id z7mr7703863wrp.194.1630835359204; 
 Sun, 05 Sep 2021 02:49:19 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id p5sm4671486wrd.25.2021.09.05.02.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 02:49:18 -0700 (PDT)
Subject: Re: [PATCH v4 14/21] target/loongarch: Add floating point load/store
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-15-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f64046e-7a37-5120-ce72-1eeef4fb7f99@linaro.org>
Date: Sun, 5 Sep 2021 11:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-15-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:41 PM, Song Gao wrote:
> This patch implement floating point load/store instruction translation.
> 
> This includes:
> - FLD.{S/D}, FST.{S/D}
> - FLDX.{S/D}, FSTX.{S/D}
> - FLD{GT/LE}.{S/D}, FST{GT/LE}.{S/D}
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/insn_trans/trans_fmemory.c | 143 ++++++++++++++++++++++++++++
>   target/loongarch/insns.decode               |  24 +++++
>   target/loongarch/translate.c                |   1 +
>   3 files changed, 168 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_fmemory.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I wonder if you want to add nanboxing for loads, since you did it for the arithmetic?  But 
certainly this is correct per spec as-is.


r~

