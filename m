Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D1333CAE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:34:29 +0100 (CET)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJy2m-00010S-D6
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lJy1S-00006j-Si; Wed, 10 Mar 2021 07:33:06 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:37460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lJy1R-00088N-22; Wed, 10 Mar 2021 07:33:06 -0500
Received: by mail-lf1-x142.google.com with SMTP id n16so33182382lfb.4;
 Wed, 10 Mar 2021 04:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jPUpRn0F6/k/OsOOeiNMtE1/tySRxUWTl0ra42QnME8=;
 b=ZIIDxpoMVx5ww7zDIwk2jINRYRTDlbrmNmIASV17WvaNhwNZlbcMl+mD+9U4YU9VDw
 nEENQVOckX/JdvNZzgJ75agv3N6xjA3CPuPrE6cFIvUD71u1Uju3yZ9ORO26iPtJ8CND
 nqYKUI7ZtBly8mpBt91w0+75rej2KqYdTt89bQD1bhVHrKslGh5aNYJ3EA75Srubrufh
 2syepSTD20LGY2zF+fEQ2mxcXnXE0nIc4Xd5sDqmnwLFK1l9UEz2iCuNaoh6VmDPSQJa
 YMM1600/k0iJ0Y/pfIkUOE8E9g2TLCYdKXDuLC4VOaJK2k2jCKRBFywimoXzwMAEofsS
 G1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jPUpRn0F6/k/OsOOeiNMtE1/tySRxUWTl0ra42QnME8=;
 b=NyZnR1kLDrQ9FokMbDNITPt/ZFxxIGM5G2JXCsn1HST2Lqd44+fzonKsanuW32g4h/
 3aJcGvdDnAEm1kTySEzkyTpfG3m26eIce2GDJq3giw2WyjBfedgP+t+c85hWEWBqIx4P
 KuoYTnO486M/6UAv2D0pdv6Jk/FxXd/IqfpklP8HPTxls1kF8dLD+ho1tNz4XG+WSHgU
 5E77sHQZ/GQ+/+VOa5Bsqgdu3P1Te28b/xgddUuCqbWwSsACj6jvLnvuPpwvRK54WNOp
 5HDBJkdKR7TZDmjJfhe2D8sDOMVf2zA85mCa6Guj3vgXd+2L+/ppDxbREMPn7JKy9xlA
 ywGg==
X-Gm-Message-State: AOAM531pEeMHEO8+NQgvpLTI+FKBqCf9hKLK8lcKvJVZz/wEZqLwgLKT
 UqGOmQ6IxKwNVyJgWrdRU8JqzOKms3gdzDw3C1Q=
X-Google-Smtp-Source: ABdhPJyLboMzCB02+uU/WOHrxOYJn8mwug+odI5uVsfYff5KEhxuOAC7hz5hEzdK/pDpPFx/lTAWgIkOpYjtVUaOxgk=
X-Received: by 2002:ac2:46db:: with SMTP id p27mr1913234lfo.396.1615379581948; 
 Wed, 10 Mar 2021 04:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20210310114314.1068957-1-philmd@redhat.com>
In-Reply-To: <20210310114314.1068957-1-philmd@redhat.com>
From: Fam Zheng <famforupstream@gmail.com>
Date: Wed, 10 Mar 2021 12:32:51 +0000
Message-ID: <CAGNx5+11ngxmX0CYKL3q_FRsZCQbT15-HfuuFgLd=MyEXo_h9g@mail.gmail.com>
Subject: Re: [PATCH 0/3] block: Introduce the 'zeroes-co' driver to help
 security reports
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000028d74905bd2ddeca"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=famforupstream@gmail.com; helo=mail-lf1-x142.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000028d74905bd2ddeca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Mar 2021 at 11:44, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> Hi,
>
> This is an alternative approach to changing null-co driver
> default 'read-zeroes' option to true:
> https://www.mail-archive.com/qemu-block@nongnu.org/msg80873.html
>
> Instead we introduce yet another block driver with an explicit
> name: 'zeroes-co'. We then clarify in secure-coding-practices.rst
> that security reports have to be sent using this new driver.
>
> The 2nd patch is RFC because I won't spend time converting the
> tests until the first patch is discussed, as I already spent enough
> time doing that in the previous mentioned series.
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   block: Introduce the 'zeroes-co' driver
>   tests/test-blockjob: Use zeroes-co instead of null-co,read-zeroes=3Don
>   docs/secure-coding-practices: Describe null-co/zeroes-co block drivers
>
>  docs/devel/secure-coding-practices.rst |   7 +
>  block/zeroes.c                         | 306 +++++++++++++++++++++++++
>


Why not add another BlockDriver struct to block/null.c and set the
read_zeroes field in the .bdrv_file_open callback? It would make the patch
much simpler.

Fam


>  tests/test-blockjob.c                  |   4 +-
>  block/meson.build                      |   1 +
>  4 files changed, 315 insertions(+), 3 deletions(-)
>  create mode 100644 block/zeroes.c
>
> --
> 2.26.2
>
>
>
>

--00000000000028d74905bd2ddeca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Mar 2021 at 11:44, Philipp=
e Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hi,<br>
<br>
This is an alternative approach to changing null-co driver<br>
default &#39;read-zeroes&#39; option to true:<br>
<a href=3D"https://www.mail-archive.com/qemu-block@nongnu.org/msg80873.html=
" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-bl=
ock@nongnu.org/msg80873.html</a><br>
<br>
Instead we introduce yet another block driver with an explicit<br>
name: &#39;zeroes-co&#39;. We then clarify in secure-coding-practices.rst<b=
r>
that security reports have to be sent using this new driver.<br>
<br>
The 2nd patch is RFC because I won&#39;t spend time converting the<br>
tests until the first patch is discussed, as I already spent enough<br>
time doing that in the previous mentioned series.<br>
<br>
Regards,<br>
<br>
Phil.<br>
<br>
Philippe Mathieu-Daud=C3=A9 (3):<br>
=C2=A0 block: Introduce the &#39;zeroes-co&#39; driver<br>
=C2=A0 tests/test-blockjob: Use zeroes-co instead of null-co,read-zeroes=3D=
on<br>
=C2=A0 docs/secure-coding-practices: Describe null-co/zeroes-co block drive=
rs<br>
<br>
=C2=A0docs/devel/secure-coding-practices.rst |=C2=A0 =C2=A07 +<br>
=C2=A0block/zeroes.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 306 +++++++++++++++++++++++++<br></blo=
ckquote><div><br></div><div><br></div><div>Why not add another BlockDriver =
struct to block/null.c and set the read_zeroes field in the .bdrv_file_open=
 callback? It would make the patch much simpler.</div><font color=3D"#88888=
8"><div class=3D"gmail_quote"><font color=3D"#888888"><br></font></div>Fam<=
br></font><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
=C2=A0tests/test-blockjob.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0block/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A04 files changed, 315 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 block/zeroes.c<br>
<br>
-- <br>
2.26.2<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000028d74905bd2ddeca--

