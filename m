Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095304820F0
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 01:06:46 +0100 (CET)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n35RV-0006k5-55
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 19:06:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n35N9-00053f-Er
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:02:15 -0500
Received: from [2a00:1450:4864:20::535] (port=38829
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n35N7-0000Sj-R7
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:02:15 -0500
Received: by mail-ed1-x535.google.com with SMTP id bm14so103479923edb.5
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fkQd6Snoi2Bn9IBR0UoZS50ckQmVgue8rg9HDQlf4Ws=;
 b=OmszKdGk8f+WbOt7aHNoFB+1G8932abzU3Ia1/GA3ELAPyIz6OOyN3E9EUVkw3lUhK
 PAoXRRAtz84f0ALw7PlzjytXww5bmuSkWrBxw83ilaRYQ4Jq8Dfyj2jasMIOcgMwv08V
 +RbPeUBcN8h/BQmu2bOQ9mt1OENLv0gqv4JRyJjx/NP6Z51DhxpRSGFNF+BdxABQfES7
 0dPCuHZ3EmTbzTsiIEA4T8Tlkv8VDWNKxY18ScXZ7pG7/XsE7l7Jc1JVGQxzj53cp0EL
 CgScnFcZgCZNiH4FGKo93YF7iD6Ofpc6vA4Ca8hGUhyRPQHtH4UXtsYlFkYH36EPEd+l
 Ulng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fkQd6Snoi2Bn9IBR0UoZS50ckQmVgue8rg9HDQlf4Ws=;
 b=8Aq8wuw9xtxqXezPTHEfqPpWH9Rlycce+jXuEFnkvRrCErYw48iEYulBMbBzqp+3ZE
 Ro1rpbWOryGz1MqD38HSGeDw+frdyjbSwYlUi0cMj4hGKcEPBa9pxv8/AZygDRsCCR0F
 nMuwSt5F5mZwkka96tQg/1y+siEPrWHYzNOdKyGHkq1eQZRjxcuKQlKulTE+fCpwaaU6
 DKPMmM0NMRX4dGwKaZG1BqBA47wxaBrPB6Gwa877Jx9xio9yDCDVnxoylCi8xSalvqPZ
 yPxFhm5hYqMudxtdCTXQ7cqhpWkAsi5CsMwP+WLFti1ednVQzYkFs3xLTERn97SVKUNc
 slhQ==
X-Gm-Message-State: AOAM533+Y6PtlZ/kvJadz/kA6muy6TcwHNNRxOFgVoW5p+Zn8Ayc1lqc
 8FYBbHZQ/PGrbv9wwLyrfElqAYRKxmY=
X-Google-Smtp-Source: ABdhPJwyDImRaj4rAfuRwSiBc7DMxZ20d8STzDmS1FOrYwA9Oc9Vb/FSFejdWFoDE0h8N6vcGL9hnA==
X-Received: by 2002:a17:907:60c8:: with SMTP id
 hv8mr26413806ejc.192.1640908931804; 
 Thu, 30 Dec 2021 16:02:11 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id ho9sm8018318ejc.86.2021.12.30.16.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 16:02:11 -0800 (PST)
Message-ID: <3dfb3b01-16d9-445e-804b-0ec89809d7e8@amsat.org>
Date: Fri, 31 Dec 2021 01:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests/tcg: Unconditionally use 90 second timeout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211230235424.49155-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211230235424.49155-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 00:54, Richard Henderson wrote:
> The cross-i386-tci test has timeouts because we're no longer
> actually applying the timeout that we desired.  Hack around it.
> 
> Fixes: 23a77b2d18b8 ("build-system: clean up TCG/TCI configury")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/Makefile.target | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

