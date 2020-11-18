Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841202B82C4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:17:34 +0100 (CET)
Received: from localhost ([::1]:46524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfR5J-0005Qy-J9
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kfR2K-0003bl-OO
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:14:28 -0500
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:41363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kfR2E-0001O9-RT
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:14:28 -0500
Received: by mail-vs1-xe42.google.com with SMTP id m16so1406282vsl.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tfJNx+8KKFgAeV9NlSHhIf3nEIjrW1gXQxpt/5iCRBE=;
 b=mELCX4ydTAeN5UYwVW6pXiD7ic7s7CJqD3Ei67l085/LKFH/5K4FZWFNlbpM7DqLnK
 jG1jVaJFVtxMn/jjfDHwZoICEh7jdmM1Le6wVMTN6Eh+mlARF5qd+CdeiKtTkoYFOFfB
 6n/yvx8TH9+g5NZRnJlHq+YFtQhLj88KA0wWC+Y9suut0epb2q0PVv/q4VL8NsgH8lpG
 pwt9HN1LMOLWN5qaRjvhrway0u+jj5NgflhJ10qNACBNrMpJFys9YnuABuJdVY/oOLdK
 COotHmt01Ce92CPbiL9YlKSQtXDi8vs4XtOI8SppY5aSKbgKoY+GwAC94bw6e2tsBWQ5
 ECtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tfJNx+8KKFgAeV9NlSHhIf3nEIjrW1gXQxpt/5iCRBE=;
 b=ojQI7YpGmvUekaZjoI/KarPujkiZYA8mgqBVfCfoykH9U2vVusOiOk2LCJcUZpYc3I
 ANhxNAnyOv+JqS8pSJ6HCljn0oMuU7UQ6rBm5ipkzr6m1fB9C4ddVnL00I8nh6d70i1O
 SMtWbvXkXbLq2q7JHy/KRbuMi5UVKHm9zC4Wa6I2XZR/BWI5lwcTD9/0twvKcD6iRYzu
 Yq0cZO8XhGOtwt2cF8pdzEg/ofxJ0VbF9CndIQLgBxrZV7xceNBiWAT63h+qT8pWWhYp
 3sJjl+RdG0NPT3Qe8gdImx0q2ZZF6cmZJUUQzPtWBeSXF+zppEgB4N02HozqemkNegyN
 XxWA==
X-Gm-Message-State: AOAM532DUf19sprj5w/0LxCiNLx3bRgrDcD/Oen1O10NvVer//Bdn1//
 dHiyt+zYnb1V0w7AgyltwqDNChP02MBRk3ES79c9hw==
X-Google-Smtp-Source: ABdhPJwHTZpCGEe2IcTrNXNlLSs5uDf774Q5ruoWSfRokmsbrp7LGnVkqMi+t3auPRt3+T4ojO6OyOp9UAEujLJr0Js=
X-Received: by 2002:a05:6102:309a:: with SMTP id
 l26mr4263753vsb.4.1605719660698; 
 Wed, 18 Nov 2020 09:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-3-kuhn.chenqun@huawei.com>
In-Reply-To: <20201118115646.2461726-3-kuhn.chenqun@huawei.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 18 Nov 2020 09:14:09 -0800
Message-ID: <CAFQmdRbaivcgHt=dQ_nysZ=zpCM=d5K+-MY1129WDa3G=E9MCg@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 2/2] tests/qtest: fix memleak in
 npcm7xx_watchdog_timer-test
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>, 
 zhang.zhanghailiang@huawei.com, Thomas Huth <thuth@redhat.com>,
 lvivier@redhat.com, Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e42;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 3:57 AM Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Properly free resp for get_watchdog_action() to avoid memory leak.
> ASAN shows memory leak stack:
>
> Indirect leak of 12360 byte(s) in 3 object(s) allocated from:
>     #0 0x7f41ab6cbd4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
>     #1 0x7f41ab4eaa50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
>     #2 0x556487d5374b in qdict_new ../qobject/qdict.c:29
>     #3 0x556487d65e1a in parse_object ../qobject/json-parser.c:318
>     #4 0x556487d65cb6 in parse_pair ../qobject/json-parser.c:287
>     #5 0x556487d65ebd in parse_object ../qobject/json-parser.c:343
>     #6 0x556487d661d5 in json_parser_parse ../qobject/json-parser.c:580
>     #7 0x556487d513df in json_message_process_token ../qobject/json-streamer.c:92
>     #8 0x556487d63919 in json_lexer_feed_char ../qobject/json-lexer.c:313
>     #9 0x556487d63d75 in json_lexer_feed ../qobject/json-lexer.c:350
>     #10 0x556487d28b2a in qmp_fd_receive ../tests/qtest/libqtest.c:613
>     #11 0x556487d2a16f in qtest_qmp_eventwait_ref ../tests/qtest/libqtest.c:827
>     #12 0x556487d248e2 in get_watchdog_action ../tests/qtest/npcm7xx_watchdog_timer-test.c:94
>     #13 0x556487d25765 in test_enabling_flags ../tests/qtest/npcm7xx_watchdog_timer-test.c:243
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>

> ---
>  tests/qtest/npcm7xx_watchdog_timer-test.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/npcm7xx_watchdog_timer-test.c b/tests/qtest/npcm7xx_watchdog_timer-test.c
> index 54d5d6d8f2..3aae5a0438 100644
> --- a/tests/qtest/npcm7xx_watchdog_timer-test.c
> +++ b/tests/qtest/npcm7xx_watchdog_timer-test.c
> @@ -204,6 +204,7 @@ static void test_enabling_flags(gconstpointer watchdog)
>  {
>      const Watchdog *wd = watchdog;
>      QTestState *qts;
> +    QDict *rsp;
>
>      /* Neither WTIE or WTRE is set, no interrupt or reset should happen */
>      qts = qtest_init("-machine quanta-gsj");
> @@ -240,8 +241,9 @@ static void test_enabling_flags(gconstpointer watchdog)
>      g_assert_false(qtest_get_irq(qts, wd->irq));
>      qtest_clock_step(qts, watchdog_calculate_steps(RESET_CYCLES,
>                  watchdog_prescaler(qts, wd)));
> -    g_assert_false(strcmp(qdict_get_str(get_watchdog_action(qts), "action"),
> -                "reset"));
> +    rsp = get_watchdog_action(qts);
> +    g_assert_false(strcmp(qdict_get_str(rsp, "action"), "reset"));
> +    qobject_unref(rsp);
>      qtest_qmp_eventwait(qts, "RESET");
>      qtest_quit(qts);
>
> --
> 2.23.0
>

