Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A9F53A5F0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 15:29:11 +0200 (CEST)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwOPO-0006tg-9j
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 09:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwOLQ-0004Kk-5u
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:25:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwOLO-0008JX-FS
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:25:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso1101650wmp.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BW7MagoBn06anFfgdLNgTzK//NE6FJqtQBjnOKIxNQY=;
 b=Vx4RYxtn5Yg0oHWtAO6wLW3dtr+zx6GANKwcz3TDZ4uwwjQWcAwgX3nHgBO8YyqdqR
 /nEZw3SwOLTGEsm+CYuwnPI2KzrFOSa+QBhDT8t1wqP3+KJW9RERujwVa5FHfKjB68i6
 RxltfspqMZZwBtmygCpEiJGhEcEhyhndZfCV4y2R841M27pvc339MbviHXTt29ABOgFx
 CKtLEfRM2t50urwM3goH/s4o3KOU1fk1Ady/M00jGY7bnPW3EqSGtLDQtc4ZkkNLF8j1
 bfm37jDenTyrumsYJxgmwLl08u4QxchZJ1+9O23mEK0Y5OaT3NVWyWUfeQEDjvxTBYv/
 CT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BW7MagoBn06anFfgdLNgTzK//NE6FJqtQBjnOKIxNQY=;
 b=P5IHeS1EnNvvjvOU+a/Nm3a7bOZ5FnJ315K4Ety6CJ1JjPJWWbXFW03C2S+bB4V7kS
 bgTyFmFQ4j9BczubV9d1uQRGCaycfAVfYc1PvlP1AvcYBVhjxWzJxEheJejr17VaoHcM
 H9yFk3owp/hFecYQiILBUwsJA9JjAx1Dg2Nk/9ZsXFU6G25gsApBDQkAT4vMgJ700bmf
 9HPUOEWr8jtehV47+4tsGTMEfr+E7B4jOjizw1jzra1xiMgPscX/NGyYV1a7j9YXMoJy
 AGcA6l/UpWgcFSToX+H7vj9Qe7/u28BuqR/IBS3FfGf66PAUfWi8xD9diaYNy7+dRJH9
 oDcQ==
X-Gm-Message-State: AOAM533gYwN5/D5iBDBd6bvekZnsQZh9TrH67PJtQAbOTV9DWHFI5Qye
 KfraEBD0v7nfSDpxyI1XMxQ=
X-Google-Smtp-Source: ABdhPJxTrXr0p8QcU3JBYODrzJ3cNRUaYNqOIq3W6SGAE2cmlgbYJXOLoksyNNcLQkCyp2Z15LaOCg==
X-Received: by 2002:a05:600c:2d86:b0:397:4743:5d25 with SMTP id
 i6-20020a05600c2d8600b0039747435d25mr27926274wmg.11.1654089900487; 
 Wed, 01 Jun 2022 06:25:00 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 z2-20020adff1c2000000b0020c5253d8dcsm1511582wro.40.2022.06.01.06.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 06:24:59 -0700 (PDT)
Date: Wed, 1 Jun 2022 14:24:58 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: Tong Zhang <ztong0001@gmail.com>, Tong Zhang <t.zhang2@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Francisco Londono <f.londono@samsung.com>
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
Message-ID: <YpdoqgpGloiPIxBk@stefanha-x1.localdomain>
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
 <20220427205056.2522-1-t.zhang2@samsung.com>
 <b675b817-7b7c-06ee-b971-3df2d7374622@redhat.com>
 <CAA5qM4ARbFV_cc+R6R-q_mdv0hbmki5pK03U5XGYH7xfvEoOMQ@mail.gmail.com>
 <0b54d6c7-f56d-1ad2-80b7-d75d1033d67e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zdGhlCq1VQmObRpS"
Content-Disposition: inline
In-Reply-To: <0b54d6c7-f56d-1ad2-80b7-d75d1033d67e@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x330.google.com
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


--zdGhlCq1VQmObRpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2022 at 10:00:50AM +0200, David Hildenbrand wrote:
> On 01.06.22 02:20, Tong Zhang wrote:
> > Hi David,
> >=20
> > On Mon, May 30, 2022 at 9:19 AM David Hildenbrand <david@redhat.com> wr=
ote:
> >>
> >> On 27.04.22 22:51, Tong Zhang wrote:
> >>> assert(dbs->acb) is meant to check the return value of io_func per
> >>> documented in commit 6bee44ea34 ("dma: the passed io_func does not
> >>> return NULL"). However, there is a chance that after calling
> >>> aio_context_release(dbs->ctx); the dma_blk_cb function is called befo=
re
> >>> the assertion and dbs->acb is set to NULL again at line 121. Thus when
> >>> we run assert at line 181 it will fail.
> >>>
> >>>   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
> >>>
> >>> Reported-by: Francisco Londono <f.londono@samsung.com>
> >>> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> >>> ---
> >>>  softmmu/dma-helpers.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> >>> index 7820fec54c..cb81017928 100644
> >>> --- a/softmmu/dma-helpers.c
> >>> +++ b/softmmu/dma-helpers.c
> >>> @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
> >>>      aio_context_acquire(dbs->ctx);
> >>>      dbs->acb =3D dbs->io_func(dbs->offset, &dbs->iov,
> >>>                              dma_blk_cb, dbs, dbs->io_func_opaque);
> >>> -    aio_context_release(dbs->ctx);
> >>>      assert(dbs->acb);
> >>> +    aio_context_release(dbs->ctx);
> >>>  }
> >>>
> >>>  static void dma_aio_cancel(BlockAIOCB *acb)
> >>
> >> I'm fairly new to that code, but I wonder what prevents dma_blk_cb() to
> >> run after you reshuffled the code?
> >>
> >=20
> > IMO if the assert is to test whether io_func returns a non-NULL value
> > shouldn't it be immediately after calling io_func.
> > Also... as suggested by commit 6bee44ea346aed24e12d525daf10542d695508db
> >   >     dma: the passed io_func does not return NULL
>=20
> Yes, but I just don't see how it would fix the assertion you document in
> the patch description. The locking change to fix the assertion doesn't
> make any sense to me, and most probably I am missing something important =
:)

The other thread will invoke dma_blk_cb(), which modifies dbs->acb, when
it can take the lock. Therefore dbs->acb may contain a value different
=66rom our io_func()'s return value by the time we perform the assertion
check (that's the race).

This patch makes sense to me. Can you rephrase your concern?

Stefan

--zdGhlCq1VQmObRpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKXaKoACgkQnKSrs4Gr
c8hEYwgAhjraQF5uHx0854hfEL52fvxfWssYyGMnPyBTo7V7oJzmy5LAHvh1BESF
h1hdtIr6l9CntQMZRvDlgozRjC8cR65pPV1t76RCKPv6GCSbst6xVNGvEM4dPe2Y
1RWjr6ofCZb9FGs/tFMJZmi+tM8AyOPyJkET7AobPEaZG+turEFLYZGET3PF94xk
GRKrydhTr3XtJ5qbX/LZDdc29bdal2UXAjN8PQ5LS8LAKTKs3GKqPBLFS9pGomkE
QF3AHmGCi52HW+VLMXG5zWdYk5cY1NB11E9WI/7t8FvhQSPTvyDHUvPjjRYRhhk3
qm3hizyBDaLvIBm7iyICUkIKaW0Y7w==
=siJ5
-----END PGP SIGNATURE-----

--zdGhlCq1VQmObRpS--

