Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9D3263C3F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 06:50:03 +0200 (CEST)
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGEX4-0005Hg-Jc
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 00:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kGEWA-0004kW-U2; Thu, 10 Sep 2020 00:49:06 -0400
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:36643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kGEW9-0003dx-76; Thu, 10 Sep 2020 00:49:06 -0400
Received: by mail-oo1-xc43.google.com with SMTP id z1so1133162ooj.3;
 Wed, 09 Sep 2020 21:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v0coHtFmd2WH92VLzMlbBd18OhUDKDk+wB/06ZjqDCA=;
 b=p8vCNV9grQAzI0ifLWcSAvjhb2eVQZ0odU0HhD9s46pNfteWQpvsgL9cXEkWW00aoU
 0J0X1WAG17KDf4bTXmZKg05Awxv+6OyUftDE+obbim2Tvl3ZQ8iuTMpeHbeJAIcKNr1V
 rv/3uafeffL88D1ELCI0NpArX/UbYvv9emR2rPh0fcKo4xdyj0KtYkaG5tQABtXqZHBw
 G0YAI95ZmbENkSJDhZpt/11KWdE9IF1YJt42xJZJS+xqC4MniMD4k82Q+s8DjNqTD1pO
 Bs8Pe6kE6/ZUogpmPDEH4FPFfcZaUbtrtUn/tg4+4yf5axtMqyeUC6ihmVDaKpSCNnYv
 Q9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v0coHtFmd2WH92VLzMlbBd18OhUDKDk+wB/06ZjqDCA=;
 b=txAAjd6HrwKpUv6C4WRaP70iC6rPS7JbSv5yJ7SCxg/yS4llxgNyW78c5hJKlu25xs
 acj+7k1F9vtEaCFbRK/yGE0mQqFqfa+q6WJTFOHTlUqL5N4qDYQTBgDZs/0Hdu8MinhP
 LMdaOEm4bI1+CouIIB62PtNhHK7xVNtlVarHXvM/o4lRMeZag1zS1GXr/h+/b3Y8VHmz
 J2SgNaaGADpjI0mOLMNIdTWtZh6vzDp6mONUwPQmurS2V2OoEO8BIvRcYl/7MlCjcj05
 bUyRh3qcB9DPnByTT8UDJVTctcZFXt0WBT0iUQuYVjhD4BLulUaOxkk249XYy/x3Rwfk
 4W2w==
X-Gm-Message-State: AOAM5303vZp0YHgzbg8pjjRkoaghYK4WhMF/6CXyF339sUk2PbhxSOTI
 qLwUPL6RqEd/QJYcsA0Rv0EPjZy+/7I/iG0pV6U=
X-Google-Smtp-Source: ABdhPJySdKt07tjbiP75k9Snb139kxT9Xdj4AHd/if9884uCtLRvbwAPxkNgBymBYccyFeP5swjpXy4eEVA58AAr2GI=
X-Received: by 2002:a4a:4201:: with SMTP id h1mr3143741ooj.1.1599713343095;
 Wed, 09 Sep 2020 21:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200910023818.11880-1-pannengyuan@huawei.com>
In-Reply-To: <20200910023818.11880-1-pannengyuan@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 10 Sep 2020 12:48:26 +0800
Message-ID: <CAKXe6SKgAUn5R5TnTsjDZ0LEDjMoWP73LWYxTZDHnwsAPSNEkg@mail.gmail.com>
Subject: Re: [PATCH] test-vmstate: remove unnecessary code in
 match_interval_mapping_node
To: Pan Nengyuan <pannengyuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Qemu Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Auger Eric <eric.auger@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pan Nengyuan <pannengyuan@huawei.com> =E4=BA=8E2020=E5=B9=B49=E6=9C=8810=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=8810:39=E5=86=99=E9=81=93=EF=BC=9A
>
> 'str' is not used in match_interval_mapping_node(), remove it.
>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  tests/test-vmstate.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
> index f8de709a0b..1c763015d0 100644
> --- a/tests/test-vmstate.c
> +++ b/tests/test-vmstate.c
> @@ -1055,9 +1055,6 @@ static gboolean match_interval_mapping_node(gpointe=
r key,
>      TestGTreeMapping *map_a, *map_b;
>      TestGTreeInterval *a, *b;
>      struct match_node_data *d =3D (struct match_node_data *)data;
> -    char *str =3D g_strdup_printf("dest");
> -
> -    g_free(str);
>      a =3D (TestGTreeInterval *)key;
>      b =3D (TestGTreeInterval *)d->key;
>
> --
> 2.21.0.windows.1
>
>
>

