Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4743C55F36D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 04:37:53 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6NaR-0007kv-HV
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 22:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o6NXl-0005Yi-Pm; Tue, 28 Jun 2022 22:35:08 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:35373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o6NXj-0007Ms-SF; Tue, 28 Jun 2022 22:35:05 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-317741c86fdso135529177b3.2; 
 Tue, 28 Jun 2022 19:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dYl8S+15Gb6TB88KkdrvqVGDpjllpABfJV0j2hdtDec=;
 b=JQ93aS3pN4hfaFwklIgfUifdBStqvGkyfkYCuTGoB7myAD6BoAA5d+4UVd51ie2t6Y
 J8tAa9bqMDhNXN8x+rFfZFJNpFJwCdaE3aU/aAx0ewRiCZi/l9eaiZj+i/yJbe14LogO
 XSUtNFsFPpENm0YVW+xF4bbngVJnftdiAUmOhFzKFeJf4GWtfYK52V7EAEJOrKOIYQYu
 c/cJVrm80OTObXfHUyqA16VkpK3dstrheezVrzsm+br4UYlhmRWhbsvTjPSyRKDEtp/u
 2uwTbfKuYJ8047k0BosvzzYB+Fra3y/+0pGJl5Mw4LpKTCN3stOsEOQ+ypnXD7aI9B8b
 xmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dYl8S+15Gb6TB88KkdrvqVGDpjllpABfJV0j2hdtDec=;
 b=2djHd50AMXRSp5JVjL3qaxJRhqZIZWiM50wa0IYxHUlmwjSvr49GIqf7JY3YUuog1o
 Z8CLtUoTlSlanX6mksgPhO5/nPKibr4FlqaMVPs2WL9J2tGS0HsmOAFkw7d+bk81fvYT
 CH5UOEFWeLD811kjR6YlND5u+P+Mk+9sVuDlkjuQYKvPlTu7rpfQ+71jDVfzsNPmgl46
 o/kOyUokUSMo5tQY4LRpqNCExnlTeplQyFJVxX/HcapF1eYF08qrJPG4jQ7Hl3oD7+ai
 2fMbAOIa+p/cknHAiiEeNRIqNv0gkTSj8DviwMBKWr1TTflZSTKBp6b2HU5bhSpolg/8
 j/IA==
X-Gm-Message-State: AJIora/mIYnCAkrQfVQhwCtDSR1byaQoByIlDBaEIrhgtcWD2zW0AQ7G
 uKbdKMIUATjKvjd3IgQ1p9WFmcMNIJIXqouT378=
X-Google-Smtp-Source: AGRyM1tzkbS1925Eb7kQ0H24XdtvPK7LmESBza+CEZHATPTJA/SkOfZkA4M6JZtdedZm6pp4HHueuYLxCCmaEJx1MZI=
X-Received: by 2002:a81:cd3:0:b0:317:861c:ac07 with SMTP id
 202-20020a810cd3000000b00317861cac07mr1429377ywm.486.1656470101214; Tue, 28
 Jun 2022 19:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-2-faithilikerun@gmail.com>
 <Yrm7iNLdIJjOjQmR@stefanha-x1.localdomain>
 <CAAAx-8LcxzKYsq1isvqaWEtF1JdUBp0wL8axLCm_eLR79jS_Dw@mail.gmail.com>
 <c74ebf91-1af0-8e29-28e0-9b4ee4580ae8@opensource.wdc.com>
 <CAAAx-8+6q9zLGO2Xzi9JaNFgkpHn0-eQyB8GijGx53zbFtsDCQ@mail.gmail.com>
 <20a3234d-eb6b-ee21-95d5-5ce18aa6c822@opensource.wdc.com>
 <CAAAx-8LmvU9sJycZ7PghGKWWj+RMJs5C3hz2j0Ta45Ks69=6PA@mail.gmail.com>
 <0b1f5e9a-dabe-b791-ac30-7e2ab4b55f56@opensource.wdc.com>
In-Reply-To: <0b1f5e9a-dabe-b791-ac30-7e2ab4b55f56@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 29 Jun 2022 10:35:02 +0800
Message-ID: <CAAAx-8LOzZnby1XUvd=ksv5LfNPuTZdZ+KBY9jnrNW8o0cWtRw@mail.gmail.com>
Subject: Re: [RFC v3 1/5] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x112e.google.com
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B46=
=E6=9C=8829=E6=97=A5=E5=91=A8=E4=B8=89 10:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/29/22 10:50, Sam Li wrote:
> >>>>>>> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(s=
truct blk_zone);
> >>>>>>> +    g_autofree struct blk_zone_report *rep =3D g_new(struct blk_=
zone_report, nrz);
> >>>>>>
> >>>>>> g_new() looks incorrect. There should be 1 struct blk_zone_report
> >>>>>> followed by nrz struct blk_zone structs. Please use g_malloc(rep_s=
ize)
> >>>>>> instead.
> >>>>>
> >>>>> Yes! However, it still has a memory leak error when using g_autofre=
e
> >>>>> && g_malloc.
> >>>>
> >>>> That may be because you are changing the value of the rep pointer wh=
ile
> >>>> parsing the report ?
> >>>
> >>> I am not sure it is the case. Can you show me some way to find the pr=
oblem?
> >>
> >> Not sure. I never used this g_malloc()/g_autofree() before so not sure=
 how
> >> it works. It may be that g_autofree() work only with g_new() ?
> >> Could you try separating the declaration and allocation ? e.g.
> >>
> >> Declare at the beginning of the function:
> >> g_autofree struct blk_zone_report *rep =3D NULL;
> >>
> >> And then when needed do:
> >>
> >> rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_=
zone);
> >> rep =3D g_malloc(rep_size);
> >
> > Actually, the memory leak occurs in that way. When using zone_mgmt,
> > memory leak still occurs. Asan gives the error information not much so
> > I haven't tracked down the problem yet.
>
> See this:
>
> https://blog.fishsoup.net/2015/11/05/attributecleanup-mixed-declarations-=
and-code-and-goto/
>
> Maybe you can find some hints.

Thanks!

>
> --
> Damien Le Moal
> Western Digital Research

