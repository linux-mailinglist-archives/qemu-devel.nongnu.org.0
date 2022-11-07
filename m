Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E646203B3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:23:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osBSY-0008Vc-KO; Mon, 07 Nov 2022 18:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBSV-0008Pg-Tn
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:23:15 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBSU-0006xB-4K
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:23:15 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l14so18470559wrw.2
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LUilsx65evLT3PunLckDq3nDFbVrBlsG/MVd+5Lo2Ao=;
 b=eLlAob5wXWAsRhG3pDB947nQBCtXyIq7DtyRrsX6YqOLh15mIvkKu4quK/xTSP9qP5
 C5nnGB/TpbUwOJLdywkjgL+qCUTik2C1C0sTBa6slKMJCtrxgmB2iG3QTBh4CxICikhM
 1MZgWJBuWqp5GKWwUpehpxDM7vyIz5HYVeemQbQMjVcVhD/lgcwXDBIf7vwRxBxa79Ia
 ak5EsvKwmGYpVlW3Z4VqHnZMeNk/n3lP/5WdSCAkEGXT0kapLSBSqjqiTE5GamNZqz1W
 dOYb72RWZ99Aih1E33W2vrvrncMHXIGoz4FLMLiB6cLmo/fMRjPN/BjZZKmcPfbezVWL
 WKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LUilsx65evLT3PunLckDq3nDFbVrBlsG/MVd+5Lo2Ao=;
 b=2pqE5ID/yQgPiP38hFI5DX9KOmzEKKDdoNajr2zUnXEXKGkQ6+9y3vedoo9Fx83EeC
 +hAxoEUxPWxgWp/AqEdjHP1NQyGav5kxddBOWGf9xwUAk+XELN82LWjpgsCtQL9gtT/E
 X/h8KYukk3e6pKn89tlcm56t0H9fvbgMsIqL1kYzhKbG9r8oToBq4Y2sKcyYhJfgbMMw
 LwnoihjHRkml/VJ204X6SRuqUbgenHGs8pczywtGfKGcsQqH0429T/kEdBwxQJ9GA4Xw
 4NNFZdXlAQXNbLCeZd9TsmJ97/Egf8zP0qMGHmTCFxUPQgYqyvTvFwKdRUfkmMe/d0m0
 vbIA==
X-Gm-Message-State: ACrzQf2C0nGmJdB14hnF6ShakTFrA/dKC3/UeB9NxiAzMDMp68l/sOZa
 /dgR8IWFR/8xt+ypFzoLMRjQDLF7ENJJ7Q==
X-Google-Smtp-Source: AMsMyM4amP+/kyyrkKL7n5tBgunupCiJ0iOSswSts3mIS5GzY3CFHbuaoGra7fjoOI0gvxRYl9cREA==
X-Received: by 2002:a05:6000:1566:b0:236:6a6f:6c27 with SMTP id
 6-20020a056000156600b002366a6f6c27mr33371301wrz.553.1667863392664; 
 Mon, 07 Nov 2022 15:23:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d46d1000000b0022efc4322a9sm8477935wrs.10.2022.11.07.15.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 15:23:12 -0800 (PST)
Message-ID: <818c2ea3-7e7e-4f33-d196-7efe6e089fc9@linaro.org>
Date: Tue, 8 Nov 2022 00:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 0/5] disas/nanomips: Format string fixes
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Petar Jovanovic <mips32r2@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20221101114458.25756-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221101114458.25756-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/11/22 12:44, Philippe Mathieu-Daudé wrote:
> Fix invalid string formats reported by Stefan:
> https://lore.kernel.org/qemu-devel/78553699-00c1-ad69-1d58-02f75a1f4fe3@weilnetz.de/
> 
> Philippe Mathieu-Daudé (5):
>    disas/nanomips: Fix invalid PRId64 format calling img_format()
>    disas/nanomips: Fix invalid PRIx64 format calling img_format()
>    disas/nanomips: Use G_GNUC_PRINTF to avoid invalid string formats
>    disas/nanomips: Remove headers already included by "qemu/osdep.h"
>    MAINTAINERS: Inherit from nanoMIPS

Queued to mips-fixes.

