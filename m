Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA08912786A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 10:48:20 +0100 (CET)
Received: from localhost ([::1]:52372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiEtP-0006uq-N9
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 04:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57344)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iiEsQ-0006TD-G2
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 04:47:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iiEsP-0005dv-9A
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 04:47:18 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34424)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iiEsO-0005Ye-S4
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 04:47:17 -0500
Received: by mail-wr1-x443.google.com with SMTP id t2so8792871wrr.1
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 01:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9QxWq1hMacd2puPuLJJXjSGabCbl3k25kyXNCn9z0hQ=;
 b=UP9V8+3/5b2/9Jx3x6F1fuVH9okI6AAme18V2OlJehfzpZ5zUW+hyMI3YeO5VykrCA
 I35TcgMvBoam3gEl9wNhzCYZehp5iAW90fBQJBK7hcg1l9Xfz25kdKudPOn3oM84hj0u
 3IL9mf8wJZ6rGKhGv7e1eYYKJpFDFuXCgcX3slr5j6mVCB+SvUcv+0PNXeRzLwrLM2QP
 Hn4OdFI0BxcDHMogYc5sVTA+HtFiSGaPGfclOS3rW9S2eyLTBLMmQv3cno3nS9TscB+d
 IU1X59Md7YGZ12dS9i2ftvp/A5ozR8oQSHJqEMcZ8OphwtORbQo7QWpUwCBhnvXIjWNq
 ka1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9QxWq1hMacd2puPuLJJXjSGabCbl3k25kyXNCn9z0hQ=;
 b=MRfgSU4r0JF2Rsr3S6EAwIcjU09LQY9HB3nP7r5yt+CHTOryn281q7vEMv71iecAis
 FBGxAg+2M1Q9RmZQS7MOpN8SkUuZ/VkyxJrGYygJuqXPCFdXmUnJNhtAinK6jH4pjxab
 n81ppgPsjKtrp3tA5nYUDkeyI955Qgh0yRSQQvhdMvzgLGrE6DESoiQldQfVHMa7zaNi
 ibLo3CJKF3FJj6AISmAdjeBNr3To9c1WZDCZRrQjOcpFf7yyGVa/ijsv1GWeTZbsh9FC
 G4m6cRV/3UpEOZ5uQ77Bi1SkZS8CUrWC6O2podVoUEYSRXyphJPZKdAiau3wfEP8wDhh
 LIDA==
X-Gm-Message-State: APjAAAVf7F06C9UswzIthMSApGqi2FHS3GvgubUvzZhKXn03xtEiN9Ld
 F2E35xHhFnaarAmByP01gdM=
X-Google-Smtp-Source: APXvYqz+x4bsUrzWI2YmKHqmNljMMqUgB6Onld8NeAapcsjZVt+LtB78AiKkfIDd90pcbodVI+0V0g==
X-Received: by 2002:adf:f411:: with SMTP id g17mr13988392wro.89.1576835234884; 
 Fri, 20 Dec 2019 01:47:14 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id w13sm9512048wru.38.2019.12.20.01.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 01:47:13 -0800 (PST)
Date: Fri, 20 Dec 2019 09:47:12 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC v4 PATCH 00/49] Initial support of multi-process qemu -
 status update
Message-ID: <20191220094712.GA1635864@stefanha-x1.localdomain>
References: <cover.1571905346.git.jag.raman@oracle.com>
 <20191210064716.GA6401@flaka>
 <20191213104116.GB1180977@stefanha-x1.localdomain>
 <20191216194655.GA5922@flaka>
 <AFBAD3A1-0E22-4E22-AF22-C56794929D87@nutanix.com>
 <20191217163316.GB1333385@stefanha-x1.localdomain>
 <DDE3DA62-31DD-437B-8392-CAD505253EED@nutanix.com>
 <20191219115545.GD1624084@stefanha-x1.localdomain>
 <772D9CF3-D15D-42D1-B9CF-1279619D7C20@nutanix.com>
 <20191219125504.GI1190276@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <20191219125504.GI1190276@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "fam@euphon.net" <fam@euphon.net>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Walker,
 Benjamin" <benjamin.walker@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>, "Harris,
 James R" <james.r.harris@intel.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "kanth.ghatraju@oracle.com" <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "liran.alon@oracle.com" <liran.alon@oracle.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 12:55:04PM +0000, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Dec 19, 2019 at 12:33:15PM +0000, Felipe Franciosi wrote:
> > > On Dec 19, 2019, at 11:55 AM, Stefan Hajnoczi <stefanha@gmail.com> wr=
ote:
> > > On Tue, Dec 17, 2019 at 10:57:17PM +0000, Felipe Franciosi wrote:
> > >>> On Dec 17, 2019, at 5:33 PM, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> > >>> On Mon, Dec 16, 2019 at 07:57:32PM +0000, Felipe Franciosi wrote:
> > >>>>> On 16 Dec 2019, at 20:47, Elena Ufimtseva <elena.ufimtseva@oracle=
=2Ecom> wrote:
> > >>>>> =EF=BB=BFOn Fri, Dec 13, 2019 at 10:41:16AM +0000, Stefan Hajnocz=
i wrote:
> > To be clear: I'm very happy to have a userspace-only option for this,
> > I just don't want to ditch the kernel module (yet, anyway). :)
>=20
> If it doesn't create too large of a burden to support both, then I think
> it is very desirable. IIUC, this is saying a kernel based solution as the
> optimized/optimal solution, and userspace UNIX socket based option as the
> generic "works everywhere" fallback solution.

I'm slightly in favor of the kernel implementation because it keeps us
better aligned with VFIO.  That means solving problems in one place only
and less reinventing the wheel.

Knowing that a userspace implementation is possible is a plus though.
Maybe that option will become attractive in the future and someone will
develop it.  In fact, a userspace implementation may be a cool Google
Summer of Code project idea that I'd like to co-mentor.

Stefan

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl38mKAACgkQnKSrs4Gr
c8gF0gf7BRVzK5DHFCHOtHeATqhLfAMgCbDlliBLm5e3yXZRcMX/lFwhPzaCdWQ1
L51oblPFFL+Hjm2SHPzwQ56gLgFZC3H5w65UC7rOs3bjDMFAYPIZ7SrXq7hSan5X
mHJb9EihDRROBh78IxiGnq1jKFAbIyzg0BKsrsx8qxGVORoi5LxenrXBbDZXZKrk
AF3MP0X6tHsZ9v3/I9vNznufHL2fq93/K1Gh3h7dcSd561E/vVza3+MM5LbwmeCq
uG8eFcFTR4H3sTJdiInv3TBRn+uCdSrjJnfZmF8wsqsw2iSmUn+zTD4dBqgT4oHD
sLFr2a4LS8cBpp/PqyWfhjYkVOtkIQ==
=lW5D
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

