Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84D4206CF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:48:55 +0200 (CEST)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIiU-0007wK-5l
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXIdB-00029t-8l
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:43:25 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXIdA-0003uG-05
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:43:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id e12so8866248wra.4
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mvF639fOwbp7uKFCrevdZwzxxeX7M6gkJ8H0h6QMyOs=;
 b=Ks9xPpVThhv2vhCQVf934h96DHdm1VWIL8yxs7Bf7YR1IekdsSu0D3Vgez4grkve/H
 8r0i36lkqHtZ5488cVQ6wTi9JluEEnV8w0GN7QroLoeH65uI+cPc6Gez7cOKFPvq4glT
 tJYOCyaA+0QePR892Ad8R2hia0tBHBqt/mpuUTJNZaC1/2zQXS4Wx4V7O1nEAs0a2ngh
 jnQd8s6fEIgntw3f2vg4sDsjWpmY11wV7qu4UxGnfc3U8J+8U43xWAsw7dob1BgjBNT5
 QSpsaZiBSuDpknSEE/RR66xrsWNhl+on+NREK06FaNAuqsLG5UQqn2YtCHLaZxaf4r8A
 8lRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mvF639fOwbp7uKFCrevdZwzxxeX7M6gkJ8H0h6QMyOs=;
 b=g66QWb12ZE5JBbCudblPnYd/aacy1L7V+eSy1qGeZJsViIExYLa4rZb2uMbtTQFGZ4
 yTH1wtV/NdFO/QhFP3EFmGZm6rM3Q2uZ6rgpoOczVz4Uiii0s/jY40T9KYY6bNo3rfFZ
 QQbYYSSiujzWQTjJiUUmsA68zNl2xxMq8nD9aEfPoC7ogMaQi8oVshm052at6lu6msX+
 aV6mtYBNmGY5rDYpInm21X6OqGi2Y9xqvav4a8rqx9bCFHI4L/2RU1G7XPhB4FIpO35w
 DmpPGgn7mFyc/t6K75EYK+dY9e3RQLOgbb51uF4KjxpZ2JoBq/mYnRyg1ljswSklhCHP
 /wiQ==
X-Gm-Message-State: AOAM533sRBAvUh1LVd3ga6AGsl5Wiw88xjBuAOv7sHkjiFbay2EoKEok
 ppD9PsEW+4NlM2UahDu6JOc=
X-Google-Smtp-Source: ABdhPJwmwjCuDDPXgJzagEDJFZvL9bsKDRshD+vKC4U9PvRCInmAa+Uloli+oh8LbnFvspWjHpqkuw==
X-Received: by 2002:adf:ee8f:: with SMTP id b15mr12586188wro.126.1633333402699; 
 Mon, 04 Oct 2021 00:43:22 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c185sm14083470wma.8.2021.10.04.00.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 00:43:22 -0700 (PDT)
Message-ID: <157566b7-f04c-10f6-cd14-f5ae1f59c026@amsat.org>
Date: Mon, 4 Oct 2021 09:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/2] target/riscv: Use dup_const_tl in orc.b to
 legalise truncation of constant
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
 <20211003214243.3813425-2-philipp.tomsich@vrull.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211003214243.3813425-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 23:42, Philipp Tomsich wrote:
> We need to use the newly introduced dup_const_tl in orc.b to legalise
> the truncation (to target_long) of the constant generated with dup_const.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> (no changes since v1)
> 
>  target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

