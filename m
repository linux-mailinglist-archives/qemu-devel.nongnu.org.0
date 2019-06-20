Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49904D3A4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 18:22:38 +0200 (CEST)
Received: from localhost ([::1]:50170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdzpd-0005Uq-SF
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 12:22:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37323)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hdzmK-0003QY-3y
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hdzmI-0007Wv-BT
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:19:11 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:32828)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hdzmI-0007HP-0B
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:19:10 -0400
Received: by mail-wr1-x443.google.com with SMTP id n9so3701446wru.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SZmR1ep04TT4dxQ6g5/nREwNCbAsY96WCGW2oGAla3M=;
 b=TRcenZYQqWHaid08KJxOMLjR049ZT9qGwLK45Y6UNq9LUajJpdzePgaCWfpZqM8p5q
 LSzwVyG6zERWgUZdWznJtZl3RNFmR1OZeeA0xmg+ausn3cvQ19vBGuIfo3fFfYXBrtJT
 zra1oBeizkuYK8LCT0Rb4/wVBXqoht8O9ZKlF3XxwdRpULkll/ja3i9pe1Fy13dj4pLO
 6s7aZKLWqb4NIIz+vAK1r+UTHUl+Jb49Gbk0KpSWyyEvolhLL6XxBBvupctfo5AJkg1z
 +1syCe4NN3dUdSdNWh/1cqCLOhg1ofy62LzZtYUNJoYSf09VXJ0vIZaZonbDUShLxtIF
 wEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SZmR1ep04TT4dxQ6g5/nREwNCbAsY96WCGW2oGAla3M=;
 b=WRIgkjLZeFtvJ0unR/3LgcetwkA1+W3vaI59MmTckl23XW7VR1IIpu31aK0I0USLNK
 kQyxjaO8M5jjvLanxqokjwjchYyMSaA9/0h+u2gegpOXBgRF78Te9pj99YGRS3f1dxW1
 GTE/rjn3rloxlyAqeFdckT03nUgd1WXQj+TpmUZbH2QjNSeWiSR+SO/GBY2Oz4udUrIJ
 cu6JN9CZVumVWMcO2VJA2BdtsvCMNmvXl6P2KDoR3XEB9+ua8S/a6H6A6bfC6k8c/Q2R
 QmB1prX2yxxT1ay0yo2Cmed7DMRdtoD/v+kizuzVpDGwFA8mmS4C+O0u7dJcqTyN0fRB
 EYuQ==
X-Gm-Message-State: APjAAAWa5nUT2S5lPLGK9dm4jySbmivOo75wvIXrs8kxfpPXIVasI/1b
 uPxZIpYYwxMrRi/twQDHUOI=
X-Google-Smtp-Source: APXvYqzZQ9INCI6ocbo6J380+xtIjMmmtylsAM124bOw6SZpD6ut4wZrCS3Br36pffrP36snKdLrag==
X-Received: by 2002:adf:db4c:: with SMTP id f12mr12036703wrj.342.1561047535856; 
 Thu, 20 Jun 2019 09:18:55 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id y16sm80767wru.28.2019.06.20.09.18.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 09:18:55 -0700 (PDT)
Date: Thu, 20 Jun 2019 17:18:50 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190620161850.GA8395@stefanha-x1.localdomain>
References: <20190612120421.20336-1-stefanha@redhat.com>
 <20190617122922.GG7397@linux.fritz.box>
 <25ad60d8-8860-b535-a42b-03d4d63d0802@redhat.com>
 <20190617175840.GO7397@linux.fritz.box>
 <6080d608-fd8d-1f09-6f40-735e212fbf9e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <6080d608-fd8d-1f09-6f40-735e212fbf9e@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH v4] virtio-scsi: restart DMA after iothread
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
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 08:27:04PM +0200, Paolo Bonzini wrote:
> On 17/06/19 19:58, Kevin Wolf wrote:
> > Of course, this makes me think that maybe for the actual proper
> > solution, VM state change handlers should really be a feature that qdev
> > provides for devices. Then if a HBA doesn't have anything else to do,
> > the qdev core would just recurse into the children right away; if it has
> > something to do, it would disable the device after its children, and
> > re-enable it before the children.
>=20
> This was more or less my reply to this version of the patch. :)

I'll send a new patch that is a combination of these ideas.

Stefan

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0LsecACgkQnKSrs4Gr
c8i1cAf+JYWB7TRcjWzrDceS5elxV585qCfxPK1HboJhQ0LGdoS6c5jCA2C0eXlV
X4oNDv5VA8oVU2iIdqF+0zmBYpjVqX/3dlPxU6o26qVOWEiN8Zb2lZ02xXaTxDJp
kqYLM7u7IDAV45yppa4JTJ8OZJnEqTwC7bVCGd9Yeagsqw1IrT6LkjRbyZ3eFQz4
eVeynrK+btDj7tdsKDeA7YcNqr6o1ZqtX6JYQjTA5gPc64tF4ANEpbwjNCkBOWJF
5eW3Wcv80pPxwmbmIC8zN1R3pQwo5MWnVggv0TZr4Iq+WVfmBARz69jyjOaL+U1h
0jMbxSbQafAxIAlUWVBnekMps7KR/A==
=PfNm
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

