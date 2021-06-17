Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B63ABBC6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:26:57 +0200 (CEST)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwjA-0005w4-B2
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltwhx-0004Nu-GL
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:25:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltwhs-0001Pr-U0
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:25:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m18so7833202wrv.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 11:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=017NnShadrNdOXxHij3cHXhKrL/qi4FvnOM05AXVJJo=;
 b=N6A1XewUS7KIGgP1nQ/buSuCL7LSdCub9zbtorhFrFyLtbOQF3n+j/put5BofJLOvA
 puENNVSSVpfXaZD9SetAagj7CwWbHxr55Ir2C6HQt30BONELX8o5DZkwZPTk9irOAz5j
 gB59gicQaebyFstmSLKo+FnVEISC9Yu1wLNtZMwgVHr6XZecqs41RT7G7aUd560PCsqp
 1G6/LN8zU08JHzdn9Sgpetz1s6lo6Vh6s1pfJLtaT5ROF3D+NG1P0CE2MMVn72NuNcGu
 XXr2DZVbSUv+V7QlDJkMjpqqT0FwpV0qDOaapkBHnKWjI4FA8ICS0m0Jask9t4f4NjpG
 DtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=017NnShadrNdOXxHij3cHXhKrL/qi4FvnOM05AXVJJo=;
 b=qQTzTnfpujy3tfz97WuZxnwr1KpHFXqsu/frQyvOdQ384VQhjjjSDoUGE0svPM9/mu
 OaDt4wzh8g8k6qhiCjiw5dmsBF4uwjc4JqCgghynjGxnB6pp1uLnzO4Fu9fZ2vKhK2bD
 Uzy4fSFQ8YVdKbjUT4O/nG+1JPyyUKhbwDdZwJCeiTWYXlEC5FreabrQzOaIkmY2o4q1
 aVr4bOKC0inaRpdJNX83D9H2SUuvjltSOHrSmeyqfjPNnBTmS4jkxnC3WdM+/bMrB46L
 OwQh40Bw/GXC/ZyVuYtkemcxIo9hZAFZXUxzVNrCxdd+SznF+AgWbuuT+Ezff7R+IjI1
 kDMQ==
X-Gm-Message-State: AOAM533X4+toeJ4i185i0V7/hduUL+CtNh/0C3/tL5vn6LVF4nqm37lr
 w+1oYup3/e+oZj4/Me0eCig=
X-Google-Smtp-Source: ABdhPJzAo+9Q7XwlnrTFMo12hW+n7y9U6HW6ZII+4AyKBOV0Dp3RKeGIBm6SRlEhKGvKQrxITRTkUg==
X-Received: by 2002:adf:e551:: with SMTP id z17mr7372057wrm.320.1623954335214; 
 Thu, 17 Jun 2021 11:25:35 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u12sm6529319wrr.40.2021.06.17.11.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 11:25:34 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/mips: Add declarations for generic DSP TCG
 helpers
To: qemu-devel@nongnu.org
References: <20210617174907.2904067-1-f4bug@amsat.org>
 <20210617174907.2904067-5-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <604bf0b1-025c-1468-5374-6096de4c73d5@amsat.org>
Date: Thu, 17 Jun 2021 20:25:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617174907.2904067-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.254,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 7:49 PM, Philippe Mathieu-Daudé wrote:
> To be able to extract the DSP ASE translation routines to
> different source file, declare few TCG helpers, MASK_SPECIAL3
> and a DSP register in "translate.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.h |  7 +++++++
>  target/mips/tcg/translate.c | 10 +++++-----
>  2 files changed, 12 insertions(+), 5 deletions(-)

Oops this was not for this series but the next one.

Review still welcomed ;)

