Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5532D344ACA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:13:41 +0100 (CET)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONBU-00031J-CH
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOMrb-00066H-QA
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:53:07 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOMrX-0003B1-JZ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:53:07 -0400
Received: by mail-ed1-x52a.google.com with SMTP id j3so19920253edp.11
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s+5QhdVTG5OJal7eAq8CLwhKWqnVulyi0JVpuisG5Sc=;
 b=aJH1Fk8nsxPFjrMghlxD6Hos3ByNiKPth+VuZiqKk8ieIYF3EDEBmWBk2ALGfnrZsa
 PMRK7+wZhSp76O3Vmlgu+i+KtH0YfAqADqLUxDhODoKLQEY0LtKoZ0UxdidD0OkK0Nm2
 D5KPrAYfuuz4IQRpDr/8cOgkLXKpIvzflm8j5M2UTFWKtdRkYUXRRDXY+nPkeJ6rYtFN
 iIjPeCp/S8R6USwrRG+rHqGyNePxVil9nVfQLhuv7k87qcZg+opb19Wfx4flsaK84rRZ
 M91Q+ovcVl/5auWxLGCLzxZFtbgXQbLfX0+oE6ziUixY+wJJ3tXYtNY+XKo+OGk/kgCT
 zBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s+5QhdVTG5OJal7eAq8CLwhKWqnVulyi0JVpuisG5Sc=;
 b=MUXCqgDBaRoryYc+YXRtZOk5D5etj8Bl4fWm6qXM79fvscaOFMYgGp6OtpS9rW98zA
 nwNoowesWvl5DSYED4tSnJHRNZZ8LttHmdQ6wmNUioTBf9E37zfx/3gZ+vxkrOSy4hdu
 ofxuDM40A5eLYDHy+sUDCzpP6D/Co3bc41u7TpzOeBKkLEd91lfiI9bV9Ybb/gImkUY7
 k1izOWSU5n2IA0hUI6jJbEDCordeFph52FqkZ7GNEYJGhU/9J/R1tMjNXLDAQ6d1lUW8
 NJxtZq7ZmRPG1cSTlIBE6hXJv1qYHIgAN68/PDPTFMpFjKNXMP9LUZFySVyB8lLuyFUQ
 UzRg==
X-Gm-Message-State: AOAM533zY2Q/So3SDIvvcBfU/QSdvpPrK/8RuhX0vpwQJmk2itLrexy8
 MdRPGMotBplQ9RtwC6ydS8g=
X-Google-Smtp-Source: ABdhPJyyoSYbOO0QgAQdfqdBiOzd2tXaAZiPtaK8Z5mklmc+BXByKM9CF3H+NitM2cvo8w9jXWuQAQ==
X-Received: by 2002:aa7:d9c8:: with SMTP id v8mr195850eds.9.1616428381174;
 Mon, 22 Mar 2021 08:53:01 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id si3sm10137159ejb.90.2021.03.22.08.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:52:59 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:52:58 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 0/8] virtiofsd: Changed various allocations to GLib
 functions
Message-ID: <YFi9WoL1hqY/0MWU@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <CAD-LL6hpUObLT-sQcDPnLt4m406TBv_SDUYgT346ZDc8eWsSig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qGr6jvIlSCzn8uUO"
Content-Disposition: inline
In-Reply-To: <CAD-LL6hpUObLT-sQcDPnLt4m406TBv_SDUYgT346ZDc8eWsSig@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qGr6jvIlSCzn8uUO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:47:03PM +0200, Mahmoud Mandour wrote:
> On Fri, Mar 19, 2021 at 3:25 PM Mahmoud Mandour <ma.mandourr@gmail.com>
> wrote:
>=20
> > Replaced allocations done using malloc(), calloc(), and realloc()
> > to their equivalent functions in GLib.
> >
> > Memory that is allocated locally and freed when the function exits
> > are annotated g_autofree so that the deallocation is automatically
> > handled. Subsequently, I could remove a bunch of free() calls.
> >
> > Also, tried to keep the semantics of the code as is, but when the
> > allocation is a small one, or a crucial one, I replaced the
> > NULL-checking mechanisms with glib's functions that crash on error.
> >
> > This is related to a patch that I had submitted as a part of a
> > previous series. The previous patch had some errors. Also, I thought
> > that it's better to split the patch into smaller pieces.
> >
> > The previous patch can be found here:
> > https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05153.html
> >
> > Mahmoud Mandour (8):
> >   virtiofsd: Changed allocations of fuse_req to GLib functions
> >   virtiofds: Changed allocations of iovec to GLib's functions
> >   virtiofsd: Changed fuse_pollhandle allocation to GLib's functions
> >   virtiofsd: Changed allocations of fuse_session to GLib's functions
> >   virtiofsd: Changed allocation of lo_map_elems to GLib's functions
> >   virtiofsd: Changed allocations of fv_VuDev & its internals to GLib
> >     functions
> >   virtiofsd/passthrough_ll.c: Changed local allocations to GLib
> >     functions
> >   virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib
> >
> >  tools/virtiofsd/fuse_lowlevel.c  | 43 +++++++++++---------------------
> >  tools/virtiofsd/fuse_virtio.c    | 34 ++++++++-----------------
> >  tools/virtiofsd/passthrough_ll.c | 21 ++++++----------
> >  3 files changed, 34 insertions(+), 64 deletions(-)
> >
> > --
> > 2.25.1
> >
> >
> Hello,
> For some reason, my get_maintainers script auto cc-filling did not work, =
so
> I had to manually cc
> you.
> Sorry for the inconvenience.

Thanks, will review tomorrow.

Stefan

--qGr6jvIlSCzn8uUO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYvVoACgkQnKSrs4Gr
c8gkYgf+L3Dk/6uZTm0Q6jFk+Nixwa/uJPoPWPgnxtwwDXnEuWmzFSt/nKrbxRHk
6k9fe80SFqOi9I+43zKRR0QF9FxV8vLVdwpzSgjGv2hH6ZG0mOhHaK/PlIT1gFuZ
TIQ0OIjV2k1MwDVGFeRfRfOsO/osR5pbFdR5mT+e5atGhrPpzHDLSTFPCyBbcsqI
2/QYbcN0JbP+F9Riv7VgFMpsZANG9JqDsyoKK4qJBj63hB09VmdsB6CIkeKeJgki
XPEge+1mrM5zsMQkdh44RDPQZacSdS1WpZ9VKVyGWopVfd42hWFkqfIKCbeo7925
fVHuO4PS3CoOSsaq199ASB3Ki+/mFg==
=THzE
-----END PGP SIGNATURE-----

--qGr6jvIlSCzn8uUO--

