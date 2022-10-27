Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E1460EE11
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 04:48:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onstt-0007qc-UT; Wed, 26 Oct 2022 22:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1onstr-0007bz-0j; Wed, 26 Oct 2022 22:45:43 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1onstp-0002b4-9S; Wed, 26 Oct 2022 22:45:42 -0400
Received: by mail-qt1-x82b.google.com with SMTP id cr19so276514qtb.0;
 Wed, 26 Oct 2022 19:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6JI4zLVLk11SkPKzXAmdOBQP7aGxeIjU5f3ycHacnw=;
 b=HaU1P7FjAdCIPy+ONxVgcwWzqMJv1h44dPYmycumWXJawyCFQouRfOsoBkFMvXZMQJ
 mAaQSh4tp4HWist1C1Z2JUPprs/wA883j7PdFkFCmxIsu8n5O5wTElWXmf/HgI+iFdTc
 j4keM6trGj5Zo0jeydpSyfQJ17CQMkGvjhRaHsD4IbENZuRh/tCUa/6E4AKVbgP7MEA0
 c/sFxLoCIQsJjSx9QdiT0DoWZf3EHTsoDwWr067fX5I2EGdpIXj4gsEF1VULrllCc6u9
 WaluEUqKU0NpzAEKwVGSa4/nSIzkYlws5njRSEzqIcL1awEOVbyd+mDbW2dW9SXZd5LR
 y3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6JI4zLVLk11SkPKzXAmdOBQP7aGxeIjU5f3ycHacnw=;
 b=QjaZcxt0mOjLVYJmsmM1lLrHkH+o5i/foYmlefXBXNhVX+DjOUNIZBRskalyyWAW0d
 s4Z8iTjZc/5E8nDf+EQggnllH+cIb+fOXKwPdpOLgMt2wBXmsQbjziHPZhJA69vAHwHP
 DdSsfN692L3thh6tIc9yR8oSP4G/Q5q4i63YkBA1s9nwpH3GFJWXO9pCBFAjwuHACD2z
 LRLTUaaAqozFgYvVM0C9O2f1o4Eyp3cRQKF7mikQfr06FL3+fiexcT4rPSEEm29yJmSF
 LIrT3DCmfjrtu5e0sJR6lvNb1+W+5h3oJQLtcCiLYMhrLFjeNu0NBrfJcW4qN03YlG3W
 5boA==
X-Gm-Message-State: ACrzQf2ryj+dpqOqKAQkMyKJIZ7KbmX12ysq6mfuIYJi7lo4phAoM8Gb
 3w/G4qlbOHkYpXDD0KVa69fTBoCPXB2VR9K5gtw=
X-Google-Smtp-Source: AMsMyM4pf62PxeOgv2qIPDt1iBXhNlko9tEYvBAZlJ5jktTm2UA80Uqouw9mWf7Qy9gMR/L5YyM67wrSiE7KU/oZG3Y=
X-Received: by 2002:ac8:5dce:0:b0:3a4:f665:453d with SMTP id
 e14-20020ac85dce000000b003a4f665453dmr2319448qtx.276.1666838739572; Wed, 26
 Oct 2022 19:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-6-bmeng.cn@gmail.com>
 <f3447651-dadb-c0ed-f1f8-4ad80b551acf@amsat.org>
 <DM4PR11MB53589BB8CFF45CE67683E762914F9@DM4PR11MB5358.namprd11.prod.outlook.com>
 <CAEUhbmWv3F-5rPnE37XbmdSyfuKAXb7JOwywqVPnzA7dq361Og@mail.gmail.com>
In-Reply-To: <CAEUhbmWv3F-5rPnE37XbmdSyfuKAXb7JOwywqVPnzA7dq361Og@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 27 Oct 2022 10:45:28 +0800
Message-ID: <CAEUhbmXka0i8Jt_kO_LHNpLWEix17Q7GiMP+U+6kEf4v9M7Rfg@mail.gmail.com>
Subject: Re: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
To: "Meng, Bin" <Bin.Meng@windriver.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Kevin,

On Sat, Sep 24, 2022 at 9:19 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> On Wed, Sep 21, 2022 at 8:10 PM Meng, Bin <Bin.Meng@windriver.com> wrote:
> >
> > -----Original Message-----
> > From: Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> On=
 Behalf Of Philippe Mathieu-Daud=C3=A9
> > Sent: Sunday, September 18, 2022 5:32 AM
> > To: Bin Meng <bmeng.cn@gmail.com>; qemu-devel@nongnu.org
> > Cc: Meng, Bin <Bin.Meng@windriver.com>; Hanna Reitz <hreitz@redhat.com>=
; Kevin Wolf <kwolf@redhat.com>; Peter Lieven <pl@kamp.de>; qemu-block@nong=
nu.org
> > Subject: Re: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
> >
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On 8/9/22 15:28, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > libnfs.h declares nfs_fstat() as the following for win32:
> > >
> > >    int nfs_fstat(struct nfs_context *nfs, struct nfsfh *nfsfh,
> > >                  struct __stat64 *st);
> > >
> > > The 'st' parameter should be of type 'struct __stat64'. The codes
> > > happen to build successfully for 64-bit Windows, but it does not buil=
d
> > > for 32-bit Windows.
> > >
> > > Fixes: 6542aa9c75bc ("block: add native support for NFS")
> > > Fixes: 18a8056e0bc7 ("block/nfs: cache allocated filesize for
> > > read-only files")
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > >   block/nfs.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > >
> > > diff --git a/block/nfs.c b/block/nfs.c index 444c40b458..d5d67937dd
> > > 100644
> > > --- a/block/nfs.c
> > > +++ b/block/nfs.c
> > > @@ -418,7 +418,11 @@ static int64_t nfs_client_open(NFSClient *client=
, BlockdevOptionsNfs *opts,
> > >                                  int flags, int open_flags, Error **e=
rrp)
> > >   {
> > >       int64_t ret =3D -EINVAL;
> > > +#ifdef _WIN32
> > > +    struct __stat64 st;
> > > +#else
> > >       struct stat st;
> > > +#endif
> > >       char *file =3D NULL, *strp =3D NULL;
> > >
> > >       qemu_mutex_init(&client->mutex); @@ -781,7 +785,11 @@ static in=
t
> > > nfs_reopen_prepare(BDRVReopenState *state,
> > >                                 BlockReopenQueue *queue, Error **errp=
)
> > >   {
> > >       NFSClient *client =3D state->bs->opaque;
> > > +#ifdef _WIN32
> > > +    struct __stat64 st;
> > > +#else
> > >       struct stat st;
> > > +#endif
> > >       int ret =3D 0;
> > >
> > >       if (state->flags & BDRV_O_RDWR && bdrv_is_read_only(state->bs))
> > > {
> >
> > What about the field in struct NFSRPC?
> >
> > NFSRPC::struct stat is used in nfs_get_allocated_file_size_cb() and nfs=
_get_allocated_file_size() that are not built on win32, so there is no prob=
lem.
> >
>
> Any further comments?
>

Will you queue this patch via the block tree?

Regards,
Bin

