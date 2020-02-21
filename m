Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED97167B69
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 11:55:57 +0100 (CET)
Received: from localhost ([::1]:55224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j55yO-0000I7-6u
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 05:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1j55xb-00087c-TF
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 05:55:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1j55xa-0003gh-TE
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 05:55:07 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33728)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>)
 id 1j55xY-0003f6-ER; Fri, 21 Feb 2020 05:55:04 -0500
Received: by mail-wr1-x444.google.com with SMTP id u6so1521940wrt.0;
 Fri, 21 Feb 2020 02:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RTC8wohHUaTPmYDmLbRxJZPuG+TSBHOrwUw3Gb77Xyo=;
 b=TleBY1qOHa8zW+e0lVeBKne/cIcnPi54VXvwfYpLeFVRc8H/1yggZJkqwBuMe4shOu
 TyCuZtu75sTm13bXKHOYbcTDcQ+noANniQA5OmvYY5BWf9O/O//HetNTVt9bbTVGEIHz
 beTP2DoSw55IBkABxhQJEyDndeoyVBV8QRqSWo7NtLzIpXOQprIkKL9+XcZNTmPomtVF
 jtqIJm2zVlwz1oCobjRMkjbINHYJKzZDkZRXReni1n1oYBhHR1pjkIN2nUJWhM5Mc1qK
 2qoA6QPV1lMQV0419QUQt/1CZS6m3Lfsu5/RSzXOAsC3blFqFW+aPkKCCirDyqs1OjS9
 +s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RTC8wohHUaTPmYDmLbRxJZPuG+TSBHOrwUw3Gb77Xyo=;
 b=h5IItqtGZ1PbeDsb8zXvn5N2vJmOoJY3jAR4rThHeET9DTfuASBzQElz1sRM3xckIy
 EJtp9KcN74VNECpz79mnL34BEK3B2H1r7sbwNfCOGzdi3PcS5EpZDOhwW7d5YACtPych
 k7XRVFdbuymmVWuT6Dc8eWXL+W296k2C+cbYqSe8W27ELkSJzWLL37QBxBbDjUU5mLMl
 tydwFLbqsY9hXQFis8eFfgSX0gAhrwhIOWivaksczppX5t/xHR4V2C6fYAho42paeL6L
 1aNKXeihb4IIpKLx9Ojjj/99oEliToPKZD4MpzrKiMEYMLh3+VIe03Vq3dwnPrTlDlOi
 XF2Q==
X-Gm-Message-State: APjAAAXIm7EMRPusGHsbIkqWMfdB5HrXQA8u4QSrFip1Y+G3hOGnnFT3
 IDvV2ATzZ+gTvaRdaOq+aAs=
X-Google-Smtp-Source: APXvYqzrZUgKOhbq2xsT1UfNg1rkD0bICXlJjOUqqw0IVu+ifOu+1bkVx0B5zFtPJ4Gvvt5PiN1F8Q==
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr48435513wrj.225.1582282503215; 
 Fri, 21 Feb 2020 02:55:03 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id s22sm3173293wmh.4.2020.02.21.02.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 02:55:01 -0800 (PST)
Date: Fri, 21 Feb 2020 10:55:00 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 2/4] virtio-scsi: default num_queues to -smp N
Message-ID: <20200221105500.GC1484511@stefanha-x1.localdomain>
References: <20200127141031.6e108839.cohuck@redhat.com>
 <20200129154438.GC157595@stefanha-x1.localdomain>
 <bc9680fc-c382-301f-a1fe-21740c918570@redhat.com>
 <20200130105235.GC176651@stefanha-x1.localdomain>
 <20200203102529.3op54zggtquoguuo@dritchie>
 <20200203105744.GD1922177@redhat.com>
 <20200203113949.hnjuqzkrqqwst54e@dritchie>
 <20200211162041.GA432724@stefanha-x1.localdomain>
 <20200211113108-mutt-send-email-mst@kernel.org>
 <20200212111832.GD464050@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline
In-Reply-To: <20200212111832.GD464050@stefanha-x1.localdomain>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 11:18:32AM +0000, Stefan Hajnoczi wrote:
> On Tue, Feb 11, 2020 at 11:31:17AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Feb 11, 2020 at 04:20:41PM +0000, Stefan Hajnoczi wrote:
> > > On Mon, Feb 03, 2020 at 12:39:49PM +0100, Sergio Lopez wrote:
> > > > On Mon, Feb 03, 2020 at 10:57:44AM +0000, Daniel P. Berrang=E9 wrot=
e:
> > > > > On Mon, Feb 03, 2020 at 11:25:29AM +0100, Sergio Lopez wrote:
> > > > > > On Thu, Jan 30, 2020 at 10:52:35AM +0000, Stefan Hajnoczi wrote:
> > > > > > > On Thu, Jan 30, 2020 at 01:29:16AM +0100, Paolo Bonzini wrote:
> > > > > > > > On 29/01/20 16:44, Stefan Hajnoczi wrote:
> > > > > > > > > On Mon, Jan 27, 2020 at 02:10:31PM +0100, Cornelia Huck w=
rote:
> > > > > > > > >> On Fri, 24 Jan 2020 10:01:57 +0000
> > > > > > > > >> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > I will create a 32 vCPU guest with 100 virtio-blk devices and verify
> > > that enabling multi-queue is successful.
> >=20
> > and that it's helpful for performance?
>=20
> I may be a little while before the next revision of this patch series.
> Testing reveals scalability problems when creating so many virtqueues
> :).
>=20
> I've measured boot time, memory consumption, and random read IOPS.  They
> are all significantly worse (32 vCPUs, 24 GB RAM, 101 virtio-blk
> devices, 32 queues/device).
>=20
> Time to see what's going on and whether some general scalability
> improvements are possible here before we enable multi-queue by default.

Update:

Boot time has improved with "[PATCH] memory: batch allocate ioeventfds[]
in address_space_update_ioeventfds()".

IOPS looks a lot better with the O(1) QEMU event loop patches that I've
posted.  This work is not complete yet, I still need to make AioContext
polling O(1) too (it consumes too much CPU with many idle devices).

After this work is complete I'll measure boot time, memory consumption,
and IOPS again.  Then we can decide whether multiqueue by default is a
good idea.

Stefan

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5PtwQACgkQnKSrs4Gr
c8hRRwf+LZ47U6dY/Ev5EEzBIih/sYB8OsJ/+1Yw/jhLqSTBRWyyVZAbRoHzmRkR
CJ6XmD7mTwfAK7f+8lLNlxRs2lPVs9Y2kmINjtuAHzkWLX5hdqgDd5DboaIoXR9X
pbBhdW9IqRBQeAEl3UU7IlwX2+gBqsyG2ecnopig03ktFb1F4g1lUbkeifjMz4Dc
onfokDUUgWpAXdV//vz5RpJj0SwwiMzLtqUZ8Kmrw55kkugklw3oipxtGOcTlM0h
E4ivMxX9UTd1Uqe0KinEzQY7OoAHmfHZBZ23SsaAtWmLWFzhcbitrIMcYh0zeFS5
fRAxvxJ44YpqY4a6tTjSlw9M5Ik+XA==
=aZ/s
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--

