Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E566BB3CC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 14:02:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcQk6-0000Di-Lf; Wed, 15 Mar 2023 09:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pcQk3-0000DW-7z; Wed, 15 Mar 2023 09:00:32 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pcQk1-0005c4-Ao; Wed, 15 Mar 2023 09:00:30 -0400
Received: by mail-ed1-x533.google.com with SMTP id h8so31394407ede.8;
 Wed, 15 Mar 2023 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678885225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLtW2Kcu+uF+r/fD0VjJv+jYVeTmjRpJ3ZjVgUCB3/Y=;
 b=j4SlxSc162UY9fCRBk6va95VWhllS6pSdFEs3xUTpfYRNoVRIJNanY3AtdOQqKDkqe
 ZJtNwOrPwnjaR3WMbqrYEmbgVRXU6LbXuSd2/X2Or8H5luw/vRr0l5QP8RhjhdIVwMnb
 9npPO9tsiSS7A3UvjGe+JHRiGKbf4ZyD8TcGULxN3+WQRxjwlzfaLdPhy3bEOT9t5ufg
 rLz6yyj+wlPbN9bDaw+Mjlgq+uExWhgDQLbQZMoS0RmwE+a2hQiNTJV8+rh9+J3cjmWf
 pe8rn7Z0sgme8sCVf0FPWcnjrGie6Kl8XVdvUJHg2wDmHFEsqfA/kWXNifs4ItWBoOgg
 aTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678885225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qLtW2Kcu+uF+r/fD0VjJv+jYVeTmjRpJ3ZjVgUCB3/Y=;
 b=jzBkAzcSjSjmJquYxfooD46IzxOWDED2aQ31YDVWsRFhIH0RpgH2zA4VhZfAnPhS73
 xOpUqpDj3LZhKGSLWy08gd4OIiLMfTt3CUlMVhPVlCzyLtuFOYEE46UUx3PRgJlvKtPw
 kj7N2iRlW+xS12wwmOLDBw27qXHkFc7i+WKiw/3gUYRLrVNP/x6qXaTHCt3b6Cl6+153
 1ajl95ZrtU6pSLM6crnFNgAHXI6LXUR+Lm6K5TD2qu90jaBx9OGF6DF5rnPOPmlg48VS
 9BMXuLf2zernt1601nxH52a8+JJ5F3ZnfVV5I/16hTdQhpT85USDSxC2fKKsOkoemh9L
 OBnA==
X-Gm-Message-State: AO0yUKUfyXgqvJvwsk2SQ9ya48rFQ8d1O0ZWBMFq9tTb6Xcx4h0dL9nR
 7LrwPIdAYelngFch+vPbm5qtIEAd0a+4YjTMqVY=
X-Google-Smtp-Source: AK7set/x2guL63xLjR3CnqSkntxrZzadJBFEeSypLzndiY4Nk4Id42P7sSuiGXZrwNl4TcF4XyQBH0HG6IJvCYc4+dA=
X-Received: by 2002:a50:ce54:0:b0:4fa:794a:c0cc with SMTP id
 k20-20020a50ce54000000b004fa794ac0ccmr1356730edj.2.1678885225353; Wed, 15 Mar
 2023 06:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103106.62124-1-faithilikerun@gmail.com>
 <20230310103106.62124-2-faithilikerun@gmail.com>
 <e143490361477503b5e7bba43e79f369e3cd7d9b.camel@wdc.com>
 <0ab0bafd-6e21-2f4d-8d73-8c6683b6d1dd@opensource.wdc.com>
In-Reply-To: <0ab0bafd-6e21-2f4d-8d73-8c6683b6d1dd@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 15 Mar 2023 20:59:58 +0800
Message-ID: <CAAAx-8+9xaCuYtJCRuvVtMV1czdO6pOCPR6Dirpzf0N0-H6jgg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] file-posix: add tracking of the zone write pointers
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>, 
 "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "mehta.aaru20@gmail.com" <mehta.aaru20@gmail.com>, 
 "stefanha@redhat.com" <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "kwolf@redhat.com" <kwolf@redhat.com>, 
 "jusual@redhat.com" <jusual@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=faithilikerun@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2023=E5=B9=B43=
=E6=9C=8814=E6=97=A5=E5=91=A8=E4=BA=8C 11:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On 3/14/23 11:23, Dmitry Fomichev wrote:
> >> @@ -3339,10 +3473,27 @@ static int coroutine_fn
> >> raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> >>                          len >> BDRV_SECTOR_BITS);
> >>      ret =3D raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> >>      if (ret !=3D 0) {
> >> +        update_zones_wp(s->fd, wps, offset, index);
> >>          ret =3D -errno;
> >>          error_report("ioctl %s failed %d", op_name, ret);
> >> +        goto out;
> >>      }
> >>
> >> +    if (zo =3D=3D BLKRESETZONE && len =3D=3D capacity) {
> >> +        for (int i =3D 0; i < bs->bl.nr_zones; ++i) {
> >> +            if (!BDRV_ZT_IS_CONV(wps->wp[i])) {
> >> +                wps->wp[i] =3D i * bs->bl.zone_size;
> >
> > This will reset write pointers of all read-only zones that may exist on=
 the
> > device and make the data stored in those zones unreadable. R/O zones ne=
ed to be
> > skipped in this loop.
>
> And offline zones need to be skipped as well.

I see. That can be done thanks to get_zones_wp() which can show the
state of the zone at specific position.

Sam

