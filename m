Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A37559E3E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:14:54 +0200 (CEST)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lxN-0002Qu-CT
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o4lti-0008B5-5N; Fri, 24 Jun 2022 12:11:07 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o4ltZ-0005K2-BQ; Fri, 24 Jun 2022 12:11:04 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i7so5229984ybe.11;
 Fri, 24 Jun 2022 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rFC6oK0cN33QkRG7dzhIjaItvJAWdiisEzC0Jtim9kU=;
 b=lr1AjVlwiDBxcwAMgx+KoZz22EdSlNAwb4V4fqEFCckpEMazAZBySit0fBou4WmJbz
 +GzZxdZwa0PQAnIKsfEQ6anmMfhS3Qiq/UdthNUhMbEhGwxjsIayKskz+rE/dlJl7GWB
 WQHRT+8OF7tuOVhOyCpAzIcdziKUqG1Tm8tp2XNMn6IovlPCXLprW6VFj+dhh5c+f5rW
 W00uTTlHti7yH/8/SRJO3YqSlrnIOHSdb34aG6pzYi1BHOUwaKNwAccu0gU16u229lY7
 7tbsz5qHNeCikVlSlpxWkDLZqkukVteyYLfvN5da9+lKC9y7PzsA4GkXw3ucZ2N0s+Q+
 oyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rFC6oK0cN33QkRG7dzhIjaItvJAWdiisEzC0Jtim9kU=;
 b=RmzoOUHbditkbVkccClm15e5y5xgC53i2UrlRFlIwW0uz6DBhRs/CFO3an6y7H4QUK
 g92KjGSy2e6w1bNFO43xrlZdN7vU0GC9q04RIYYXLXk+/jY0e11ecM8GD32zBFVQPGIr
 56SA540RjKaQgJguizv3yd5im21gZD1Ten6TmhbQ84FKp2211uWNbaMB0oOFtC3li5br
 AhR1dqNYQphUAETIikL88A+50dS7W76O15XLCIjRBnrXY2MkzMNOMxgcyzFUyLTt85wJ
 CHyAjNt5RHc2uOY5vJTepFBbb9bKRTSEoMNKBspKHQvYmLCRJDG5i12+6hpr5jrVu2bI
 LNJQ==
X-Gm-Message-State: AJIora86au+M7QAnKL7K1L/Kh1zDFCPdum1moMGjRT9wwRxau+cMFPaG
 tHenlohXzkZN3btb4gXpapQ57Np/EmsNFJsE4K0=
X-Google-Smtp-Source: AGRyM1tJyNU+8tnL96n/N3uWzjXoM3Ijrs/aboj8m1rAfdwapdByaNIG/e6TAqn2TizSfc/RtjYkX6Cx0byxFEudSj0=
X-Received: by 2002:a25:ae23:0:b0:668:daf8:c068 with SMTP id
 a35-20020a25ae23000000b00668daf8c068mr15667723ybj.427.1656087053999; Fri, 24
 Jun 2022 09:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220620033611.82166-1-faithilikerun@gmail.com>
 <YrAn2f4ORFziZ8vk@stefanha-x1.localdomain>
 <CAAAx-8JdYAKfoS_xBxx5g2iAJFoAHLMqDkz5QA6jhw2QH1L0=w@mail.gmail.com>
 <YrXdJQe+KiRcM5RN@stefanha-x1.localdomain>
In-Reply-To: <YrXdJQe+KiRcM5RN@stefanha-x1.localdomain>
From: Sam Li <faithilikerun@gmail.com>
Date: Sat, 25 Jun 2022 00:10:54 +0800
Message-ID: <CAAAx-8+eBON8=bKXVkdpaT8_indgpdp8JPLaXAyWQE4phFE2mw@mail.gmail.com>
Subject: Re: [RFC v2] Adding block layer APIs resembling Linux ZoneBlockDevice
 ioctls.
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, 
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=BA=94 23:50=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jun 24, 2022 at 11:14:32AM +0800, Sam Li wrote:
> > Hi Stefan,
> >
> > Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=882=
0=E6=97=A5=E5=91=A8=E4=B8=80 15:55=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Mon, Jun 20, 2022 at 11:36:11AM +0800, Sam Li wrote:
> > >
> > > Hi Sam,
> > > Is this version 2 of "[RFC v1] Add support for zoned device"? Please
> > > keep the email subject line the same (except for "v2", "v3", etc) so
> > > that it's clear which patch series this new version replaces.
> > >
> > > > Fix some mistakes before. It can report a range of zones now.
> > >
> > > This looks like the description of what changed compared to v1. Pleas=
e
> > > put the changelog below "---" in the future. When patch emails are
> > > merged by git-am(1) it keeps the text above "---" and discards the te=
xt
> > > below "---". The changelog is usually no longer useful once the patch=
es
> > > are merged, so it should be located below the "---" line.
> > >
> > > The text above the "---" is the commit description (an explanation of
> > > why this commit is necessary). In this case the commit description
> > > should explain that this patch adds .bdrv_co_zone_report() and
> > > .bdrv_co_zone_mgmt() to BlockDriver so that zoned block devices can b=
e
> > > supported.
> > >
> > > >
> > > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > > ---
> > > >  block/block-backend.c             |  22 ++++
> > > >  block/coroutines.h                |   5 +
> > > >  block/file-posix.c                | 182 ++++++++++++++++++++++++++=
++++
> > > >  block/io.c                        |  23 ++++
> > > >  include/block/block-common.h      |  43 ++++++-
> > > >  include/block/block-io.h          |  13 +++
> > > >  include/block/block_int-common.h  |  20 ++++
> > > >  qemu-io-cmds.c                    | 118 +++++++++++++++++++
> > > >  tests/qemu-iotests/tests/zoned.sh |  52 +++++++++
> > > >  9 files changed, 477 insertions(+), 1 deletion(-)
> > > >  create mode 100644 tests/qemu-iotests/tests/zoned.sh
> > > >
> > > > diff --git a/block/block-backend.c b/block/block-backend.c
> > > > index e0e1aff4b1..20248e4a35 100644
> > > > --- a/block/block-backend.c
> > > > +++ b/block/block-backend.c
> > > > @@ -104,6 +104,8 @@ typedef struct BlockBackendAIOCB {
> > > >      int ret;
> > > >  } BlockBackendAIOCB;
> > > >
> > > > +
> > > > +
> > >
> > > Please avoid whitespace changes in code that is otherwise untouched b=
y
> > > your patch. Code changes can cause merge conflicts and they make it
> > > harder to use git-annotate(1), so only changes that are necessary sho=
uld
> > > be included in a patch.
> > >
> > > >  static const AIOCBInfo block_backend_aiocb_info =3D {
> > > >      .get_aio_context =3D blk_aiocb_get_aio_context,
> > > >      .aiocb_size =3D sizeof(BlockBackendAIOCB),
> > > > @@ -1810,6 +1812,25 @@ int blk_flush(BlockBackend *blk)
> > > >      return ret;
> > > >  }
> > > >
> > >
> > > Please add a documentation comment for blk_co_zone_report() that
> > > explains how to use the functions and the purpose of the arguments. F=
or
> > > example, does offset have to be the first byte in a zone or can it be
> > > any byte offset? What are the alignment requirements of offset and le=
n?
> > > Why is nr_zones a pointer?
> > >
> > > > +int blk_co_zone_report(BlockBackend *blk, int64_t offset, int64_t =
len,
> > >
> > > Functions that run in coroutine context must be labeled with
> > > coroutine_fn:
> > >
> > >     int coroutine_fn blk_co_zone_report(...)
> > >
> > > This tells humans and tools that the function can only be called from=
 a
> > > coroutine. There is a blog post about coroutines in QEMU here:
> > > https://blog.vmsplice.net/2014/01/coroutines-in-qemu-basics.html
> > >
> > > > +                       int64_t *nr_zones,
> > > > +                       struct BlockZoneDescriptor *zones)
> > >
> > > QEMU coding style uses typedefs when defining structs, so "struct
> > > BlockZoneDescriptor *zones" should be written as "BlockZoneDescriptor
> > > *zones".
> > >
> > > > +{
> > > > +    int ret;
> > >
> > > This function is called from the I/O code path, please mark it with:
> > >
> > >   IO_CODE();
> > >
> > > From include/block/block-io.h:
> > >
> > >   * I/O API functions. These functions are thread-safe, and therefore
> > >   * can run in any thread as long as the thread has called
> > >   * aio_context_acquire/release().
> > >   *
> > >   * These functions can only call functions from I/O and Common categ=
ories,
> > >   * but can be invoked by GS, "I/O or GS" and I/O APIs.
> > >   *
> > >   * All functions in this category must use the macro
> > >   * IO_CODE();
> > >   * to catch when they are accidentally called by the wrong API.
> > >
> > > > +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len, nr_zon=
es, zones);
> > >
> > > Please add blk_inc_in_flight(blk) and blk_dec_in_flight(blk) around t=
his
> > > function call to ensure that zone report requests finish before I/O i=
s
> > > drained (see bdrv_drained_begin()). This is necessary so that it's
> > > possible to wait for I/O requests, including zone report, to complete=
.
> > >
> > > Similar to blk_co_do_preadv() we need blk_wait_while_drained(blk),
> > > blk_check_byte_request(), and bdrv_inc_in_flight(bs) before calling
> > > bdrv_co_zone_report(). bdrv_dec_in_flight(bs) needs to be called afte=
r
> > > bdrv_co_zone_report() returns.
> > >
> > After adding similar structure to blk_co_do_preadv(), zone operation
> > command will always fail at blk_wait_while_drained(blk) because
> > blk->inflight <=3D 0. Would it be ok to just remove
> > blk_wait_while_drained?
>
> Are you hitting the assertion in
> block/block-backend.c:blk_wait_while_drained()?
>
>   assert(blk->in_flight > 0);
>
> If yes, then there is a bug in the code. You need to make sure that
> blk_inc_in_flight() is called before blk_wait_while_drained().
>

Right! I didn't add blk_inc_in/dec_flight() because similar
blockdriver functions in file-posix.c don't use blk_inc_in_flight much
and the location would be wrong.

> > > > +    BLK_ZT_CONV =3D BLK_ZONE_TYPE_CONVENTIONAL,
> > > > +    BLK_ZT_SWR =3D BLK_ZONE_TYPE_SEQWRITE_REQ,
> > > > +    BLK_ZT_SWP =3D BLK_ZONE_TYPE_SEQWRITE_PREF,
> > > > +};
> > > > +
> > > > +enum zone_cond {
> > > > +    BLK_ZS_NOT_WP =3D BLK_ZONE_COND_NOT_WP,
> > > > +    BLK_ZS_EMPTY =3D BLK_ZONE_COND_EMPTY,
> > > > +    BLK_ZS_IOPEN =3D BLK_ZONE_COND_IMP_OPEN,
> > > > +    BLK_ZS_EOPEN =3D BLK_ZONE_COND_EXP_OPEN,
> > > > +    BLK_ZS_CLOSED =3D BLK_ZONE_COND_CLOSED,
> > > > +    BLK_ZS_RDONLY =3D BLK_ZONE_COND_READONLY,
> > > > +    BLK_ZS_FULL =3D BLK_ZONE_COND_FULL,
> > > > +    BLK_ZS_OFFLINE =3D BLK_ZONE_COND_OFFLINE,
> > > > +};
> > >
> > > This 1:1 correspondence with Linux constants could make the code a
> > > little harder to port.
> > >
> > > Maybe QEMU's block layer should define its own numeric constants so t=
he
> > > code doesn't rely on operating system-specific headers.
> > > block/file-posix.c #ifdef __linux__ code can be responsible for
> > > converting Linux-specific constants to QEMU constants (and the 1:1
> > > mapping can be used there).
> > >
> > Can we define those constants in block-common.h? Because
> > BlockZoneDescriptor requires zone_condition, zone_type defined and
> > BlockZoneDesicriptor are used in header files and qemu-io
> > sub-commands. If we use #ifdef __linux__ in block-common.h, it can be
> > responsible for converting Linux constants instead.
> >
> > Thanks for reviewing! If there is any problem, please let me know.
>
> I suggest defining the constants in block-common.h. #ifdef __linux__ is
> not necessary in block-common.h because the constants should just be an
> enum with BLK_ZS_NOT_WP =3D 0 and so on (no need for Linux headers).
>
> In block/file-posix.c you can define a helper function inside #ifdef
> __linux__ that does something like:
>
>   BlkZoneCond zone_cond_from_linux(enum blk_zone_cond val)
>   {
>       switch (val) {
>       case BLK_ZONE_COND_NOT_WP:
>           return BLK_ZS_NOT_WP;
>       ...
>   }
>
> The code in block/file-posix.c should call this helper to convert from
> Linux values to QEMU values.
>
> This way the QEMU block layer does not use Linux constants and compiles
> on non-Linux machines.
>

Thanks!

> Stefan

