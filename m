Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1AF2DC6FE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:21:58 +0100 (CET)
Received: from localhost ([::1]:55506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcN3-0003wI-Ht
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcFJ-0007hr-0z
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:13:57 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcFH-00088h-F4
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:13:56 -0500
Received: by mail-oi1-x22b.google.com with SMTP id l207so28842613oib.4
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/eMv4jgTr86eBbI+l7cn/9ly/Ss9seKsmH73EA1idCQ=;
 b=TA88DAKJciReLhTxX8WjFAKe37R9Gq6vnv7Y5gJGDVZlc04hBMs5ytucU/S58YxoE5
 owrJj6hdx69iKqkd3thLvqJuYzG5p78JOhp12k2xD4+tunx+leKghtcxtRvTDlrNuco/
 gA5m8MyRbVDYS0m20/8HOzKdnOE8FG82MwliKKZXU7e9VFMxNhNwHw4HvKt0dZLP+QQ5
 ICmnf0giICBisY7TheXSxHHkCqDIjOMsWkVVYvD83eYSIfVz75LpafRkXGS2VZP7AdT8
 UkZGjuTm2oeT+AThYHg5uXuh1s+X3POT69+H3ZfI16BunnGMufZtqbp+RKsnGm3XQdqq
 JhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/eMv4jgTr86eBbI+l7cn/9ly/Ss9seKsmH73EA1idCQ=;
 b=JhdKxF9+Gq/knXD8hWZZW2tnkW0hvBQJR9pfxCrbU1/Jk6UR4yyFY1wrLnFkiRxcVm
 OlfXAfsHnz6WFTBrIKOzn+PuF1zz5EfkZifQYbE+2SjQCHFpwlF8+139y1kIYsQXKKce
 EHkXtUGJJ7pPQ9leWBKkgrD0PLft6o8rW5wDd81+oyGVXMW1tOKHLngu0qx3YhXkBwmK
 trV8sMlCNx+t/r8wHDzVHBf88x/yNqMvIMcfSyQkhC9ZLwS6QveBFAj0gE2w17mwns2B
 Tq2mh1s59mxAvHWqVTI1JG/Z9ocwhUXmuDnC4SFKNGyDkomD63VjvBTxxUYdrFb8r6Yi
 PR+g==
X-Gm-Message-State: AOAM532ulutYouKpOgbdtuZPBjg2uXXiaFtx2/4RR3Mkywf/oRwWpBUe
 5ME6bYEAsVUf7wcMrbEjdRIQUw==
X-Google-Smtp-Source: ABdhPJzWJ8Nn+5SNQ6bZyfrIx3rlihmG3QiOmjoG3NKh2x5IR92kiAZCz+gOese3/R9UtLV9vdpJaA==
X-Received: by 2002:aca:3dc3:: with SMTP id k186mr2823653oia.156.1608146034411; 
 Wed, 16 Dec 2020 11:13:54 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x31sm641011otb.4.2020.12.16.11.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:13:53 -0800 (PST)
Subject: Re: [PATCH v2 08/12] target/mips/mips-defs: Rename ISA_MIPS32 as
 ISA_MIPS_R1
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b3828e0f-f599-9305-3bb6-44d8bc89b932@linaro.org>
Date: Wed, 16 Dec 2020 13:13:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> The MIPS ISA release '1' is common to 32/64-bit CPUs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h  |  2 +-
>  target/mips/mips-defs.h |  4 +--
>  target/mips/translate.c | 54 ++++++++++++++++++++---------------------
>  3 files changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


