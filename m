Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939565A1302
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:11:02 +0200 (CEST)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDZV-0004kt-Dc
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDY2-00035j-Ni
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:09:30 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDY0-0000ej-Nv
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:09:30 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x19so17109960pfq.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=YXcgdB60Npebq7OGvZ5S4BiPxwuq8f7MjRlogvUP2P8=;
 b=bM3rKDYcsd3w6DKqi3w1KspR6cMYMrgQBfi2tycOVcW/nrgy8hl/RWaMOQAt1p0sYm
 H9YX4lhDamsPqutWXCC5ZDlv57Jo/Je54REkJjYONdMT4nXbJLC87Sica55WRsF2pGkV
 dydtXk38fsQfflFito9/dJb1uAI2yFcE3aAYXshNsqKloVzL2wMrpzSB8Ixn6s80Urqe
 iAe50JUoPG9Itp+6gVKt2GAl74PfcZrNeZ/QjA5LMIjGc2o9Ilk9t1kuEbPGxOFpHy33
 6cwQOPo8fNkiddPEzqoakuDeCg2cMawWoYEKGOmfZeJOmgMc2PUEuTxnKJtvlDinJ4V0
 M0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=YXcgdB60Npebq7OGvZ5S4BiPxwuq8f7MjRlogvUP2P8=;
 b=MiVdRtNL9zdMAhMrdnJu3hfORl2gMxdTMTlpvAWkpjMQMnp7cqzDiEnLbQOaSpGRBW
 NxbP9AvA625qjyksHtoBFjdAYHzmghcb9iviotP3WRhJezmHmBzwiqs7UZGQcA/fU45x
 f0Aiz9DCAP4Feq1rWTYOO+7wWZanYPbO8hpgVeIiCc7BDbIrbpyUMeNXayQqc2r86ICA
 I9jhXQvVjMTfYIzHQ2/MW8xZxvRjS0r7SrOWJUZLLhm5Upjc6ux55EHBnyl3bTPYl7tf
 Nvu360/BE28cA5HUZ2gd26ZQAqqSNn1s1JdHryUZk4HEE3c9sBn4D/wFERSoo2cybvZM
 paOg==
X-Gm-Message-State: ACgBeo2RcmqjhxNLPCfZia7YbFTg6FQ1B2Bx79mP/TahCmMMppgfoFZm
 1jhJ+U2l6kX8pxIMNbBWl3s=
X-Google-Smtp-Source: AA6agR6ko687V51uL4t7IvZBFNPC+wHBBPNuIKulz/F41dLwTcxD3GqsKw0j7iRvjqSFmiDPNChtbw==
X-Received: by 2002:a05:6a00:850:b0:537:1d58:5921 with SMTP id
 q16-20020a056a00085000b005371d585921mr4372358pfk.31.1661436565710; 
 Thu, 25 Aug 2022 07:09:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170903210400b0016eede528b4sm14531041ple.61.2022.08.25.07.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 07:09:25 -0700 (PDT)
Message-ID: <1ea26b24-438b-d331-3927-799ce2f4617a@amsat.org>
Date: Thu, 25 Aug 2022 16:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] target/avr: Support probe argument to tlb_fill
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com
References: <20220823050718.1930676-1-richard.henderson@linaro.org>
In-Reply-To: <20220823050718.1930676-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 23/8/22 07:07, Richard Henderson wrote:
> While there are no target-specific nonfaulting probes,
> generic code may grow some uses at some point.
> 
> Note that the attrs argument was incorrect -- it should have
> been MEMTXATTRS_UNSPECIFIED. Just use the simpler interface.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/avr/helper.c | 46 ++++++++++++++++++++++++++++-----------------
>   1 file changed, 29 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



