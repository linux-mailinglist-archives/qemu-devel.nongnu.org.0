Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E36EFCB3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 23:59:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prn8s-0003r1-Lx; Wed, 26 Apr 2023 17:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1prn8q-0003qm-Sl; Wed, 26 Apr 2023 17:57:36 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1prn8o-0000mY-RF; Wed, 26 Apr 2023 17:57:36 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-54fc1824f0bso88170887b3.0; 
 Wed, 26 Apr 2023 14:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682546252; x=1685138252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19Hz5X8MU8UomO+JzTGoA6GoP+OpnGAwZPmF8OKPLLU=;
 b=a+11S3Lt6Fezegiy9SDI3+a3p7UETd8CBvM3n3qoevM9r4UYPo6b6qql00Wv69RvCV
 e0/2TdUKihiw6FybnzPSPwwd/aDxmM5ofDNRT+dMEUZ4ha4ebwyshXEmFuX2/K4+R+mk
 vI+B2s6X0vR9LlJ2Rl+jzu/OZEYwf/58ulvdZkDfspkVHcpr/Swl+KYuaFoYh9+M+m5a
 X+M7bOPvm8JWaP5/6ZWprIOKk0OnuM9K6x2TDVIg/1b35ehsnW6XufqOhDa+vI0H1+LL
 ti15FclEzz9PGc5JZSdEgAs8k6uowa0PrxBJVm0ffcFWBHYog+xdUDUnHgKoVZ4RSwaM
 6Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682546252; x=1685138252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=19Hz5X8MU8UomO+JzTGoA6GoP+OpnGAwZPmF8OKPLLU=;
 b=XD5feVGDEnwg9JwCwz7H1QMolj4Gw9HAhDSqqeP9twt1oCiMdASdZcEJ+YaxgeVcT4
 rn0XMkJXCAOnWBMtfuWcs1Yb4U5bHtSWhOrDtwEQRDhQURLES04NNqLIKJ+sdZMTUDeF
 cM0nFvriSAS5P0k6MHHtz5fWaCyEY3tDAdCKpcg67Ve9I8qmRYTRJD0RpHqK49sWZBl/
 VzMddyGdqWBIERHFpUTRKDxLw6DTTW/+cI3uNnyS06fGoGQPG7o39Kq6tffbzuGObcOr
 WdR5Euq0p/a6dTuYHOc2BoV0CmubVjwPfWkWpk+vEFvJAinVPn/jyGOvU1enrxhy8cMl
 4uOA==
X-Gm-Message-State: AAQBX9civpGKIahEFyD3Ota8b5NPQ7w3xPOmT+TI2Z98REiia5mbMbnM
 JxJlRcduhf6Zwz8uOSq9ELUUrVCt/K9pyDRMumw=
X-Google-Smtp-Source: AKy350ZpXkfhrYBa0ffEuplDUITGlB1A+OsFgtJO4NUFnm/lb92LSFsCfitMIlxje8wummjFW7OO/RrhyPs18EDlWko=
X-Received: by 2002:a0d:db06:0:b0:555:d2a9:4187 with SMTP id
 d6-20020a0ddb06000000b00555d2a94187mr13398121ywe.23.1682546252302; Wed, 26
 Apr 2023 14:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
 <20230424094309.197969-4-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20230424094309.197969-4-alexander.ivanov@virtuozzo.com>
From: Mike Maslenkin <mike.maslenkin@gmail.com>
Date: Thu, 27 Apr 2023 00:56:56 +0300
Message-ID: <CAL77WPDgx5gsnDZAbir+ae5f6N419WxHQVHZhUr=M4E63AZk0w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] parallels: Add checking and repairing duplicate
 offsets in BAT
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, den@virtuozzo.com, 
 stefanha@redhat.com, vsementsov@yandex-team.ru, kwolf@redhat.com, 
 hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Apr 24, 2023 at 12:44=E2=80=AFPM Alexander Ivanov
<alexander.ivanov@virtuozzo.com> wrote:
>
> Cluster offsets must be unique among all the BAT entries. Find duplicate
> offsets in the BAT and fix it by copying the content of the relevant
> cluster to a newly allocated cluster and set the new cluster offset to th=
e
> duplicated entry.
>
> Add host_cluster_index() helper to deduplicate the code.
>
> Move parallels_fix_leak() call to parallels_co_check() to fix both types
> of leak: real corruption and a leak produced by allocate_clusters()
> during deduplication.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  block/parallels.c | 134 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 129 insertions(+), 5 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index ec89ed894b..3b992e8173 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -136,6 +136,12 @@ static int cluster_remainder(BDRVParallelsState *s, =
int64_t sector_num,
>      return MIN(nb_sectors, ret);
>  }
>
> +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
> +{
> +    off -=3D s->header->data_off << BDRV_SECTOR_BITS;
> +    return off / s->cluster_size;
> +}
> +

I guess  there should be:
off -=3D le32_to_cpu(s->header->data_off) << BDRV_SECTOR_BITS

Regards,
Mike.

