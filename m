Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7546D9CCE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:55:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRwV-00012k-6R; Thu, 06 Apr 2023 11:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkRwT-00012c-1I
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:54:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkRwJ-0006Jz-A5
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:54:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h17so39967834wrt.8
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680796457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1xo7l+sPqEXkZwU39zwB+SU8DHW9LLkuNxRPpNE9FXc=;
 b=i7l3m/KIklXc0mKu199RykqD3rIXWv8dhC4p9wXkUGcF4rO349rj7yvNPr1Nn/mCaF
 pEM/rTvPREl0QGLxLgC/TUY6Kkjla0LAvr1nrc5GJ4ZQacI9tc5p2THFLxgM5NcA59el
 qCRNqAtp6RBvGe0+sFUn9c4oRomWYkq2fjSpjqt8biY13EdGQ/elvaRVddhj1FtrkmBs
 qiHmmE5HU1rNH4pu0ej0MJSO9sknrjhb/Fs6clcQOJxViVZ7sHTNpTLC2RIeZQWgv15E
 5shlffuzNpvm02vjJdvqTW/vIKMd5owKEsda8wYMEiCmMu1fEDM41xGWrc/fxJx7fuky
 dtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680796457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1xo7l+sPqEXkZwU39zwB+SU8DHW9LLkuNxRPpNE9FXc=;
 b=Wc3aBMvgqmREFNcKFK+HANgo6g9rBdnekCJ05aVACqR05r2sT6p6PXliUPioVVGRTr
 6MN3fqHK96MWbQLzpTfkd0xM7UqYAfejLAivIZ/69ml8xvGXGQTu+hu4pBmcTnkDa4L8
 JJZ0qve8d0Rvp+5PCkSyGVDar1x+BCnwSU0AgyCdu4sdy49jEAkhR3QY/oWDuZzzqwQl
 S18CB8tm10pO1fTLuteEf4NPSsenwNxnsfXWHIZSZm46edhLT1Nl5NCwYkZ66+CStRbn
 2+YMNjJQaFBzMYDqAXshZt+jym/cMsqlyBE+ShQnv0HXdfLCl1No3lhAdbgmWSWOGZpW
 afbQ==
X-Gm-Message-State: AAQBX9f4C7S6NEF+rhl/+LPubj/d3+MTT3foquXxTAHaFG5cx3nEGoqe
 wRyky2lGE1GBmj25qeYkbAstKg==
X-Google-Smtp-Source: AKy350Z9WFR8nMwncU19BE2HRUTmZnlL9YZB90Xg16kh5jeiMX29QfVw0eaaHahtzMK2EhD2zjx6vw==
X-Received: by 2002:a05:6000:1364:b0:2ef:9f5e:e215 with SMTP id
 q4-20020a056000136400b002ef9f5ee215mr237799wrz.46.1680796457230; 
 Thu, 06 Apr 2023 08:54:17 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.141.142])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a0560001b0500b002cfe3f842c8sm2081702wrz.56.2023.04.06.08.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 08:54:16 -0700 (PDT)
Message-ID: <d26a0128-10b5-0dae-cf12-15072a564396@linaro.org>
Date: Thu, 6 Apr 2023 17:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] hw/mips/malta: Fix minor dead code issue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230406153721.3349647-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230406153721.3349647-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/4/23 17:37, Peter Maydell wrote:
> Coverity points out (in CID 1508390) that write_bootloader has
> some dead code, where we assign to 'p' and then in the following
> line assign to it again. This happened as a result of the
> refactoring in commit cd5066f8618b.
> 
> Fix the dead code by removing the 'void *v' variable entirely and
> instead adding a cast when calling bl_setup_gt64120_jump_kernel(), as
> we do at its other callsite in write_bootloader_nanomips().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/mips/malta.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thank you!

