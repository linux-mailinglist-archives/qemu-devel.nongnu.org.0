Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E65590940
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 01:42:13 +0200 (CEST)
Received: from localhost ([::1]:59854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMHoa-00059m-AC
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 19:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHjv-0001bA-KI
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:37:23 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHju-00057R-3I
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:37:23 -0400
Received: by mail-pf1-x431.google.com with SMTP id p125so14219946pfp.2
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 16:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=wFpcglhzSlzo6u8PM+nMMAP/C86CFLIoX2wB2EWjf1E=;
 b=KC1m1h1vOtqc80bsDYu6DqJJRdQyY9nZZDWh2UpD4wqI0pcJPmeExwpmKhRvU7sxGX
 htR1ElG3V6FGXUFJj48WjBqcoWH7gn8DzWXygSwMDPQR93PS9wSX/qxMdAjzBqv+Zbn7
 dPnGawu07Avi1ZtS7qPYwgJ3tZtCk6hlO3NfOi5x74Q9iVu+KOhLbvexj48DAzBeINPt
 Iqw44yVnKQFdLqy4ODxG8PfFvhqkAcprSSA91gQH4ACOf1bHQ3d9ojfITMny9qEzEnK6
 2BYKA6J2P7I2ooXIjaOzguRszialGbjCK2yoGJ4TYU8Qg3cPqmcwhXekKSB2Va7Xy6Jc
 ERlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=wFpcglhzSlzo6u8PM+nMMAP/C86CFLIoX2wB2EWjf1E=;
 b=fgivBGeS2yyq3mE92WIEcmXeVulXsLMV7TA/RRUY5g0LkGXf4c0kH6uMpKTmMAIGNB
 hbHCMjBVekJecVFj53/OARgIWE7EWp2ElMmYyI1Kygq/sqBmgqEmCQTafBr1FMGGSyQM
 LM4tfUPvSGvu6QoRLWejJVwr/Hob9awMmACO/WEbELxbzxoISYcpavvl0/jef1fMgk0p
 3Lv61jK3UKQK/W9Hjuf5AruqU/hAxRR3XnQ6btoyzHxcSW3ToFWczt2tGOzhysJxCxla
 hU2YLa+dsVH3nV0zUPcZFe+ZfnZ9nX9rOEHpPc+q9IV3S194+Vhs4/AGscDGfzgP8xop
 kHqQ==
X-Gm-Message-State: ACgBeo0F2qiTL+qYt2t6lVAnDTa5Q+40t/tksZwMt7XsgyCE1HpBFjB9
 kOT08IxF9BAgWaCe2F5HQTE=
X-Google-Smtp-Source: AA6agR6Iuygt0Gk20sA7Y6iR7XQyuMyuDzP54MHBFPrahW14d8y90YkGS/L6km90fNh+dq8GZJkcLA==
X-Received: by 2002:a63:2205:0:b0:417:61fd:cd35 with SMTP id
 i5-20020a632205000000b0041761fdcd35mr1019643pgi.544.1660261040192; 
 Thu, 11 Aug 2022 16:37:20 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a17090a150f00b001ef9479373fsm4303036pja.4.2022.08.11.16.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:37:18 -0700 (PDT)
Message-ID: <d454fc53-b6d6-0550-2ec5-fb7889dc6cc8@amsat.org>
Date: Fri, 12 Aug 2022 01:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v1 2/8] cpu: cache CPUClass in CPUState for hot code paths
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-3-alex.bennee@linaro.org>
In-Reply-To: <20220811151413.3350684-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
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

On 11/8/22 17:14, Alex Bennée wrote:
> The class cast checkers are quite expensive and always on (unlike the
> dynamic case who's checks are gated by CONFIG_QOM_CAST_DEBUG). To
> avoid the overhead of repeatedly checking something which should never
> change we cache the CPUClass reference for use in the hot code paths.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/core/cpu.h | 9 +++++++++
>   cpu.c                 | 9 ++++-----
>   2 files changed, 13 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


