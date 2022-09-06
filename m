Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367365AEA00
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:41:45 +0200 (CEST)
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYpk-0005Cw-7T
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYDq-0006t8-Uh; Tue, 06 Sep 2022 09:02:34 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYDo-0003lL-OY; Tue, 06 Sep 2022 09:02:34 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 14so2542016pfu.9;
 Tue, 06 Sep 2022 06:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=Du78C/8R63Et8ZTM5nXd1HOCFuCXFHuFqxSmP1L5S/M=;
 b=D0Zm3pdyXf9awhb4beMt/A/9lX2Mc0RQFn2I6Vp2c79kzorxeq0NCTi/GBHCE1JqEV
 OMWSmLJubKLAQE2QRII/n37jDBOkmpJHhj82E/kZZNBh+VYux5ZQkALUZLFLv9Luf1/d
 1DPrwkjLgjxsEd6gAM3T/55jdsl9305GTT4ZEhZKUjEzZvQ2U+75YdT/SvLGnRS70yEZ
 XYxeWrZ1rv9pwHoQbL3b7kvGDuuQxj9/689s1RCy/RxqXtHf6z3/1sZDR9UzgcguTwN6
 sLBeNwY67AVJ5w/tk1owXtHFi+4gA2KPVAmYp1kgWBQ5P2Dm2OpJmpFMqn4yigf/XBwl
 WACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=Du78C/8R63Et8ZTM5nXd1HOCFuCXFHuFqxSmP1L5S/M=;
 b=pV0YOmnOqrNUjFzU7iERvX0oascF2K0TA49pzQylEqpSyF3wqTkMK0ZzsvBza/NoEU
 tyVa7W1l7T8uMW0UVL8lJoaTAx54QQHLQo9tfkIj2mAlm/lCbiHn1yYq1kGcBCOATpHo
 xH3Xhd97s+d5/1DpPS8slCO/4XbKkOs/nW4HD2PyxVFLxcejZEJfqdcAu6MSha6FmWrc
 zDY2K4jJzlN3wJIgAO5MHr6n+0wwVx1xWlzQ54c1vHmkMc+0KndMDNdbpCIB4fEa+Zuv
 b3/F1sfpbbiPKZvei5VbERJcRdiJkWpbo3rQ/9arj2UCqxz+ZiIs/KgiU6leezXGj3HR
 KHxQ==
X-Gm-Message-State: ACgBeo1d6uvnkLJrUtsgPm3XfCfkOQkJuu3O6WR/Eukt3QNr/JGnrr0g
 jCi0BURRNulCre6MGU2NTc0=
X-Google-Smtp-Source: AA6agR6QW/1t7mL3tNRr91Ud0RvbTHu1UW2GVPSFFwLFc0p8cp003oL/nrhNV2LxHn9Izhqu1gS2Jw==
X-Received: by 2002:a63:d1b:0:b0:42b:828b:f14a with SMTP id
 c27-20020a630d1b000000b0042b828bf14amr44396365pgl.235.1662469350760; 
 Tue, 06 Sep 2022 06:02:30 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 63-20020a620542000000b005386162bc2asm10389174pff.92.2022.09.06.06.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 06:02:30 -0700 (PDT)
Message-ID: <180feb3a-46bd-561c-8213-2aae399bb18e@amsat.org>
Date: Tue, 6 Sep 2022 15:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-9-richard.henderson@linaro.org>
In-Reply-To: <20220906100528.343244-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/9/22 12:05, Richard Henderson wrote:
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate.c | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

