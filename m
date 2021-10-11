Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60F42992D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 23:54:06 +0200 (CEST)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3FF-0006Yg-9b
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 17:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3A6-0004FD-RX
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:48:47 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3A2-0001FC-I7
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:48:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id t2so60406225wrb.8
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 14:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PHsjZHMjFes63HLnx+sFDGLaC03lB7Fy77An8Byry3A=;
 b=EoVF0OOXfUcU8ltcwqQ+HxClSYR7uli+yyT86hNQUliJNKJg1pH0B6dFIg5Q58yv++
 menOAoMzCPBiCRZIt0nU0xWVptqvxAj6PK/wfjRYWSCGIGccMdUkZR8RjxQxW88Wyz9p
 2v1GEdln7yvubi7QY+Z/+a77PF2xjT8ycJLC5PqZrSXcofcRhrGffFq2rtT7KnJAeQcs
 h81pgh9wZ+/nUzsoWdtOnJxO17WSagplFmn3lfAmo0EW6K+XXK8psKL7ngHUQPmBJKzv
 uuSlAUX6faw7fBkk/TPhxi476qXUxgsOTHpVsP0Vay33kf57PYz0blvARmQRoMj4d/ZV
 Z97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PHsjZHMjFes63HLnx+sFDGLaC03lB7Fy77An8Byry3A=;
 b=CEoUFltaI6bfsa1ywL/eEUPnVUOqoYj1e9y7ZjzoBfvwFEWj4Tk/1FEGLp2mRZOG4I
 3wkLYf38Q5AvKZqnOB5SwzpJ3HVCmaiR6N80CYIJi3PVqhUw0TjmGzo3HJPwpOTl3v3j
 6sRLHl/GgjJ6Zz2WFOUTaBZMk3b+MfFUzP1+2tu0DwgWW8MPk/swXwvvirnvf+elA1bF
 2y5tcy/obGBeH0utSNokuyfpTmt7Z7orH+vv6uz/t7c7Sxwi0SnaNhonnLq9YtimaBeT
 DryzAdyZB9Lr21LD/J6u4EcVAXhfYyoMGR/HrViPMMv25A3XOKD2YrOrXf7WX18v1+6j
 Zqgw==
X-Gm-Message-State: AOAM530kShGKlDwnZBCIQ2ihU5982vRCTI9flVN6DttBzBFVGsiQoxWP
 J12ShQNc9+eI5iNWFo3veCU=
X-Google-Smtp-Source: ABdhPJxJOvRoIDNtZ+f43p1xXF5lLRtRTfGhgcyKowbVd1cnmLgHlEDYV67mYSs0rRSi/ihOjd6rtQ==
X-Received: by 2002:adf:f243:: with SMTP id b3mr24103257wrp.60.1633988919876; 
 Mon, 11 Oct 2021 14:48:39 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c15sm8912275wrs.19.2021.10.11.14.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:48:39 -0700 (PDT)
Message-ID: <69f299d1-901e-990c-e8c5-987b88cfb535@amsat.org>
Date: Mon, 11 Oct 2021 23:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/8] accel/tcg: Split out g2h_tlbe
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211010174401.141339-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/21 19:43, Richard Henderson wrote:
> Create a new function to combine a CPUTLBEntry addend
> with the guest address to form a host address.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

