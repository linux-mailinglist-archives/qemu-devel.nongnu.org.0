Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1938543BB6A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:12:44 +0200 (CEST)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfSoN-0002nK-8N
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSmH-000102-34
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:10:33 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSmF-0006Jk-97
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:10:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id w16so359485plg.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YeEUS9R9Xa0wxl+xPn0ItwlTYI0bVcoPo4BcxLm/3zk=;
 b=xyf5tcgY2vgu06rmA3sZXOaCGkTpujEkeGpNOOKYLvc8DtK+hllIyhUhHUgvUuXwnA
 cSt3j4W7I+C93n0VvzWx8jV3Z5nTXwVcpGd5wAgYeivBqpYfNXrDdreu+zGQgSQKhF0t
 TdOPiyhSCS96gBOz2otja+T014aPVDsW/Svs2h3wqrradvP9mNmLPi/I7PLs4kl7/x1s
 TFFY88Mg67VUEMftAGT5X7FUFs9g0VYrkR3DXMHxejSlNT6TGgTSZ3Ve5dtbOL391O/m
 quXEkH/1m0WWrk4iN25sWC643XtvgQ024aqOEu/1oK70vXZ4XzmKWwo29aQusbgU2h66
 MBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YeEUS9R9Xa0wxl+xPn0ItwlTYI0bVcoPo4BcxLm/3zk=;
 b=armpBuVxlE2vUTnS1VHanQ2B7EpXVa2kCGSU0dVkrI62BRShlu4T559LZ/AmFkcZpa
 pK3pfVz7B/j73Il3jv1h35CJBCl/P1OjAdhFav1xaawUc66Zpe6bla5H7wjgBHZ/iSd7
 VcztMPNVNjDZuBbHU9kg9HHgjj1uck1hc69goELKKqYWE6q30HLyP4wO8HiJuF4z55NH
 70WVs8Jd8L4uP74bl+3BlTIVaAhPnQyCTc6DNpCSpHI4nrw+QgtpOuCHgf7V7P8l4+Fu
 ggorJkvVJp2YmqiekF8w863lIp1jgzUzhKiRJQiu7UtDS6WAo3WxMeymCb9uVwdG3Y4S
 kgMg==
X-Gm-Message-State: AOAM53215L7jjOjGeUMTXR1r+yeHgckPSJRcZLMABMbscJe37WU/wLQ2
 YgvY7RV+1r25HQwM0Q7uDt48Ww==
X-Google-Smtp-Source: ABdhPJw5SgEXEO8BYPpRz9jtSwMpSnd8BwveJVN7q5gKDzkzeH4oCy7B58uJKxFANCDB2vz8rVi4dQ==
X-Received: by 2002:a17:90b:4c86:: with SMTP id
 my6mr984143pjb.75.1635279029609; 
 Tue, 26 Oct 2021 13:10:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y23sm7623975pfa.220.2021.10.26.13.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:10:27 -0700 (PDT)
Subject: Re: [PATCH v1 21/28] docs: remove references to TCG tracing
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8271d2df-a2f3-390c-0b66-4fdbb19c2cbc@linaro.org>
Date: Tue, 26 Oct 2021 13:10:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 Luis Vilanova <vilanova@imperial.ac.uk>, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, stefanha@redhat.com, crosa@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> Users wanting this sort of functionality should turn to TCG plugins
> instead.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Luis Vilanova<vilanova@imperial.ac.uk>
> Cc: Stefan Hajnoczi<stefanha@redhat.com>
> ---
>   docs/about/removed-features.rst | 13 +++++
>   docs/devel/tracing.rst          | 85 ---------------------------------
>   2 files changed, 13 insertions(+), 85 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

