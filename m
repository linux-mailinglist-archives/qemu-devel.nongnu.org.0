Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7C3595F5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:01:01 +0200 (CEST)
Received: from localhost ([::1]:48346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUl8W-00015G-KV
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUl3j-0007Mv-VR; Fri, 09 Apr 2021 02:56:03 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUl3i-0003ts-B1; Fri, 09 Apr 2021 02:56:03 -0400
Received: by mail-qt1-x82b.google.com with SMTP id m16so2846880qtx.9;
 Thu, 08 Apr 2021 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y1ahtiNVb2q9jTVYUF3DvE1f/Lc6fX+u6hmdROqUpck=;
 b=aewfO0Od4b/Dr0VJY6wQpCYkWupEzGF/KrKTUEQdP39aaK/1pLO0KErkWe1EvL/ise
 o4Pv445BPkT38Em3DbarSxv1BNUzy5rWk6UXc246Ga7fxwdVCEFYbRBxKQyzu5e7x8hs
 Qv/FaTDbFcEvjqoumEGhTtTNUNnPaYYMKq0Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y1ahtiNVb2q9jTVYUF3DvE1f/Lc6fX+u6hmdROqUpck=;
 b=SXMeYKGQkRFmX5LXJ5heZ7X/zg1UzORRksSNAv8yirSSet6c5QvfZNq42DV3OD3vyC
 8mg3mKOTsJtU+wUJIXO1iLb+AOHOStigwtPuNlsahlLQvCae+sTNsnClvGxFQhZ4DLek
 WwaWYOjpB0FD7QGISAWH5HoRoPGyQMypHILfG9+tfm+xFuWhZtfc0y/h7sPt7DUgDNc2
 T8+pMt7lJWSYvVZp3+P9NJJEwJ4pS3wU5oPzOG1uxfcpsaNC97HJnMvGkEEeRmEM/W0C
 ga+IawVgju7qrmOTO0ui+cIJRUHMQ3exLD4nwFysiJE7TNdFL4MUTTpQkKKI6xAaS8sa
 M+Yw==
X-Gm-Message-State: AOAM530x5bXsafbuyyt334ccxP9QQKar8Q2LJuH0Uvt4rQEZNijuEhhQ
 XSoxbn6vgKUCZ6yDas09f+cu88YqdbBUY4/FQM4=
X-Google-Smtp-Source: ABdhPJxxCx/qzjTBZq+T/yrhUSFhxItC0dPrEi5Zh+L4Ce4D8lx51dbi2GFOHJxqPjOewgANmYZNH/CqdNL9MELG2bY=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr10999352qta.135.1617951360904; 
 Thu, 08 Apr 2021 23:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-17-clg@kaod.org>
In-Reply-To: <20210407171637.777743-17-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:55:48 +0000
Message-ID: <CACPK8XdVHn-rYwrO=wFm2oPRzeC2rJtvwe9rD1Tn_RgtmNqjNA@mail.gmail.com>
Subject: Re: [PATCH 16/24] tests/qtest: Rename m25p80 test in aspeed_smc test
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 17:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The m25p80 test depends on the Aspeed SMC controller to test our
> SPI-NOR flash support. Reflect this dependency by changing the name.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

\o/ more tests

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} | 12 ++++++------
>  tests/qtest/meson.build                          |  4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  rename tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} (96%)
>
> diff --git a/tests/qtest/m25p80-test.c b/tests/qtest/aspeed_smc-test.c
> similarity index 96%
> rename from tests/qtest/m25p80-test.c
> rename to tests/qtest/aspeed_smc-test.c
> index f860cef5f08f..87b40a0ef186 100644
> --- a/tests/qtest/m25p80-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -367,12 +367,12 @@ int main(int argc, char **argv)
>                                 "-drive file=3D%s,format=3Draw,if=3Dmtd",
>                                 tmp_path);
>
> -    qtest_add_func("/m25p80/read_jedec", test_read_jedec);
> -    qtest_add_func("/m25p80/erase_sector", test_erase_sector);
> -    qtest_add_func("/m25p80/erase_all",  test_erase_all);
> -    qtest_add_func("/m25p80/write_page", test_write_page);
> -    qtest_add_func("/m25p80/read_page_mem", test_read_page_mem);
> -    qtest_add_func("/m25p80/write_page_mem", test_write_page_mem);
> +    qtest_add_func("/ast2400/smc/read_jedec", test_read_jedec);
> +    qtest_add_func("/ast2400/smc/erase_sector", test_erase_sector);
> +    qtest_add_func("/ast2400/smc/erase_all",  test_erase_all);
> +    qtest_add_func("/ast2400/smc/write_page", test_write_page);
> +    qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
> +    qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
>
>      ret =3D g_test_run();
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 84b3219c15c6..269a30b217d7 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -164,7 +164,8 @@ qtests_npcm7xx =3D \
>     'npcm7xx_watchdog_timer-test'] + \
>     (slirp.found() ? ['npcm7xx_emc-test'] : [])
>  qtests_aspeed =3D \
> -  ['aspeed_hace-test']
> +  ['aspeed_hace-test',
> +   'aspeed_smc-test']
>  qtests_arm =3D \
>    (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) =
+ \
>    (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-ap=
b-dualtimer-test'] : []) + \
> @@ -175,7 +176,6 @@ qtests_arm =3D \
>    (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) +=
 \
>    ['arm-cpu-features',
>     'microbit-test',
> -   'm25p80-test',
>     'test-arm-mptimer',
>     'boot-serial-test',
>     'hexloader-test']
> --
> 2.26.3
>

