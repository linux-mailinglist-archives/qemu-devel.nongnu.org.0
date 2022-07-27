Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4B858292C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:00:03 +0200 (CEST)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGiW2-0003Va-5I
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiCU-0007D9-1e; Wed, 27 Jul 2022 10:39:50 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiCS-0006Iv-Jy; Wed, 27 Jul 2022 10:39:49 -0400
Received: by mail-yb1-xb31.google.com with SMTP id o15so2442822yba.10;
 Wed, 27 Jul 2022 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EV2Nu4Ep/Xp9EAqF2XYhS4EkantcIcyjq+CThjWXU1Y=;
 b=XZT1WlWyyf66n1CEjHMbhmWgkaToPLD6nMtZeJaUh4jn6gfw3Abf4WUn48scCgIrGr
 Cl7oas6T+kj+c9c+cx0ZxDHLtg/1/4eQIG30mPZbbl1UpRW1HKerv/K4c3j930aoz1GR
 ckKo18SWXnMFwcVgr3WnoAMhIAEk2yJl5CL/JBT8UqixoASL8/s5RcS8Lwi/ke6GBjQg
 VXFhhF3VlGBVP17mNVgJ72ZRzSZqt63AM8z8ju4yBgdiDu0eMmgUYCW1GZRW525Wfsje
 DT0SnyzUTHO7u5R6fxPvnrw5oAY7iq9ddj8q9mfFURwc+0oWmRomK7PWlKC6QYnAD1JZ
 hOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EV2Nu4Ep/Xp9EAqF2XYhS4EkantcIcyjq+CThjWXU1Y=;
 b=wlY2rrqofCWMu0kC+GBVAWuI35Qg1XfALpo+40Jg8bV7iybPh0sG/vBUIPa/ne0rLw
 I9K4psyP6YqBxON1QPVhFKOLrc3k8+vQeFZ5K6f/JyUaS7It8OEVopZNy4Qh3gXP9uuI
 1E2pFGLG1FZwQ5CeBH47XhCEHDOhftwdInzG0xBD/Ulj5tmFZVgN5WlYg59q+35pRilq
 DVBOUf/TYo7foGiikrrCG3j9IsLe/LeMpZ3gE9jbfxXCu7/22cBdnINTLPbiTqZS76zN
 6i2VJlbNne1e0dM8YBBwuZwmQSJdEFe4p9aBnA7czcEWlSEeiBw54NUN16daVtXTOQ99
 59Iw==
X-Gm-Message-State: AJIora+tTtcd9yGtOd7bSdhk5BPAbMzz1CUSytA4CR2Wa2VGx8OQvQL9
 WV0CdacnKSOMKVfIl1vJAleiJwjsbu7RiD8jHpo=
X-Google-Smtp-Source: AGRyM1sMI4FwQsoKLOswzCRJmUHFXdl/8UG6QKf/0pHRYZ2MwE2fqNx+s8NfsDU+RqAMk45CLY0gduwM5uVQgS4OHsY=
X-Received: by 2002:a25:238d:0:b0:673:4607:acf4 with SMTP id
 j135-20020a25238d000000b006734607acf4mr593818ybj.209.1658932786382; Wed, 27
 Jul 2022 07:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-7-faithilikerun@gmail.com>
In-Reply-To: <20220712021345.8530-7-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 10:39:34 -0400
Message-ID: <CAJSP0QXObLgmFSjgsGoH2hz+aYLUu_q_UF7d_f8OVk4R1FACew@mail.gmail.com>
Subject: Re: [RFC v4 6/9] raw-format: add zone operations
To: Sam Li <faithilikerun@gmail.com>, Markus Armbruster <armbru@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 qemu block <qemu-block@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jul 2022 at 22:21, Sam Li <faithilikerun@gmail.com> wrote:
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/raw-format.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 69fd650eaf..96bdb6c1e2 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -314,6 +314,17 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
>      return bdrv_co_pdiscard(bs->file, offset, bytes);
>  }
>
> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                           int64_t *nr_zones,
> +                                           BlockZoneDescriptor *zones) {
> +    return bdrv_co_zone_report(bs->file->bs, offset, nr_zones, zones);
> +}
> +
> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, zone_op op,
> +                                         int64_t offset, int64_t len) {
> +    return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
> +}
> +

Kevin, Markus, or Hanna: bdrv_*() APIs take a mix of BlockDriverState
*bs and BdrvChild *child arguments. Should these new APIs take bs or
child?

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

