Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F32B8327
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:36:37 +0100 (CET)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRNk-0001Db-EZ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kfR0b-0000rk-RN
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:12:41 -0500
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:35872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kfR0Z-0001DX-Gb
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:12:41 -0500
Received: by mail-vs1-xe41.google.com with SMTP id h185so1410665vsc.3
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 09:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p2CVxCmQCzVOvtam3dzCsdeY2+nYOUt2mUceWYvvva8=;
 b=lPHxjrdBIRmjvB9LuS18FQ1x+kcUDnD057W5rcqBo3+Zvn1tNDzwaRI6s4YDHs5cA/
 n2C3fk3VKcBMttAywoe65r/FLU3QQr1HDp+g+oyGDqSugM2Olo25f0PJ3p0qQ+XkU6+7
 V8XNkR9MdyW/TRgnn+oSYGjVtDpgswMdqHQVbPJnT0POvG5A0Y0r0ef4ZrTqMWtH+5KV
 bZZS9ogyRpVBtviiAYd/jjjgyI5Q2AYWix4bfBN0g8z2+vhP6sEu+wHNMgPM5C5etlmR
 +QTnq+df3PcpjmsfjtxhQJu/H0oGK1yxDyg63XPwvzMjp2F4FsFDGnAfenU/hwfzNwdH
 OtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p2CVxCmQCzVOvtam3dzCsdeY2+nYOUt2mUceWYvvva8=;
 b=uF2pDTa73CxRzT9phL7a+E19h0k7EviqwPImF2v7UoRcayRv9KRacu3KYelraIyzAj
 he6ZZXtBz/zLRH1kjSASHagTfwmbU/yzKsPmiKGnt5jjaD10PUIMeWSyhCD9QgesHXmz
 gk8sZhGZqTgrjfRpt6x69NN0zEdmH6douP2hSse8oKfywk4UeZ2hVEqhmrwAWMuzgXQk
 OeSzRC5b4uOsv+uFT5nbYdrsqsuPPXHxrLoBe9J18BV32xnQWZ5vVvAEkxkxEWqLDBBg
 lIQypPmAmDlodXPWMsshmZfRQFYwAECqtXFI82NmC0CCW2baE+ADpXnB+6T13LKzBa/P
 ZJyQ==
X-Gm-Message-State: AOAM533fVgFsMlbpAlb5FwBDrl4HnGDsgQFOyID8Us0LWm0QuLlIa1vt
 RgpkxkSLUfWGu+ptN8bi0DjuKHlSBDL6LLq0smmYUQ==
X-Google-Smtp-Source: ABdhPJzRCiHrHUXwIlp8Tybl1wY7HnM8NFqSLRXzJfVqPe/2yM1TWUt0F/Jz9yW3BM+KpG5bPwvNUMsDYWSGQItMXYs=
X-Received: by 2002:a67:3256:: with SMTP id y83mr4481272vsy.48.1605719556353; 
 Wed, 18 Nov 2020 09:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
In-Reply-To: <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 18 Nov 2020 09:12:25 -0800
Message-ID: <CAFQmdRagpYyvkx9fvhABzfEwJ4WxVxji=AhMYNNrzTfgAgsLsw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by g_autofree
 need to be initialized
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>, 
 zhang.zhanghailiang@huawei.com, Thomas Huth <thuth@redhat.com>,
 lvivier@redhat.com, Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e41;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
> According to the glib function requirements, we need initialise
>  the variable. Otherwise there will be compilation warnings:
>
> glib-autocleanups.h:28:3: warning: =E2=80=98full_name=E2=80=99 may be
> used uninitialized in this function [-Wmaybe-uninitialized]
>    28 |   g_free (*pp);
>       |   ^~~~~~~~~~~~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>

I'd be totally fine with Philippe's suggestion too.

Thanks!

> ---
>  tests/qtest/npcm7xx_timer-test.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer=
-test.c
> index f08b0cd62a..83774a5b90 100644
> --- a/tests/qtest/npcm7xx_timer-test.c
> +++ b/tests/qtest/npcm7xx_timer-test.c
> @@ -512,11 +512,9 @@ static void test_disable_on_expiration(gconstpointer=
 test_data)
>   */
>  static void tim_add_test(const char *name, const TestData *td, GTestData=
Func fn)
>  {
> -    g_autofree char *full_name;
> -
> -    full_name =3D g_strdup_printf("npcm7xx_timer/tim[%d]/timer[%d]/%s",
> -                                tim_index(td->tim), timer_index(td->time=
r),
> -                                name);
> +    g_autofree char *full_name =3D g_strdup_printf(
> +        "npcm7xx_timer/tim[%d]/timer[%d]/%s", tim_index(td->tim),
> +        timer_index(td->timer), name);
>      qtest_add_data_func(full_name, td, fn);
>  }
>
> --
> 2.23.0
>

